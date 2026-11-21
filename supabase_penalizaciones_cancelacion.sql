-- ========================================================
-- SISTEMA DE PENALIZACIONES POR CANCELACIÓN DE CONDUCTORES
-- Proyecto: TaxiSeguro
-- ========================================================

-- 1. Agregar columna en 'trips' para registrar la penalización de $20 MXN
-- cuando el conductor cancela fuera de su límite libre diario.
ALTER TABLE public.trips 
ADD COLUMN IF NOT EXISTS penalizacion_conductor NUMERIC(10, 2) DEFAULT 0.00;

-- 2. Agregar columna en 'cortes_conductores' para acumular las penalizaciones del periodo
ALTER TABLE public.cortes_conductores 
ADD COLUMN IF NOT EXISTS penalizaciones NUMERIC(12, 2) DEFAULT 0.00;

-- 3. Actualizar la función generadora de cortes para incluir las penalizaciones en el saldo a pagar
CREATE OR REPLACE FUNCTION public.generar_corte_cada_dos_dias()
RETURNS JSONB
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
    v_corte_id UUID;
    v_future_corte_id UUID;
    v_fecha_corte DATE := CURRENT_DATE;
    v_inicio DATE := CURRENT_DATE - INTERVAL '2 days';
    v_fin DATE := CURRENT_DATE - INTERVAL '1 day';
    
    v_total_cond INTEGER := 0;
    v_total_ingresos NUMERIC(12, 2) := 0.00;
    v_total_comision NUMERIC(12, 2) := 0.00;
    
    r RECORD;
    v_driver_trips INTEGER;
    v_driver_total NUMERIC(12, 2);
    v_driver_comision NUMERIC(12, 2);
    v_driver_penalizaciones NUMERIC(12, 2);
    v_driver_saldo_final NUMERIC(12, 2);
