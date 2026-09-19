-- ==============================================================================
-- SCRIPT: Eliminar usuarios específicos de Authentication y tabla users
-- ==============================================================================

-- PASO 1 (OPCIONAL): Verificar los usuarios encontrados antes de eliminar
SELECT 
    au.id AS auth_id,
    au.email AS auth_email,
    pu.id AS public_id,
    pu.user_id AS public_user_id,
    pu.nombre,
    pu.correo AS public_correo
FROM auth.users au
FULL OUTER JOIN public.users pu 
    ON au.id = pu.user_id OR LOWER(au.email) = LOWER(pu.correo)
WHERE LOWER(au.email) IN (
    'kirala3443@gmail.com',
    'vag_abubdo500@hotmail.com',
    'candidoortega500@gmail.com',
    'ricardogalvez12@hotmail.com',
    'alfredoadame108@gmail.com',
    'cpvictor.casio@gmail.com',
    'sergio.checko.o@gmail.com',
    'lopezgomeznicolas175@gmail.com',
    'cruzjjj1@gmail.com',
    'ruizfree6.0@gmail.com',
    'jukio1003@gmail.com',
    'loperruizgilbertoremedios@gmail.com',
    'montoyahiberr7@gmail.com',
    'rafacomanche57@gmail.com',
    'ricardo_solis@hotmail.com',
    'alex_mog29@outlook.com'
) OR LOWER(pu.correo) IN (
    'kirala3443@gmail.com',
    'vag_abubdo500@hotmail.com',
    'candidoortega500@gmail.com',
    'ricardogalvez12@hotmail.com',
    'alfredoadame108@gmail.com',
    'cpvictor.casio@gmail.com',
    'sergio.checko.o@gmail.com',
    'lopezgomeznicolas175@gmail.com',
    'cruzjjj1@gmail.com',
    'ruizfree6.0@gmail.com',
    'jukio1003@gmail.com',
    'loperruizgilbertoremedios@gmail.com',
    'montoyahiberr7@gmail.com',
    'rafacomanche57@gmail.com',
    'ricardo_solis@hotmail.com',
    'alex_mog29@outlook.com'
);

-- ==============================================================================
-- PASO 2: Ejecutar la eliminación completa y en cascada
-- ==============================================================================
DO $$
DECLARE
    target_emails text[] := ARRAY[
        'kirala3443@gmail.com',
        'vag_abubdo500@hotmail.com',
        'candidoortega500@gmail.com',
        'ricardogalvez12@hotmail.com',
        'alfredoadame108@gmail.com',
        'cpvictor.casio@gmail.com',
        'sergio.checko.o@gmail.com',
        'lopezgomeznicolas175@gmail.com',
        'cruzjjj1@gmail.com',
        'ruizfree6.0@gmail.com',
        'jukio1003@gmail.com',
        'loperruizgilbertoremedios@gmail.com',
        'montoyahiberr7@gmail.com',
        'rafacomanche57@gmail.com',
        'ricardo_solis@hotmail.com',
        'alex_mog29@outlook.com'
    ];
    target_uids uuid[];
BEGIN
    -- 1. Obtener todos los UUIDs asociados a estos correos (desde auth.users y public.users)
    SELECT ARRAY_AGG(DISTINCT id) INTO target_uids
    FROM (
        SELECT id FROM auth.users WHERE LOWER(email) = ANY(SELECT LOWER(unnest(target_emails)))
        UNION
        SELECT user_id AS id FROM public.users WHERE LOWER(correo) = ANY(SELECT LOWER(unnest(target_emails))) AND user_id IS NOT NULL
    ) sub;

    -- 2. Eliminar referencias en tablas relacionadas si existen
    IF target_uids IS NOT NULL AND array_length(target_uids, 1) > 0 THEN
        -- Calificaciones / Reseñas (si existe)
        IF EXISTS (SELECT FROM information_schema.tables WHERE table_schema = 'public' AND table_name = 'ratings') THEN
            DELETE FROM public.ratings WHERE reviewer_id = ANY(target_uids) OR target_id = ANY(target_uids);
        END IF;

        -- Historial de viajes (si existe)
        IF EXISTS (SELECT FROM information_schema.tables WHERE table_schema = 'public' AND table_name = 'trips') THEN
            DELETE FROM public.trips WHERE user_id = ANY(target_uids) OR driver_id = ANY(target_uids);
        END IF;

        -- Conductores (si existe)
        IF EXISTS (SELECT FROM information_schema.tables WHERE table_schema = 'public' AND table_name = 'conductores') THEN
            DELETE FROM public.conductores WHERE user_id = ANY(target_uids) OR LOWER(correo) = ANY(SELECT LOWER(unnest(target_emails)));
        END IF;
    END IF;

    -- 3. Eliminar de public.users
    DELETE FROM public.users 
    WHERE LOWER(correo) = ANY(SELECT LOWER(unnest(target_emails)))
       OR (target_uids IS NOT NULL AND user_id = ANY(target_uids));

    -- 4. Eliminar de auth.users (Supabase Authentication: limpia sesiones, identidades y tokens automáticamente)
    DELETE FROM auth.users 
    WHERE LOWER(email) = ANY(SELECT LOWER(unnest(target_emails)))
       OR (target_uids IS NOT NULL AND id = ANY(target_uids));

    RAISE NOTICE 'Usuarios eliminados exitosamente de Authentication y de las tablas de datos.';
END $$;
