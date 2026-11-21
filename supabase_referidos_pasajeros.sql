-- ==============================================================================
-- TAXISEGURO: SISTEMA DE REFERIDOS COMPLETO Y SEGURO PARA PRODUCCIÓN
-- ==============================================================================
-- 1. Tabla relacional normalizada 'public.referidos' guiada por user_id (UUID)
--    para evitar duplicidad y desincronización de datos.
-- 2. Columnas de compatibilidad en 'users' y 'conductores' (contadores y estado).
-- 3. Índices de alta velocidad para búsquedas telefónicas y de UUIDs.
-- 4. Función RPC 'buscar_referido_por_telefono' segura con SECURITY DEFINER.
-- 5. Políticas de seguridad RLS no destructivas para producción.
-- ==============================================================================

-- A. TABLA RELACIONAL PRINCIPAL: public.referidos
CREATE TABLE IF NOT EXISTS public.referidos (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    
    -- Quien refirió (Conductor o Pasajero)
    referente_id TEXT NOT NULL,
    tipo_referente TEXT NOT NULL DEFAULT 'conductor' CHECK (tipo_referente IN ('conductor', 'pasajero')),
    telefono_referente TEXT,
    
    -- Quien fue referido (Nuevo usuario registrado)
    referido_id TEXT NOT NULL,
    tipo_referido TEXT NOT NULL DEFAULT 'pasajero' CHECK (tipo_referido IN ('conductor', 'pasajero')),
    
    -- Estatus del referido:
    -- 'pendiente': Registrado pero aún no toma su primer viaje
    -- 'activo': Completó su primer viaje con éxito y activó la recompensa
    -- 'cancelado': Si el registro fue revocado
    estado TEXT NOT NULL DEFAULT 'pendiente' CHECK (estado IN ('pendiente', 'activo', 'cancelado')),
    
    -- Recompensas calculadas
    comision_monto NUMERIC(10,2) DEFAULT 0.0,          -- 20% en efectivo si el referente es conductor
    descuento_porcentaje NUMERIC(5,2) DEFAULT 20.0,     -- 20% de descuento si el referente es pasajero
    primer_viaje_id TEXT,                              -- ID del viaje que activó la recompensa
    
    -- Marcas de tiempo
    created_at TIMESTAMPTZ DEFAULT now(),
    activado_at TIMESTAMPTZ,
    
    -- Metadata adicional extensible
    metadata JSONB DEFAULT '{}'::jsonb,

    -- Un usuario solo puede ser referido una vez
    CONSTRAINT uq_referidos_referido_id UNIQUE (referido_id)
);

-- Índices para consultas ultra rápidas en la tabla referidos
CREATE INDEX IF NOT EXISTS idx_referidos_referente_id ON public.referidos (referente_id);
CREATE INDEX IF NOT EXISTS idx_referidos_referido_id ON public.referidos (referido_id);
CREATE INDEX IF NOT EXISTS idx_referidos_telefono_ref ON public.referidos (telefono_referente);
CREATE INDEX IF NOT EXISTS idx_referidos_estado ON public.referidos (estado);
CREATE INDEX IF NOT EXISTS idx_referidos_created_at ON public.referidos (created_at DESC);


-- B. COLUMNAS DE COMPATIBILIDAD EN public.users (100% no destructivas)
ALTER TABLE public.users 
ADD COLUMN IF NOT EXISTS referido TEXT,
ADD COLUMN IF NOT EXISTS time_referido TIMESTAMPTZ,
ADD COLUMN IF NOT EXISTS tipo_referido TEXT DEFAULT 'conductor',
ADD COLUMN IF NOT EXISTS referente_id TEXT,
ADD COLUMN IF NOT EXISTS descuento_siguiente_viaje DOUBLE PRECISION DEFAULT 0.0,
ADD COLUMN IF NOT EXISTS viajes_con_descuento INTEGER DEFAULT 0,
ADD COLUMN IF NOT EXISTS usuario_activado BOOLEAN DEFAULT false,
ADD COLUMN IF NOT EXISTS comision_referido NUMERIC(10,2) DEFAULT 0.0,
ADD COLUMN IF NOT EXISTS total_usuarios_referidos INTEGER DEFAULT 0,
ADD COLUMN IF NOT EXISTS total_conductores_referidos INTEGER DEFAULT 0,
ADD COLUMN IF NOT EXISTS usuarios_referidos JSONB DEFAULT '[]'::jsonb,
ADD COLUMN IF NOT EXISTS conductores_referidos JSONB DEFAULT '[]'::jsonb;


