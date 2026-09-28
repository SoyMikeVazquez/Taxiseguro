-- ========================================================
-- TABLA: cortes_conductores
-- Control de cortes y liquidaciones cada 2 días para cobro
-- de comisiones a los conductores de TaxiSeguro.
-- ========================================================

CREATE TABLE IF NOT EXISTS public.cortes_conductores (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    periodo_inicio DATE NOT NULL,
    periodo_fin DATE NOT NULL,
    fecha_corte DATE NOT NULL DEFAULT CURRENT_DATE,
    conductor_id TEXT NOT NULL,
    nombre_conductor TEXT NOT NULL DEFAULT 'Conductor',
    correo_conductor TEXT,
    telefono_conductor TEXT,
    total_viajes INTEGER NOT NULL DEFAULT 0,
    total_generado NUMERIC(12, 2) NOT NULL DEFAULT 0.00,
    comision_app NUMERIC(12, 2) NOT NULL DEFAULT 0.00,
    total_efectivo NUMERIC(12, 2) NOT NULL DEFAULT 0.00,
    total_tarjeta NUMERIC(12, 2) NOT NULL DEFAULT 0.00,
    saldo_a_pagar NUMERIC(12, 2) NOT NULL DEFAULT 0.00,
    estatus_pago TEXT NOT NULL DEFAULT 'pendiente', -- 'pendiente', 'pagado', 'en_revision'
    correo_enviado BOOLEAN NOT NULL DEFAULT FALSE,
    fecha_envio_correo TIMESTAMPTZ,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    CONSTRAINT uq_corte_periodo_conductor UNIQUE (conductor_id, periodo_inicio, periodo_fin)
);

-- Índices para optimizar búsquedas por conductor, fechas y estatus
CREATE INDEX IF NOT EXISTS idx_cortes_conductor_id ON public.cortes_conductores(conductor_id);
CREATE INDEX IF NOT EXISTS idx_cortes_periodo ON public.cortes_conductores(periodo_inicio, periodo_fin);
CREATE INDEX IF NOT EXISTS idx_cortes_estatus ON public.cortes_conductores(estatus_pago);

-- Habilitar RLS
ALTER TABLE public.cortes_conductores ENABLE ROW LEVEL SECURITY;

-- Políticas de lectura y escritura para usuarios autenticados
CREATE POLICY "Permitir lectura y escritura de cortes para usuarios autenticados"
ON public.cortes_conductores
FOR ALL
TO authenticated
USING (true)
WITH CHECK (true);

-- Política para anon
CREATE POLICY "Permitir lectura y escritura de cortes para anon"
ON public.cortes_conductores
FOR ALL
TO anon
USING (true)
WITH CHECK (true);
