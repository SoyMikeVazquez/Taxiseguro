-- ==============================================================================
-- SCRIPT DE MIGRACIÓN: Poblar tabla public.users desde auth.users (Nombres en minúsculas)
-- ==============================================================================

-- 1. Crear columna user_id enlazada a la autenticación (si no existe)
ALTER TABLE public.users ADD COLUMN IF NOT EXISTS user_id UUID REFERENCES auth.users(id);

-- 2. Insertar todos los usuarios desde auth.users a public.users usando la columna 'nombre'
INSERT INTO public.users (
  nombre,
  correo,
  telefono,
  created_at,
  user_id
)
SELECT 
  INITCAP(REPLACE(SPLIT_PART(au.email, '@', 1), '.', ' ')) AS nombre,
  au.email AS correo,
  '' AS telefono,
  au.created_at AS created_at,
  au.id AS user_id
FROM auth.users au
WHERE NOT EXISTS (
  SELECT 1 FROM public.users pu WHERE pu.correo = au.email OR pu.user_id = au.id
);

-- 3. Confirmar total de usuarios en public.users
SELECT COUNT(*) AS total_usuarios FROM public.users;