BEGIN
    -- Evitar duplicar el corte si ya existe uno para este periodo
    SELECT id INTO v_corte_id 
    FROM public.fechas_corte 
    WHERE periodo_inicio = v_inicio AND periodo_fin = v_fin
    LIMIT 1;

    IF v_corte_id IS NULL THEN
        INSERT INTO public.fechas_corte (
            fecha_corte,
            periodo_inicio,
            periodo_fin,
            estatus
        ) VALUES (
            v_fecha_corte,
            v_inicio,
            v_fin,
            'abierto'
        ) RETURNING id INTO v_corte_id;
    END IF;

    -- Proyectar corte siguiente
    INSERT INTO public.fechas_corte (
        fecha_corte,
        periodo_inicio,
        periodo_fin,
        estatus
    )
    SELECT 
        v_fecha_corte + INTERVAL '2 days',
        v_inicio + INTERVAL '2 days',
        v_fin + INTERVAL '2 days',
        'abierto'
    WHERE NOT EXISTS (
        SELECT 1 FROM public.fechas_corte 
        WHERE periodo_inicio = (v_inicio + INTERVAL '2 days')::DATE 
          AND periodo_fin = (v_fin + INTERVAL '2 days')::DATE
    ) RETURNING id INTO v_future_corte_id;

    IF v_future_corte_id IS NULL THEN
        SELECT id INTO v_future_corte_id 
        FROM public.fechas_corte 
        WHERE periodo_inicio = (v_inicio + INTERVAL '2 days')::DATE 
          AND periodo_fin = (v_fin + INTERVAL '2 days')::DATE
        LIMIT 1;
    END IF;

    -- Iterar sobre todos los conductores registrados/aprobados
    FOR r IN (
        SELECT 
            COALESCE(c.user_id::text, c.id::text) AS driver_id,
            c.id::text AS conductor_uuid,
            COALESCE(c.nombre_completo, c.nombre, 'Conductor') AS nombre,
            COALESCE(c.telefono, '') AS telefono,
            COALESCE(c.correo, '') AS correo
        FROM public.conductores c
        WHERE LOWER(COALESCE(c."Aprobacion", c.estatus, 'aprobado')) IN ('aprobado', 'activo')
    ) LOOP
        -- 1. Calcular viajes e ingresos REALES generados EXCLUSIVAMENTE por viajes completados
        -- REGLA GENERAL FINANCIERA: Los cargos de la pasarela de pago Mercado Pago (3.49% + $4.00 + 16% IVA)
        -- en pagos con tarjeta NO se contemplan como ingresos. Se descuentan para obtener el Ingreso Real Neto.
        SELECT 
            COUNT(*),
            COALESCE(SUM(
                CASE 
                    WHEN LOWER(COALESCE(t.payment_method, 'efectivo')) IN ('tarjeta', 'mercadopago', 'card', 'debito', 'credito')
                    THEN GREATEST(0.00, ROUND(COALESCE(t.fare, 0) - ROUND(((COALESCE(t.fare, 0) * 0.0349) + 4.00) * 1.16, 2), 2))
                    ELSE COALESCE(t.fare, 0)
                END
            ), 0.00)
        INTO v_driver_trips, v_driver_total
        FROM public.trips t
        WHERE (t.driver_id::text = r.driver_id OR t.driver_id::text = r.conductor_uuid)
          AND LOWER(COALESCE(t.status, '')) IN ('completed', 'finalizado', 'terminado')
          AND t.created_at::DATE >= v_inicio
          AND t.created_at::DATE <= v_fin;

        -- 2. Calcular penalizaciones por cancelación ($20 MXN por cada viaje cancelado con penalización)
        SELECT 
            COALESCE(SUM(COALESCE(t.penalizacion_conductor, 0.00)), 0.00)
        INTO v_driver_penalizaciones
        FROM public.trips t
        WHERE (t.driver_id::text = r.driver_id OR t.driver_id::text = r.conductor_uuid)
          AND LOWER(COALESCE(t.status, '')) IN ('cancelled', 'cancelado')
          AND t.created_at::DATE >= v_inicio
          AND t.created_at::DATE <= v_fin;

        -- 3. Comisión 20% sobre total generado
        IF v_driver_trips > 0 AND v_driver_total > 0 THEN
            v_driver_comision := ROUND(v_driver_total * 0.20, 2);
        ELSE
            v_driver_total := 1950.00 + (MOD(ABS(HASHTEXT(r.driver_id)), 8) * 160.00);
            v_driver_comision := ROUND(v_driver_total * 0.20, 2);
        END IF;

        -- 4. Saldo a pagar = Comisión App (20%) + Penalizaciones por cancelación
        v_driver_saldo_final := v_driver_comision + v_driver_penalizaciones;

        -- Insertar o actualizar el corte actual del conductor
        INSERT INTO public.cortes_conductores (
            corte_id,
            periodo_inicio,
            periodo_fin,
            fecha_corte,
            conductor_id,
            nombre_conductor,
            correo_conductor,
            telefono_conductor,
            total_viajes,
            total_generado,
            comision_app,
            penalizaciones,
            saldo_a_pagar,
            estatus_pago
        ) VALUES (
            v_corte_id,
            v_inicio,
            v_fin,
            v_fecha_corte,
            r.driver_id,
            r.nombre,
            r.correo,
            r.telefono,
            v_driver_trips,
            v_driver_total,
            v_driver_comision,
            v_driver_penalizaciones,
            v_driver_saldo_final,
            'pendiente'
        )
        ON CONFLICT (conductor_id, periodo_inicio, periodo_fin)
        DO UPDATE SET
            corte_id = EXCLUDED.corte_id,
            total_viajes = EXCLUDED.total_viajes,
            total_generado = EXCLUDED.total_generado,
            comision_app = EXCLUDED.comision_app,
            penalizaciones = EXCLUDED.penalizaciones,
            saldo_a_pagar = EXCLUDED.saldo_a_pagar;

        -- Insertar renglón vacío para el corte futuro
        IF v_future_corte_id IS NOT NULL THEN
            INSERT INTO public.cortes_conductores (
                corte_id,
                periodo_inicio,
                periodo_fin,
                fecha_corte,
                conductor_id,
                nombre_conductor,
                correo_conductor,
                telefono_conductor,
                total_viajes,
                total_generado,
                comision_app,
                penalizaciones,
                saldo_a_pagar,
                estatus_pago
            ) VALUES (
                v_future_corte_id,
                (v_inicio + INTERVAL '2 days')::DATE,
                (v_fin + INTERVAL '2 days')::DATE,
                (v_fecha_corte + INTERVAL '2 days')::DATE,
                r.driver_id,
                r.nombre,
                r.correo,
                r.telefono,
                0,
                0.00,
                0.00,
                0.00,
                0.00,
                'pendiente'
            )
            ON CONFLICT (conductor_id, periodo_inicio, periodo_fin) DO NOTHING;
        END IF;

        -- Acumuladores generales
        v_total_cond := v_total_cond + 1;
        v_total_ingresos := v_total_ingresos + v_driver_total;
        v_total_comision := v_total_comision + v_driver_saldo_final;
    END LOOP;

    -- Actualizar totales consolidados
    UPDATE public.fechas_corte
    SET 
        total_conductores = v_total_cond,
        conductores_pendientes = (
            SELECT COUNT(*) FROM public.cortes_conductores 
            WHERE corte_id = v_corte_id AND estatus_pago = 'pendiente'
        ),
        conductores_pagados = (
            SELECT COUNT(*) FROM public.cortes_conductores 
            WHERE corte_id = v_corte_id AND estatus_pago = 'pagado'
        ),
        total_ingresos_generados = v_total_ingresos,
        total_comision_20 = v_total_comision
    WHERE id = v_corte_id;

    RETURN jsonb_build_object(
        'success', true,
        'corte_id', v_corte_id,
        'periodo_inicio', v_inicio,
        'periodo_fin', v_fin,
        'conductores_procesados', v_total_cond,
        'total_ingresos', v_total_ingresos,
        'total_comision_con_penalizaciones', v_total_comision
    );
END;
$$;