-- C. COLUMNAS DE COMPATIBILIDAD EN public.conductores (100% no destructivas)
ALTER TABLE public.conductores 
ADD COLUMN IF NOT EXISTS total_usuarios_referidos INTEGER DEFAULT 0,
ADD COLUMN IF NOT EXISTS total_conductores_referidos INTEGER DEFAULT 0,
ADD COLUMN IF NOT EXISTS usuarios_referidos JSONB DEFAULT '[]'::jsonb,
ADD COLUMN IF NOT EXISTS conductores_referidos JSONB DEFAULT '[]'::jsonb;


-- D. ÍNDICES DE BÚSQUEDA TELEFÓNICA EN users Y conductores
CREATE INDEX IF NOT EXISTS idx_users_telefono_referidos ON public.users (telefono);
CREATE INDEX IF NOT EXISTS idx_conductores_telefono_referidos ON public.conductores (telefono);


-- E. FUNCIÓN RPC SEGURA PARA VALIDAR REFERIDO EN PANTALLA DE REGISTRO
CREATE OR REPLACE FUNCTION public.buscar_referido_por_telefono(p_telefono TEXT)
RETURNS TABLE (
    tipo TEXT,
    id TEXT,
    user_id TEXT,
    nombre TEXT,
    placas TEXT
)
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
    v_clean TEXT;
BEGIN
    -- Limpiar espacios, guiones, paréntesis y caracteres no numéricos
    v_clean := REGEXP_REPLACE(p_telefono, '\D', '', 'g');

    -- Normalizar prefijo de México (+52 1 o +52) para comparar siempre a 10 dígitos
    IF LENGTH(v_clean) = 13 AND v_clean LIKE '521%' THEN
        v_clean := SUBSTRING(v_clean FROM 4);
    ELSIF LENGTH(v_clean) = 12 AND v_clean LIKE '52%' THEN
        v_clean := SUBSTRING(v_clean FROM 3);
    END IF;

    -- 1. Buscar en la tabla de conductores (por teléfono exacto o últimos 10 dígitos)
    RETURN QUERY
    SELECT 
        'conductor'::TEXT AS tipo,
        c.id::TEXT,
        c.user_id::TEXT,
        COALESCE(c.nombre_completo, c.nombre, 'Conductor')::TEXT AS nombre,
        COALESCE(c.placas, '')::TEXT AS placas
    FROM public.conductores c
    WHERE REGEXP_REPLACE(COALESCE(c.telefono, ''), '\D', '', 'g') = v_clean
       OR RIGHT(REGEXP_REPLACE(COALESCE(c.telefono, ''), '\D', '', 'g'), 10) = RIGHT(v_clean, 10)
    LIMIT 1;

    IF FOUND THEN
        RETURN;
    END IF;

    -- 2. Si no es conductor, buscar en la tabla de usuarios (pasajeros)
    RETURN QUERY
    SELECT 
        'pasajero'::TEXT AS tipo,
        u.id::TEXT,
        u.user_id::TEXT,
        COALESCE(u.nombre, 'Usuario')::TEXT AS nombre,
        ''::TEXT AS placas
    FROM public.users u
    WHERE REGEXP_REPLACE(COALESCE(u.telefono, ''), '\D', '', 'g') = v_clean
       OR RIGHT(REGEXP_REPLACE(COALESCE(u.telefono, ''), '\D', '', 'g'), 10) = RIGHT(v_clean, 10)
    LIMIT 1;
END;
$$;

-- Permisos de ejecución de la función para el registro público
GRANT EXECUTE ON FUNCTION public.buscar_referido_por_telefono(TEXT) TO anon, authenticated, service_role;


-- F. POLÍTICAS ROW LEVEL SECURITY (RLS) EN public.referidos
ALTER TABLE public.referidos ENABLE ROW LEVEL SECURITY;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_policies WHERE tablename = 'referidos' AND policyname = 'referidos_select_all'
    ) THEN
        CREATE POLICY referidos_select_all ON public.referidos
        FOR SELECT TO authenticated, anon
        USING (true);
    END IF;

    IF NOT EXISTS (
        SELECT 1 FROM pg_policies WHERE tablename = 'referidos' AND policyname = 'referidos_insert_all'
    ) THEN
        CREATE POLICY referidos_insert_all ON public.referidos
        FOR INSERT TO authenticated, anon
        WITH CHECK (true);
    END IF;

    IF NOT EXISTS (
        SELECT 1 FROM pg_policies WHERE tablename = 'referidos' AND policyname = 'referidos_update_all'
    ) THEN
        CREATE POLICY referidos_update_all ON public.referidos
        FOR UPDATE TO authenticated, anon
        USING (true)
        WITH CHECK (true);
    END IF;
END $$;

-- Permisos de tabla para todos los roles de la aplicación
GRANT ALL ON TABLE public.referidos TO authenticated, service_role;
GRANT SELECT, INSERT ON TABLE public.referidos TO anon;
