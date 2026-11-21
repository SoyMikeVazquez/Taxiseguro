-- ==============================================================================
-- TAXISEGURO: SUSPENSIÓN DE RESTRICCIONES REGIONALES (COBERTURA EN TODO MÉXICO)
-- ==============================================================================
-- Para permitir que cualquier usuario pueda pedir un viaje desde cualquier parte
-- del país (CDMX, Guadalajara, Monterrey, Cancún, etc.) sin bloqueos,
-- copia y ejecuta este bloque en el SQL Editor de Supabase:
-- ==============================================================================

-- 1. Eliminar el trigger que valida el origen en Chiapas en la tabla trips
DROP TRIGGER IF EXISTS tr_check_trip_origin_in_chiapas ON public.trips;

-- 2. Eliminar la función validadora de Chiapas
DROP FUNCTION IF EXISTS public.check_trip_origin_in_chiapas();

-- 3. Habilitar la bandera de bypass en la tabla users para asegurar compatibilidad total
ALTER TABLE public.users ADD COLUMN IF NOT EXISTS bypass_geofence BOOLEAN DEFAULT true;
ALTER TABLE public.users ADD COLUMN IF NOT EXISTS has_special_location_permission BOOLEAN DEFAULT true;
ALTER TABLE public.users ADD COLUMN IF NOT EXISTS permiso_especial_ubicacion BOOLEAN DEFAULT true;

UPDATE public.users 
SET bypass_geofence = true, 
    has_special_location_permission = true, 
    permiso_especial_ubicacion = true;
