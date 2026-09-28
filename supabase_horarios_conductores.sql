-- ========================================================
-- TABLA: horarios_conductores
-- Registra los turnos, horarios y tiempo que los conductores
-- pasan activos en la plataforma para calcular horas por día.
-- ========================================================

CREATE TABLE IF NOT EXISTS public.horarios_conductores (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    conductor_id TEXT NOT NULL,
    fecha DATE NOT NULL DEFAULT CURRENT_DATE,
    hora_conexion TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    hora_desconexion TIMESTAMPTZ,
    minutos_activo NUMERIC DEFAULT 0,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Índices de alto rendimiento para búsquedas por conductor y fecha
CREATE INDEX IF NOT EXISTS idx_horarios_conductor_id ON public.horarios_conductores(conductor_id);
CREATE INDEX IF NOT EXISTS idx_horarios_fecha ON public.horarios_conductores(fecha);
CREATE INDEX IF NOT EXISTS idx_horarios_conductor_fecha ON public.horarios_conductores(conductor_id, fecha);

-- Habilitar RLS (Row Level Security)
ALTER TABLE public.horarios_conductores ENABLE ROW LEVEL SECURITY;

-- Políticas de lectura y escritura para usuarios autenticados
CREATE POLICY "Permitir lectura y escritura de horarios para usuarios autenticados"
ON public.horarios_conductores
FOR ALL
TO authenticated
USING (true)
WITH CHECK (true);

-- Política para usuarios anon si aplica
CREATE POLICY "Permitir lectura y escritura de horarios para anon"
ON public.horarios_conductores
FOR ALL
TO anon
USING (true)
WITH CHECK (true);
