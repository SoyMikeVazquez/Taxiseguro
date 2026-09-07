-- Crear o actualizar la tabla conductores con las columnas necesarias
CREATE TABLE IF NOT EXISTS public.conductores (
  id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id uuid REFERENCES auth.users(id) ON DELETE CASCADE,
  nombre text,
  nombre_completo text,
  correo text,
  telefono text,
  modelo_auto text,
  color_auto text,
  placas text,
  estatus text DEFAULT 'activo',
  created_at timestamp with time zone DEFAULT now()
);

-- Si la tabla ya existe, agregar las columnas que falten
ALTER TABLE public.conductores ADD COLUMN IF NOT EXISTS user_id uuid REFERENCES auth.users(id) ON DELETE CASCADE;
ALTER TABLE public.conductores ADD COLUMN IF NOT EXISTS nombre text;
ALTER TABLE public.conductores ADD COLUMN IF NOT EXISTS nombre_completo text;
ALTER TABLE public.conductores ADD COLUMN IF NOT EXISTS correo text;
ALTER TABLE public.conductores ADD COLUMN IF NOT EXISTS telefono text;
ALTER TABLE public.conductores ADD COLUMN IF NOT EXISTS modelo_auto text;
ALTER TABLE public.conductores ADD COLUMN IF NOT EXISTS color_auto text;
ALTER TABLE public.conductores ADD COLUMN IF NOT EXISTS placas text;
ALTER TABLE public.conductores ADD COLUMN IF NOT EXISTS estatus text DEFAULT 'activo';
