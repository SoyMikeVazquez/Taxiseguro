-- ==============================================================================
-- SCRIPT DE ADAPTACIÓN: Ajustar tabla public.conductores existente en Supabase
-- ==============================================================================

-- 1. Añadir columnas faltantes a la tabla public.conductores existente
ALTER TABLE public.conductores ADD COLUMN IF NOT EXISTS user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE;
ALTER TABLE public.conductores ADD COLUMN IF NOT EXISTS nombre TEXT;
ALTER TABLE public.conductores ADD COLUMN IF NOT EXISTS nombre_completo TEXT;
ALTER TABLE public.conductores ADD COLUMN IF NOT EXISTS correo TEXT;
ALTER TABLE public.conductores ADD COLUMN IF NOT EXISTS telefono TEXT;
ALTER TABLE public.conductores ADD COLUMN IF NOT EXISTS modelo_auto TEXT;
ALTER TABLE public.conductores ADD COLUMN IF NOT EXISTS color_auto TEXT;
ALTER TABLE public.conductores ADD COLUMN IF NOT EXISTS placas TEXT;
ALTER TABLE public.conductores ADD COLUMN IF NOT EXISTS estatus TEXT DEFAULT 'activo';
ALTER TABLE public.conductores ADD COLUMN IF NOT EXISTS calificacion_promedio NUMERIC(2,1) DEFAULT 5.0;
ALTER TABLE public.conductores ADD COLUMN IF NOT EXISTS total_viajes INT DEFAULT 0;

-- 2. Habilitar inserciones/lecturas abiertas para usuarios autenticados
ALTER TABLE public.conductores ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "Permitir insercion a conductores" ON public.conductores;
CREATE POLICY "Permitir insercion a conductores"
ON public.conductores FOR INSERT
TO authenticated
WITH CHECK (true);

DROP POLICY IF EXISTS "Permitir lectura a conductores" ON public.conductores;
CREATE POLICY "Permitir lectura a conductores"
ON public.conductores FOR SELECT
TO authenticated
USING (true);
