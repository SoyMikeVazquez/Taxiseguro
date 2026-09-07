CREATE OR REPLACE FUNCTION delete_driver_account(uid uuid)
RETURNS void
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
BEGIN
  -- Eliminar de la tabla de conductores
  DELETE FROM public.conductores WHERE user_id = uid;
  
  -- Eliminar de la tabla users
  DELETE FROM public.users WHERE user_id = uid;
  
  -- Eliminar de Supabase Auth (auth.users)
  DELETE FROM auth.users WHERE id = uid;
END;
$$;
