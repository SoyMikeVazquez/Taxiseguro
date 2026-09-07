-- ==============================================================================
-- SCRIPT: Crear tabla de conductores (conductores) y dar de alta conductor
-- ==============================================================================

-- 1. Crear la tabla public.conductores
CREATE TABLE IF NOT EXISTS public.conductores (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    nombre_completo TEXT NOT NULL,
    correo TEXT NOT NULL,
    telefono TEXT DEFAULT '8110002233',
    modelo_auto TEXT DEFAULT 'Nissan Versa',
    color_auto TEXT DEFAULT 'Blanco',
    placas TEXT DEFAULT 'XYZ-8921',
    estatus TEXT DEFAULT 'activo' CHECK (estatus IN ('activo', 'inactivo', 'en_viaje')),
    calificacion_promedio NUMERIC(2,1) DEFAULT 5.0,
    total_viajes INT DEFAULT 0,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL
);

-- 2. Habilitar RLS en public.conductores
ALTER TABLE public.conductores ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Los conductores son visibles para usuarios autenticados"
ON public.conductores FOR SELECT TO authenticated USING (true);

CREATE POLICY "Los conductores pueden actualizar sus datos"
ON public.conductores FOR UPDATE TO authenticated USING (auth.uid() = user_id);

-- 3. Registro en public.users para el conductor mike.vaz@hotmail.es
INSERT INTO public.users (nombre, correo, telefono, user_id)
SELECT 'Mike Vazquez', au.email, '8110002233', au.id
FROM auth.users au
WHERE au.email = 'mike.vaz@hotmail.es'
ON CONFLICT DO NOTHING;

-- 4. Registro en public.conductores
INSERT INTO public.conductores (user_id, nombre_completo, correo, telefono, modelo_auto, color_auto, placas, estatus, calificacion_promedio, total_viajes)
SELECT au.id, 'Mike Vazquez', au.email, '8110002233', 'Nissan Versa', 'Blanco', 'XYZ-8921', 'activo', 5.0, 1
FROM auth.users au
WHERE au.email = 'mike.vaz@hotmail.es'
ON CONFLICT DO NOTHING;
