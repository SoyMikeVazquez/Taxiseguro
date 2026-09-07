-- Crear o actualizar la tabla trips con todas las columnas para pedidos y finanzas
CREATE TABLE IF NOT EXISTS public.trips (
  id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id uuid REFERENCES auth.users(id) ON DELETE CASCADE,
  driver_id uuid REFERENCES auth.users(id) ON DELETE SET NULL,
  origin_address text NOT NULL,
  destination_address text NOT NULL,
  origin_lat float8,
  origin_lng float8,
  destination_lat float8,
  destination_lng float8,
  postal_code text,
  delegation text,
  status text DEFAULT 'pending', -- pending, accepted, in_progress, completed, cancelled
  fare numeric(10,2) DEFAULT 0.00,
  distance_km numeric(10,2) DEFAULT 0.00,
  created_at timestamp with time zone DEFAULT now(),
  completed_at timestamp with time zone
);

-- Si la tabla ya existe, agregar las columnas que puedan faltar
ALTER TABLE public.trips ADD COLUMN IF NOT EXISTS driver_id uuid REFERENCES auth.users(id) ON DELETE SET NULL;
ALTER TABLE public.trips ADD COLUMN IF NOT EXISTS origin_lat float8;
ALTER TABLE public.trips ADD COLUMN IF NOT EXISTS origin_lng float8;
ALTER TABLE public.trips ADD COLUMN IF NOT EXISTS destination_lat float8;
ALTER TABLE public.trips ADD COLUMN IF NOT EXISTS destination_lng float8;
ALTER TABLE public.trips ADD COLUMN IF NOT EXISTS postal_code text;
ALTER TABLE public.trips ADD COLUMN IF NOT EXISTS delegation text;
ALTER TABLE public.trips ADD COLUMN IF NOT EXISTS status text DEFAULT 'pending';
ALTER TABLE public.trips ADD COLUMN IF NOT EXISTS fare numeric(10,2) DEFAULT 0.00;
ALTER TABLE public.trips ADD COLUMN IF NOT EXISTS distance_km numeric(10,2) DEFAULT 0.00;
ALTER TABLE public.trips ADD COLUMN IF NOT EXISTS completed_at timestamp with time zone;

-- Habilitar Realtime para la tabla trips si no está habilitado
ALTER PUBLICATION supabase_realtime ADD TABLE public.trips;
