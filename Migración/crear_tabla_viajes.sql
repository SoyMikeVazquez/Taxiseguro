-- ==============================================================================
-- SCRIPT: Crear tabla de historial de viajes (trips)
-- ==============================================================================

-- 1. Crear la tabla de viajes
CREATE TABLE IF NOT EXISTS public.trips (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    driver_id UUID REFERENCES auth.users(id) ON DELETE SET NULL, -- Si tienes conductores como usuarios
    origin_address TEXT NOT NULL,
    destination_address TEXT NOT NULL,
    status TEXT NOT NULL DEFAULT 'in_progress' CHECK (status IN ('in_progress', 'completed', 'cancelled')),
    fare NUMERIC(10, 2), -- Tarifa o costo del viaje
    distance_km NUMERIC(5, 2), -- Distancia recorrida
    created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL,
    completed_at TIMESTAMP WITH TIME ZONE
);

-- 2. Habilitar Seguridad a Nivel de Fila (RLS)
ALTER TABLE public.trips ENABLE ROW LEVEL SECURITY;

-- 3. Crear Políticas de Seguridad
-- Política: Los usuarios solo pueden ver sus propios viajes
CREATE POLICY "Users can view their own trips"
ON public.trips FOR SELECT
USING (auth.uid() = user_id);

-- Política: Los usuarios pueden insertar/crear sus propios viajes
CREATE POLICY "Users can insert their own trips"
ON public.trips FOR INSERT
WITH CHECK (auth.uid() = user_id);

-- Política: Los usuarios pueden actualizar sus propios viajes (ej. cancelarlos)
CREATE POLICY "Users can update their own trips"
ON public.trips FOR UPDATE
USING (auth.uid() = user_id);

-- 4. Crear índices para optimizar las consultas del historial
CREATE INDEX IF NOT EXISTS idx_trips_user_id ON public.trips(user_id);
CREATE INDEX IF NOT EXISTS idx_trips_status ON public.trips(status);
CREATE INDEX IF NOT EXISTS idx_trips_created_at ON public.trips(created_at DESC);
