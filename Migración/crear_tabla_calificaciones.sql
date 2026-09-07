-- ==============================================================================
-- SCRIPT: Crear tabla de Calificaciones y Reseñas (ratings)
-- ==============================================================================

-- 1. Crear la tabla de calificaciones (para conductores y pasajeros)
CREATE TABLE IF NOT EXISTS public.ratings (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    trip_id UUID REFERENCES public.trips(id) ON DELETE CASCADE,
    reviewer_id UUID NOT NULL,
    target_id UUID NOT NULL,
    role VARCHAR(20) NOT NULL CHECK (role IN ('driver', 'passenger')),
    rating NUMERIC(2, 1) NOT NULL CHECK (rating >= 1.0 AND rating <= 5.0),
    comment TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL
);

-- 2. Habilitar Seguridad a Nivel de Fila (RLS)
ALTER TABLE public.ratings ENABLE ROW LEVEL SECURITY;

-- 3. Crear Políticas de Seguridad
CREATE POLICY "Las calificaciones son visibles para todos los usuarios autenticados"
ON public.ratings FOR SELECT
TO authenticated
USING (true);

CREATE POLICY "Los usuarios pueden crear sus propias calificaciones"
ON public.ratings FOR INSERT
TO authenticated
WITH CHECK (true);
