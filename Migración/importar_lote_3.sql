-- Lote 3 de 4 (400 usuarios)
CREATE EXTENSION IF NOT EXISTS "pgcrypto";
BEGIN;

DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'portavos@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'portavos@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$3+p11hFNsf9kwQ==$qLDO/bv9JoNc0QdrNn2XrVTM6xc0dO+tqbEQVVSn8G+9h8CUoao8Vk0yGks0XJld83y2/ATMlYotIJw205luJQ==', NOW(), TO_TIMESTAMP(1768611229771 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "d0TUp0EstiYDRF3JxQ9rgIioCPU2"}',
      FALSE, TO_TIMESTAMP(1768611229771 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'portavos@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1768611229771 / 1000), TO_TIMESTAMP(1768611229771 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'lucky_15_leo@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'lucky_15_leo@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$pCc6U8f8YOq5vA==$VhqqpxYpKBztyWAPX+i33074J9ErdZBeZuKuq4mIDIBE1f3PT1/n3ZBE6iI7oao5zgU6pfcCAbcceFWS7e4E1A==', NOW(), TO_TIMESTAMP(1773711767467 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "d2hdTqMvpIYlnlITmF4JY7TVBC12"}',
      FALSE, TO_TIMESTAMP(1773711767467 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'lucky_15_leo@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1773711767467 / 1000), TO_TIMESTAMP(1773711767467 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'orlandogonzalezbarber@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'orlandogonzalezbarber@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$AxxYm3xJYUiBrg==$VZ0PtGr44GPTK5BMxjn67iYEk5ADFgzeSJHJK3l4+7FqbcR0zBPAkEfdMPIqBKlEESSWOzxvoMw+355wALQ3ww==', NOW(), TO_TIMESTAMP(1776218400170 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "d7GjglBvW7fBnPiXFZCyfswv9xr2"}',
      FALSE, TO_TIMESTAMP(1776218400170 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'orlandogonzalezbarber@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776218400170 / 1000), TO_TIMESTAMP(1776218400170 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'lic.silviagarcia8@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'lic.silviagarcia8@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$em2dl5UXBQkrdA==$R7dA5FtrJ9rBbBV3MEizP8Z/yUETjGwdwhVdjWQOCSRSUJzCpnHReyASn1j9aorc+i0/ioKk4xWd6yLij6OcGg==', NOW(), TO_TIMESTAMP(1751739305175 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "d9MyYUVfUkeDJscOEZ57c8bMzpg2"}',
      FALSE, TO_TIMESTAMP(1751739305175 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'lic.silviagarcia8@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1751739305175 / 1000), TO_TIMESTAMP(1751739305175 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'buencody@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'buencody@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$l5hg/dYPbiw9pA==$sadnUbvP9VWuLTt9Cfc9cS3gg4GKolSZnmmrJidomoTzr8cQW69PZ54+2jRqGVYUcsQvqkFmdLqwJlxRXPNRKA==', NOW(), TO_TIMESTAMP(1771279936816 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "dDXDJVVzqcfJzmXyKqbIQjaMWy72"}',
      FALSE, TO_TIMESTAMP(1771279936816 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'buencody@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771279936816 / 1000), TO_TIMESTAMP(1771279936816 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'missaelrovelo@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'missaelrovelo@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$m7mFxmB3rEeHkQ==$3C20d3y2TS3RPJ2XKMh/FG7DKvtjD1/sL9vEezY78mshTTJcT5yqO5wPeeH37/eB/VR9V1BmXohNC7yYJmwT+w==', NOW(), TO_TIMESTAMP(1772912194150 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "dGJTnac8FnfdfDBnDXL1WIzMLuz1"}',
      FALSE, TO_TIMESTAMP(1772912194150 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'missaelrovelo@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772912194150 / 1000), TO_TIMESTAMP(1772912194150 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'johangabriel8@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'johangabriel8@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$92i5dTkcGoTZJQ==$AoGso01TIL/i4baH3AbWienIV9Rz+MplDqhY8ZJdmX5sK1kLJDU95KpQf2+ekFB+qEta5TEVqLSfCF6Ht1DiiQ==', NOW(), TO_TIMESTAMP(1747234835354 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "dIMOOadLSrhstVZeqlBvuhxrvhC3"}',
      FALSE, TO_TIMESTAMP(1747234835354 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'johangabriel8@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1747234835354 / 1000), TO_TIMESTAMP(1747234835354 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'jdavid7murphy@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'jdavid7murphy@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$5H5jDcFNyah8jQ==$USw/pPZO0a1UDO2MGMH0q1/AGD19QdWzFCyRKGN/wkcXn8lRtTiZ/jYvaZLaxLpTbNe2Udj+Fp8u61JnBH3+Mg==', NOW(), TO_TIMESTAMP(1771801971732 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "dK6dxABmTnY3nhZLmFseLu97ayu1"}',
      FALSE, TO_TIMESTAMP(1771801746698 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'jdavid7murphy@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771801971732 / 1000), TO_TIMESTAMP(1771801746698 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'mazatzifelix@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'mazatzifelix@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$UXwTuUaA7vh84A==$z/gcB/ZyRQ6vSQvHQ57YUdGwp9FWZZy/09plvSZxeKMbZiZdt/TCTwUIIyPEDao9IDCp36yLaGuew81WndYBWw==', NOW(), TO_TIMESTAMP(1762407823984 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "dNcQtkG8oKTHvLJVhBsO0HyLSiJ3"}',
      FALSE, TO_TIMESTAMP(1762407823984 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'mazatzifelix@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1762407823984 / 1000), TO_TIMESTAMP(1762407823984 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'ric55lazbait@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'ric55lazbait@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$s7R6YNkHfpOPhQ==$SJlMPfPNcUfdcLGMjWIkn9LYHEU7EieM1hAVPLOOYfzI1vPLpkp7cQsCOKmph6YPppn3Dyhq9JOaCTguiFUWVg==', NOW(), TO_TIMESTAMP(1764545250891 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "dOM5DSf9S8cZdfSvaqJlx6sgEFI3"}',
      FALSE, TO_TIMESTAMP(1764101582969 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'ric55lazbait@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1764545250891 / 1000), TO_TIMESTAMP(1764101582969 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'olvera.yeizon@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'olvera.yeizon@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$j0PhI93OrvX5sg==$rwNEnxbMklq2wPhorH++yAQoOCAKXiwpFVSqOCvQAY7BZhnYij1i1HAcZVObiB8f4XeSEiO/mzIpyTMWR3k8Qw==', NOW(), TO_TIMESTAMP(1753396117876 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "dRSHtcXQ6aV7tiaddAowZy1x5rr1"}',
      FALSE, TO_TIMESTAMP(1753396117876 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'olvera.yeizon@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1753396117876 / 1000), TO_TIMESTAMP(1753396117876 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'javier01jms@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'javier01jms@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$Bt3ehdR7xQF0Ug==$hYd5367A4TWG4Azn+2oRjwdvetRUwLvbZnHMIu41kgtPU65842RtgtrGr0kYkIcYfFUVo4cLyJ919t4pTKXWrA==', NOW(), TO_TIMESTAMP(1773423145528 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "dVMzG4WDbfV5i4iLhmTHJCeBe0L2"}',
      FALSE, TO_TIMESTAMP(1773423145528 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'javier01jms@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1773423145528 / 1000), TO_TIMESTAMP(1773423145528 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'prueba-a1@prueba.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'prueba-a1@prueba.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$KanoqN84xSZlsw==$FlFISvJo1RL15S+WF10Un837nX+vIFYNROQyRFLJXZsK3OL7BBGQ4xOaUp2hm24+bg/YQUveiRA35GXBkv2Exg==', NOW(), TO_TIMESTAMP(1771802678818 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "dkx0J0fngZQNBUGG6f3xLg4N58h2"}',
      FALSE, TO_TIMESTAMP(1743390282755 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'prueba-a1@prueba.com')::jsonb,
      'email', TO_TIMESTAMP(1771802678818 / 1000), TO_TIMESTAMP(1743390282755 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'fernandoandresgomeztrejo8@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'fernandoandresgomeztrejo8@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$wyRida5JuFhHkA==$ZiuyYNU7CsjQSV0D9OQ6TquV7vePdMuAptzrhNmcFJzsdIZhydJ6qhniWnpp/ok/8zQ1A7MCcI6oTWKqch4bbA==', NOW(), TO_TIMESTAMP(1778862691090 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "dm4IXANhvueDeBGWKQZrM7W4kmX2"}',
      FALSE, TO_TIMESTAMP(1776276817261 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'fernandoandresgomeztrejo8@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1778862691090 / 1000), TO_TIMESTAMP(1776276817261 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'amorsinfronterasuber@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'amorsinfronterasuber@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$3aT7TTPmNEUOew==$BbVKFP3fztczUgqNxTvasO3mWSVMR+IElEiKJ47APtCPezQxzs4sa0+FygmybRhPKBZ8Qyvv5DWxtTJhCeyJcg==', NOW(), TO_TIMESTAMP(1771434685359 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "dpFSs9ndmEOGt4NmHc06bolIn9D3"}',
      FALSE, TO_TIMESTAMP(1771325351694 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'amorsinfronterasuber@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771434685359 / 1000), TO_TIMESTAMP(1771325351694 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'vanessabautista175@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'vanessabautista175@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$keeUJPNDxr1fkQ==$cSu17SZzlJdJYjojDz4t8CVsFiby8WsHHa9cRjKq5AUCkK3iqsXfI4FMueEZh5e4SC3mjbLFpWP4H74eFbIEsA==', NOW(), TO_TIMESTAMP(1771304163996 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "dpHWpKt055RolcaDPSUigh8mvMv1"}',
      FALSE, TO_TIMESTAMP(1771304163996 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'vanessabautista175@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771304163996 / 1000), TO_TIMESTAMP(1771304163996 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'dna96gs@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'dna96gs@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$FXTztrGX+/XTcQ==$PpiBA0WTDWMpe+/t+NlDJaqOZ7lHpQpGd3Cgr7ZeQzj/xRXcIA4x5xYeZ3aBB2ZipEpWjnN5c7rXa14bRdt/iQ==', NOW(), TO_TIMESTAMP(1778918098559 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "dvORqbHXQLcsdTGBvRH2ibWAu4j2"}',
      FALSE, TO_TIMESTAMP(1778918098559 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'dna96gs@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1778918098559 / 1000), TO_TIMESTAMP(1778918098559 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'noraarenasduran@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'noraarenasduran@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$hD9o1I789KptXQ==$Qts0I3wLvkJ9/zi15uzHzmXO7Pvx6T5V660d9jOzPC9uf85MHBzfrZEdND7debnO5bksNGSihkw0Teo6tyrjqQ==', NOW(), TO_TIMESTAMP(1758388730730 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "dw5jIiZOeseoC953C31G78UvYlh2"}',
      FALSE, TO_TIMESTAMP(1758388730730 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'noraarenasduran@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1758388730730 / 1000), TO_TIMESTAMP(1758388730730 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'kritickjp@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'kritickjp@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$ZDjcw3o8Dol4MQ==$I2O8S5gqfoACFe/s6hQ79EzrEtvpjs9AZr7cIKhBRtNWce8AL9Bwm5M9tERUCOW1tX+x2NIh3D83bWPazDK+Ow==', NOW(), TO_TIMESTAMP(1771275624228 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "dx3qvbDaJSgfnqzgFiBbVb4SeBC2"}',
      FALSE, TO_TIMESTAMP(1771275624228 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'kritickjp@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771275624228 / 1000), TO_TIMESTAMP(1771275624228 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'aleh08238@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'aleh08238@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$94mQIXCZhN3Krw==$Kj3JKmb7hPXDGoCCNVaXCICVEAEJ4X9cTfP2U6Bi/0769HmbNSu6Iuo65FG+CHhtJ5UVjFucRQzENtm1i3TZUg==', NOW(), TO_TIMESTAMP(1773800145931 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "dxCAxDytcUedNxHz5S2LUDRo4h33"}',
      FALSE, TO_TIMESTAMP(1773356730391 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'aleh08238@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1773800145931 / 1000), TO_TIMESTAMP(1773356730391 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'fercho3443@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'fercho3443@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$WEIUxkR4xrve1A==$N8ayGiM7/fohMHBQkWnE+17+PiVei09XV1tdEua0ZPxyxHK0tA0cU51kZ2pDD/uA1FJJHUTvThRpZtZTrFUX0A==', NOW(), TO_TIMESTAMP(1771554158977 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "dyzVfj8NZ1TO8yqnjN8VehBShYF3"}',
      FALSE, TO_TIMESTAMP(1771554158977 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'fercho3443@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771554158977 / 1000), TO_TIMESTAMP(1771554158977 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'juzuca720714@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'juzuca720714@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$/KfZUrVLBuxMvQ==$NZi2kKtaK+iu4WseCE5eo9ylKYXOg+sNODN3+9e8lOmzUAtSuJeLrRKHGJ1aC/dhkL7Rq3CeacRs+3v+SNOP7g==', NOW(), TO_TIMESTAMP(1776215155915 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "e1mkePQHABUx5FeBsYzqyIrQBzr2"}',
      FALSE, TO_TIMESTAMP(1776215155915 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'juzuca720714@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776215155915 / 1000), TO_TIMESTAMP(1776215155915 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'mojitopili16@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'mojitopili16@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$8u1Bt/cEX6BrlQ==$7DyKuE+Nz7yS9LROwLT3Vt98XT0Z3YQPJbn+dlOglBepVjH/Pb96X80ijtw5clJMMtmt9IS+Yg2Pcwh6VBUsUA==', NOW(), TO_TIMESTAMP(1776225061978 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "e4X0e1CfU7eZaFYygBlvxB6Lq8H3"}',
      FALSE, TO_TIMESTAMP(1771388209471 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'mojitopili16@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776225061978 / 1000), TO_TIMESTAMP(1771388209471 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'mexjimenez3@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'mexjimenez3@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$GXz4iT754enqqw==$bPidEaokwtD/b7Uuub+3yQCB6sj511aYK+Iqe5njIhZjX5J1aUv5yen+vobv4LNGTwL048yHwG9wEGZP/r5mLw==', NOW(), TO_TIMESTAMP(1771419355677 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "eCcVodsaTSbontQY1ptnps630ox2"}',
      FALSE, TO_TIMESTAMP(1771419355677 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'mexjimenez3@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771419355677 / 1000), TO_TIMESTAMP(1771419355677 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'martin-gpe1994@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'martin-gpe1994@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$/H2JcfAnUJZa1Q==$V8cFyhMkwt0UH6O8TuBtamMdx20pDSKfTILmMYMdieOXlpPwot4JjTxla+9/4mswxuMt5Pwf0yyweSYF3Bfudw==', NOW(), TO_TIMESTAMP(1776216966895 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "eCwZMF4KExOp1JWrQT4quRs2fQg2"}',
      FALSE, TO_TIMESTAMP(1776216966895 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'martin-gpe1994@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776216966895 / 1000), TO_TIMESTAMP(1776216966895 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'kbcorreoimpresione@outlook.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'kbcorreoimpresione@outlook.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$awgtOJZPOfyY5w==$GCZGftR+p8cp3T6VuZoxqYQRZMAzvuIOS5fVPBjU6304ImHTC8hTgMft3s87U0Jc9vo2FVMCKQQHf9xfNww8RA==', NOW(), TO_TIMESTAMP(1772380468700 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "eEQsmKJSvlPxnQaIYlxhkgYK6v92"}',
      FALSE, TO_TIMESTAMP(1772380468700 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'kbcorreoimpresione@outlook.com')::jsonb,
      'email', TO_TIMESTAMP(1772380468700 / 1000), TO_TIMESTAMP(1772380468700 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'loanuelitos151217@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'loanuelitos151217@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$Ir203z9UAWONWA==$bV6LVOLDOgXl/9gXpO8mfswvDbtNFPtTZsvnH4QSWEFp2s3FeYwNAcNRCXVkWdjCo1elKibjzxZWIev55CvWhg==', NOW(), TO_TIMESTAMP(1776257129827 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "eOSjBvxA19N7hl1QG3GqMpDti2z1"}',
      FALSE, TO_TIMESTAMP(1776257129827 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'loanuelitos151217@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776257129827 / 1000), TO_TIMESTAMP(1776257129827 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'pucca_lolois@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'pucca_lolois@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$hei7R3ewvLT+rQ==$QjMU7AiEEBGpHrlZMFS0Y7Z+Hin/JmgNmphvNk1Ml21DbMIsN0hY+9DdqLCD3FGtr1xTKPOAkA9vKwbe7kVLFg==', NOW(), TO_TIMESTAMP(1752010342305 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "eR31Xr8hjUMGZWjhMo3tofN0IID2"}',
      FALSE, TO_TIMESTAMP(1752010342305 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'pucca_lolois@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1752010342305 / 1000), TO_TIMESTAMP(1752010342305 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'lindatrujillo0506@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'lindatrujillo0506@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$B6BsupIyxj5lOw==$k26xfL3SU9rApQX5ZqPHTptj+1g8/xHZ3dHwJBDni7DE6m72MXL7Ucg5/nbiFuG9bpbI1Q+pCk92ErpCAwZ/8A==', NOW(), TO_TIMESTAMP(1772092162024 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "eZdV2EGE1qekXJtS4RaJGXqmQm12"}',
      FALSE, TO_TIMESTAMP(1772091360797 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'lindatrujillo0506@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772092162024 / 1000), TO_TIMESTAMP(1772091360797 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'velasco_munguia@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'velasco_munguia@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$MU2CdxHbJFRp2A==$BNcxVmL3YBQnW3koq7qUfeBHxn2UwTXYWE5DyDxz4nWWH02ax0nKXXgvO40j2X3HFak5K4RmcmC4lzWHrpZjzg==', NOW(), TO_TIMESTAMP(1771291549391 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "ed6dM1JLoPRvqw2zXkoN8aERp5i2"}',
      FALSE, TO_TIMESTAMP(1771291549391 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'velasco_munguia@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771291549391 / 1000), TO_TIMESTAMP(1771291549391 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'edmundo.eboli123@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'edmundo.eboli123@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$eSCXrIL5RmcgUw==$VWlcYlpui3/DzGRlzBEG5JfXMV/lr+c50RDO5qkxvHPs/g4LTJzIDYZ8hK53kpp4Dy7+ncgUBCQ5+oRUrRW17A==', NOW(), TO_TIMESTAMP(1776230371981 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "eeh8WpJS9BVUdMcpKcRyJ3khWpi1"}',
      FALSE, TO_TIMESTAMP(1776230371981 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'edmundo.eboli123@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776230371981 / 1000), TO_TIMESTAMP(1776230371981 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'jl3092300@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'jl3092300@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$JQKmJpL1OIiMLA==$d2K4tUtB7O1TTfAWnLbw5AZoCxrKR0Gw160C+EPlldrDu+z0erJY+TRCX/fvT2BiRW+hnT/YP8M48jyOPw3MPw==', NOW(), TO_TIMESTAMP(1772255332295 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "epJhb2Xg24fvV1SNJHXr3ofkcZI2"}',
      FALSE, TO_TIMESTAMP(1772255332295 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'jl3092300@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772255332295 / 1000), TO_TIMESTAMP(1772255332295 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'jany_leo@hormail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'jany_leo@hormail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$O0Tb5I5oPeFebA==$+Nsxau7os/DHZ3vzFcTX3RVlcJsfGiCsukwUadj24FhzpzAjmEZMFlWBNNszecznhXH170w1NlExbRtXrfkTwQ==', NOW(), TO_TIMESTAMP(1773735465484 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "erUmdrPYyNQNsQ0q5puLpOK2ld33"}',
      FALSE, TO_TIMESTAMP(1773735465484 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'jany_leo@hormail.com')::jsonb,
      'email', TO_TIMESTAMP(1773735465484 / 1000), TO_TIMESTAMP(1773735465484 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'ruizfree6.0@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'ruizfree6.0@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$JR84PO5dE6swmg==$K+lQNQRsYPev/eQWofodJZ5Twr7U1d4MiuIHHi55s8szxZMcIgpWcovLaAYeHoV6SaWkxF/LsMF0VpVlCiZoWA==', NOW(), TO_TIMESTAMP(1764199267130 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "euUXzQrZzRMwe0eKKz4o1W06Z4u2"}',
      FALSE, TO_TIMESTAMP(1763836094502 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'ruizfree6.0@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1764199267130 / 1000), TO_TIMESTAMP(1763836094502 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'danielcrm.11@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'danielcrm.11@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$sFOLuQRDmT/olA==$Eel6kwyQiOCs+ce1EPQQYQ2RkGkeRs8+FiMdMCeCgW6XrH6K9U+Iy0KJ2t9vpXXo9Rw/2SnVPd6z+F131rs0DQ==', NOW(), TO_TIMESTAMP(1776273173138 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "exRUuGltIxY56JHh3IqRPZg2pl72"}',
      FALSE, TO_TIMESTAMP(1776273173138 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'danielcrm.11@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776273173138 / 1000), TO_TIMESTAMP(1776273173138 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'natanaelgomez09@icloud.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'natanaelgomez09@icloud.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$U3u8hl1K0C+bBA==$JegYzFypz+m075gD0nXCr+r+0xC8mFJvfiAZZ03P05Ul+/qbY0LkJx2kdG26YLsMWVjGa6au7R1lYjDKBmRDng==', NOW(), TO_TIMESTAMP(1762925789451 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "ezmvd6AvZcctf7jWFHFjhVJkXI63"}',
      FALSE, TO_TIMESTAMP(1762925789451 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'natanaelgomez09@icloud.com')::jsonb,
      'email', TO_TIMESTAMP(1762925789451 / 1000), TO_TIMESTAMP(1762925789451 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'williammisaelgarcia@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'williammisaelgarcia@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$/hZwCPDUI/eR2w==$hgUglefIzkyoP/vA1nJkiv/AbuLyPFyTjSMYJWFb+5TDz0YOeQT+riDmcQ7/f8jfC5USFRhe9az77gl837r7pg==', NOW(), TO_TIMESTAMP(1771291725731 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "f3TpVHiqKRMCPzFT3iPPFcc5mf13"}',
      FALSE, TO_TIMESTAMP(1771291725731 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'williammisaelgarcia@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771291725731 / 1000), TO_TIMESTAMP(1771291725731 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'christofervillafuerte@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'christofervillafuerte@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$QapkiLP9N247Ag==$5QMjavD2KhxOV1LGWBrbEpyPL433N4z6w6aLTgjGM5P0jgYB1Tj0katrD8BFtQTtKZzggx/qwMn4JAc2p/YDRw==', NOW(), TO_TIMESTAMP(1767243291762 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "f4qUatrMInUZHNmPN1NnKQRxfWG2"}',
      FALSE, TO_TIMESTAMP(1767243291762 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'christofervillafuerte@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1767243291762 / 1000), TO_TIMESTAMP(1767243291762 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'joseralf_r15@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'joseralf_r15@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$pAicW09oIl6VAQ==$rDV95hqbKaAuvFuKgpFsvvee/94szWVmLu0TgNDm4k8LADa4EbomKUeWslAIH5y7SRGonkdcL6u5+tSDN/wcfQ==', NOW(), TO_TIMESTAMP(1772852537889 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "f7rhsdGsXng7oLXs7q9iIM0jkmy2"}',
      FALSE, TO_TIMESTAMP(1772852383202 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'joseralf_r15@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772852537889 / 1000), TO_TIMESTAMP(1772852383202 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'admin@pideloseguro.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'admin@pideloseguro.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$uT/nsM06ib5XgQ==$wZBCspL6N8TPadaHQIY8WAs4L8P3eHAtvdCLyoYI8I4SKlEUaMAuaHi6fNq0ucSCVPHSv+k4lRKyZ+QvgEaDUg==', NOW(), TO_TIMESTAMP(1748183437052 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "f9VQurEjUSgoOEmy9GuN87ZxRil1"}',
      FALSE, TO_TIMESTAMP(1740428924481 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'admin@pideloseguro.com')::jsonb,
      'email', TO_TIMESTAMP(1748183437052 / 1000), TO_TIMESTAMP(1740428924481 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'karla.valdez.cab@cobach.edu.mx') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'karla.valdez.cab@cobach.edu.mx', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$PuBnJCIqb+s4MA==$8XgPx7u5VBnXyBZI4R3kBRsQY1HB0TPAHarHwabhb3G/KfnWqNwUshDAV00MQMbdOASEblY3C5hT8jOTHabQJQ==', NOW(), TO_TIMESTAMP(1776224259855 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "fB4gGar6yqR9zsT5r7ZC3a9DgSg2"}',
      FALSE, TO_TIMESTAMP(1776224259855 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'karla.valdez.cab@cobach.edu.mx')::jsonb,
      'email', TO_TIMESTAMP(1776224259855 / 1000), TO_TIMESTAMP(1776224259855 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'rosaurasantizlopez@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'rosaurasantizlopez@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$DrroHirnbrlE+w==$nG1jK+4pCcuRoNYKa357dUaqpWagdal2YsUnZTbSUU+9X9lSV6/o7asz5CsCcRn0J90ZSX9dQVLyRGl0jlGr9Q==', NOW(), TO_TIMESTAMP(1771301179072 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "fB5E3gnfS9Ym6hjhCPBCkUiVXvq1"}',
      FALSE, TO_TIMESTAMP(1771300923589 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'rosaurasantizlopez@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771301179072 / 1000), TO_TIMESTAMP(1771300923589 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'rolandojavierquinteroroque@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'rolandojavierquinteroroque@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$7uAaNF/dxtnvHg==$L96rUG5RXJU75TDfPJ/hliPc0myt/Jusnv5XYaKg4hYh9keOb14Aaf53itFDMwgAwwoy4u3++Vu1yxABtgzuNQ==', NOW(), TO_TIMESTAMP(1753479732825 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "fEgT6H9LVLNTR7eRo5CndeoQ5zx1"}',
      FALSE, TO_TIMESTAMP(1753479732825 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'rolandojavierquinteroroque@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1753479732825 / 1000), TO_TIMESTAMP(1753479732825 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'fabiortegagtz@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'fabiortegagtz@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$kJNRgj2DEVuXYA==$cpOhQNqJIVL7fnQ1IKyqy3tuYvSg7QrhQ+NL11aWooNhHYb1LXbQG8VEE6P7pZfAO2oSAwcCDwZSxkU02EdxGw==', NOW(), TO_TIMESTAMP(1771282585988 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "fIHIQ2KhdYcwRYWYAhEwbhM9QLh2"}',
      FALSE, TO_TIMESTAMP(1771282585988 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'fabiortegagtz@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771282585988 / 1000), TO_TIMESTAMP(1771282585988 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'rdzkahory@gmail.comr') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'rdzkahory@gmail.comr', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$PGR/xyARbPKW/g==$NynbtwpDikICDDPP6KiFfHmxHchbLKzeXljSdE9Y1LZlYFaF8/5TGwF8K9uI8+tN7aC95KkTRzZSlKu/b8+fyA==', NOW(), TO_TIMESTAMP(1754814112561 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "fIHwFPxazqYtWKS8XMJmqEy5aQL2"}',
      FALSE, TO_TIMESTAMP(1754037429022 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'rdzkahory@gmail.comr')::jsonb,
      'email', TO_TIMESTAMP(1754814112561 / 1000), TO_TIMESTAMP(1754037429022 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'vicentetapya2005@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'vicentetapya2005@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$VfF+ejzwSjlnWw==$9KFX+8Zd/aEuEcpi1e7s2n6Q1nvtzqrOzMRcwfhVvQfaDsVsWEFmuyvTURBJFqI46oCd0xtbUQYYs8gYwXV+1A==', NOW(), TO_TIMESTAMP(1745295182531 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "fKK8LtiHAFT0TrrVZLIb7yI0UKW2"}',
      FALSE, TO_TIMESTAMP(1745295182531 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'vicentetapya2005@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1745295182531 / 1000), TO_TIMESTAMP(1745295182531 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'luis-abdias1@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'luis-abdias1@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$pTEcsYR9p4bsjw==$HVXZIinX8GSDNDY0S3EHdnNlgfcSgcr9UQo1oy3wCAeikBJcYD1CdmJQ0e8y/KEqYG1iuO7Tc34FFoxZiMkPrQ==', NOW(), TO_TIMESTAMP(1776300808768 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "fLZKcdk6g8gNKpyg0oX2Ke3907W2"}',
      FALSE, TO_TIMESTAMP(1776300808768 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'luis-abdias1@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776300808768 / 1000), TO_TIMESTAMP(1776300808768 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'avete9046@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'avete9046@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$Ouxhq/0kIT4qXA==$OlY8vftWLJ7PD623tV6J7CCzBxop7JhDJECOUiDDNwNuiQu99CeU8/4rramAZwuUas4AXUb+FhtFYIhEY1sKRg==', NOW(), TO_TIMESTAMP(1771545771394 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "fMbdUiNhpzNQ1kmiKcxkXaa0V7p1"}',
      FALSE, TO_TIMESTAMP(1771545771394 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'avete9046@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771545771394 / 1000), TO_TIMESTAMP(1771545771394 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'dgp220597@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'dgp220597@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$yOFI1fU7r0u/SQ==$lzh146P6e+AzWkKzAoLhoHoLNrMle0pBzpyVDO2gGNXCnHXhZsgMkT+/4e3BuRtly/4YzWw7MjkqX32kml+nhA==', NOW(), TO_TIMESTAMP(1752701257339 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "fNbBvcc9A0bDlcRwDbIvgJAA8tI3"}',
      FALSE, TO_TIMESTAMP(1752701257339 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'dgp220597@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1752701257339 / 1000), TO_TIMESTAMP(1752701257339 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'gordolobo2@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'gordolobo2@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$P3HSVEcQoh+qBw==$r0EkTIeiMGPVhQsxzF7z38cUV+N9djwp8UuwRMu+Y0z2ZkoyS+6THoOUh74mdvGI7+mOO5FigPcCTWDV8Yot8A==', NOW(), TO_TIMESTAMP(1771513454293 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "fNddJprQfna5WMxXLSpO3g5Gdkp2"}',
      FALSE, TO_TIMESTAMP(1771513454293 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'gordolobo2@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771513454293 / 1000), TO_TIMESTAMP(1771513454293 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'brendagsan98c@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'brendagsan98c@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$OGdio8GsQboQsg==$iGDdN8CPB6ZsENwEojGJEm8vLRTLztcfWysJUD4CItWIfTuB12GIbTXEJNN0wMRpha1Gg1BCQAjIh3tlwVqb5w==', NOW(), TO_TIMESTAMP(1765421415236 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "fSj8b1gVNjSRbYgTtcA3KdFnLim2"}',
      FALSE, TO_TIMESTAMP(1764292862338 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'brendagsan98c@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1765421415236 / 1000), TO_TIMESTAMP(1764292862338 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'martinezgabrielaedith1@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'martinezgabrielaedith1@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$2XW7kY59m/WsiQ==$8/v+qGtU+S0+2orV4Fqy1S40LzAzMok2T6p9XkPNsxuyQ4fC2j6L24d8oAYQ7OoWXTtZDPNVQpZCvwgot0RCdQ==', NOW(), TO_TIMESTAMP(1747847407851 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "fUrvdm7UyaPrgBJozWiX7DjBQwn1"}',
      FALSE, TO_TIMESTAMP(1747847407851 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'martinezgabrielaedith1@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1747847407851 / 1000), TO_TIMESTAMP(1747847407851 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'luna_130785@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'luna_130785@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$gI0kx4m0zRO+Zw==$xvsOhq8n4j/M+ZEApwI41k4+qdeP2nf0iYU94ugmn9u3G0J/IQ9SOIesG29jHW36/BVLusC5NoiyXRiO0CV11A==', NOW(), TO_TIMESTAMP(1776215854140 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "fc26DKW1WHdtmH1n7AHWbkUnvNC2"}',
      FALSE, TO_TIMESTAMP(1776215854140 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'luna_130785@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776215854140 / 1000), TO_TIMESTAMP(1776215854140 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'vsolis587@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'vsolis587@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$7D7CLWVviUoieQ==$uEeKkjmO5ZPzyjSb71SCkidy7azjx+ybKgbCK+2v6HrCKJKKV05E0YdWtnCqp4lTs7RM6FMJuOhstVrepqo3wA==', NOW(), TO_TIMESTAMP(1776365940655 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "fd8Z95VuJJdWidGxakPis9E4WTh1"}',
      FALSE, TO_TIMESTAMP(1776365940655 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'vsolis587@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776365940655 / 1000), TO_TIMESTAMP(1776365940655 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'jimenezcarolina128@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'jimenezcarolina128@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$9qMFa7hCFGRlXw==$cVSn55wSP5i9akZJapRylMxGzkx/DtG0Wfppy1E/TBi3m1SIn3FXqNv2TdkCGhzUN5/rV92ZK7bJxsCOQvmRYQ==', NOW(), TO_TIMESTAMP(1771274954551 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "fdmPcKVYsDbshRx3urU2AzXjbwI2"}',
      FALSE, TO_TIMESTAMP(1771274954551 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'jimenezcarolina128@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771274954551 / 1000), TO_TIMESTAMP(1771274954551 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'josealfonsoll.123@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'josealfonsoll.123@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$SbyCjNDxX2JJCw==$I5ec9NSf6OWZsBWpByn6STFvfpKu/UewdSq3zXxBI991VM8OAAuohpTP8dpyXM1JJTj6GleqMV8L+xcHsoQujw==', NOW(), TO_TIMESTAMP(1771280099149 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "fe51tMeTQUQqSNE4dCtF9Knb9Gj2"}',
      FALSE, TO_TIMESTAMP(1771280099149 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'josealfonsoll.123@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771280099149 / 1000), TO_TIMESTAMP(1771280099149 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'esteban.ugalde.martinez@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'esteban.ugalde.martinez@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$D7NF0tdptKyEeQ==$+T1Wm7tvYvnOmt8dxairJ4RIXnVudLxy7vBaEtZ86jg3PZH0Yq8iEnUGOOW2FDeJ6y8P8maQjVQhoqUE4u3pVA==', NOW(), TO_TIMESTAMP(1772149289294 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "fi1PCzhZUecqxrfWprud8amofqC2"}',
      FALSE, TO_TIMESTAMP(1772149289294 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'esteban.ugalde.martinez@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772149289294 / 1000), TO_TIMESTAMP(1772149289294 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'ajimemo1@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'ajimemo1@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$V5IKk6DMIVovog==$9pQyG3U8IT3Gt6BtwM9+6JpqoClx1qeyXCR8Y1RNOIATp0FjXbOAVukKSbOL1MK9NuODPpsG0mbydXAGAB67Sw==', NOW(), TO_TIMESTAMP(1776217832347 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "fn8JlUlGLsN2MbCFHhsqgVcqagC3"}',
      FALSE, TO_TIMESTAMP(1776217832347 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'ajimemo1@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776217832347 / 1000), TO_TIMESTAMP(1776217832347 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'jstelloisaak@yahoo.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'jstelloisaak@yahoo.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$hNI1r9kSQoSNdQ==$7w6ezPVmSQFp3Qw2xaL1LCacnYRqBVt2RfRjtFwjDnOcwdP3tkvVX+3PZRwDTVPrriSE/wNixsbEmajQeaAqdw==', NOW(), TO_TIMESTAMP(1776234895435 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "fnOfZzfmkghY7Jj3nZCm3iZHin63"}',
      FALSE, TO_TIMESTAMP(1776234895435 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'jstelloisaak@yahoo.com')::jsonb,
      'email', TO_TIMESTAMP(1776234895435 / 1000), TO_TIMESTAMP(1776234895435 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'kaeu1999@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'kaeu1999@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$K1ZbfLx6DJ/LZA==$UAVfWPeH9RffwRrc1Evr/bTAhmke4Bapth2L2eA/bLCmN7wzQ2eEQIfSwHAaiem1d4UKl8KcN6R/kyjfIWD1ZA==', NOW(), TO_TIMESTAMP(1772228396033 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "fnkCjKLOrIVgO7yXtjpQO8zYcbp2"}',
      FALSE, TO_TIMESTAMP(1772228396033 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'kaeu1999@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772228396033 / 1000), TO_TIMESTAMP(1772228396033 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'leonardojossuem@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'leonardojossuem@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$fEFQvQc4IAXHiQ==$WGqiLs8XKnq5O6GA8+zTEeJLMfebQakTLJxXWfXhDBqNALkAx84t9973yithjn401yCPs1XmF5NZpVq/YvXcrw==', NOW(), TO_TIMESTAMP(1776317284597 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "fqmWLsBRJofSyaCJgxc1XvwWUk13"}',
      FALSE, TO_TIMESTAMP(1776317284597 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'leonardojossuem@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776317284597 / 1000), TO_TIMESTAMP(1776317284597 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'arturorrodriguez08@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'arturorrodriguez08@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$UqeHMTWCETHb6w==$NTZcI8DOoFZJL1jGfomT2HnonQFcTrukmg/H4sSEqFwtkyFs43CFUb5qd1jWV46LGUDRVccS4TB+f13FNHgrkg==', NOW(), TO_TIMESTAMP(1753842924670 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "fvK50N7WgrWg5qyXLYPmfPkHYTq2"}',
      FALSE, TO_TIMESTAMP(1753842924670 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'arturorrodriguez08@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1753842924670 / 1000), TO_TIMESTAMP(1753842924670 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'domiinguezmariel@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'domiinguezmariel@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$w4poZgQSz+d3sA==$coSDjabZjR4TQ+EdpTvw2gIiUsPIBwthCEl5CE9vgMQ2QSv/5cij1Lze1t58Z6pg8F1CPMRgS5il7xsME1Xf0Q==', NOW(), TO_TIMESTAMP(1775084814818 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "fxNl0lesDhQ4tbyJMoniAO8wa3j2"}',
      FALSE, TO_TIMESTAMP(1775084814818 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'domiinguezmariel@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1775084814818 / 1000), TO_TIMESTAMP(1775084814818 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'benitogregoriobolom@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'benitogregoriobolom@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$UvJYVvpCJUVFRw==$OG7WyCU9QOZv1d/nBFEai7eMVv13gZIuqL0LE10zCuKHfEShl4lE3HuAPNxjlodqzHtK15jolNhKiygQOF2dSQ==', NOW(), TO_TIMESTAMP(1772598251487 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "fzDX9ZNzpHTL8X0j1lXEJGkO3ND2"}',
      FALSE, TO_TIMESTAMP(1772598251487 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'benitogregoriobolom@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772598251487 / 1000), TO_TIMESTAMP(1772598251487 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'krilinpato@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'krilinpato@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$rHGWcHIGY+eRrA==$wDNqz/GPgNr3hsh9Rvjuhgxze8DBkCnYZavxUHdR4jQeUNGyGZjjjC3vQMBZEPWegjBhuFoV/F3by/3+eG0wXA==', NOW(), TO_TIMESTAMP(1776223544188 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "g1caoqxryWhQ0omplpR0VB154Cp1"}',
      FALSE, TO_TIMESTAMP(1776223544188 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'krilinpato@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776223544188 / 1000), TO_TIMESTAMP(1776223544188 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'prueba-c1@prueba.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'prueba-c1@prueba.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$xhLUSX5HtaQTVw==$g8gx7SlxWFI4b+w8IREdJKnCeTMNud+3VJtv6JlT6ev9uFH4oMf2pJsvePhxzEGMavdVdTnBRBMDthICG88+ng==', NOW(), TO_TIMESTAMP(1764976037678 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "gA5Bo2YfomhCW5hz1EQ4TDiYzF43"}',
      FALSE, TO_TIMESTAMP(1743394466685 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'prueba-c1@prueba.com')::jsonb,
      'email', TO_TIMESTAMP(1764976037678 / 1000), TO_TIMESTAMP(1743394466685 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'karinahernandezcruz874@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'karinahernandezcruz874@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$Gk/L25jNF8fDZA==$QQGcv/Ct+WTs7pqTj6ddEdHOto3p5ZMuC/Q8QvXhMHKm+pR6lCRJaUJOR2SgY6CAj+oN3wqqcOU/IyLT1N8cfQ==', NOW(), TO_TIMESTAMP(1771282140011 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "gAak0Rw9fxRHEkRa9FmBj6TiWcg1"}',
      FALSE, TO_TIMESTAMP(1771282140011 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'karinahernandezcruz874@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771282140011 / 1000), TO_TIMESTAMP(1771282140011 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'cruzvadlc@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'cruzvadlc@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$08hXjh72P6T2JQ==$MyiJmzR8eBCj6WhMx2ReT6IWINB4i+eq54H7BtgSNwr2j7D5ELYcsxsekG7Xj+beM/AtlTIWAEYGZwnRgjyszw==', NOW(), TO_TIMESTAMP(1770262358571 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "gD94MFhJjgZhsMiBFaDhiQdFfGl2"}',
      FALSE, TO_TIMESTAMP(1770262358571 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'cruzvadlc@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1770262358571 / 1000), TO_TIMESTAMP(1770262358571 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'montoyarociodelcarmen98@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'montoyarociodelcarmen98@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$XTI9AG9yZIEtTA==$Zqw7pu5CpFQ/izJwuTG81mLyeurI57QX5CJg+LGZfxcZnCgFIgg3TWrUEJnNOtH17mTgUZwhLewox1AXnZh9nA==', NOW(), TO_TIMESTAMP(1776896483614 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "gFOJtxM2KQVy1aRg7nrZhyrvLYd2"}',
      FALSE, TO_TIMESTAMP(1776896483614 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'montoyarociodelcarmen98@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776896483614 / 1000), TO_TIMESTAMP(1776896483614 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'brediaz99@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'brediaz99@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$c2JoVnXUxjBjUw==$9iCHhcSvZuxWnPIOlqtddrig3/ycoLMk2Mk3HsZGJViqpsqK9syNJ7qikVbsGX+5rkArzkqVNR6geS0VzGr3nw==', NOW(), TO_TIMESTAMP(1771302041275 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "gGVWYV3JBDRwzslQQiXxQYW72g13"}',
      FALSE, TO_TIMESTAMP(1771302041275 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'brediaz99@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771302041275 / 1000), TO_TIMESTAMP(1771302041275 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'marygosa71@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'marygosa71@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$PBoE8WwUbwZeQA==$D4d1mEs2WMzqQ1hYj4t6YVnZqAzJzk71t5L6peefjPYtksP6ZLRxcchRz2HhNIA0BN2f0opxfKvZSgcnmFTX1w==', NOW(), TO_TIMESTAMP(1777106603648 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "gH01fnscLQOAH2mwJObVJemT8Nn2"}',
      FALSE, TO_TIMESTAMP(1777106603648 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'marygosa71@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1777106603648 / 1000), TO_TIMESTAMP(1777106603648 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'camilacorzokaren@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'camilacorzokaren@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$37B93Sxab6IDeA==$zzlhpfOk5n9vuNhk6fh4K5NbI8JEJnYhcEmePwYuoK2AcbsR4ld8oP33lzNhfdkyWZtfKDAQPS9oxH72bcEtng==', NOW(), TO_TIMESTAMP(1773255418560 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "gI0yYfFUFjXrfnDgC6b72QnUezp2"}',
      FALSE, TO_TIMESTAMP(1773255418560 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'camilacorzokaren@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1773255418560 / 1000), TO_TIMESTAMP(1773255418560 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'ediberto1@hotmail.es') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'ediberto1@hotmail.es', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$+usYTpb28wUwBw==$i9o5O2mvJzBiGu1eh2gxMVyty81gP2/UHiejYZw5m0YsbT/5cOaFgyVCld1bkDf9jZE2RTKvQ/SXKpvMwu+5Jw==', NOW(), TO_TIMESTAMP(1772607267131 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "gJAyCFXfm0MTNMBJZbfUwfl97el1"}',
      FALSE, TO_TIMESTAMP(1772607267131 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'ediberto1@hotmail.es')::jsonb,
      'email', TO_TIMESTAMP(1772607267131 / 1000), TO_TIMESTAMP(1772607267131 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'gutmanaguilar@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'gutmanaguilar@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$k/C9pCP2RyQI/g==$54Lhdd1GOrGSOAAe2QKBywvdJgzzemzyBb0qAPr3xoweNJ+MqUoht7CK03AWyEKRgeag7uPl0+HmCqbYyqDFtA==', NOW(), TO_TIMESTAMP(1777504061798 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "gOilQvkFDOhunzas2qWiFzWoXD93"}',
      FALSE, TO_TIMESTAMP(1777504061798 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'gutmanaguilar@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1777504061798 / 1000), TO_TIMESTAMP(1777504061798 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'luisherball1324@outlook.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'luisherball1324@outlook.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$SbwYIiw/0wbO3w==$nTn/RufJzLcWqLGL93myvf1IVSIt9UJ0QYlY7ioOPBgY7JhveqqQTWdQQY+AKLI11BisglMIZnNo1TLtRpzgWw==', NOW(), TO_TIMESTAMP(1776216207862 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "gRZsgJuVirNaWhximFFLbfsVYz23"}',
      FALSE, TO_TIMESTAMP(1776216207862 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'luisherball1324@outlook.com')::jsonb,
      'email', TO_TIMESTAMP(1776216207862 / 1000), TO_TIMESTAMP(1776216207862 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'rosendo.ep2020@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'rosendo.ep2020@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$GyZKQ0xpIcCSqw==$Uyq9BIbLhJ1B+1jOZ8eiP5U2sDZcHYC0j/NUrXDPxqJuB9MHjqVvbBZXHlUJf2VayoqR683QC/PQmBZoK9m5jQ==', NOW(), TO_TIMESTAMP(1774590614691 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "gSqRlgxUhCRO9ovlOXYDQclSK0r1"}',
      FALSE, TO_TIMESTAMP(1774590614691 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'rosendo.ep2020@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1774590614691 / 1000), TO_TIMESTAMP(1774590614691 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'toxyc3423@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'toxyc3423@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$8JPphAbrD8h4/Q==$nm7NxmBFuf12BwCI791Z59+XmQrnlCxq6ACRZv0mjXXV5v4ZqZi4ManjEW/PiuOL8/Sc4Z7lyYeBTTiOjcLH2g==', NOW(), TO_TIMESTAMP(1772921219993 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "gUcUjvBLB8Rm6mHePrzl54VZTVr1"}',
      FALSE, TO_TIMESTAMP(1772920786989 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'toxyc3423@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772921219993 / 1000), TO_TIMESTAMP(1772920786989 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'rusacri40@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'rusacri40@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$rzdqKhuvz0Kksw==$Wkaq5P2e2Z/Pwq6fPYU5GUqzc9VVOlJL/JmlVRmlbPVz3mn9icT34Upe8tFKIxJuszx4qK045Fgk9NTa7c4iDA==', NOW(), TO_TIMESTAMP(1774418775357 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "gXYYKOug6VOeZcuRHULUfw2whCg1"}',
      FALSE, TO_TIMESTAMP(1774388271982 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'rusacri40@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1774418775357 / 1000), TO_TIMESTAMP(1774388271982 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'fannyjazz0@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'fannyjazz0@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$HXq2ChYlRxrzxA==$1ukpu6KYVMAzQGUN3JYT2TVgD1Km6ecLelYmZor37r9hbIAio/zpTYE6vlI+HJSVUOklR2tn6+8WW/qke6zrNg==', NOW(), TO_TIMESTAMP(1771352262626 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "gXjf3tzQWFbjxsXwZLQlFoE3KY42"}',
      FALSE, TO_TIMESTAMP(1771352262626 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'fannyjazz0@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771352262626 / 1000), TO_TIMESTAMP(1771352262626 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'alvarotrevino21@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'alvarotrevino21@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$qwpHPXXScnZf3g==$uuAJd/4cQBYJaUGvVyHWMnxYMfg23qi3q1K9348H7OhRTJgcHhURGeEA9FiSFsV3EpztEU3c/hLbnqkdkbzDcg==', NOW(), TO_TIMESTAMP(1756953663094 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "gc1QwDUhonVrcCp6oQjMAJmPpY32"}',
      FALSE, TO_TIMESTAMP(1756953663094 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'alvarotrevino21@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1756953663094 / 1000), TO_TIMESTAMP(1756953663094 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'hkramsky@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'hkramsky@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$n7PtKK6yFASb9Q==$/d5sogR6R7newClWzt86sK8GGhlicBqRaeRDDwdvZRKzeIoEW2+Zbm2mC/6SY1AeXChGjpopzOfae3QOA+UYHQ==', NOW(), TO_TIMESTAMP(1771518041652 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "ggElSoinVpgk8wosGs6LZIJWgit2"}',
      FALSE, TO_TIMESTAMP(1771518041652 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'hkramsky@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771518041652 / 1000), TO_TIMESTAMP(1771518041652 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'jessicadeleonsantiz@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'jessicadeleonsantiz@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$ZaudY1ai6f/GWQ==$JMgo8xFn+0btvITQFVqU+uj9ifjI2WMCQldo4okyWAl/EmpTsE8BLD0Fv7Yd/URvY/Jkg5WVzzRxLoWq0kdYnA==', NOW(), TO_TIMESTAMP(1773548643232 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "gjzfvLRnJKgYxHVCP8zuEgDSSow1"}',
      FALSE, TO_TIMESTAMP(1773548643232 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'jessicadeleonsantiz@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1773548643232 / 1000), TO_TIMESTAMP(1773548643232 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'kmilitary04@outlook.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'kmilitary04@outlook.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$IPXLyZwvCq38PA==$idKV+qAEtWip5uDCGQ/WwtUWLQMhodE0lYPHKpXc3FT5av0Pa8y7hiDfSK3GehM5G5E0xyvHuFMFhMVeOmlynw==', NOW(), TO_TIMESTAMP(1776575202729 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "gl5OiUcBBdUiZNPmzdZqZHMWpQi1"}',
      FALSE, TO_TIMESTAMP(1776575202729 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'kmilitary04@outlook.com')::jsonb,
      'email', TO_TIMESTAMP(1776575202729 / 1000), TO_TIMESTAMP(1776575202729 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'rodriguezjr524@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'rodriguezjr524@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$hJO7Z+sFgR0tJg==$lyc9Q0EfEFjBRxAaC3ERLBroJGrzBt2nE0kd5VKhfUjzm0BgyEdqCdhTuce1U64Z/txYlQflE9Rby9Ik5eaN4w==', NOW(), TO_TIMESTAMP(1779682160177 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "goPBeW2pubdpFIM7tVGVBOLPfFs1"}',
      FALSE, TO_TIMESTAMP(1779682160177 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'rodriguezjr524@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1779682160177 / 1000), TO_TIMESTAMP(1779682160177 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'alejaelizalde@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'alejaelizalde@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$zq9JE/zlOtCmfg==$bMNFzBe1//KItJfaSxCfTjzMPvMRqUo0o8AA10UBo+hflXe5kovtokBAa1N+Ey7bFLbkGGRvVmtEFoaXdBDgLw==', NOW(), TO_TIMESTAMP(1771541283072 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "gpc9EvwCkWbuY080lsCppSSZqFR2"}',
      FALSE, TO_TIMESTAMP(1771540934250 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'alejaelizalde@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771541283072 / 1000), TO_TIMESTAMP(1771540934250 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'salvadormp@outlook.es') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'salvadormp@outlook.es', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$gb7osfcFkVPltg==$d2NbQXvYmGeP9PPcR5piK9zlH9TSX21sBlD/1E8/vvv7Th5kmCQPTTiQvYLXVxknun8Y/tEV2DKkvuAJhl4iSA==', NOW(), TO_TIMESTAMP(1774715673759 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "grbKfhldKxOuwsDYGepoo3WpJvk1"}',
      FALSE, TO_TIMESTAMP(1774715431870 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'salvadormp@outlook.es')::jsonb,
      'email', TO_TIMESTAMP(1774715673759 / 1000), TO_TIMESTAMP(1774715431870 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'carlossuma72@outlook.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'carlossuma72@outlook.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$wYoNPbHWFpQivQ==$ikEOZFQuxWfRXgOI4n40qe3IDJbjJ7KsjiOBn2y/dpwMnJQrj3zT9QU8939Ns6/Zd/STwY1uRMUwHGJxl1Ei7g==', NOW(), TO_TIMESTAMP(1771302337104 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "gtaYKP644ISTmnZ8gOIclWAjjcz1"}',
      FALSE, TO_TIMESTAMP(1771302337104 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'carlossuma72@outlook.com')::jsonb,
      'email', TO_TIMESTAMP(1771302337104 / 1000), TO_TIMESTAMP(1771302337104 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'burgueteguille@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'burgueteguille@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$pa9GbzpFQHbLWQ==$FMsqwLCP9ewckefVP2DAp9f+fg90jJtI+JDgZuXtqmIWPL5DkO0w6WDr0PQ7yrWBoVZqFdTt2dcW0QWlsWtkvA==', NOW(), TO_TIMESTAMP(1773986890236 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "h1iUhFTGVHQNvtuIjQdnskTLx1O2"}',
      FALSE, TO_TIMESTAMP(1773986890236 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'burgueteguille@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1773986890236 / 1000), TO_TIMESTAMP(1773986890236 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'yolii_ff@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'yolii_ff@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$M2YxGOlCeB0yYg==$roTS0TPwm1E5g/Y9VYOtBBB1RjEfGHCt67kEXEaDM1GmpGM0PRTxTO66i1FvY9Dw396Xg1AwyMbmnqxPnvHJcQ==', NOW(), TO_TIMESTAMP(1775541646585 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "h1krVQ3DBbbPJvyr8p8Cfvyk6J93"}',
      FALSE, TO_TIMESTAMP(1775541646585 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'yolii_ff@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1775541646585 / 1000), TO_TIMESTAMP(1775541646585 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'ricardo_solis05@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'ricardo_solis05@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$x7vEYH3oyHO9Gw==$2jmGK2cIdalz4Iq5/+hCoaXZfRJXalBKG9Qunul0gYp5hSzgtrhHQCg1wgeBwS5FY0rCx/MOjH5Qy7IRa4+fJQ==', NOW(), TO_TIMESTAMP(1773682779223 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "h1uoq839AkgvIOnjOrF2bXjq4dw2"}',
      FALSE, TO_TIMESTAMP(1771344799149 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'ricardo_solis05@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1773682779223 / 1000), TO_TIMESTAMP(1771344799149 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'mlopezgutierrez49@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'mlopezgutierrez49@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$R4JmMeQ6ik2KfQ==$Ye8p0lajZIB4A19lYpOAYaWsTKQCe+QMkY9RuOVya7F00jfMoq17neeKpgp5uHG+iM39/5voWDJPD2o8lwDFTQ==', NOW(), TO_TIMESTAMP(1774040044215 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "h6IwoZH7LpY2lTL6kULK5eYy3Oj2"}',
      FALSE, TO_TIMESTAMP(1774040044215 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'mlopezgutierrez49@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1774040044215 / 1000), TO_TIMESTAMP(1774040044215 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'cidl160@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'cidl160@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$6zyTJ0SHPQNpJA==$/3s7jOUGTKTpGvM9VpUswHgGIsKCWUQq5ahrdxrrCsIEptHNv/eiae0vrpjBFPPidz9f9NZyCcQAqEGRZQUyUg==', NOW(), TO_TIMESTAMP(1772330022500 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "h6o9r7CDkQfwsF1X9IQnn1cKrBN2"}',
      FALSE, TO_TIMESTAMP(1772330022500 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'cidl160@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772330022500 / 1000), TO_TIMESTAMP(1772330022500 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'mili5zy6@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'mili5zy6@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$BLT6qqNxIwXMIw==$N+6yLYdSYO50WjBpAUm78zZnkDuFvyVuBsUcRkTRnyYoEpfTc42HVapOSk8TJBbiIZNeJYsLZ+eLw+VHUdpmAQ==', NOW(), TO_TIMESTAMP(1772554068916 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "h9MpiNMgyXhQXcwP7pA7FF68ucF2"}',
      FALSE, TO_TIMESTAMP(1772554068916 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'mili5zy6@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772554068916 / 1000), TO_TIMESTAMP(1772554068916 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'vane38774@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'vane38774@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$m4//RpyuZkzWMg==$RAdUYjMAtTfii4Ztp7lUzPNSgIuJ/AmvMcEkELPHtID3KJCiv/ivjeM3KunnGCF0Jkp4Z/n2NWwxeFAAgruDZw==', NOW(), TO_TIMESTAMP(1771730083095 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "hGGiTFQeqiZcHiYY4ZNko1Filbf1"}',
      FALSE, TO_TIMESTAMP(1771729701697 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'vane38774@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771730083095 / 1000), TO_TIMESTAMP(1771729701697 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'noriegadelgadojuanalberto@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'noriegadelgadojuanalberto@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$lqS+O66hTtavjw==$AfwgjclhNpWmTSzqJKPB9ZuIrUAYdg81O2mrF5SFQg+0dcZIsuWgpUvOTlB/8v4NasbdjVPvmjC6BUm2z7xZeA==', NOW(), TO_TIMESTAMP(1771608034604 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "hHO1Yc90P3hjJ4vkW5q2pMVmrvz2"}',
      FALSE, TO_TIMESTAMP(1771607841138 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'noriegadelgadojuanalberto@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771608034604 / 1000), TO_TIMESTAMP(1771607841138 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'oscarorella123@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'oscarorella123@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$3PFldZ0KL/2WXw==$napZbpJBlFUtd/3+0nIKXaYK7+z3K+JI/hrEWbQbXmErntC5mznskooMkJDK6km7t2w88HYlNj5yDx74KnV9Nw==', NOW(), TO_TIMESTAMP(1771363775966 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "hSi5Wlb2sSMbYzN9ONPOV9mWd0n2"}',
      FALSE, TO_TIMESTAMP(1771363775966 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'oscarorella123@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771363775966 / 1000), TO_TIMESTAMP(1771363775966 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'roman08as@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'roman08as@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$va9MeC7QR1Ivhg==$Dp6EzVgIu/cENPyvKkMqO7fqG3CwEOlEEML4TbLKJE0scqiE/7sid4YaydmOf+g7wmeq3wAMYxiBytMpdxgQTQ==', NOW(), TO_TIMESTAMP(1775050684975 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "hV2KNgPnrPRcWNosyJc1hXhVcPB2"}',
      FALSE, TO_TIMESTAMP(1775050684975 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'roman08as@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1775050684975 / 1000), TO_TIMESTAMP(1775050684975 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'josea.valdiviezoc@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'josea.valdiviezoc@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$1XQDxrOBybMQNQ==$JOsjZ6knyRJ/Y13FHcCMsktId8uAbO6Kl6DrKWcFcH5gMYUMbDaKwlQBJJyypSDiKTeBvhT/1Jt2v6mR55GQYg==', NOW(), TO_TIMESTAMP(1772327672442 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "hYMhvterFdSKQFaPicmqbtcEFc43"}',
      FALSE, TO_TIMESTAMP(1772215972402 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'josea.valdiviezoc@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772327672442 / 1000), TO_TIMESTAMP(1772215972402 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'hm.alvaradogz@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'hm.alvaradogz@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$SLttsZLZO4r2GA==$I+FJWxzUKm2Bz0HDdQU2nS0wcthECzsXAQPv/a9QzRsFnx3ZLbv5HzluDwG8pEfZc2ozzazhcO/nH5pv0LfECw==', NOW(), TO_TIMESTAMP(1772315866957 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "hZfC4xP7L7e50V68kfObI1OTkgm2"}',
      FALSE, TO_TIMESTAMP(1772315866957 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'hm.alvaradogz@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772315866957 / 1000), TO_TIMESTAMP(1772315866957 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'katymalu1102@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'katymalu1102@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$2TzQN9OQF4/WvA==$nNUb6Ogh3BML1W5IsXy3iGHzKJC2BjI9DDZpitEi+/Okmv/41LF8LeVs8HLKyqXwapyHcFJn5nQaSHXmO7xZIw==', NOW(), TO_TIMESTAMP(1771684579514 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "haH8G7YzE6gy44Tn4q1UiOBmnZw1"}',
      FALSE, TO_TIMESTAMP(1771277191823 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'katymalu1102@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771684579514 / 1000), TO_TIMESTAMP(1771277191823 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'kafresoul@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'kafresoul@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$8oubW2RaYTfXgw==$DsIQMnyERJCWEQ3cJDjwSpfK1sgsPt9zQCOjIatn5X/7e6Wh5NIZEHprnjMLBdjQE23/jj5CtGj5jxeLnj+EqQ==', NOW(), TO_TIMESTAMP(1776236562777 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "haVWRpvDbuMCLjTj4AZoujr1MSm2"}',
      FALSE, TO_TIMESTAMP(1776236562777 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'kafresoul@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776236562777 / 1000), TO_TIMESTAMP(1776236562777 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'lilianagaudalupegomezjimenez@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'lilianagaudalupegomezjimenez@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$P35TWpXg/CDxEw==$77xejZ1LIHJgsE9R6k6j98YxcT3H4UJ7dnpBQdE/84oWEcichIGTzd9ydnT0k9q4oxGEQY1fpRshG4UOtXUkWg==', NOW(), TO_TIMESTAMP(1774316650388 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "haYnq7Q5s3acMCtguFDulf7d1b63"}',
      FALSE, TO_TIMESTAMP(1774316650388 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'lilianagaudalupegomezjimenez@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1774316650388 / 1000), TO_TIMESTAMP(1774316650388 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'evazquezsantz@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'evazquezsantz@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$K5J/wkkU0T7MwA==$l6wAWa+V4lW8yqGLSHCnFuB6aDvlZGr+K7SwRYku9GhclJOB1igmbAxKPLRSlAeVcdNsj98TQyw/vUM+NFDCgA==', NOW(), TO_TIMESTAMP(1771814264784 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "hbmbktiLB9YC5pqMLU1Y6hIM2rT2"}',
      FALSE, TO_TIMESTAMP(1771317821298 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'evazquezsantz@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771814264784 / 1000), TO_TIMESTAMP(1771317821298 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'psicologa.issa@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'psicologa.issa@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$jz7ReFB7ClJvrA==$O/X9VoyKedjolYxJfkVabJGRp//KpdQVQC6XnIRdEhwgLYt4xtjr02PecNDFmVJTOY0aBCqAl9PABiUs1YxR/Q==', NOW(), TO_TIMESTAMP(1771350784019 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "hhxSmOBhcNebYEZomeh6H7JK9ge2"}',
      FALSE, TO_TIMESTAMP(1771350784019 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'psicologa.issa@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771350784019 / 1000), TO_TIMESTAMP(1771350784019 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'morganwendy98@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'morganwendy98@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$HacebPp4KDw2Wg==$vMWrUwg/+iO7mOvSbRDCVtAAGf/pqxmjHH3VnCYZGMeiHeQGHoqlD96hUhg/gMcgeJnuFuLXnlkg4pIx0ZwQUA==', NOW(), TO_TIMESTAMP(1779120226214 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "hiNv2qk66qTT1i6KaEfofA75sh43"}',
      FALSE, TO_TIMESTAMP(1779120226214 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'morganwendy98@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1779120226214 / 1000), TO_TIMESTAMP(1779120226214 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'escorpionluna323@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'escorpionluna323@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$45jTJVh91GuGDQ==$LvWwx8R4DRTzKZcNIHazUej5DF4pP/TLSPrr/aai6x5DVLl0YrcQq3YhKY6oaU+Tdyp5EvBY/5ie1OsBzHh78g==', NOW(), TO_TIMESTAMP(1765851706238 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "hj07gmXUalZEitKlz7pLkeScHlt2"}',
      FALSE, TO_TIMESTAMP(1765851706238 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'escorpionluna323@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1765851706238 / 1000), TO_TIMESTAMP(1765851706238 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'mvc01088@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'mvc01088@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$/9WBg6fME6lzQg==$iiT4wGNGKy6Gtb5BcUfvw6LxW6GlN9AHAROAB+fkEylf4lPFyIwij2z0LDZDd+mTzd6/vk+6h7AkBK4pTiIA8A==', NOW(), TO_TIMESTAMP(1756581212624 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "hjja85MNPJhKISedAZclB3F6vBj1"}',
      FALSE, TO_TIMESTAMP(1750890712352 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'mvc01088@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1756581212624 / 1000), TO_TIMESTAMP(1750890712352 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'patajanet@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'patajanet@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$I329BJ0yxN/xJA==$leW9WxPNWfkFu/i25cSzoRWShX1V2EbUX4bT5Ks1uMtfRKT1hQvH//nyTEL/W9cBX6fZWA8g4zjMlf5oPrt2Xw==', NOW(), TO_TIMESTAMP(1776220898303 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "hkMb7xVuljNVmsZTT9EwMD7eCtE2"}',
      FALSE, TO_TIMESTAMP(1776220898303 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'patajanet@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776220898303 / 1000), TO_TIMESTAMP(1776220898303 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'sacruga@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'sacruga@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$gjsisjrA3QK7NQ==$v8yO8/byA6uKXIgluQhBTcNQeZgm8d+X6Q8GjFRw4c8oNDMW0dLCdhuDGS2NhPE8H4gfgCTUyAaczaxjOvBlnw==', NOW(), TO_TIMESTAMP(1764283913561 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "hlMypzlViRPuW716L3QZWKwdJU03"}',
      FALSE, TO_TIMESTAMP(1764283913561 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'sacruga@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1764283913561 / 1000), TO_TIMESTAMP(1764283913561 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'waustorfberenice@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'waustorfberenice@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$x7m+TsrO2qY3tg==$HOgm/YhxmPA+snA56tgVEeQjlN9GvK7h18TDqDATb+FTvSwp1lmMexOONog5EQd7JN7ocRB1Ui7J3r7+H6xyag==', NOW(), TO_TIMESTAMP(1776670254256 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "htKicRcK5KMQx0OVtwArmyXRJLG3"}',
      FALSE, TO_TIMESTAMP(1776670254256 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'waustorfberenice@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776670254256 / 1000), TO_TIMESTAMP(1776670254256 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'xrafa1@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'xrafa1@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$DyTFzpaiUh+zIw==$lqSaMtbGOWY2XeGe9WezJbGRsIkRBNPjQdm4u1WexIBjOM5aXF5mcc3qjja+ugikd3sDV5vYxGQoSSAicvSpqg==', NOW(), TO_TIMESTAMP(1771274619571 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "htZp9XQWeSPgc6TmZcjdUyGilza2"}',
      FALSE, TO_TIMESTAMP(1771274619571 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'xrafa1@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771274619571 / 1000), TO_TIMESTAMP(1771274619571 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'jncrisgarzacastillo554@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'jncrisgarzacastillo554@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$ou3VYmfFvQLnRw==$qDNoKQG1f1hOsgA2Dgnq8abpR4tlTg4ORMeN19V5Z/4Mf3uAXLE/cgcvDE0ApsSUegfxq0ZGsz/+TZkDQIeSyA==', TO_TIMESTAMP(1751384489581 / 1000), TO_TIMESTAMP(1752722525661 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "htfo4gjdb1dyDDBEPPGZ7ffAnMz1"}',
      FALSE, TO_TIMESTAMP(1751384489581 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'jncrisgarzacastillo554@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1752722525661 / 1000), TO_TIMESTAMP(1751384489581 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'davidalejandroh975@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'davidalejandroh975@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$zPS7ClUWVOquuw==$tawSBrYzrtsqk6g+LZNArLqrELtVYDiiuCxg6dM/6yaOgtYd0d2lEnzlhl5hssgU4/jhVriVwIz/aR1lUIu+1A==', NOW(), TO_TIMESTAMP(1776464153907 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "htyT8lO8fah05pk6wcK1gdUFXeF3"}',
      FALSE, TO_TIMESTAMP(1776464153907 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'davidalejandroh975@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776464153907 / 1000), TO_TIMESTAMP(1776464153907 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'manueldejesusj36@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'manueldejesusj36@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$5G6OQmUbwXj1AA==$HR7E4IkHxjekVmOkGmvq5DN8Lk72eLfwZvvRaCEbM7LYKqk1fnsy2bwi+dyJJrsfK9z9rbYkaDymEJ9SwpkylA==', NOW(), TO_TIMESTAMP(1775577243497 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "hxwpQaQFLIfrapilQzJRuNtJusn2"}',
      FALSE, TO_TIMESTAMP(1775577243497 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'manueldejesusj36@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1775577243497 / 1000), TO_TIMESTAMP(1775577243497 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'brandonestrada022@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'brandonestrada022@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$ETxMNhq7C5oFlw==$zTwAzD1B9dgA9lzJRgy82WcG4gd5jisiP7gGZp3axZdfMN73cnfCADCghZaCcg0H3S4a9QA54vYbEtKmgG9axg==', NOW(), TO_TIMESTAMP(1772147499632 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "hzF5y00IA9Z9yIvmY9z1KoEUMB12"}',
      FALSE, TO_TIMESTAMP(1772147499632 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'brandonestrada022@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772147499632 / 1000), TO_TIMESTAMP(1772147499632 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'michelmartinezhernandez690@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'michelmartinezhernandez690@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$WRVBT8U/VU5iEA==$l0Uo+B4IcVrf31Lce4nKQvLRER6Z1WupoG3p2+cfPKqvYJgmKXY5QPQ6i1zwuh79GbjXuU3JFL+IgOoYOhFj+w==', NOW(), TO_TIMESTAMP(1773707491880 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "i5qMZoZMUjd3Qcp8RyRCwgYbepl1"}',
      FALSE, TO_TIMESTAMP(1773707491880 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'michelmartinezhernandez690@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1773707491880 / 1000), TO_TIMESTAMP(1773707491880 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'florivalle39@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'florivalle39@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$U05mxu5bwFPwTQ==$f3qBPjJzDrnS+J1bAEFBeXrqnqRGM/tyriLDHC9GrBlY4DwqG66u63b5USPpQoPw2zzfxPwf+P3E+Z4Z0nIzjg==', NOW(), TO_TIMESTAMP(1771372372077 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "iK7UDq49JnOaL2FQ7PsPCGCxluC3"}',
      FALSE, TO_TIMESTAMP(1771295803649 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'florivalle39@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771372372077 / 1000), TO_TIMESTAMP(1771295803649 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'eldasanchez0210@gmail.con') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'eldasanchez0210@gmail.con', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$JJaYxOBV+RyBtA==$SJV+N5Ao9vae50GNbHFtuVAzLn58kM/Gw4Oxb6FiNCBiMNWZh9+6DkKo6PL4GPkDuzp45IzCTn5BJwEAl6bskQ==', NOW(), TO_TIMESTAMP(1771517091385 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "iMiXHHkPwNWChdFVMkoQKecRUGo2"}',
      FALSE, TO_TIMESTAMP(1771517091385 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'eldasanchez0210@gmail.con')::jsonb,
      'email', TO_TIMESTAMP(1771517091385 / 1000), TO_TIMESTAMP(1771517091385 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'carlos_vs_2000@outlook.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'carlos_vs_2000@outlook.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$LWcwUKlDq15Whg==$DqeepVqppptRc3EDy1fUvC+y0PdkRx+s2Q2jh/Q9+1wXg0ihDRTOyA3Vr/i305IAYtkW+CpkLMwYnu98tObJcA==', NOW(), TO_TIMESTAMP(1771771946425 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "iP0TDMj2OJSGELl7T2QqmQrmbV82"}',
      FALSE, TO_TIMESTAMP(1771771455113 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'carlos_vs_2000@outlook.com')::jsonb,
      'email', TO_TIMESTAMP(1771771946425 / 1000), TO_TIMESTAMP(1771771455113 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'ricc55lqz@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'ricc55lqz@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$2fJ8nE3QQw+84g==$rYzKJqXigTp6jV5Z0CRSe6yVF31di9GDrQyYQTcEye1VqOLcZpii6129rHZZcFGrUorOTnv31IdzsgKeAmwMsQ==', NOW(), TO_TIMESTAMP(1771508926500 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "iRC7JbiD0IVd7H46qHVMVF9Q0Jp1"}',
      FALSE, TO_TIMESTAMP(1771508926500 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'ricc55lqz@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771508926500 / 1000), TO_TIMESTAMP(1771508926500 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'dorantejose23@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'dorantejose23@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$c5ClaB2k8xjlZQ==$z0kL/JDiXPokRrvC2Me0wf2Zq9nX/hYLe6hOG2vtCr1y3gL3fwMpRbyizMAu4Qcw9pETxAtOEjfSV2CtPJRS1Q==', NOW(), TO_TIMESTAMP(1769527317833 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "iTMm999xdCZa0wes0aEUuAUiMRC2"}',
      FALSE, TO_TIMESTAMP(1769527317833 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'dorantejose23@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1769527317833 / 1000), TO_TIMESTAMP(1769527317833 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'lilianaesperanzacastillejos@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'lilianaesperanzacastillejos@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$dxvG2LRIB1b2XA==$ZDpDMsVh5XQ38F2ucpPOI5fECl4WTyb1JvX6iWC2/v+YGhSrHo7NcxPC6LMRZDTdzFalNCcnBjckQNCSug2hkg==', NOW(), TO_TIMESTAMP(1769833847027 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "iTihBdeuChZZy746lNjjApqZCv72"}',
      FALSE, TO_TIMESTAMP(1769833847027 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'lilianaesperanzacastillejos@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1769833847027 / 1000), TO_TIMESTAMP(1769833847027 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'mrmr.294090@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'mrmr.294090@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$H8JT0qs0jKRUbQ==$PTi+MuHVLqdy37D8sjdXO4Pt/5pHt6NT7G2spDtVT4JZnHXzxXSMs+t5y48O4jZ4SgSMtsFwB54jWfPrGhQJKQ==', NOW(), TO_TIMESTAMP(1774670121981 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "iVwOzV8sDPZ29YkePzsDJP50i6J2"}',
      FALSE, TO_TIMESTAMP(1774669461221 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'mrmr.294090@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1774670121981 / 1000), TO_TIMESTAMP(1774669461221 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'chopo555@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'chopo555@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$Sb0xLcbsx5vmKA==$MclNy5chGXiTQP3DqWcrPbuO4Oil5LspQdfbkt0Hgtpyk/rxx/unugF1TMrnCe+oCUOFdXHbN36z+EB00MgPHA==', NOW(), TO_TIMESTAMP(1772494076981 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "ibErIv4AhZVMokoFjakaE9eqHtb2"}',
      FALSE, TO_TIMESTAMP(1772494076981 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'chopo555@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772494076981 / 1000), TO_TIMESTAMP(1772494076981 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'santizlogan1986@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'santizlogan1986@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$JlGcbYfArIffuw==$40BG0REqG50TGqxsSRoy6X6VUpLRrVmFXnOknh5yJFb/tVx4HLQtdjv3T5NOe14E/mUBeXimrbWIaZca1trq3A==', NOW(), TO_TIMESTAMP(1771296697194 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "icXJcODx9yQzHIDqknS51cb5sxT2"}',
      FALSE, TO_TIMESTAMP(1771296697194 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'santizlogan1986@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771296697194 / 1000), TO_TIMESTAMP(1771296697194 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'adrianazmbranovera@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'adrianazmbranovera@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$0vA72gK9U0+tYA==$PrLaXru3GIicZU1G3UUsnUsMsGoTFZ1yk+pl6UomeOF+8xvK4RmuXLZIanxKMrrKVqLiMvWwcx3Cd4yVrM3dOA==', NOW(), TO_TIMESTAMP(1771347866732 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "iih6auFbT5Z500SHGqYUqQsnB8O2"}',
      FALSE, TO_TIMESTAMP(1771347866732 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'adrianazmbranovera@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771347866732 / 1000), TO_TIMESTAMP(1771347866732 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 't.carloscruz2@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      't.carloscruz2@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$CCasnhk+MV7clQ==$ZjJoAhKyAkSo4ilBxaKwnNHsbBwMRjhBNHOc8J4JmM6JwJ8UwXCCjdKnUZ5K0fNhqSeVRkjmno3S54992S1PWQ==', NOW(), TO_TIMESTAMP(1775355802165 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "ilRLb2MHaTeL0ykOmBHxSSxHhQS2"}',
      FALSE, TO_TIMESTAMP(1775355802165 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 't.carloscruz2@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1775355802165 / 1000), TO_TIMESTAMP(1775355802165 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'javierxx76@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'javierxx76@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$U4aHo9DFxgi+Ow==$dbeomj3Eok4JfR/WcrZLM/s9FUJ0jy369WBM8y9tZ9JRvO/Hw1ZvPV2zYXcIuRYHAUsC07ZADrx3AD6vo8inVA==', NOW(), TO_TIMESTAMP(1772137803140 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "imYTavoaLHf0Oead7WjWkNw913g1"}',
      FALSE, TO_TIMESTAMP(1771290805730 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'javierxx76@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772137803140 / 1000), TO_TIMESTAMP(1771290805730 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = '190593eduardo@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      '190593eduardo@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$OR6yuZooRKqJtQ==$TZYyuYGEEoDVJgGrFTIPfEO4yWhOW2XivlprW6yJYQl8G633WkJIzeW+9IzQtOpD9bEwN04qZwfcvHc4LQpnNQ==', NOW(), TO_TIMESTAMP(1771281966081 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "ipCUrUmgDKOOaO5es1RGOsmOfpn2"}',
      FALSE, TO_TIMESTAMP(1771281966081 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, '190593eduardo@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771281966081 / 1000), TO_TIMESTAMP(1771281966081 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'recrearse.mx@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'recrearse.mx@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$xm2QikkZoV9TDg==$B3m3QRgMRalx5CCCieDwBWXWezld7dg0Ivw4ZJq9c0FAWCJBpnqlbU4RsRR7qNf1RodtIkFKg2sCOe96Irgxdg==', NOW(), TO_TIMESTAMP(1771540950160 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "isiceuihb7OJ26hdRReqcZaRb9q2"}',
      FALSE, TO_TIMESTAMP(1771540950160 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'recrearse.mx@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771540950160 / 1000), TO_TIMESTAMP(1771540950160 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'mejorrene123@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'mejorrene123@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$bYNgU7glyYFH2g==$+jcK1gxVoSjpTT8LyFiF9zrJsRDhIE+LPJuYLbarAenOFFPLB+rHl/kAflS5FuPkeOR25CLR/cABa8vOo82q9Q==', NOW(), TO_TIMESTAMP(1772387549048 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "iu3cswsuXKRKLw0qf7NSPP7WjJf2"}',
      FALSE, TO_TIMESTAMP(1772387549048 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'mejorrene123@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772387549048 / 1000), TO_TIMESTAMP(1772387549048 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'vazquezirene118@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'vazquezirene118@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$G3NZBUN+jfsLhA==$76qCG4vN0DD6OWm9QDnZNzDR/6E82xSdv348DwYPWclxKbuQrqh3T9MoKIAXXjJqk4pkSVKj11e8vkEnn7sJjg==', NOW(), TO_TIMESTAMP(1764181159760 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "iy3naLaTb5T2AJm5JpLhR3Xbr7B2"}',
      FALSE, TO_TIMESTAMP(1764181159760 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'vazquezirene118@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1764181159760 / 1000), TO_TIMESTAMP(1764181159760 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'jorgeluis2860@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'jorgeluis2860@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$aFX5Ld0eNnj5bw==$cQVdQqlO0HarrdIMZcQAHQaJXjMw2NQ8dCzx2FEHYCetToES0jajeP+xKtm8S/f4XsqNXyice8AZNyUD9upmmg==', NOW(), TO_TIMESTAMP(1772858981932 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "iyInaNNREddzhdcbsiYZ9GOwSHH2"}',
      FALSE, TO_TIMESTAMP(1772858981932 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'jorgeluis2860@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772858981932 / 1000), TO_TIMESTAMP(1772858981932 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'carmonaricky181@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'carmonaricky181@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$ZxPOWg3cay6KiQ==$MrzgZWuZLw7UwfhXAeDgApXS4M4cP5et5XNi17lP76LqGgzLDYaT8uz4yPhsSuTIVBi3rd1hnMMaEd2XJBN59g==', NOW(), TO_TIMESTAMP(1776230914151 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "j1nK2NyVHwbaefo363rr0cUYNuS2"}',
      FALSE, TO_TIMESTAMP(1776230914151 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'carmonaricky181@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776230914151 / 1000), TO_TIMESTAMP(1776230914151 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'ministeriojec@icloud.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'ministeriojec@icloud.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$XKYzwI1h94xnHg==$l6PLUiEaGuV3HG584mNlrxG5kv153F6E9bxPmDyfULzleVeeDp0JoXCPVV6v8Q76pKfXtPn0rhNk2QcBf73ODg==', NOW(), TO_TIMESTAMP(1774716138138 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "j3ShBNF2QfVUBcfuAr2ClNTkrjz1"}',
      FALSE, TO_TIMESTAMP(1774716138138 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'ministeriojec@icloud.com')::jsonb,
      'email', TO_TIMESTAMP(1774716138138 / 1000), TO_TIMESTAMP(1774716138138 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'arpaylinn@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'arpaylinn@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$ukCfmve5mIlBJw==$pdF5SF3a0KfVNXlZJ9FVcdrg+/KNfVS97WHZuzMwUgXB9M6gk0SD9mFUPl74siexMMNh2a33KyEL85yfU4OI0w==', NOW(), TO_TIMESTAMP(1775665897390 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "j43W0ze4PVhpJNOxjRTfHQ9MyTJ2"}',
      FALSE, TO_TIMESTAMP(1775665897390 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'arpaylinn@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1775665897390 / 1000), TO_TIMESTAMP(1775665897390 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'sophi.gonza07@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'sophi.gonza07@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$U5dPahTgDU2f6A==$2AoEAEtXdBIZ9Xeg5JwWBq74eG3AoEDUomt76ksn2PyP9gYLvVypy8SJsdinkh9e7269NYpVFKpe78/T2L0Wqg==', NOW(), TO_TIMESTAMP(1777048683875 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "j4p9UajsKYMVRBXlXiwsYp4TKBS2"}',
      FALSE, TO_TIMESTAMP(1777048683875 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'sophi.gonza07@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1777048683875 / 1000), TO_TIMESTAMP(1777048683875 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'reyesisaias774@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'reyesisaias774@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$kf1QjYUVaxsRfw==$CRYY2ZTzO3pnddHjbPZN7K6FjLpErntJAuNNhgj8rwoW0QCRA1jVS/K1GLGd3bO0bTZ35GnHBj1CO+vT5vjlMw==', NOW(), TO_TIMESTAMP(1753142219565 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "j7A3TPBtFaOOPEGO9HvaUfyP02l1"}',
      FALSE, TO_TIMESTAMP(1753141187820 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'reyesisaias774@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1753142219565 / 1000), TO_TIMESTAMP(1753141187820 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'mar20_00@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'mar20_00@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$Begwfuj9kwV0Hg==$bTJCQQHCkjLINcd5YcT6eLIbcKEP2Mr0/CutI5TQ6hy5ZyuHjLbpLHyHEdx4JmtR7LYqAo8NZdjHmKQY8LKjiQ==', NOW(), TO_TIMESTAMP(1777867208091 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "j8NPFraLYpOpJ36GOYxJZdCWeSv1"}',
      FALSE, TO_TIMESTAMP(1777867208091 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'mar20_00@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1777867208091 / 1000), TO_TIMESTAMP(1777867208091 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'tamiztala@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'tamiztala@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$I65wV8uECEZ0Dw==$cIgbXfP3sROgMo34FrPhrCd6wZN0RngAVTUGovjVvCfWH1d1KoTj0wH+t/z4j7DbiT4KQxooNKxDbvzScP6D0w==', NOW(), TO_TIMESTAMP(1772843835641 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "jE3QGrv8JpTljJCQ8uEEHUPd6Fy1"}',
      FALSE, TO_TIMESTAMP(1772843835641 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'tamiztala@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772843835641 / 1000), TO_TIMESTAMP(1772843835641 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'jpsun303@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'jpsun303@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$HTCaNmyU4breYQ==$Na07wVHacK4MeERDj8eEchvVkNbXkmoo3pEbnYdNLAPzLj6hhCX9U2Y/vFErGQJfAf35t2HAFlfXviJoFPBBSA==', NOW(), TO_TIMESTAMP(1753638388022 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "jUNLtKZL8FPpTXN7hyxw2zbWEk82"}',
      FALSE, TO_TIMESTAMP(1753638388022 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'jpsun303@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1753638388022 / 1000), TO_TIMESTAMP(1753638388022 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'hectorgordillo207@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'hectorgordillo207@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$pGuRnmfRM1FvoQ==$u9LZOX5hDGyD3NCFSfpH+QqWTTZpxkV7CVx4MUXs6L94ud5+3Fp8FpA9bgA9oCVuHL+iIlFVm8ycDXJ4ehrraw==', NOW(), TO_TIMESTAMP(1769722907956 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "jZt4pul8mZOWqAWuosay2SMnaW02"}',
      FALSE, TO_TIMESTAMP(1769722907956 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'hectorgordillo207@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1769722907956 / 1000), TO_TIMESTAMP(1769722907956 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'mieryarmandocv@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'mieryarmandocv@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$aHUNS0gyXEU25A==$8G0YTskLKquV0wo7I9PwyaQw/7gDhocufigbo4DuNwsjnYWflyMGYqmkABIHd8JtXtw4aJSbSwhVdXnrvN952Q==', NOW(), TO_TIMESTAMP(1753298824694 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "jf9L5cBCzIZ1AVBUZ1DEjRPQ45k2"}',
      FALSE, TO_TIMESTAMP(1753298824694 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'mieryarmandocv@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1753298824694 / 1000), TO_TIMESTAMP(1753298824694 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'angeelronaay@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'angeelronaay@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$5ubbhxO6W3/96w==$qQQq9Zvp+gM+ggoGxVRzyEMTPqVVG9YZVs0owWGOc6Mq1/3IrclpFOkdWWTY97/umCYciPz3z/CQONdO5PWoWw==', NOW(), TO_TIMESTAMP(1772086713595 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "jgcgSSJjmibMgQ3ZuFZc5BN3w1f2"}',
      FALSE, TO_TIMESTAMP(1772086713595 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'angeelronaay@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772086713595 / 1000), TO_TIMESTAMP(1772086713595 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'lj286685@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'lj286685@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$+CrPTtnYY60H/w==$kUdbyz7sLLf+sGnlhW7QFiJ2Thw0UZrwp3kbhG+7VAgbx5bz/X943Ba0bAFotPzVjuxBRJBsqjqziWpxL+cTsg==', NOW(), TO_TIMESTAMP(1771354136558 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "jn6XSwMIq6MkTtuKGrfoO4cchn13"}',
      FALSE, TO_TIMESTAMP(1771354136558 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'lj286685@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771354136558 / 1000), TO_TIMESTAMP(1771354136558 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'ric555laz@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'ric555laz@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$fQUvY6W6TB3uFg==$tOTnqF+VfoOP8tm2bpBc06VUpH9Kdwe0tDsAFAzDqx9V9EWYGiLV7l7CKYJmUrF0vEIM1xUzPTFDLBUEcHT7YQ==', NOW(), TO_TIMESTAMP(1771455631826 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "jqCrpDjJ2IUAJrYp2K3gPVpdqlI2"}',
      FALSE, TO_TIMESTAMP(1771455631826 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'ric555laz@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771455631826 / 1000), TO_TIMESTAMP(1771455631826 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'sebastianaf90@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'sebastianaf90@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$bSNPNV4RI/vrhQ==$jdAZH05jc9Zqli2zsw5mrWdARUveXhOtWDBJBxCy4TBhejAUGsr+pGM9xdiP2as702CoHCul6MMoSYg9n8BZAA==', NOW(), TO_TIMESTAMP(1776220898162 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "juGHT2iKZyc8iHCTUrbMazDj35h2"}',
      FALSE, TO_TIMESTAMP(1776220898162 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'sebastianaf90@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776220898162 / 1000), TO_TIMESTAMP(1776220898162 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'angeliiitooo27@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'angeliiitooo27@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$OzecP4FFfV5dXA==$d3cRJJXLt/XeIcP3oIMwaSW6/GDlDlHXLTnIPjceJEHhwIkFPqvJiaD0tWD6Kil2Qu2OdlSPoYBGQ4fL3exMVg==', NOW(), TO_TIMESTAMP(1773254022786 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "jug0eWzs8scgr9MqLNOJFQKDh1k2"}',
      FALSE, TO_TIMESTAMP(1773242679640 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'angeliiitooo27@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1773254022786 / 1000), TO_TIMESTAMP(1773242679640 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'deivigonzalez24@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'deivigonzalez24@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$ns1M/qpNowr80Q==$4BDKdoSjf3R7HhHcAyUECnlqeeep6JEAHPPT7MNPPPQnyuILLoGVr0BjAEHiitHuK7WbwHs2UjzPnxtmprg1gA==', NOW(), TO_TIMESTAMP(1777320054233 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "k63lQucA1CfHcTV4ZXI4WueHNL23"}',
      FALSE, TO_TIMESTAMP(1777320054233 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'deivigonzalez24@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1777320054233 / 1000), TO_TIMESTAMP(1777320054233 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'juanherper5@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'juanherper5@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$n2AuykspH9gYFg==$9/SFDKBKx5/wxwu92ILJ7NfeNdXkIgQkePLvNsylu3K1xKf40m5vaZfjpRYLGSvsHlbAzhlZP++8RmpwXpSRnA==', NOW(), TO_TIMESTAMP(1776219567150 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "kHhGjUor3sdLqLIXj5QYNwIXA5q1"}',
      FALSE, TO_TIMESTAMP(1776219567150 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'juanherper5@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776219567150 / 1000), TO_TIMESTAMP(1776219567150 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'heydiverosilvanohernandez@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'heydiverosilvanohernandez@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$MD6o4GdDVDNhMA==$ULHs0ij7oEZaNsfXHB+Xqhrld8WGmW3y67hQx/EJ46b3sJCapXYuB53Cr79+I7aUWBrM4Ku6h6BgqtCBWeE2pQ==', NOW(), TO_TIMESTAMP(1771306138215 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "kJL3wetddAY2NfG7ZZuSi7kTD4H2"}',
      FALSE, TO_TIMESTAMP(1771305669229 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'heydiverosilvanohernandez@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771306138215 / 1000), TO_TIMESTAMP(1771305669229 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'leidba2609@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'leidba2609@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$8OBRa6nIbo51mw==$TJZ9HZO6Yroes586mFus0Z6lPwNfvLQqWjwk7eYQGOZclXGZ5+ZnsdOeEC3s7N5WbTA6AILo6bDhz13SlD/mdA==', NOW(), TO_TIMESTAMP(1753831344116 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "kKzrN6XBEuWIBGIsEqKlvLVhEFp1"}',
      FALSE, TO_TIMESTAMP(1753831344116 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'leidba2609@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1753831344116 / 1000), TO_TIMESTAMP(1753831344116 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'riccc55oo@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'riccc55oo@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$XzxLymeIzKCxpg==$IBU3WkOoalL3nntHKYYNQzXtGWwTYpsS6tClFkLlqrAKlwARvWshxoug9vw8p8JoAP9g89ni6DOOuhufSfncmw==', NOW(), TO_TIMESTAMP(1774709693154 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "kL9K66RVcVPRLb4xAB1WWosvJaH2"}',
      FALSE, TO_TIMESTAMP(1774709693154 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'riccc55oo@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1774709693154 / 1000), TO_TIMESTAMP(1774709693154 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = '2203015581@alumnos.xoc.uam.mx') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      '2203015581@alumnos.xoc.uam.mx', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$nKXHs/nC1YBypQ==$B1Rlb9uqKzkepjCZMMOcCfhMUPabViYAAZc62zyWs6txWvot0RsnJEChhKUrCpHLWzg9E8dNepia9KH+gtahag==', NOW(), TO_TIMESTAMP(1772851983976 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "kOsnlAlEcJdS1rmRUSMibK002HE3"}',
      FALSE, TO_TIMESTAMP(1772851701639 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, '2203015581@alumnos.xoc.uam.mx')::jsonb,
      'email', TO_TIMESTAMP(1772851983976 / 1000), TO_TIMESTAMP(1772851701639 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'fergrutrilla@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'fergrutrilla@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$3dTSrScUCIfgnw==$TO31Vm7EQUqc/QkBof6ECPrUO1F56Rlf7RfCOk+TxrIBaJyAYW18jH8uzqJS2Ba3JjduwM03gvYLcR5bP4Tw8w==', NOW(), TO_TIMESTAMP(1774039855465 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "kTZcz6gBQPdcJZR13wx74qvYg2P2"}',
      FALSE, TO_TIMESTAMP(1774039660889 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'fergrutrilla@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1774039855465 / 1000), TO_TIMESTAMP(1774039660889 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'cielmar_@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'cielmar_@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$MHjetsoEtnFvCw==$VveReq9oO0wgdgo/vOMsFSt6+i1jTeKpW8b1OjTBKqXWFbU6xzKgZvOmxIuL/g/FdnuDO5BnSfXRYibyaJDH1w==', NOW(), TO_TIMESTAMP(1771737229719 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "kTardkvxvRRkHQ13AtCIgvCcs1s1"}',
      FALSE, TO_TIMESTAMP(1771737229719 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'cielmar_@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771737229719 / 1000), TO_TIMESTAMP(1771737229719 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'christianortega616@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'christianortega616@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$JEjOTA88H4hiSA==$JcBMlFahoYDy41oxLUImFGXgkJXXKBHBq1ZAijKJY1KDAdLCxoh7j3zZTVDderZDp/dG0ZPE4EIiDObbheOoBQ==', NOW(), TO_TIMESTAMP(1776275712989 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "kVA4Mm1KGUY4vIAk78ZqkhSUPta2"}',
      FALSE, TO_TIMESTAMP(1776275712989 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'christianortega616@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776275712989 / 1000), TO_TIMESTAMP(1776275712989 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'fercho_cruz2007@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'fercho_cruz2007@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$Xpvpib/gvYqnSg==$2E7nAlHGVyz20aq4rlo6i4Rp+lvdTiJemsxKdD1gGkatlXc4EhHT/gK5+CfMfBqh3isaDNSqi9ytgSI69HCsOQ==', NOW(), TO_TIMESTAMP(1771273933805 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "kXKTrtOel9h6vLqAeA7cQL4jl4c2"}',
      FALSE, TO_TIMESTAMP(1771273933805 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'fercho_cruz2007@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771273933805 / 1000), TO_TIMESTAMP(1771273933805 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'cpjuancarpio@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'cpjuancarpio@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$RFEd2f5jtdOwog==$OU9btwEZVV+Ymd6al1W8Rbky0kS3SJSICZRw7/+gQyqTqIP6T4YD/Vx7lE1wYpqFZd8W2GnmHpeGHY0EDRIG8Q==', NOW(), TO_TIMESTAMP(1776433879539 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "kft49MQFiPa90fzmEz1FrcDrhby2"}',
      FALSE, TO_TIMESTAMP(1776433879539 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'cpjuancarpio@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776433879539 / 1000), TO_TIMESTAMP(1776433879539 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'rruizvillafuerte@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'rruizvillafuerte@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$BVoimMRTBGGriQ==$c0CXNf/9sEv2Hcd9ljyQ/KGevnhqMQjvGUurGCkzTu6DEC2RlDnOgHlQbMfYT/RcUST9cLDvsxjiPZrGfGGL1Q==', NOW(), TO_TIMESTAMP(1772233381920 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "kkcmi7c7UCXsaZBGcbuJXgSbuxy1"}',
      FALSE, TO_TIMESTAMP(1772233381920 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'rruizvillafuerte@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772233381920 / 1000), TO_TIMESTAMP(1772233381920 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'lisa_ame@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'lisa_ame@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$OsVlbIXFwyXvUQ==$hZ7C20kizaFdC2Gu4n9qoKZEnXP6xjmnfkaB6sPxCwgGvx+E0wZ/mKxCz57eI+1wZ5cGuBy5XCi1SWguQD1AfA==', NOW(), TO_TIMESTAMP(1776263389703 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "ko3ohNb6gxUajn7z0p96WjzFKjT2"}',
      FALSE, TO_TIMESTAMP(1776263389703 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'lisa_ame@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776263389703 / 1000), TO_TIMESTAMP(1776263389703 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'issaizuniga58@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'issaizuniga58@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$Dj5zIikBf7hEjg==$4V0frVq0HF6Rvk0ivQowdxwspRKjbEnkcAUSItV5LOr+WRmQEnHoam5GRYALNHmmPG5t3poXWUuOEe+kBXkgpw==', NOW(), TO_TIMESTAMP(1776827836497 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "kruA2QzWQuhmOcHyIEB6AxGMSs83"}',
      FALSE, TO_TIMESTAMP(1776827836497 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'issaizuniga58@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776827836497 / 1000), TO_TIMESTAMP(1776827836497 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'jorestra50@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'jorestra50@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$WSvdBAZocmWiEw==$jPUkvadEbX6Wyp5V3BWWqLUQASMvdfjH/StdDeoJlTJRXogo9XGiHpwOg7kI6qXZBEYpbNZE/dEha832grwMaQ==', NOW(), TO_TIMESTAMP(1771279703562 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "ktM7Fs2Rl6QTLu6cQHhLdXBzKPh1"}',
      FALSE, TO_TIMESTAMP(1771279703562 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'jorestra50@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771279703562 / 1000), TO_TIMESTAMP(1771279703562 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'sralejandro191@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'sralejandro191@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$Z8GKtmy4lwa2tQ==$ZTDBtqcFOOI2uCYBATwbzBMfoh8j5eZm0BEqZNKeWpU0JX9YUoeG0YaGn89FI/psyd6njA4IcETyHa+tQhc8dg==', NOW(), TO_TIMESTAMP(1772388418552 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "kth1QKgtDYUBv5aFED8G9ihgit93"}',
      FALSE, TO_TIMESTAMP(1772388418552 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'sralejandro191@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772388418552 / 1000), TO_TIMESTAMP(1772388418552 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'brendalunitha13@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'brendalunitha13@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$gtf0fAuV0ILImg==$EkmAt46yoc5E8cPMlyXwHD3piTYqNgptTGZLOBUzkuCoRAU2jyeNa1dy54V00tJXeJ8wFAigaQXDfmkCkV0/Lw==', NOW(), TO_TIMESTAMP(1776261738625 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "kux7MRSVRcWBlqgSZYTNA4MQ1cp2"}',
      FALSE, TO_TIMESTAMP(1776261738625 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'brendalunitha13@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776261738625 / 1000), TO_TIMESTAMP(1776261738625 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'kirala3443@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'kirala3443@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$A9e/90wwHG7e2Q==$xCNq2DnhHQFU3w0D/PYUYlPGuJmgbUJsY9zTFelpJTnTafHv4cQcZsUUs7RrNX2XV4d53QjuooiwuHYYmBERFQ==', NOW(), TO_TIMESTAMP(1772745083040 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "kwCumvdHrQYmTyql4L2vSQK0cft1"}',
      FALSE, TO_TIMESTAMP(1764026045109 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'kirala3443@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772745083040 / 1000), TO_TIMESTAMP(1764026045109 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'santiagolizbeth315@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'santiagolizbeth315@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$ADaLv0I5G1hoyA==$6x5FEwxMT0LwgnO6BfWuWNfQn7puPKXJKC+a1QXXHfa46+9RuOtMVDOhZ3LD2oyRIM39Wrr6tygIzBhkQwhJvQ==', NOW(), TO_TIMESTAMP(1771281324868 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "kyxEUM0hyfMdUrCA9oq4bOaxf2o2"}',
      FALSE, TO_TIMESTAMP(1771281324868 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'santiagolizbeth315@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771281324868 / 1000), TO_TIMESTAMP(1771281324868 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'rosariochishna04@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'rosariochishna04@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$2/r3tIXR+e4emA==$MpUf6vLLEYHTaftDsUEUCyPht8jZFV6OJ6Qj0UarxyspU7yahMi3oEJzRqHH2AuMfIpnH/V4zMXQkfKNV8lueg==', NOW(), TO_TIMESTAMP(1771692112517 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "kz0b9qXaqWYThoi4ZMzLoKwJWGy2"}',
      FALSE, TO_TIMESTAMP(1771692112517 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'rosariochishna04@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771692112517 / 1000), TO_TIMESTAMP(1771692112517 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'lizgila1@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'lizgila1@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$5oQtEORuvFJ5SQ==$FMnoQ5cl1xOxekJw7sFicZKBUWmO4gW5Q+3/TpMuEkJL3Du0esJa4/3h4pbqVmzlFSdOYBTwufrR594oUOLkPw==', NOW(), TO_TIMESTAMP(1772163040971 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "l2EodX6OrPY2kXFAPHIBBOMhsWc2"}',
      FALSE, TO_TIMESTAMP(1772163040971 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'lizgila1@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772163040971 / 1000), TO_TIMESTAMP(1772163040971 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'brauliosepersonal@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'brauliosepersonal@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$Yt3zJqY2kKI94g==$IwTOORRf1kAlBs5EBwQk+7+WvV7l9hBRWXPrPziUOE6VoRuInLK8v3rrr6mdFg6FwyH8jLU5gML6+gxH7D5oGQ==', NOW(), TO_TIMESTAMP(1773359554909 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "l3Pju9Rq2TQECg6kmBlKBvLyYQW2"}',
      FALSE, TO_TIMESTAMP(1773032713644 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'brauliosepersonal@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1773359554909 / 1000), TO_TIMESTAMP(1773032713644 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'morenodiazmarthalaura90@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'morenodiazmarthalaura90@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$0m+gg1zjmanHYQ==$knVuJxEWVwkFfFEqwfZVt1KoVSTHtip+CutWwD8mWqhXwtFFJ1aWaL6mMBF1c1rbUXm7vb6GFq1F6nFiVAQlKg==', NOW(), TO_TIMESTAMP(1776265158788 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "l6e1gGKLYoWXmeKVxaT4bpLS3aw1"}',
      FALSE, TO_TIMESTAMP(1776265158788 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'morenodiazmarthalaura90@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776265158788 / 1000), TO_TIMESTAMP(1776265158788 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'stay.shop@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'stay.shop@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$K1xQqmWc3zJpZQ==$OmbJ345UIzPCgCISmDlCUC4fBkBppx5YJc8NTYpj+pqJf6m1yzkrCwm2iUlL3QdZnFeiU22ugCAqmQaGVSIZ1g==', NOW(), TO_TIMESTAMP(1753464628241 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "l82RI2uChsP0SfaDWhPBDgUsnwn1"}',
      FALSE, TO_TIMESTAMP(1753464628241 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'stay.shop@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1753464628241 / 1000), TO_TIMESTAMP(1753464628241 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'erikaelim504@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'erikaelim504@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$YYS1lnzhm5Pf3w==$Q8jqVpTal5lCqBnDCoMx1CO6E8n7xqSgLOx5cZ3VuTuJs0pp6pYB0efvTsPPu2CUC48Ay5jlfqI09nbsB3kn3Q==', NOW(), TO_TIMESTAMP(1775626490340 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "lHxgKeAmbjQn8yetHo0HCrnYwag2"}',
      FALSE, TO_TIMESTAMP(1775626490340 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'erikaelim504@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1775626490340 / 1000), TO_TIMESTAMP(1775626490340 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'mariel280908@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'mariel280908@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$Yjsrp1gaekaRsg==$VveQAC7QIJ8KpvzNIwz6H4GcJvn12mn31EdPHBjYfPGitp/ToKIhMW1BvkNi77jXXIZTCprNo5/tB4CAaVno3g==', NOW(), TO_TIMESTAMP(1772317339895 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "lKwKpvkGRlP2rmDALS8o4AtNSIK2"}',
      FALSE, TO_TIMESTAMP(1772317339895 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'mariel280908@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772317339895 / 1000), TO_TIMESTAMP(1772317339895 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'ac496889@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'ac496889@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$CsMAo8zDjhLZ0g==$sshqDO+tVDG9oRL2ydxHNt+eAJvlCcR3P8hzy0WaSUizFTwWSwoz1r3YOnOAhNGoYOTi/rfEkywHmL2SwpqKWA==', NOW(), TO_TIMESTAMP(1775609557632 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "lSS8ho1GsTWOqyjw7MECgIYNTmV2"}',
      FALSE, TO_TIMESTAMP(1775609557632 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'ac496889@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1775609557632 / 1000), TO_TIMESTAMP(1775609557632 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'brendajanps@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'brendajanps@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$a44R0voMCrpPgA==$5t/tyFNmzV0JsGkQAtWb+PPUI9gh73+oznb6VxcHDaTY3b6rfDB+d06GyA2RQniS8oiXYQ7g5Raf60zI6hZPtA==', NOW(), TO_TIMESTAMP(1775495393971 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "ljJJaJIthfZPQfndHDm82ybCD5x1"}',
      FALSE, TO_TIMESTAMP(1775495393971 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'brendajanps@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1775495393971 / 1000), TO_TIMESTAMP(1775495393971 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'roca@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'roca@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$gnaQdLucrA61+g==$2n9awXBGIWBt/tiIcIfmWJ7YGlxbw83+iC/OsktWIlr3dkM7yOxseCjz+N0o2W/mSnvmoEnKGENdA8GjiDbR9A==', NOW(), TO_TIMESTAMP(1774750750565 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "lloRktsytGYJxIky2IAT9W9FC5U2"}',
      FALSE, TO_TIMESTAMP(1774750750565 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'roca@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1774750750565 / 1000), TO_TIMESTAMP(1774750750565 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'alexandermdz88@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'alexandermdz88@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$bNSGlNvEISJ4BQ==$f0MbgEeQsX3QHSF5OohCTh4wl+9aIshbeiVhCzOD+TH6JpJDXIhYDVIpnHgWI8MRq+pM1JUHDVz4HUbWM3y4EQ==', NOW(), TO_TIMESTAMP(1772902389434 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "lmiH1vrtCPcOGLst7if0RTDuqMv1"}',
      FALSE, TO_TIMESTAMP(1772902389434 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'alexandermdz88@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772902389434 / 1000), TO_TIMESTAMP(1772902389434 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'miguel.arturo.gordillo18@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'miguel.arturo.gordillo18@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$Cu51mzPl7xMANg==$Shm1tYcgPCfyUv4hx14IhW2NvRC2+cYwoAu/IscXTCbxkPuclXFl2+x35v0dVCWVGenqrhmwZes2fW5t7WwFaw==', NOW(), TO_TIMESTAMP(1777264257508 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "lvVjx1dI0iNyxfFCR3nuv2p6efY2"}',
      FALSE, TO_TIMESTAMP(1777264257508 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'miguel.arturo.gordillo18@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1777264257508 / 1000), TO_TIMESTAMP(1777264257508 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'martha.martinez.trnado5@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'martha.martinez.trnado5@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$BtRtKAni07n1+Q==$y+WbP72daSz58VDmpkmqI6cQ+/XNhPW5iqUCBkZwM+voNC5tXwT4pYr6CHPDrwZ1e8+WYEpV6c1bF7Z5tCSYZQ==', NOW(), TO_TIMESTAMP(1773286554566 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "lwC1bFxtBSYgxbM3mSmw0VYdgMr2"}',
      FALSE, TO_TIMESTAMP(1773286554566 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'martha.martinez.trnado5@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1773286554566 / 1000), TO_TIMESTAMP(1773286554566 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'acselorta7@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'acselorta7@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$gTFuQO9a64lZtw==$HOu5bxB5ZX7OnwoCLJqN2QqsETKnbJ1W6MFsl43e14RpQIdsw0T1rU94gzE0spYQKzHLKbVMzWKvi8FxZb8dGw==', NOW(), TO_TIMESTAMP(1751508856960 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "lz95Grtl9je6LQiOWjpi1rmAkC52"}',
      FALSE, TO_TIMESTAMP(1751506426290 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'acselorta7@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1751508856960 / 1000), TO_TIMESTAMP(1751506426290 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'esmelitlwm@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'esmelitlwm@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$YVd30cbd/Bavxg==$2Fynye7V+pVN7w1LsaPpuRWQQa5QNqB6nHyVflClRKyUUU4JIvyaxchrac2HW6yU3zYOmsUuDYUgqlNWftOBzA==', NOW(), TO_TIMESTAMP(1771275010377 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "m1yAS9xjjdMysYMiFfipkjuH8SA3"}',
      FALSE, TO_TIMESTAMP(1771275010377 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'esmelitlwm@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771275010377 / 1000), TO_TIMESTAMP(1771275010377 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'leonardo1087@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'leonardo1087@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$+Dj6l5W9PmBAiw==$/d2IMNtrpzJhplSkTjLzHxzuJokhaQkuPVapKnqr5L/m0TBNYKPtQ+x79XTOYbuFCWm2qH2Tx2d3SE9UvWYcig==', NOW(), TO_TIMESTAMP(1773602918967 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "m2L8fkInaQfr8eUvDhlZJlmfF9p1"}',
      FALSE, TO_TIMESTAMP(1773602918967 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'leonardo1087@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1773602918967 / 1000), TO_TIMESTAMP(1773602918967 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'ltsjclh89@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'ltsjclh89@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$TA8+iqayCAcp7w==$MQkeHppsP5SWyEXJJY7VGUAaE8BGxmSPnJJQe9vwV5nSn9tO1bc4uiiV64HfZUSWAzDOtjYUra0OH4no05DQzw==', NOW(), TO_TIMESTAMP(1773040617563 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "m4nZOcWP1TPiwzDAGzCq2oP816W2"}',
      FALSE, TO_TIMESTAMP(1772844055075 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'ltsjclh89@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1773040617563 / 1000), TO_TIMESTAMP(1772844055075 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'chepedeperez02@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'chepedeperez02@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$JDtGaIkbOUuDgg==$Qo08F4rYR2L2W2+s83FgZ39iZlvS3tIVPC5shaL7+JT9S6rqzmi4MBpdOEvsLIqqJVJJCDTcOxCY3dMUCO5Ctg==', NOW(), TO_TIMESTAMP(1771609995839 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "m9Yf8S7Msjdg4zC8Ze78JCtCmFF3"}',
      FALSE, TO_TIMESTAMP(1771609737929 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'chepedeperez02@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771609995839 / 1000), TO_TIMESTAMP(1771609737929 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'dm8716152@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'dm8716152@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$5Cm0uGPBIXGzeQ==$zxq/8d3m/XqDc+BLcYdmEfQYF1EkQqaVrrRVpbSyk4hp+NET2QWiFnH5CemGGf4YNHFhZ9gWlO7C/siG8srS2A==', NOW(), TO_TIMESTAMP(1776449556130 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "mDdgTNPmSzez3tz50JvjdMGl3xc2"}',
      FALSE, TO_TIMESTAMP(1776449556130 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'dm8716152@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776449556130 / 1000), TO_TIMESTAMP(1776449556130 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'naviguillermoevelyn@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'naviguillermoevelyn@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$G9zouck6pSfiiw==$o6XnL6b18lGh5hHN5T8HsjrtdNqHCkGDyNao3ADSZa3eVo8B/Wsv0Ksra+lFgxr9+pm0D+uiuirP6bk2g3B8rA==', NOW(), TO_TIMESTAMP(1752984204944 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "mFokE4wV8dOrpNXCi2ix6FItqL52"}',
      FALSE, TO_TIMESTAMP(1752984204944 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'naviguillermoevelyn@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1752984204944 / 1000), TO_TIMESTAMP(1752984204944 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'kristobal.teomitzi@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'kristobal.teomitzi@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$7+NbeD7VOmiX3w==$YZde6bSxgreH2ytRSJf8Fw3fNrwSq1usJm6tvpLmiBASdzOkXxvwp0+FEZZUdjcBHHbtaLjw5KmMSk/FaDIzeg==', NOW(), TO_TIMESTAMP(1771297923431 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "mICC3dqZAYTRr52pGEvaucjqE5l2"}',
      FALSE, TO_TIMESTAMP(1771297923431 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'kristobal.teomitzi@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771297923431 / 1000), TO_TIMESTAMP(1771297923431 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'irisbautista497@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'irisbautista497@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$jGw6G2RsQKJcKw==$yJDH5IA5P6DCBpuifpsA+KWXFZbUBajtqmwkYD55hCxZUA6UmPStJ4ictJcdpoGVXijVgyvuo/IV/cPFHqOl+w==', NOW(), TO_TIMESTAMP(1771274479549 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "mISbW9Y0ZNSTYAaeycnTFiT09av2"}',
      FALSE, TO_TIMESTAMP(1771274479549 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'irisbautista497@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771274479549 / 1000), TO_TIMESTAMP(1771274479549 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'yeelin0455@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'yeelin0455@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$bycuSi9J+a9bpQ==$B6qd7IM4oukdnFfbwXX2Eu5OdCqO+X5o57orTSlvDWGaWtiI31K2Sve9bpN4/PQJN6NSiNZdr7B+w0gPWM7f5g==', NOW(), TO_TIMESTAMP(1774075493315 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "mOqijSJ2x8Wq28VivytfFhGqJCO2"}',
      FALSE, TO_TIMESTAMP(1774075493315 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'yeelin0455@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1774075493315 / 1000), TO_TIMESTAMP(1774075493315 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'lae.luis.molina@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'lae.luis.molina@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$A/XoZYu6LhBnow==$6uCQZLXryA+FBbYLkUTck1zYYPgP4LhHHAtWNWorWLVH0l6PuaOxrnnPFg8+bSCOF8k/Cph8+eguLWvcT+7EwA==', NOW(), TO_TIMESTAMP(1776526546666 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "mQw7QTg9sQX89WgCobJBVxkCcsl2"}',
      FALSE, TO_TIMESTAMP(1776526546666 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'lae.luis.molina@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776526546666 / 1000), TO_TIMESTAMP(1776526546666 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'ab_alc83@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'ab_alc83@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$mNLHSX8NvPxLdg==$JR36eip5Y6n/bWzeceZFWOTHZtcsowLW0bAhIgsy/pJTjPv/g9nbog/4HYsa4T0b4J2yOkTWqDOv/4JwunT3lw==', NOW(), TO_TIMESTAMP(1771430108418 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "mRKK3sqK2GeaoUDllhU2ik16JSy2"}',
      FALSE, TO_TIMESTAMP(1771430108418 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'ab_alc83@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771430108418 / 1000), TO_TIMESTAMP(1771430108418 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'tttt@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'tttt@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$XlnL1A1+Tkchvg==$LwKUYdTLRAexQZfh3uJJ2lLZK1xSg/ygK4r0fB8VjHqVpi21iW503Qr2Qx/E01e8ijsJPGAkEVwSWyvFxatUqw==', NOW(), TO_TIMESTAMP(1772246576925 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "mSBNSMRespSvmWxBaf73p27lXv02"}',
      FALSE, TO_TIMESTAMP(1772246576925 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'tttt@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772246576925 / 1000), TO_TIMESTAMP(1772246576925 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'jcgomezgarcia870320@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'jcgomezgarcia870320@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$kNPF/Mww2dDUvA==$KJAeWKHEjrLcxGtyB3+Ul280yDFvhKGi+TQ5OG/G3LB6ALgcd/R7EftAHTVd+aPJUi6kjdcy9ruZRASsoAJ2NA==', NOW(), TO_TIMESTAMP(1773087355892 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "mVn37VJy2Td8843Ka9NcRATcFZ63"}',
      FALSE, TO_TIMESTAMP(1773087355892 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'jcgomezgarcia870320@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1773087355892 / 1000), TO_TIMESTAMP(1773087355892 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'pukuj84@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'pukuj84@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$uHylAgP8s1cH8g==$SMHaIAIM/onaCRXVEla4oP1o+X8yaelwYoEw5z39q7YdHgWMQaKQBUbzxvPIYX+XZI5yVxqUiuxvFW9hUsqG7w==', NOW(), TO_TIMESTAMP(1772244634896 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "mb3H0yiYOGZ7TXLHuCmxWYazlgo2"}',
      FALSE, TO_TIMESTAMP(1772244634896 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'pukuj84@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772244634896 / 1000), TO_TIMESTAMP(1772244634896 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'azeapple21@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'azeapple21@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$vLdspOmVeluQyQ==$glyTnzxX0sVZFs9nHW1N+SxOQjfji7RovWsNoclcbHATYeEtX4YgIBFSAK4YlHkJeOBt9XpXU620EfNTJgHiuQ==', NOW(), TO_TIMESTAMP(1773549468226 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "mjYZVHBsnEdJqciGp282pDTnCnk2"}',
      FALSE, TO_TIMESTAMP(1773549468226 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'azeapple21@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1773549468226 / 1000), TO_TIMESTAMP(1773549468226 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'sonyacuesta2005@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'sonyacuesta2005@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$6F4ANXhQr4hGJQ==$sjF5XR2BJQBsC8T12OIjZB1Uqo+fgMn0s+ZXRJQVK6XneW/PxsQ5q7vflj3lXf3owfN7QPVCpklIYTGuE4vp7Q==', NOW(), TO_TIMESTAMP(1776219922078 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "mlck8fEBTtSILtEoPx1yJLC9C0D3"}',
      FALSE, TO_TIMESTAMP(1776219922078 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'sonyacuesta2005@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776219922078 / 1000), TO_TIMESTAMP(1776219922078 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'aldotituana8@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'aldotituana8@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$HizCwidmLc0mHg==$qIG/7kLIFi4Gm682XnHpWH2H1mBHXuvkZ7SzpXKCqQODbOgmkLjW7aA13Dswo/dcZ42kneNG+MQmYhNZKKrwHA==', NOW(), TO_TIMESTAMP(1771283032748 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "mmyZrYV7kiU59xg1mVKNpmgaNZ62"}',
      FALSE, TO_TIMESTAMP(1771283032748 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'aldotituana8@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771283032748 / 1000), TO_TIMESTAMP(1771283032748 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'goch121374@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'goch121374@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$MRohrsVwkwjWpQ==$CC3U/7I9nJ77vuTaaStaqNMw9vjMN+mRU9U3B0x4O9WjvxqKYNGRPDrK/G1ccShgAX9VwyWh+Jteecux2qOeMA==', NOW(), TO_TIMESTAMP(1771331418701 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "mq8ADug8dON4XMbDrMh56sJAKQ72"}',
      FALSE, TO_TIMESTAMP(1771331418701 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'goch121374@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771331418701 / 1000), TO_TIMESTAMP(1771331418701 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'marco.f.flores.87506@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'marco.f.flores.87506@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$VZP+rTfYz707UQ==$JNalzb+cmu+QOm4hcck7XFgR/o5r9x/GY1JApz/ke/bCNZowaZAOHfQkz1oNRRf9wSNNjSxOQTSRt6cpmdt4uw==', NOW(), TO_TIMESTAMP(1779833501607 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "mryP2p4TYKOTKpy6lbpOGzHEq9h2"}',
      FALSE, TO_TIMESTAMP(1779832125636 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'marco.f.flores.87506@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1779833501607 / 1000), TO_TIMESTAMP(1779832125636 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'morenoaxalyyasumi@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'morenoaxalyyasumi@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$HrEnVQSIPRsP8g==$SXhQowgpLFzd7H0Y0lsT+zXjXMGzMp6Y/07pligV57c5SjWm0U4Pn69Y/QZEtyULeglPUom+ZSSIQ9kZ/jl2Eg==', NOW(), TO_TIMESTAMP(1776231106779 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "ms30jBIpRvURuWZJAqfomJXlFdn2"}',
      FALSE, TO_TIMESTAMP(1776231106779 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'morenoaxalyyasumi@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776231106779 / 1000), TO_TIMESTAMP(1776231106779 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'marcopat01@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'marcopat01@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$9ZDzsBz+nU+5Qw==$0vnZCFtONViFDL+Mecrzrb98VPMGTZG1Y7fcOFPfsl/5MR59t4hEdzbSABcAO97LY9ywR7YCzYvZPaHi+biQcA==', NOW(), TO_TIMESTAMP(1771388259872 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "mwYkjGmCmTYiTyAfwndLRe880us2"}',
      FALSE, TO_TIMESTAMP(1771388259872 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'marcopat01@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771388259872 / 1000), TO_TIMESTAMP(1771388259872 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'maggis161084@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'maggis161084@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$zmhUFUZX8ghrzQ==$cVyHMcOmejOMtwhCUZsiuarq8egsHewdaEK1c1feAnJHhI76Gu185rQfS63a3rEInxZlJbjYPM3PWcLa63niMg==', NOW(), TO_TIMESTAMP(1771812479754 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "n1gVTHlsHjPFmCeqiTTB9UOsBWF3"}',
      FALSE, TO_TIMESTAMP(1771812185255 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'maggis161084@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771812479754 / 1000), TO_TIMESTAMP(1771812185255 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'yaretzimelendezgarcia125@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'yaretzimelendezgarcia125@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$UNR+FH9TbU+TOw==$xTrDqGzXuKXU8psbfnmD52ipz7aXjgU2DTRadtkOCaj23aJ7wS40c1gxw4xeCDMaAr+CTYspB7Y0Naei5EeONg==', NOW(), TO_TIMESTAMP(1780112952669 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "n5hZNE8G66SjITe79npfDNNNkly1"}',
      FALSE, TO_TIMESTAMP(1780112952669 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'yaretzimelendezgarcia125@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1780112952669 / 1000), TO_TIMESTAMP(1780112952669 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'juanhpantoja@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'juanhpantoja@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$XgFqPvzDPSvEuA==$/6bjUYIC9/4ZRvlFYKFvu0xuImj5gCVRC7AwADNeOqPORmVkeYofRhxM7PzcX2EUu+mjhKsMX7ahYx5fgCG5Cw==', NOW(), TO_TIMESTAMP(1771282672840 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "nAs6idGwy0TEfF4SPSPLJNdrorF3"}',
      FALSE, TO_TIMESTAMP(1771282672840 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'juanhpantoja@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771282672840 / 1000), TO_TIMESTAMP(1771282672840 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'ricardorodriguezgalvez12@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'ricardorodriguezgalvez12@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$PslVC5sNJ7P4yQ==$2cwzxmavFxOrJjOJ8JFss+I93WdX4jT0EmZUr5lJdEEq+oIrymZ3UDJK1wSpVWS0dxpZxddsi2H/DhkHPqYKIw==', NOW(), TO_TIMESTAMP(1764112687975 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "nDtd4X9zzEaw3cxP0s0eGZZQNUq2"}',
      FALSE, TO_TIMESTAMP(1764112687975 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'ricardorodriguezgalvez12@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1764112687975 / 1000), TO_TIMESTAMP(1764112687975 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'cesararellanomorales1964@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'cesararellanomorales1964@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$kIlpaUcJZBJK+A==$98Hd9PRoMIendJ/Rtu87bSr5AxFfizU6YbHtj4sHXM+whdxspKeaTQxuNTugE6m2jVFVTpbWcLbZ0SsMIh2hnw==', NOW(), TO_TIMESTAMP(1778600934954 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "nOHFWg1VuYV0yT4nOhmktPRDrsr2"}',
      FALSE, TO_TIMESTAMP(1778600934954 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'cesararellanomorales1964@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1778600934954 / 1000), TO_TIMESTAMP(1778600934954 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'rayadojjhs@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'rayadojjhs@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$RPXqtHTQ8sx4NA==$Dx5AoYyBq7H457943WuYG/H41N1zxuIXbLpWM3AJX418lWNKcz6vFtHZhRs3i4Rv0/DlGMvnUj6ncxO2RnsKQg==', NOW(), TO_TIMESTAMP(1753457412768 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "nVJ4JbIIpfef1f0bYRTQEbAfMRr2"}',
      FALSE, TO_TIMESTAMP(1753457412768 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'rayadojjhs@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1753457412768 / 1000), TO_TIMESTAMP(1753457412768 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'rayito_astudillo@live.com.mx') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'rayito_astudillo@live.com.mx', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$HSpwiS9o6qdK0g==$Xi8RH1r53lIhThLR2AKTIWdqaaNp23riIr3XOqheAZMW5F0UK0VItCGxzc9NfrDXfYU8MUrweyJ3E8aZWHxEeQ==', NOW(), TO_TIMESTAMP(1776223967317 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "nYW59WYUugflXniEtNdk6SbGCni2"}',
      FALSE, TO_TIMESTAMP(1776223967317 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'rayito_astudillo@live.com.mx')::jsonb,
      'email', TO_TIMESTAMP(1776223967317 / 1000), TO_TIMESTAMP(1776223967317 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'almagadith@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'almagadith@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$xLx9OA4Yk8gg3w==$SDpk9Kygngyc8o/lCvi2nbcdW7bl004ZT+mGrt7QkvXMVwZvDhlV+TQMKT/5JpzHtoN8WM99iFNJhfzGJ70Vug==', NOW(), TO_TIMESTAMP(1772086325154 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "ncFKBfLdDQfJeEZffeeQ0wxSavg2"}',
      FALSE, TO_TIMESTAMP(1772086325154 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'almagadith@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772086325154 / 1000), TO_TIMESTAMP(1772086325154 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'lauratvillegas86@outlook.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'lauratvillegas86@outlook.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$uSB5bKt6oJX2pA==$nH1PwY4pPnMNUUo7OtGc9eg2wp8SyTP3RTqq4AjSdHpeFinsr59bpDE9Kw6vM/s+Lu/yDPpiFJejwVUdpUeFNA==', NOW(), TO_TIMESTAMP(1752972360200 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "ndTnIKY1T5YgSwYxG3W78yhlXuD3"}',
      FALSE, TO_TIMESTAMP(1752972360200 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'lauratvillegas86@outlook.com')::jsonb,
      'email', TO_TIMESTAMP(1752972360200 / 1000), TO_TIMESTAMP(1752972360200 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'oficina2alternativa@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'oficina2alternativa@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$GEw2p43KT0lUBg==$uz3tqNf01+0MhBwiN0pGPRP8zjSWmj12GNf0pUIsfRquyOBzg/X4HP2ct1bzhgNYWhpm6ESJRNJbymASo86zeQ==', NOW(), TO_TIMESTAMP(1752005805800 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "nfiRpiSzqMd8sN9psiRztNhqK5t2"}',
      FALSE, TO_TIMESTAMP(1752005805800 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'oficina2alternativa@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1752005805800 / 1000), TO_TIMESTAMP(1752005805800 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'angelzam3005@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'angelzam3005@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$yZUk9vkgHRCdzw==$3KhVdBiMnPVSamudXEq7hiotUYypHkNyNbCXtThbvx3M0H2+8sNTHWtiSFRflWMJ6w7afDsgtbrYk9vc/1shCA==', NOW(), TO_TIMESTAMP(1776275782769 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "njogu6BU7nejtQlT12jEGNMp0EI2"}',
      FALSE, TO_TIMESTAMP(1776275782769 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'angelzam3005@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776275782769 / 1000), TO_TIMESTAMP(1776275782769 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'lpozosg92@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'lpozosg92@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$Ewo3t4/YynsvFg==$kCmDbIf4sM0qkjtFOnffCcRVYbqmwYGcLwxEOZOIpGrPJZ1R5QWSfon5Wq4eK3mVF0NK6veDt5zJkR0AekjNHg==', NOW(), TO_TIMESTAMP(1753474557964 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "nkGeye2YCfXiH4quCre0z0f6Aj82"}',
      FALSE, TO_TIMESTAMP(1753474557964 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'lpozosg92@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1753474557964 / 1000), TO_TIMESTAMP(1753474557964 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'fjimenezchacon6@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'fjimenezchacon6@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$CuzBN+1gLCNENw==$gXd4WDNgwXa5vIZQ/8g3dq2PEg5pIuIUrT67XcJwnAOIAofEgr1toSYXf64TYZqu9xIfRIISUSTtwoSjv9v+yg==', NOW(), TO_TIMESTAMP(1773330748519 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "nmkELFLf5vciCxwZIrjc2bqL0PO2"}',
      FALSE, TO_TIMESTAMP(1773330748519 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'fjimenezchacon6@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1773330748519 / 1000), TO_TIMESTAMP(1773330748519 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'luisacampospadilla95@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'luisacampospadilla95@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$/96plyxtkkxgNA==$J4rGTq/wrn4kfnsC5fLZPaK1BHlGAuADhsM3yLPhwusbhcQmvvdZOl2M3CgGka54fjXekmKkVqGO8m5jv8ITew==', NOW(), TO_TIMESTAMP(1774311630469 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "nrryjtcEYEW4J8gwrxywlFzZKOk1"}',
      FALSE, TO_TIMESTAMP(1774311630469 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'luisacampospadilla95@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1774311630469 / 1000), TO_TIMESTAMP(1774311630469 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'ric555laz@gmai.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'ric555laz@gmai.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$3lF3d1wd2qeRsQ==$TmIZXwRP7FbAvztS5+j517xRXfyexjyFeopWfqty+3zk/SkNqo4PlfQM4NmTystzaLT69G6KDSHNFlFHMARS6Q==', NOW(), TO_TIMESTAMP(1771463042798 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "nurJTFxhDXcPQSELh8wsUE4XpKc2"}',
      FALSE, TO_TIMESTAMP(1771463042798 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'ric555laz@gmai.com')::jsonb,
      'email', TO_TIMESTAMP(1771463042798 / 1000), TO_TIMESTAMP(1771463042798 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'crakkenulis@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'crakkenulis@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$6/NtUKW/0sGcHg==$QzemRlIr50uEtZh0+jqMNCtLF9fbibUimqrMR1jYHNN7xFJOLh21csyMM0cJ8ynFbybB04VYCz5TgESY4n3rrg==', NOW(), TO_TIMESTAMP(1776218330494 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "nxAEa5igD4TnBiM871mB4axZV5H2"}',
      FALSE, TO_TIMESTAMP(1776218330494 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'crakkenulis@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776218330494 / 1000), TO_TIMESTAMP(1776218330494 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'cesarernestoriverahernandez@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'cesarernestoriverahernandez@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$V8eMw8R+4AbM6Q==$XU5oFARoio/g5zT0US915nw54RECizExBSHjRHM8YZ0orCUU6XcgIMAwpTkspl23UxQ+MEW9cgjG9fq3h4jrTg==', NOW(), TO_TIMESTAMP(1771282224076 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "o7ZPZ37LzvTHvt62S7xee4t1Bjr2"}',
      FALSE, TO_TIMESTAMP(1771282224076 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'cesarernestoriverahernandez@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771282224076 / 1000), TO_TIMESTAMP(1771282224076 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'rivasxochilt@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'rivasxochilt@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$gXMtnuBrOYon8A==$BEVuZ8Q7+VvqxORdZqNjZdPRw9J+QCTIX30I5A4R533d4/Nlx5BKZWvQuu3VlwEj6CacCckxsDW3KEQWLRhhoQ==', NOW(), TO_TIMESTAMP(1771342263439 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "oCsxDZWMBIWruW5VMVJppN94T4P2"}',
      FALSE, TO_TIMESTAMP(1771342263439 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'rivasxochilt@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771342263439 / 1000), TO_TIMESTAMP(1771342263439 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'ymontejo7575@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'ymontejo7575@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$5uVJ3H1ocWg+bA==$QLZEnrfC/Mq9vZVV5KcLmpdUUHybeClt7sm62ckZDqyUqSlh0bJ5m4hx+8+qaOzMV0T5NmWwrV6vIVfU//i9RA==', NOW(), TO_TIMESTAMP(1772331053132 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "oD7LbSFvLOV4TV2OyYSf7CVhP4R2"}',
      FALSE, TO_TIMESTAMP(1771298007246 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'ymontejo7575@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772331053132 / 1000), TO_TIMESTAMP(1771298007246 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'gfhsfrnb@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'gfhsfrnb@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$mLqBDAnpo6gfIw==$n4pNkzxuqBaxol18EwTm380dqQglOyL4SKMLs1nTjjj6zooBUQCfznZfkZpoVVVcycMFEkJhas22GZ6apF3A+A==', NOW(), TO_TIMESTAMP(1771276729214 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "oDrGr9xaWwSkdI8xxy1iiScx5jg1"}',
      FALSE, TO_TIMESTAMP(1771276729214 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'gfhsfrnb@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771276729214 / 1000), TO_TIMESTAMP(1771276729214 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'jessyvillafuerte24@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'jessyvillafuerte24@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$HgUFLxdETvlGqQ==$OCCxIXQJcHjS09hsvMhaBVWW8olwFuieeScu0nCMErkMR12rCGEvoQaJcSyRHgqrDgfnRjjhtyXHnpDEvVn/+w==', NOW(), TO_TIMESTAMP(1771278485952 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "oGjMdoYZ0iYMRFhLMKyKiLy1Ri22"}',
      FALSE, TO_TIMESTAMP(1771278485952 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'jessyvillafuerte24@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771278485952 / 1000), TO_TIMESTAMP(1771278485952 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'enfroramos_29@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'enfroramos_29@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$w5l5VAx4FlgNbA==$dRDYpO+s8ksZJyW5f1fHG3n1VmTJGIUq/o726E3lloakdWqaTjat4CwJ5KAW0w0witKhiyMlcIPXsknMTX3a9A==', NOW(), TO_TIMESTAMP(1772143010149 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "oK250FNOBaXGplPsVPbc0jPQiKF3"}',
      FALSE, TO_TIMESTAMP(1772143010149 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'enfroramos_29@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772143010149 / 1000), TO_TIMESTAMP(1772143010149 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'elmardancab33@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'elmardancab33@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$+VbERF8P8XSz4w==$5Pykcgnyd+WIHN5Eo9N05K6lecXHnX8b+Xq6rz6+cCWvU4ioYxM/Fh5TytxpgBGICiKrlUqBDQCflMz+UToNWQ==', NOW(), TO_TIMESTAMP(1778600391330 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "oL65DUibixTptxi3XvffAo9bsyi1"}',
      FALSE, TO_TIMESTAMP(1778600391330 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'elmardancab33@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1778600391330 / 1000), TO_TIMESTAMP(1778600391330 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'chembergs37@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'chembergs37@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$Zqcx10JLeMox6A==$NSxu/l6jVvxHlbC6yd2abQF+Wep9wwv4Cj4sau9vf+p5fOS9VxxHp2C3ZOfuIr+rhInZqOXmeRGA58MncGZrVA==', NOW(), TO_TIMESTAMP(1776354115311 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "oM4TzdxXv4WscLPycGhAUp1mRzH3"}',
      FALSE, TO_TIMESTAMP(1776354115311 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'chembergs37@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776354115311 / 1000), TO_TIMESTAMP(1776354115311 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'cruiz_8392@yahoo.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'cruiz_8392@yahoo.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$dMxXYYLVVi+YCA==$g3jPbEYhO+dDIQodmTN/foJD9dtBWuxFGWzvJPGzxRgQSQ6XINFSuQMLA3RpvJOdDfXV0pVLBd7SwCwP5LJb+A==', NOW(), TO_TIMESTAMP(1777902990877 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "oO9I8Vbsk6OsIrUfgCFnjNK5cuR2"}',
      FALSE, TO_TIMESTAMP(1777902990877 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'cruiz_8392@yahoo.com')::jsonb,
      'email', TO_TIMESTAMP(1777902990877 / 1000), TO_TIMESTAMP(1777902990877 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'alfonsoteacher1984@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'alfonsoteacher1984@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$CghDk7JsrnDJ1g==$WYewfYPFcYcHzjNRJNaQkvfhFEIMiOsjCfPXcbZ7HFoIRvA8mlrCn+vi+2lEq80Ew5qLerLHRVISmoKYTZXQVw==', NOW(), TO_TIMESTAMP(1772577990915 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "oRs5142tATgreCh9CyR2ySLAqYh2"}',
      FALSE, TO_TIMESTAMP(1771692526589 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'alfonsoteacher1984@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772577990915 / 1000), TO_TIMESTAMP(1771692526589 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'hedras.gutierrez04@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'hedras.gutierrez04@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$vve8namriyUNwA==$4NbOA+xicw0SlLeZ4Y7eCMY/bkqYjp8uyANWPK3+cVZCfZk1fInQPQL7J2sZYgKVOg8MPhygwU18KNqu5E+64g==', NOW(), TO_TIMESTAMP(1771279235167 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "oUNm0IgvrXX4sVmYSJwavk9jjuF2"}',
      FALSE, TO_TIMESTAMP(1771279035022 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'hedras.gutierrez04@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771279235167 / 1000), TO_TIMESTAMP(1771279035022 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'doravillanueva460@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'doravillanueva460@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$vxmQBwdu2qCkdQ==$3M85fBfq2KPPMSHOa2r7J/vtdSGUo1E5HBlMJXqgvAtKG7zszRf1FsWu1Q0mo/nNqTMd5WcsNURXknCeNgqJCw==', NOW(), TO_TIMESTAMP(1751805167459 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "oX592LDl6yRe5EFNNjsFEiSKvE92"}',
      FALSE, TO_TIMESTAMP(1751805167459 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'doravillanueva460@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1751805167459 / 1000), TO_TIMESTAMP(1751805167459 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'korie.gr@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'korie.gr@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$nilAedJCSlzZpg==$Pq6pUaB+s5rhXIwcDG2rr6D2sqHmrK/HJPoTLiqbO7dWu0vzAsZD21JMYES6PTzs5F/ru8L+o4Ebs2BMbcV3Tw==', NOW(), TO_TIMESTAMP(1774240739960 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "oXbhQWhez2X5LoSMqngoGuNKfX22"}',
      FALSE, TO_TIMESTAMP(1774240597313 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'korie.gr@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1774240739960 / 1000), TO_TIMESTAMP(1774240597313 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'rodrijt436@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'rodrijt436@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$2BLvOQ43Y0XlOA==$/iI3QVs9OEMnm+zgKuwGKmzOMyFUvt4+OIzUfxlLoorbMo8uygy4SK7c7EMBMd/W3K5qvnWBl0CX4jc3l+yHeQ==', NOW(), TO_TIMESTAMP(1772136066605 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "oYOGNfX4KLPl2wVFwVaitkziIYi2"}',
      FALSE, TO_TIMESTAMP(1772136066605 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'rodrijt436@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772136066605 / 1000), TO_TIMESTAMP(1772136066605 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'saraykai10@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'saraykai10@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$nll9uDw5zKyrmw==$bldzX5yU7ORCFdFiX2M8dM2ydAGgT95bWVnyZj8/9eEt80JmxRmEMOE5LYVLLBDi+07RVEzoZyVkGMljwID28w==', NOW(), TO_TIMESTAMP(1776553367599 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "odpUp6ui1hSDeUpEFPLT3bjKPjg1"}',
      FALSE, TO_TIMESTAMP(1776553367599 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'saraykai10@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776553367599 / 1000), TO_TIMESTAMP(1776553367599 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'vag_abundo500@hotmail.cpm') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'vag_abundo500@hotmail.cpm', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$GjMcV2I5yGIzmQ==$Lbol5Pxpx8/uxN2+BNy8uxXLn/do21sWVRY9vO6EMhqIPMqiJsQHh03e08cMxQzH6I32X0zhyQB/2ItzLKrrCQ==', NOW(), TO_TIMESTAMP(1765892702952 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "oiMIXxTRUFUykZ2XyDkRtUcxZb02"}',
      FALSE, TO_TIMESTAMP(1765892702952 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'vag_abundo500@hotmail.cpm')::jsonb,
      'email', TO_TIMESTAMP(1765892702952 / 1000), TO_TIMESTAMP(1765892702952 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'carmen.nunez20@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'carmen.nunez20@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$N2OxugTgBaEQfQ==$JI18hgDZI8B6GWENOPiEl/T6WD76C9TcJRYl8tWU5SronZVU+bS37ZYyv0hnUSMOOrenH1S0tqwQZCmSCLjGjg==', NOW(), TO_TIMESTAMP(1771470210352 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "oizkgdraVHYUGRKJz4i9Njm3FBu1"}',
      FALSE, TO_TIMESTAMP(1771470210352 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'carmen.nunez20@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771470210352 / 1000), TO_TIMESTAMP(1771470210352 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'contacto.cotorrisa@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'contacto.cotorrisa@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$nVFRFUQl6EARwA==$EpeEHlWp1QYX2kH1mgKmDgp2Ec3p+u1Q8+NlsN4q5+jDVq7WqMpk+koZUGvSZgmr09uiHMbXRISg4LXOg/5qOA==', NOW(), TO_TIMESTAMP(1753678344946 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "ojg2nFT0FKOU8gR2F3aDuckVq7E3"}',
      FALSE, TO_TIMESTAMP(1753678344946 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'contacto.cotorrisa@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1753678344946 / 1000), TO_TIMESTAMP(1753678344946 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'angelicaalejandranajeraaguilar@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'angelicaalejandranajeraaguilar@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$r9U6bAtb6Qxnuw==$8H+at6xZCU5mtx4HeGheoBUgOwIWrVThwzvsN7RVrW0wcq7pk4ek4LIOa8rSF9VhdyOAJc7LWT3Ucr60V4n2Sg==', NOW(), TO_TIMESTAMP(1771279168687 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "oqDm2c9zAcbPvtFmcRsG9AKoEhi2"}',
      FALSE, TO_TIMESTAMP(1771279168687 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'angelicaalejandranajeraaguilar@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771279168687 / 1000), TO_TIMESTAMP(1771279168687 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'edivargas@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'edivargas@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$6feQA/4E6icw8w==$dFQ2D7e2TmLyUTQC0QpHheS36/dmSwuF4eZ3hjA+VbCNZtMifwNLY3rzuXd7nxRNnhSH/HPed+jzIhFjB650mg==', NOW(), TO_TIMESTAMP(1771295735744 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "oqT6pTy66edRKpj8C76Eo6qghV23"}',
      FALSE, TO_TIMESTAMP(1771295735744 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'edivargas@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771295735744 / 1000), TO_TIMESTAMP(1771295735744 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'lalito.84@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'lalito.84@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$wz2h//f+Df7MCA==$esPdQzlKrNKW7c4890zOhIZ1t9+CUdr73QIw5Io5zh96m9DVKV3llUg1m+uOp7+Vmbhv1EQdkRzqegSnNJzo3w==', NOW(), TO_TIMESTAMP(1762999259740 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "or8JWgDfGsP1HX9wkV9vHW6NXef1"}',
      FALSE, TO_TIMESTAMP(1762999259740 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'lalito.84@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1762999259740 / 1000), TO_TIMESTAMP(1762999259740 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'adegollado2015@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'adegollado2015@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$mwixuKWnGv+Q5Q==$0AgJSDMBH6akrDeVefsJHdlH5u7dQ5qWTi62r9PfqghYNWZsWrcQd3lAi/SDprIzLbKYwDL5E7opSk7IhqsMjg==', TO_TIMESTAMP(1750443044379 / 1000), TO_TIMESTAMP(1760917504925 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "owzJONpLr2Re6l0Mv3CXAoYwWq03"}',
      FALSE, TO_TIMESTAMP(1750443044379 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'adegollado2015@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1760917504925 / 1000), TO_TIMESTAMP(1750443044379 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'perezruli9207@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'perezruli9207@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$t1JWULSkjUCMMQ==$zojOUeTgRuL6VQLiwlhJ1mr0y8NglEzcvSgrq7Mrqak++O5OGcSv34VeYdxP3lMUrZO8bF02w0uAKU5aB9D/pg==', NOW(), TO_TIMESTAMP(1771636848347 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "p1ivc7a40Qfac0w2qU7LpuTWQgJ2"}',
      FALSE, TO_TIMESTAMP(1771636848347 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'perezruli9207@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771636848347 / 1000), TO_TIMESTAMP(1771636848347 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'marthajdiaz_1805@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'marthajdiaz_1805@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$AZDGDD8GiJ0Oqg==$txQLRgsR6SrA1OiLcAOdEHWmlHpZ6mUdvFQ0FVjKJvuElxA35C0afnN1Lnd2UJcguFasz680J+wWowul2NASew==', NOW(), TO_TIMESTAMP(1771279025562 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "p2vBXcJjiSh9ZCHNy5frESuwd3M2"}',
      FALSE, TO_TIMESTAMP(1771279025562 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'marthajdiaz_1805@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771279025562 / 1000), TO_TIMESTAMP(1771279025562 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'calvoivan706@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'calvoivan706@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$2IyZLeLhzNjyfA==$HYfXx3u57UT8SW82m6ak3ibOO3RoNZICMUQPJg8P4PJ3xirP0ErRIq+yCCYOzd6v//Ch4jJmNjCDDWGAwaqxBA==', NOW(), TO_TIMESTAMP(1776523167211 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "p8uhw0ZcWxUWhkMWhwFTDeBh9F62"}',
      FALSE, TO_TIMESTAMP(1776523167211 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'calvoivan706@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776523167211 / 1000), TO_TIMESTAMP(1776523167211 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'villauerte0616@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'villauerte0616@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$68n1ZRLH9U4I3A==$DGx/6OD7kiux5LFGmBJ0nqPZjA/rJijcfpDCRJdR9Knn8J7Pis/OU5stfPjPSfe5UK9cCAcDHYMcNaB3OIOX9g==', NOW(), TO_TIMESTAMP(1771283779144 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "pA98gS4oXYfNmwxOpUTs3IQmbSR2"}',
      FALSE, TO_TIMESTAMP(1771283779144 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'villauerte0616@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771283779144 / 1000), TO_TIMESTAMP(1771283779144 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'hussameg04@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'hussameg04@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$f+pDHKlwuCnZUg==$BJzwDTouo3TziVSfMdET3aj/LwZaas9+kk8epz2dPGb/To/z+Q7bv1YCHvvF0w3VRwN0TIgyxCbyfs7Vx5te/Q==', NOW(), TO_TIMESTAMP(1777676707332 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "pCrpSvG1dSeiRi9kq2eBUu1V2x22"}',
      FALSE, TO_TIMESTAMP(1777675945499 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'hussameg04@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1777676707332 / 1000), TO_TIMESTAMP(1777675945499 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'masaku_14@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'masaku_14@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$LI6ezkz5k7SgUA==$NdyBgPWzMx1bVzkLy98osPmZQ1zHFiW/h0ivSP1HTQ199mMIjHjOAhmoGHucGDlM0bkjcwbqMZsYUAVrXVfLuA==', NOW(), TO_TIMESTAMP(1779480602361 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "pCv9b61QoLQhMD9MddWusRviwl72"}',
      FALSE, TO_TIMESTAMP(1779480602361 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'masaku_14@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1779480602361 / 1000), TO_TIMESTAMP(1779480602361 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'kirala3443@mgail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'kirala3443@mgail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$Qi+s/TeWNFEehw==$v8CktLFbir9OZczUg2NfY8Lr6pMMbQf+Zi3rDh/PskkOIr7FKRVOPfYNTINFqb21G7Kg/fNdYjqj55NUye+dzg==', NOW(), TO_TIMESTAMP(1764079732148 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "pIwYgP1Kc6aiBgiedvERBKt6VUT2"}',
      FALSE, TO_TIMESTAMP(1764079732148 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'kirala3443@mgail.com')::jsonb,
      'email', TO_TIMESTAMP(1764079732148 / 1000), TO_TIMESTAMP(1764079732148 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'rosyesperanz@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'rosyesperanz@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$Q2dDksrYPVls8A==$JujuzviHxN9EuBcHqFJl1OeR6/FMYZkYhCH+P75uQCYVoqSD5BQQp/lWFYYkK8fglgwzFc4C4OICE0/DdlsLUQ==', NOW(), TO_TIMESTAMP(1776222812187 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "pQPR3J70YJaO1YNFmbyWcCmN4592"}',
      FALSE, TO_TIMESTAMP(1776222812187 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'rosyesperanz@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776222812187 / 1000), TO_TIMESTAMP(1776222812187 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'issmau80@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'issmau80@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$vsxqkytfyqyLgA==$8teunXnyhtNL5M8k+GeA7KdeLubriJ3RkGbnCPKsNqK2S7dTVEpl0eyz7lr69tU9HP6bnc1zoHnHHfNgMcKRgQ==', NOW(), TO_TIMESTAMP(1774902209930 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "pZsyUDvUWOVm6TkCqizqEvRR5b43"}',
      FALSE, TO_TIMESTAMP(1774902209930 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'issmau80@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1774902209930 / 1000), TO_TIMESTAMP(1774902209930 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'alandejesusdh@icloud.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'alandejesusdh@icloud.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$sixzmLICisSWFw==$rXScZ6NpsySSTGBaUDUuLBbABERJ/Lj7NXGOGZMJWOLxzfbtB7g6ZnnFUrLqrMyG02uBZd3c18I3JUAKxSgFIA==', NOW(), TO_TIMESTAMP(1775540245064 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "pf70XbB1QCby3BdZtoalU5cxc0E3"}',
      FALSE, TO_TIMESTAMP(1775540245064 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'alandejesusdh@icloud.com')::jsonb,
      'email', TO_TIMESTAMP(1775540245064 / 1000), TO_TIMESTAMP(1775540245064 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'dmg64561@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'dmg64561@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$Fmel40OC7StxYA==$9cSsaJqGgeCslAlnWCd7jG1lu/ph6HIAh4nAdQulon47hekFB86PjTXR7r0uknpkBF7WRoy6xvH68yFprsXPWA==', NOW(), TO_TIMESTAMP(1754765346124 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "pjRJ4xMOYZhUFP721aWY2Pj0kt63"}',
      FALSE, TO_TIMESTAMP(1753958618081 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'dmg64561@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1754765346124 / 1000), TO_TIMESTAMP(1753958618081 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'chusgomez171225@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'chusgomez171225@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$OJ8AuwvIWW9XkA==$LPIv8gpploE4rave0kKPg2ssrs5wlYWUrdYeWRUDSbvijJgPkMkz1qcBhg6bzHE4bv+zMkOqdQPc2KX7MOEQ4Q==', NOW(), TO_TIMESTAMP(1779280162740 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "pjsvGy67k8WBRr3EzDmfTJOseap2"}',
      FALSE, TO_TIMESTAMP(1779280162740 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'chusgomez171225@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1779280162740 / 1000), TO_TIMESTAMP(1779280162740 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'oz.jack.jovas@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'oz.jack.jovas@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$3M1NrRYEbgk2UA==$YSgDa7/KdkuWCaovjIXZxqlS52SZRnuVogFzyVQCLFHF9OwwhV16UhsSDkYtki0w4XEQwyfecCqvZbxzs3KPYA==', NOW(), TO_TIMESTAMP(1771279009783 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "ptoXlJjVhwRyvclDRryBnr5GXVJ2"}',
      FALSE, TO_TIMESTAMP(1771279009783 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'oz.jack.jovas@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771279009783 / 1000), TO_TIMESTAMP(1771279009783 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'lupemolina888@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'lupemolina888@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$pyO7JF8Yiq4spw==$vrwSNZR13HUt+fXE2Tq9WCY07b2HwD7KZPlieebefLluA3ozWiA0b//exLkwCDWk2h0B+Ega9UxkUXKo2Q8kHg==', NOW(), TO_TIMESTAMP(1772900605480 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "pwBsb29tIjhDUE8XdSsYb0yFaA13"}',
      FALSE, TO_TIMESTAMP(1772841893309 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'lupemolina888@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772900605480 / 1000), TO_TIMESTAMP(1772841893309 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'esaype81@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'esaype81@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$uft/JgKwGOf3mw==$ewXPa/ZHJoLObtQWvxo2ZwYkkBz5ugTmfDONVQkkJ26Cjg3PN+2aezc4l0T9uDNS3z1hF1woOATOv74OYmu4Vw==', NOW(), TO_TIMESTAMP(1772139667530 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "q3plUytrasSZ3eOzJIHWE5fdXcH3"}',
      FALSE, TO_TIMESTAMP(1772139667530 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'esaype81@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772139667530 / 1000), TO_TIMESTAMP(1772139667530 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'anaisagg05@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'anaisagg05@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$uogMJ1uqQLpMcw==$BCyFLdsYvMJHKVN1mTkuezEs+nD9E4U0TlQNqiODiMzJ5fInfAlUjgVngXcS/tWJSSh7j7yJScgaGmVAn9Z4rQ==', NOW(), TO_TIMESTAMP(1772679258376 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "q9YakQ33fMYQBWL0RAZFxQiO1gP2"}',
      FALSE, TO_TIMESTAMP(1772679258376 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'anaisagg05@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772679258376 / 1000), TO_TIMESTAMP(1772679258376 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'redmzac2025@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'redmzac2025@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$buhwyn+8nNoAyQ==$+IZddPEEo0gGqBieRbpklvKqLJd0UZeNKxJ5kxX50UU0GxDF/a895ul4tV++7hAlPlDTINol2Zsx/hrPeoTK6Q==', NOW(), TO_TIMESTAMP(1778458989754 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "qC9zgyJPKmQonzDDdNdouK0sWr72"}',
      FALSE, TO_TIMESTAMP(1778458989754 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'redmzac2025@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1778458989754 / 1000), TO_TIMESTAMP(1778458989754 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'artelopm@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'artelopm@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$yTf+JHidPJIeFw==$wADgy/N5SZOLamr1wQ0e1vq12o4znCSpnLwU6vfu2E/x3lXL2LMkln1UttPQM3qUud3hwqj5aK7h8qCJr2oFoQ==', NOW(), TO_TIMESTAMP(1776360976409 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "qD04AJMybTVi6QdU2GTdSaM5rq62"}',
      FALSE, TO_TIMESTAMP(1776360976409 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'artelopm@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776360976409 / 1000), TO_TIMESTAMP(1776360976409 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'nydia2497@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'nydia2497@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$H/M70H9CFnkmPA==$p2AJ13yB2/ny9ytVmLw1xGggifg6x97Qez4vNRWW8WX6wmUTHjkbuzKuFtht1dGvZqkKO1vnQ8L3yku8T8MXqQ==', NOW(), TO_TIMESTAMP(1764271306203 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "qEvI6lMxbuVjn0kYTMjcTtLurfe2"}',
      FALSE, TO_TIMESTAMP(1764271306203 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'nydia2497@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1764271306203 / 1000), TO_TIMESTAMP(1764271306203 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'gpecnr17@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'gpecnr17@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$9EUHdJQMu6g03w==$XC5TeaMVbOi1uLGZMwNEfmvjS6ooKLAlTA3kuBQ8cd51RTaMmT38d9PlBeAQwzV9CR1Noo5WXsndjoIsERUExw==', NOW(), TO_TIMESTAMP(1771361439524 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "qIQUGK2Z1uO9E0Up6Az3Wl2GRYF2"}',
      FALSE, TO_TIMESTAMP(1771361439524 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'gpecnr17@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771361439524 / 1000), TO_TIMESTAMP(1771361439524 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'pedropena5075@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'pedropena5075@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$ZSnHb5UsmI7VhQ==$QqqijupJolrelv5emSFGwXbD1wEL834+2RH0PvT8Oo1+3x05SlCEPawJK9owt5LQ0Zb3IK3fQSEOPlEJq8JRhw==', NOW(), TO_TIMESTAMP(1751480775946 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "qJgbg0RN4KbYyGM7shupeKG8O7I2"}',
      FALSE, TO_TIMESTAMP(1751480775946 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'pedropena5075@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1751480775946 / 1000), TO_TIMESTAMP(1751480775946 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'vurbina36@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'vurbina36@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$hwDLtnrB2+QpJA==$0szUb4G33UDVHt9NPA3tBzFYI4wk40jD00VHq8cShZxncZm4bAHzN71VkKkMIIFsITIBbpDJkbv+jdyTJIvX9A==', NOW(), TO_TIMESTAMP(1774996861835 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "qKcOVvB31yM1KEqenWIFecuJ1bj1"}',
      FALSE, TO_TIMESTAMP(1771378513529 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'vurbina36@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1774996861835 / 1000), TO_TIMESTAMP(1771378513529 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'jazzlpz08@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'jazzlpz08@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$+8rdJBEqnPhq1A==$LIt1SKHkrN8iTetXFCBypMngelk6pTj2X11bVff6ZWcY6HoAWVOXvGM2b2j7rlW98DpYwtn/8uOI+VNcoyYZkw==', NOW(), TO_TIMESTAMP(1776219194645 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "qOYz17314dfzo3ubHBjyoHGlQrt1"}',
      FALSE, TO_TIMESTAMP(1776219194645 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'jazzlpz08@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776219194645 / 1000), TO_TIMESTAMP(1776219194645 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'dulcepuente1011@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'dulcepuente1011@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$U1Q6eB/6CiniVg==$akL4yGR6W8cfLKrhT6xfTIPKpzfRD9esRBgD+UOE1WoHrqzlFbRMaN+VMkYxIg5Y9yDcvc+2okLn94dfStxp8Q==', NOW(), TO_TIMESTAMP(1751604327288 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "qUCldcbrMxOT7rGg6M79EOHvgJG3"}',
      FALSE, TO_TIMESTAMP(1751604327288 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'dulcepuente1011@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1751604327288 / 1000), TO_TIMESTAMP(1751604327288 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'hernandezjimenezluis879@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'hernandezjimenezluis879@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$Vutja2V0cxZTLg==$qA1Y03Za4yLs154xa3uQ/+mZ9m/76nMJ4Vo6TgGh3L9pE6D78tE0JUW7YipnnAGmk0+8mgcrjtZxHNQvtZ1oKw==', NOW(), TO_TIMESTAMP(1774067119612 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "qXwD58UwASUhPCAlaaKItsvpzaq1"}',
      FALSE, TO_TIMESTAMP(1774067119612 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'hernandezjimenezluis879@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1774067119612 / 1000), TO_TIMESTAMP(1774067119612 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'litzysancheztrujillo@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'litzysancheztrujillo@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$7w0wG7hIZ2c1Jw==$1wLZQgXluX5p1yjX3FtrjciCU9KGDxOaJh/nSFSB180KucynVj4cOs7kL096OZAlRs8t7JBpb0vHg9/RvQdK5w==', NOW(), TO_TIMESTAMP(1776231211558 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "qZsJclCd5LUYJqLOLL7jWrs6lTy1"}',
      FALSE, TO_TIMESTAMP(1776231211558 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'litzysancheztrujillo@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776231211558 / 1000), TO_TIMESTAMP(1776231211558 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'jgcadenas5@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'jgcadenas5@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$jkLD9ykblvKF1w==$06vUyf3ceg9S+t2mVUO726GyYlXZKcGFmSM7hc5qzJMDIHIry5Iwnkvo+wWAJ40dyfRzAfcJNmFJmjRh/I9c/A==', TO_TIMESTAMP(1767985242923 / 1000), TO_TIMESTAMP(1769134875653 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "qbfaLLHixVXoFX0uaTum34elCPd2"}',
      FALSE, TO_TIMESTAMP(1767985242923 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'jgcadenas5@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1769134875653 / 1000), TO_TIMESTAMP(1767985242923 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'alexissantiz275@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'alexissantiz275@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$m5qGRuguiX2Kzw==$0qkQYzB0lE8KiMqyUO7mKSXMrJ3cdnNmDw1rhN6PzCFB4GKHtphgK+eSATlY/FsEvY7j5J63JcU9PJuTcZVfVg==', NOW(), TO_TIMESTAMP(1772947458195 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "qcTXSjMdOIetEXAtQnSKaXDIFPE3"}',
      FALSE, TO_TIMESTAMP(1772947458195 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'alexissantiz275@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772947458195 / 1000), TO_TIMESTAMP(1772947458195 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'dianakristelnajera@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'dianakristelnajera@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$2vaXoic0qx0TSg==$igXOCmjRLVBVv8smvhTX3GGSrJzLmwexH8lBVUNDYw+gA3+uQCdt4XvYxfgsALUH5E2ibLD1iZGdQ8LlKHCysg==', NOW(), TO_TIMESTAMP(1774561572633 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "qdOmEDnuTKSxyZiruqHcfH6W7QG2"}',
      FALSE, TO_TIMESTAMP(1774561572633 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'dianakristelnajera@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1774561572633 / 1000), TO_TIMESTAMP(1774561572633 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'manuelgomezlopes101@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'manuelgomezlopes101@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$x/+3xrTDQCnXjw==$sGrTjhS/DcDK9+wG99cQoNw1J6eYi+jN2H65L3JoCsJznuIl25j7VfpAkTQpUInCiFoS1go5cbp2JK7OQo96Ow==', NOW(), TO_TIMESTAMP(1772857704714 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "qdtubr9b0mZ5cBvlagpMjBOuYWt1"}',
      FALSE, TO_TIMESTAMP(1772857704714 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'manuelgomezlopes101@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772857704714 / 1000), TO_TIMESTAMP(1772857704714 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'sergiozepeda471@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'sergiozepeda471@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$25U7hLEXgrGivQ==$7gPgYBXhMnO6U8zaaMkuRcrJHa8S3Lw/xalbDv8j0J7h2P4Vuke35mcDrkszjzw8Hs9zHf2Pqbs01uqq3IRcdw==', NOW(), TO_TIMESTAMP(1771277018927 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "qik29xwzqChyHRvAFgqNpnADo2m2"}',
      FALSE, TO_TIMESTAMP(1771277018927 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'sergiozepeda471@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771277018927 / 1000), TO_TIMESTAMP(1771277018927 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'jasibesita@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'jasibesita@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$cDY2naOfpVcRdQ==$KrPeyng+P2yElwmpN4jlL1zntbIXRc0m3uMoT5/LoDmPzYxNZ6sTl0WVfMB9A/zXbS3p5gF2ANXs/1NyaReOXw==', NOW(), TO_TIMESTAMP(1772143060770 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "qkDnaW0YZ4cDl41TGrWDDmKp5Ja2"}',
      FALSE, TO_TIMESTAMP(1772143060770 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'jasibesita@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772143060770 / 1000), TO_TIMESTAMP(1772143060770 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'hugui_ixoye2@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'hugui_ixoye2@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$jC6uZ1FJRuIj5g==$NX58CYT+ABesiOMUmKTA4XiAVe7M4pWbQY7VBMZQgCP7/u7w6Wk9FC5g8KlJKnCvEQMqhdfO0d+6VaYmXaDV8Q==', NOW(), TO_TIMESTAMP(1772240223304 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "qp98DnzxiRW2o4Yn1KOqq0Kf76m1"}',
      FALSE, TO_TIMESTAMP(1772240223304 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'hugui_ixoye2@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772240223304 / 1000), TO_TIMESTAMP(1772240223304 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'abimael.ortega92@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'abimael.ortega92@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$vPGHlXx0WlqUbQ==$EyUejh/yfIppMMR5qlIMTPGHyYKC15gddo5BmtUh/YrwUfxckQ39A1MXgtmSJ27HEh/ngShRzJ2XCFThEBipBw==', NOW(), TO_TIMESTAMP(1775178852592 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "qqWs6j1Y7chNpYcolz0tMBKrrXg2"}',
      FALSE, TO_TIMESTAMP(1775178852592 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'abimael.ortega92@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1775178852592 / 1000), TO_TIMESTAMP(1775178852592 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'chemamoreno365@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'chemamoreno365@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$iYE+tSMCgFf6TQ==$rVbw4cTr4h96fpE9wg9pECQbQd2RsxuM7+Sup9tlr3pzsjPGmzmoEH9/gvkasyqx+dt7XdQQ2+Xu1AmdjxlWeQ==', NOW(), TO_TIMESTAMP(1771279397732 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "r143NMhv2HdnxdYxOZVIGDUzGsN2"}',
      FALSE, TO_TIMESTAMP(1771279397732 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'chemamoreno365@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771279397732 / 1000), TO_TIMESTAMP(1771279397732 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'ramirezlievanoalejandra@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'ramirezlievanoalejandra@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$hxBYojXooI7UqQ==$jHUQM5HwWvh9u/IIiak/EpVAN5KDdF/YsJb+yFNkGWT8BYBQdB9C1YLPjzX20ll4iwWdqcYv0CCpeIl+s0fLZw==', NOW(), TO_TIMESTAMP(1776347574259 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "r4lPc826exUP6BmDJxa9NEwKHvj2"}',
      FALSE, TO_TIMESTAMP(1776347574259 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'ramirezlievanoalejandra@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776347574259 / 1000), TO_TIMESTAMP(1776347574259 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'tic55laz@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'tic55laz@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$cSYqPPOpENoSkQ==$ORgazMiyfic/DrhxdECFBJ7T8mzPCe5EHfCotfd9RJebsiq4sh+BT+xM8MxSRlCXrAw1YFX1S5kbuRaJaqpxwQ==', NOW(), TO_TIMESTAMP(1776392282701 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "r56H4ojVcgWjhSHJEcgsvWFnZ772"}',
      FALSE, TO_TIMESTAMP(1776391353724 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'tic55laz@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776392282701 / 1000), TO_TIMESTAMP(1776391353724 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'aspectosancristobal@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'aspectosancristobal@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$hZcE5sQlvZALSA==$j95n/EgVOhCrmr/aJjhmUKhY7wIJKLRXhoSNCxTKBS1CqGNvyOtQgLGh7lFYzTLlB0aoApqvegQfnhMZZ5Ii3g==', NOW(), TO_TIMESTAMP(1771604005760 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "r7kitvIZ08e3inoNf3x9ZB2zZon1"}',
      FALSE, TO_TIMESTAMP(1771603853062 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'aspectosancristobal@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771604005760 / 1000), TO_TIMESTAMP(1771603853062 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'mendezlopeznoemi40@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'mendezlopeznoemi40@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$y4Pin2pLUMTwKg==$gHbPkgcx+8Luy8xAcXoussCdk7Q3Imza//1fVvgZ3pOhKpFgwG/JYJLKMDHz79s12ZCS+MOgSzFPTNV5WrSEPg==', NOW(), TO_TIMESTAMP(1771778932062 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "r9jmr9WnzGN8VUGWPIvXSuLUx7Q2"}',
      FALSE, TO_TIMESTAMP(1771778175868 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'mendezlopeznoemi40@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771778932062 / 1000), TO_TIMESTAMP(1771778175868 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'luisalfreda123@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'luisalfreda123@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$3k97F5iLx7Huqw==$U08FecE3JvRPo2nl/GogwBby1whB2fz2jqSghu1y+36dFz/57ElvDdBBTFKHVyUjBiURnuokKgagoWKHAmpTzg==', NOW(), TO_TIMESTAMP(1772241603753 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "rGHrlNQ419afSLGDjjhasmvweb03"}',
      FALSE, TO_TIMESTAMP(1772241603753 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'luisalfreda123@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772241603753 / 1000), TO_TIMESTAMP(1772241603753 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'miguelangelmartineztovar8@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'miguelangelmartineztovar8@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$utM/fP72/0mzRw==$KhOVnyZe7p2j53OMdfKCIS/PrZiP7lYUyGJIfrpVPeXaZ9AM8DbKk0/NnAij5X5pWCALHPHWclcjGB7MAh5ojQ==', NOW(), TO_TIMESTAMP(1753397482147 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "rHiGvhPdC3ZfuHS1VSb9n7M8GUs2"}',
      FALSE, TO_TIMESTAMP(1753396950604 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'miguelangelmartineztovar8@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1753397482147 / 1000), TO_TIMESTAMP(1753396950604 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'sya.delaparra@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'sya.delaparra@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$bJzZg4KsTnEBPg==$CqEuCS3KKQd5U0CBPfcouWLr3GtDtb9oHsVS6j2T+dvHQ0+8jLo51Xwh+hUqPPpCVf6ijr/nnb/uIeAZfEoEZg==', NOW(), TO_TIMESTAMP(1765554839178 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "rJj7B8tObmY8UcbIVMAh666Utrw1"}',
      FALSE, TO_TIMESTAMP(1765554839178 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'sya.delaparra@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1765554839178 / 1000), TO_TIMESTAMP(1765554839178 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'grupowarner1173@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'grupowarner1173@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$PIKl/k2vKk3dDg==$tPk/UvRgP/vp/6pa3Q78pA3GoGaXn66FFR2IlFJcBmyAXyk3cPx4P2x7oT/z/92yKOzakP3T6TDZKiYf+lQdVQ==', NOW(), TO_TIMESTAMP(1771308289951 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "rQb23pTrp8W3M3mwJNPtpm4RC3X2"}',
      FALSE, TO_TIMESTAMP(1771307930566 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'grupowarner1173@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771308289951 / 1000), TO_TIMESTAMP(1771307930566 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'juanlopez712@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'juanlopez712@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$o5dEXU2AkM1fjg==$clBqaexkFAXDY0CdjiG6sbku6+2i+DjaEfdM+UwGbxCBIL7hVClznh9s07K54BkE0XaLjSwhE6/AlNeLfBnCiQ==', NOW(), TO_TIMESTAMP(1771297881835 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "rTUOzvIwEVNk6nd4ls2VIeIESdP2"}',
      FALSE, TO_TIMESTAMP(1771297881835 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'juanlopez712@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771297881835 / 1000), TO_TIMESTAMP(1771297881835 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'alfredogupa88@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'alfredogupa88@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$NBr3+71VhYIsZw==$YRcUB1k5jcULEvfTKBZBO2LrVC5MUjwjc+jt3/znM7fbIz0EJkw5+gnf0U2Ux0KCZKfaFL/RgLocJYcm/5ZOJA==', NOW(), TO_TIMESTAMP(1753585399962 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "rUBGCFTswjWsLZ8pWC3RxthMgzJ3"}',
      FALSE, TO_TIMESTAMP(1753583645044 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'alfredogupa88@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1753585399962 / 1000), TO_TIMESTAMP(1753583645044 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'eddierodrigogonzalez@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'eddierodrigogonzalez@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$iUzsUelAvZRZkw==$7Up7kxxacdLLVdsAynlx9fCei2eYG5ZsE24CVUcJ0b8Wa5uhH26Lm+UQUfKsmrmHB3MvjI4TVA8pOsTjzp6WmA==', NOW(), TO_TIMESTAMP(1776951955839 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "rWqsnMkUNmXjcA4TydJcDRZTg7C3"}',
      FALSE, TO_TIMESTAMP(1776951955839 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'eddierodrigogonzalez@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776951955839 / 1000), TO_TIMESTAMP(1776951955839 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'jorgeandresvilla12@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'jorgeandresvilla12@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$S8GrW4wQT3hJbQ==$Xwfp6WLf6IoaBC3gJGGNHeuKABW6BIH0WLGfpq5lnXUf1b6ns17v3fe+TDTAc9aj0kxuz3p6bok5knSszavgxg==', NOW(), TO_TIMESTAMP(1752795974461 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "rZ7V8GnNrLXGha6WkZ3yzmZyFHj2"}',
      FALSE, TO_TIMESTAMP(1752795974461 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'jorgeandresvilla12@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1752795974461 / 1000), TO_TIMESTAMP(1752795974461 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'ana_penagos@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'ana_penagos@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$EGYxx2rqSEcmdA==$eCGvEXS35RZgio5YcGa80jEmWGvk2FAlOd8LH3hwJ88ayLom5B7HHzD2PC5Pd+vMniIsHZHZk1gVNVWFfVLJHg==', NOW(), TO_TIMESTAMP(1775407892588 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "rZlpjJ7VAiQ9S2yNUQkRgCc9s5l2"}',
      FALSE, TO_TIMESTAMP(1774034059792 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'ana_penagos@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1775407892588 / 1000), TO_TIMESTAMP(1774034059792 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'fzdav88@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'fzdav88@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$xEA/N2EoFBdQfA==$iVQ28XeHgj1VO0C2eNj48mkP/99wDldSDaa8W5ZVhp3tXh9qML8w1UQARG89JY/nmOGnoMi1u1BuE5M8uAzITw==', NOW(), TO_TIMESTAMP(1771437560417 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "rdgpyXBLVxSnCqna4O3ylNsLIiv1"}',
      FALSE, TO_TIMESTAMP(1771437309777 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'fzdav88@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771437560417 / 1000), TO_TIMESTAMP(1771437309777 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'cruzgomezdiego3@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'cruzgomezdiego3@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$wd/ohk1cCaiXOA==$tHN7Y/0ggduZ3YWyd5CmiNP3UXC7vHicb6+jre2heC4BhBdM16LPLbtINP9qqRfeflY0g/876oBGP3CjU3PtWA==', NOW(), TO_TIMESTAMP(1772108335749 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "rdjh5iDGcmMXvFTkFgQRog89NQH2"}',
      FALSE, TO_TIMESTAMP(1772108335749 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'cruzgomezdiego3@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772108335749 / 1000), TO_TIMESTAMP(1772108335749 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'elia.perez@e.unicach.mx') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'elia.perez@e.unicach.mx', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$YbpRNbqf6VZnwA==$WBxnrmNih0GpLljfl78Nm6xYhY667/l7afxdSiX0L5W9FuIvzsASyN8WUpijLRJxzxghE67wNUpiYMPkOXzHgA==', NOW(), TO_TIMESTAMP(1776130133975 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "rjBsdfvo3HOvOtkC6JdOgguOfaH3"}',
      FALSE, TO_TIMESTAMP(1776130133975 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'elia.perez@e.unicach.mx')::jsonb,
      'email', TO_TIMESTAMP(1776130133975 / 1000), TO_TIMESTAMP(1776130133975 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'magali_1994@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'magali_1994@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$Afii6H/l/aadKA==$wqud+W9BVa2ZADcbG6lozUZ4is3c3EEpvcAwxVA150YfrVckPCYevtOPXudPJzky1/yxQazlFkCKzOSMddKmrg==', NOW(), TO_TIMESTAMP(1776826532156 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "rloLlULHouZDvdtHzd7fWxzpEt73"}',
      FALSE, TO_TIMESTAMP(1776826532156 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'magali_1994@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776826532156 / 1000), TO_TIMESTAMP(1776826532156 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'seagma70@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'seagma70@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$HyM+cZ5ssGFgpA==$i741Ei+10iazmpM/us2SajUIRl7bvKIwSfv+d/+gJVpVZIs43R8mvbvE6nmUUzSHds1rAbazkYQs3CR7RRecwQ==', NOW(), TO_TIMESTAMP(1772582777901 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "rrQbn8ioTfMGykCi5fjoaC8Z09X2"}',
      FALSE, TO_TIMESTAMP(1772582777901 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'seagma70@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772582777901 / 1000), TO_TIMESTAMP(1772582777901 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'isaac.adrian1844@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'isaac.adrian1844@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$Y1J75MELF1aYIg==$oPf77jUp4yvoeBaQuFWs1zwy8GJpDsgoM8eqGdfI9gbI2zlaZ84j8rhuveeTrd1dlmHjs/PhoSQm6Z082/cPlw==', NOW(), TO_TIMESTAMP(1752785822438 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "rso0SyR6c4MTQC51sUhk4WwW73Y2"}',
      FALSE, TO_TIMESTAMP(1752785822438 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'isaac.adrian1844@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1752785822438 / 1000), TO_TIMESTAMP(1752785822438 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'maldonadocoronel121@outlook.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'maldonadocoronel121@outlook.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$TYStRRT9BIRxdw==$tPwVTmr7Xo7mEk3B998+ERHMU5lk/siKN9VtcBvbsp+gwPZc2TCtfs86/9da1ZalF2nwIhUgMhAuZVqD/+N06w==', NOW(), TO_TIMESTAMP(1774643170062 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "ru2ZYu6YGahqycAmNP4O4uUUQx83"}',
      FALSE, TO_TIMESTAMP(1774643170062 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'maldonadocoronel121@outlook.com')::jsonb,
      'email', TO_TIMESTAMP(1774643170062 / 1000), TO_TIMESTAMP(1774643170062 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'fz_dav@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'fz_dav@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$CtbkUKcxehKdVA==$QrDt1l1aUPw/6vRf2ZFfsM0V7clf2cZaUS69+NBnWBUf249GtmmMucHlEf+dgG7r43ZH4vgmyt3qQufmcpZXMQ==', NOW(), TO_TIMESTAMP(1774327139864 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "ruBQxeG6S9YgIiCWDHroL5Th3AE2"}',
      FALSE, TO_TIMESTAMP(1774327139864 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'fz_dav@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1774327139864 / 1000), TO_TIMESTAMP(1774327139864 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'luisin5289@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'luisin5289@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$NeK4nqA9oPqWcA==$Wwnx2R1JSlM8Wgu8FfHwLG0CBvlqC0FNSncf557vUj0PLfeOLK0YAyEZjZwVnf4b4HtflcGWkwZZ+V06QCDKgQ==', NOW(), TO_TIMESTAMP(1774647572591 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "rwVfSTt2IvNo9kjnZbCG0tn66xf1"}',
      FALSE, TO_TIMESTAMP(1774647572591 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'luisin5289@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1774647572591 / 1000), TO_TIMESTAMP(1774647572591 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'bodegaaurrera@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'bodegaaurrera@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$p3AOXQ8RwjPwog==$cnHKtSAvedY4Y5By7KB0ChawTcRGewp3wF0JXbEyUUdPMZ8Eek6YXhFIJoKndFT+xjGpUVShA5FmfsRmHD9csw==', NOW(), TO_TIMESTAMP(1764392683381 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "s3jvVBCrEvUD7rpl26DsPjAa5Yg1"}',
      FALSE, TO_TIMESTAMP(1764392683381 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'bodegaaurrera@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1764392683381 / 1000), TO_TIMESTAMP(1764392683381 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'josesebastiangutierrezgomez@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'josesebastiangutierrezgomez@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$GYZBPwAhoQTZqA==$tNbIXtUxeMhvB+wp5l0UE+k5wr/8ngF6nWAnHABWSkAyPaCA9nw9PLL6miPaSEfUMSJeoyr1HDChouLtPdZNQg==', NOW(), TO_TIMESTAMP(1779501413849 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "s6Yn2tYBQxZRm6MLMiD9A2F0QtV2"}',
      FALSE, TO_TIMESTAMP(1779501413849 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'josesebastiangutierrezgomez@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1779501413849 / 1000), TO_TIMESTAMP(1779501413849 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'facturasmty@procarga.com.mx') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'facturasmty@procarga.com.mx', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$uCBsGNNIWql0Gg==$zuzzdQHyPmvVgqTIeR1AgdpCnE6d0k4PeF2fRW+Cj8/MjnOmcGPpnBmvMrhi/nzZQUcez7Gd5yR32OsPlt20Og==', NOW(), TO_TIMESTAMP(1771518007832 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "s7ci8WwyntSnsl0uDSnnqoFGjO03"}',
      FALSE, TO_TIMESTAMP(1771518007832 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'facturasmty@procarga.com.mx')::jsonb,
      'email', TO_TIMESTAMP(1771518007832 / 1000), TO_TIMESTAMP(1771518007832 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'humbertoroblesmoreno@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'humbertoroblesmoreno@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$8Aq5K87pNHoFmw==$eRPJ/UVyg28Ncfd2yae2MxZ5cxGWHcmIJR7FnHtguAHhYkxxXaymaNhrbza2SfwejwWNlke8IZC07wlaBQLZrg==', NOW(), TO_TIMESTAMP(1772513455669 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "s9sGKo4CjOP5IFRRdLzxiOszqbs2"}',
      FALSE, TO_TIMESTAMP(1772513455669 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'humbertoroblesmoreno@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772513455669 / 1000), TO_TIMESTAMP(1772513455669 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'nardaroblesprd@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'nardaroblesprd@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$mZ2Xmdrbtqijhw==$RsANnG3sSYU+4bmXGApwgVs1lkgCr2Aj6GbAauRD2TPSuwiBQROhVoPpuX+phXdXMb4gHcbEG6UCNP2WuTDB6Q==', NOW(), TO_TIMESTAMP(1779396854876 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "sDbJQHVI51MGuRXTyq1l27rnzkJ2"}',
      FALSE, TO_TIMESTAMP(1779396854876 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'nardaroblesprd@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1779396854876 / 1000), TO_TIMESTAMP(1779396854876 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'ramosrosy@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'ramosrosy@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$AZkDQCc8dzUbfQ==$dQswigFdljWqZK2jaBXiDWy6V9cpqc4AvS4RIBWD2FFPZAqvc8JyW63d2gEN8xXh1pOqwO9ZnBn2FLTE+RTe2Q==', NOW(), TO_TIMESTAMP(1771303913320 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "sF8VPakkD6YMCGp2JiC59McFJ762"}',
      FALSE, TO_TIMESTAMP(1771303474478 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'ramosrosy@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771303913320 / 1000), TO_TIMESTAMP(1771303474478 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = '13fenixjimenez@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      '13fenixjimenez@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$SjdG9oa150MItQ==$4G2OQNFBTfIaadNucA/uVgfGXWcn6vEJLwwkNYi8/f7L2tz8lBwo5iXT5BthuQWGQQR9Nogjryw4SJDehonEog==', NOW(), TO_TIMESTAMP(1772846179257 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "sKsxLwKaFoN9fQFSTcnJ56FLKDd2"}',
      FALSE, TO_TIMESTAMP(1772846179257 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, '13fenixjimenez@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772846179257 / 1000), TO_TIMESTAMP(1772846179257 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'erickyoan4@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'erickyoan4@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$u02wh/sZ8OwKEw==$zhvvZUVQ8sZKGu0woffS98U83lCUXRYFDmUhcuv+KMsLijkaw8RuGsFBzpirNZ262dr6txAdevIGlEQQceAl5Q==', NOW(), TO_TIMESTAMP(1751740891356 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "sNE9DVBGpjQORatbnaxNg7pDfNl2"}',
      FALSE, TO_TIMESTAMP(1751740891356 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'erickyoan4@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1751740891356 / 1000), TO_TIMESTAMP(1751740891356 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'josegaelfigueroareyes@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'josegaelfigueroareyes@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$34ZYkILN7SoIRA==$3RwDh3UrbPMhQmSN1p1uyQLPaJWMBWyX06eEvcIfsq5VQiTAp1TsZx17n5z+c9pq4+RzFwuFwNIM/erkhY7gCA==', NOW(), TO_TIMESTAMP(1773714535328 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "sOGAso0WBBMXW2lXv15LdAVz8XI2"}',
      FALSE, TO_TIMESTAMP(1773713909185 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'josegaelfigueroareyes@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1773714535328 / 1000), TO_TIMESTAMP(1773713909185 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'yen-bares6i@icloud.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'yen-bares6i@icloud.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$cAdQMyhweCByew==$bL0F5PLUbrPcdKXuWF526ujlxzdqxgaY607+ZYmAgnce8qeqAB/L78vOeeoLs90dK8MBrhMljAsGCnddmSXGeg==', NOW(), TO_TIMESTAMP(1772179295583 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "sPwhqV3zm9aGblklKdbYdbd2caH3"}',
      FALSE, TO_TIMESTAMP(1772179295583 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'yen-bares6i@icloud.com')::jsonb,
      'email', TO_TIMESTAMP(1772179295583 / 1000), TO_TIMESTAMP(1772179295583 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'itzelbere843@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'itzelbere843@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$mCk9RWvo46uHiw==$TzYg2UV6NuEUNC9rxDGSy4QnHi27uCXYZh5Ch5eaoo9HrcToQh8eWTBkgH6smlibizU2rMG9Nx/9YWH0AZgfBA==', NOW(), TO_TIMESTAMP(1778628728919 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "sQXre8qdrMWegvzSBGz7kMAQzTz2"}',
      FALSE, TO_TIMESTAMP(1778628728919 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'itzelbere843@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1778628728919 / 1000), TO_TIMESTAMP(1778628728919 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'gilberto_reyes@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'gilberto_reyes@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$0U5Hh6m8XCwhTA==$GMWtte/+GO2daC54sASFxkBuaMwYG9UGSykKxZsiTrqcg/a2wLD3QXWbzHEWbGUwKNst0XFezlKGJjvaW8Jh+g==', NOW(), TO_TIMESTAMP(1775952365831 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "sU8P98k6O1R9DQikwzcTsZzjyTn2"}',
      FALSE, TO_TIMESTAMP(1775952365831 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'gilberto_reyes@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1775952365831 / 1000), TO_TIMESTAMP(1775952365831 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'osoriosamuel564@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'osoriosamuel564@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$iXqS9ucpiKR1hQ==$K6HR/Paf5QsSZdUpP94LUXw9EVr928bMZzHyDg5QGvvw+/Cvg74x/pBN0mLS2HmNfFMCMgaLXltz/0iZi224Ew==', NOW(), TO_TIMESTAMP(1772138728254 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "sXYiGQz0rgavVXeWsudburXIYNu2"}',
      FALSE, TO_TIMESTAMP(1772138728254 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'osoriosamuel564@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772138728254 / 1000), TO_TIMESTAMP(1772138728254 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'emarcial885@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'emarcial885@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$WQrJaWFRn7TtJA==$et+QejogUnLNarJQnpGmJPXxdyS5ZSmuPToiyb69lFmcKWXKcyQ5J61dLH1YuJDi7qwKwZxm3S50Ph82fEPLzA==', NOW(), TO_TIMESTAMP(1753496992769 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "sXko9A4uV4bzw8C5a853q6FMvca2"}',
      FALSE, TO_TIMESTAMP(1751516881254 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'emarcial885@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1753496992769 / 1000), TO_TIMESTAMP(1751516881254 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'ricardolazn1977@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'ricardolazn1977@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$LwgxzOPgLnUTmw==$8c67UaV/MbqUrp5tDJc+Z+uXU4j8QnFLw3Bs7rOLP2H/e9zQdK9ufYu4wRoXpRHHALC/3lFHh/f2mzeUYanu2A==', NOW(), TO_TIMESTAMP(1775057928003 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "sbaDSjfvcvTz6YRTxmxoqGp29fi2"}',
      FALSE, TO_TIMESTAMP(1775057928003 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'ricardolazn1977@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1775057928003 / 1000), TO_TIMESTAMP(1775057928003 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'gcristinaaurora@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'gcristinaaurora@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$uOFLT1dJMEB2kA==$rsBMBTveV5xl58gHMv5CBmiq0rRBvwUfrTFw1YDnzOEwLvlBGgW/LDtDaNkUc+y7mkdFq0TqqtLNR4jjU79N3g==', NOW(), TO_TIMESTAMP(1774837140808 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "sgpv7FQWIGhMm4fSonyUXbddSDC2"}',
      FALSE, TO_TIMESTAMP(1774837140808 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'gcristinaaurora@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1774837140808 / 1000), TO_TIMESTAMP(1774837140808 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'lozmer.j@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'lozmer.j@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$PtY6Z397p+5V1Q==$ERPCI5oAGTIYbqAl3Cgv9uRTHzgWh8An31GCsUEuwgTxvv82XPqsMW62qNyqt1kZ6OqJtKaN++AOxXaPKG26TA==', NOW(), TO_TIMESTAMP(1753824936609 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "slgbIFwzlqX0xqYHRSHsn38OhVm1"}',
      FALSE, TO_TIMESTAMP(1753824936609 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'lozmer.j@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1753824936609 / 1000), TO_TIMESTAMP(1753824936609 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'solecitohernandez90@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'solecitohernandez90@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$AshT/KyxMvzupA==$aRHfAVCI7SFQj5ruI+Qm2Xk7eQuNJ+jMw4WfV+Bvej7/E4nYvaRWZ2yi+SF+2QCPEW3ySJKPsj+IfV1TOpTxaw==', NOW(), TO_TIMESTAMP(1772240913777 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "smGTI8vwG9bS1rgn2V4MCnMmMHw2"}',
      FALSE, TO_TIMESTAMP(1772240913777 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'solecitohernandez90@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772240913777 / 1000), TO_TIMESTAMP(1772240913777 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'paelitaestrada@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'paelitaestrada@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$7Hr5DoCmioxmVg==$W0LvTuIKH5p1MQyLCcxst135zw0AHJ1INJF5tYYKQNvQFu/mM+Q/aBQ2f8MzeB3l0NZWHvCHZETSwjdDfoE26w==', NOW(), TO_TIMESTAMP(1774314099633 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "sq9rDCwyxBWdGfk0AX506doWRnV2"}',
      FALSE, TO_TIMESTAMP(1774314099633 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'paelitaestrada@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1774314099633 / 1000), TO_TIMESTAMP(1774314099633 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'brayansauarenas@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'brayansauarenas@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$/jTiqlUuffCVZw==$238YK6CdNV7CSqxK5FoQm6wt/u15N4ps4qYqHul0yzTkR03CeMJIScYMJVCZLfejS4gmH+/TqsvZr9bLOrzn/Q==', NOW(), TO_TIMESTAMP(1766727954694 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "sxE6EZQFazYcPXK4Iy2oSBX5RgG3"}',
      FALSE, TO_TIMESTAMP(1766727603978 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'brayansauarenas@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1766727954694 / 1000), TO_TIMESTAMP(1766727603978 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'azarelaguilera@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'azarelaguilera@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$n0NwnSkXaF0PbQ==$XKOrkkY43PCVIpMfgYnSgiXS96COv1roKKsO0+5NBWaT1JZffC5WU8/xg7D78L2qewM6fD1aBKqJ65pl2Ax/8Q==', NOW(), TO_TIMESTAMP(1771907019833 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "syaErM7toARhCbsoxubvdHxcAXA3"}',
      FALSE, TO_TIMESTAMP(1771907019833 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'azarelaguilera@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771907019833 / 1000), TO_TIMESTAMP(1771907019833 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'sabo18gomes@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'sabo18gomes@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$KfpjHhnV0ouegg==$9eT8nkTDbt37zpiHz99z60+4tOj5PEJLHbRSrBVRuhf8HG6S03IodlhJNpDsfaELaz1QdnIP3JVnnZOI0ELhYA==', NOW(), TO_TIMESTAMP(1771283781254 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "t801HfGHZYgAxyliFJYc2RQhoxe2"}',
      FALSE, TO_TIMESTAMP(1771283781254 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'sabo18gomes@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771283781254 / 1000), TO_TIMESTAMP(1771283781254 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'gabrielxt@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'gabrielxt@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$W2tkVWu174/Gew==$yUuCyfzsAaQs4k2LqyKEd2bbmUni/AToQVDBAM/ncAI25kKVVxXTLaP3KupV9UuY+GtqGWjU9U49ERMYHthjhw==', NOW(), TO_TIMESTAMP(1749429500252 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "tByVPodmymcp9c0TFwdzoYzI15R2"}',
      FALSE, TO_TIMESTAMP(1749429500252 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'gabrielxt@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1749429500252 / 1000), TO_TIMESTAMP(1749429500252 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'maria.iasalazar1969@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'maria.iasalazar1969@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$Hv80IjCa1ou2UA==$QU5jacOTun2jKUW1E8wCOyAyLwJxMbBnE9LwSf+4BAz5YWgZDhmKgvu8CYzZQJexl8E2byi1wTznUGj9f4AGGg==', NOW(), TO_TIMESTAMP(1775058784516 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "tDry3itFMjSxo3QjsZckASnNPKx2"}',
      FALSE, TO_TIMESTAMP(1773100113229 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'maria.iasalazar1969@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1775058784516 / 1000), TO_TIMESTAMP(1773100113229 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'pino500019@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'pino500019@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$RwwDpgbNjzCuFg==$idVGqRjmNw67ewTfM2/qi7C/oWuwc4alt79SnFoIb7fwdsULor1UCnph9comlk3cfOfNvuDbUX4WulbbIffQvw==', NOW(), TO_TIMESTAMP(1776215553137 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "tIGYmYXtxLdj4OqhrYqp0ZcW4AO2"}',
      FALSE, TO_TIMESTAMP(1776215553137 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'pino500019@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776215553137 / 1000), TO_TIMESTAMP(1776215553137 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'fcoverau@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'fcoverau@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$7lxGcs0xn1likA==$q/jC9joPosBjKw5n/tsqYKkp/zyKZ3wdUoUkxb6hMXY1Tq1kmlfL2OVI/BFOvYpRVU+hJK3lTnCXm9goKnZzsQ==', NOW(), TO_TIMESTAMP(1771507489401 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "tIlZ6ohjlpUm3Hs9oASDS6i34xf1"}',
      FALSE, TO_TIMESTAMP(1771507489401 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'fcoverau@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771507489401 / 1000), TO_TIMESTAMP(1771507489401 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'danycfm87@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'danycfm87@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$7eyWsueFCt43Jw==$s3OCQkav9WIMDJDZNLLT/wXXMF1E/rX5UsMW2ZJLgYrh1NsacOuBIg5gSasPLkxevF4dDPXIfMXsK31FYBSRmA==', NOW(), TO_TIMESTAMP(1752756476800 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "tJdmoMO1j8Nt3HMzIx8HRly5GCJ3"}',
      FALSE, TO_TIMESTAMP(1752756476800 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'danycfm87@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1752756476800 / 1000), TO_TIMESTAMP(1752756476800 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'fabyytha.89@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'fabyytha.89@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$ir+nux3iXWtP7w==$aLlm7PHdpKS0Il3Za0WkJ0kW5dTAd7kaqikAPfJGZeLN/Qf10xWjMgPSponlzA5BjYIqpjPhui0knrYJZswZCA==', NOW(), TO_TIMESTAMP(1776223701431 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "tNGrIYH5Q8dh7jCpBryFBhN1kqq2"}',
      FALSE, TO_TIMESTAMP(1776223701431 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'fabyytha.89@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776223701431 / 1000), TO_TIMESTAMP(1776223701431 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'mayrax68@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'mayrax68@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$32QIU+GivfhZFQ==$4dqDH5e8P30EEo8dAB5hez9gkqfO+dCUrmYM12qFDC7jaUhL8IZzua5R0fM4XVqofoBmNb90u6txy0ilx8bgKA==', NOW(), TO_TIMESTAMP(1772248598224 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "tNbw906bYUXbQhrF5svMXXSE8UA2"}',
      FALSE, TO_TIMESTAMP(1772248598224 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'mayrax68@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772248598224 / 1000), TO_TIMESTAMP(1772248598224 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'egartomastrejo@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'egartomastrejo@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$QXawK8nfKmPDvA==$h/NlmnCTc20RaysrL4ccIDkxYRiC8pypF4XFy20YibdWPYf2N8offUBjsf4TDwvgOT2uskZ9b9FdRfFbTR3kaA==', NOW(), TO_TIMESTAMP(1772843271862 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "tTOkeWxAYnZQ8GTbcWJl03CeLP73"}',
      FALSE, TO_TIMESTAMP(1772842268410 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'egartomastrejo@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772843271862 / 1000), TO_TIMESTAMP(1772842268410 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'carlos_jorge4@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'carlos_jorge4@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$y54WuHFL3HEMcQ==$0I4+GXXIaphiEOCrmeA9uSBwpgPOdP8sf3jsDWjUCxct5EHQMFmrR5QCX2EBAsom5ay1ZE4baybeAwagJycvXw==', NOW(), TO_TIMESTAMP(1771767161035 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "tYtBtr8FuheiKGsDq8pT3cLMCPE2"}',
      FALSE, TO_TIMESTAMP(1771767161035 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'carlos_jorge4@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771767161035 / 1000), TO_TIMESTAMP(1771767161035 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'jennifer.gyado@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'jennifer.gyado@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$rQKZ2UBnCOxGQA==$ShTNO/meZ4TcXeAdH+h/5AVQpJDQGgiAj7LADyVEc9iROYT3OCsTtLaH8jokvbXOYUz/cHw2p8EUlzZkoFtdUQ==', NOW(), TO_TIMESTAMP(1776371977466 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "talNuYMqF5ajN6mfkKL6qcmVh3l2"}',
      FALSE, TO_TIMESTAMP(1776371977466 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'jennifer.gyado@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776371977466 / 1000), TO_TIMESTAMP(1776371977466 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'ricardolaz19777@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'ricardolaz19777@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$gzdPNCIp0daiRQ==$1Z3p0MgFTpz8r9m69tt37tpyMUgKYS0nQslRdlY03Db9NC4yUAFK8bt7w9OFTpHsKbDHWP1USJCwVIYFl7YiMw==', NOW(), TO_TIMESTAMP(1777142831223 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "tdhI4pPn5adLA5JIdHgKJiN1vUQ2"}',
      FALSE, TO_TIMESTAMP(1777142831223 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'ricardolaz19777@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1777142831223 / 1000), TO_TIMESTAMP(1777142831223 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'yesiflorespoma050419@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'yesiflorespoma050419@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$86kIdI1HiI3lpA==$qdOXNS3golNx3tA3CeS14fSzO05lnfOHgJPFiNsqunDlkI1NP6O2e6MZcLkfKp++eeXQcJ6CDPo5Owt8CZm6jQ==', NOW(), TO_TIMESTAMP(1776219552857 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "teqABefosAQPQLiVYvWbmvOrI143"}',
      FALSE, TO_TIMESTAMP(1776219552857 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'yesiflorespoma050419@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776219552857 / 1000), TO_TIMESTAMP(1776219552857 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'chuycontreras581@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'chuycontreras581@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$+53xNW1svyuEWg==$i0kAEZ9Y2nq/gidArJulQCkoVR/7we3CGa+yZxNELnCTHacyrDbq26jv92QFBnHA5PrkZWnLria7awjchrXbeA==', NOW(), TO_TIMESTAMP(1768943547886 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "tgOnM2QzL4OjSSIMeTLfRbovkzg2"}',
      FALSE, TO_TIMESTAMP(1768943547886 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'chuycontreras581@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1768943547886 / 1000), TO_TIMESTAMP(1768943547886 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = '2702lgblp@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      '2702lgblp@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$2WdIps1A87uXlA==$gFcJ2HXpjmhu87FMI1elMEiqaPSyQRxKeLz+pCl9dO56I/IklTCW4MtyfKYNVqgCQdhIpoKFm9xRruOJ1QtWhA==', NOW(), TO_TIMESTAMP(1776286593924 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "tixVUH0X9mgD9TSWCwmv0e4L0sN2"}',
      FALSE, TO_TIMESTAMP(1776286593924 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, '2702lgblp@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776286593924 / 1000), TO_TIMESTAMP(1776286593924 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'erickhcosta98@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'erickhcosta98@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$K1XEJiEg3L6YQA==$28L0VkgdNxVs4v8XWUEENAuB0+9OQf5B34ksc881HFBzv/qbEME4/oOlp+sn1WrbTF8jJZCduJp1KjeL2Pd3AQ==', NOW(), TO_TIMESTAMP(1773359339640 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "tjhZFp3EqzRmi6t3LPtVWxZT05y1"}',
      FALSE, TO_TIMESTAMP(1773359339640 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'erickhcosta98@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1773359339640 / 1000), TO_TIMESTAMP(1773359339640 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'papeleria_gaby02@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'papeleria_gaby02@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$0vHolGeUbh6vsA==$ryoujlnKSyoXlGvCYNdHveyXUZxY5wREiGtcQPIk9SyjK/2t83CNNi43dR3l+nK+hmEStNPuejCHciIUd/tVZQ==', NOW(), TO_TIMESTAMP(1776227358865 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "tlVLAq5ZhoZDq0D3jSuDBFulQhC2"}',
      FALSE, TO_TIMESTAMP(1776227358865 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'papeleria_gaby02@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776227358865 / 1000), TO_TIMESTAMP(1776227358865 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'montseeli2025@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'montseeli2025@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$ZRgPqlkJyiv3sg==$GvU5Pr/0Z+TBAcLB9aXLIhcL1onA4C7ul+hguPpH3N2pC/sH7q6FbuPn6p/mLu8ETpQqHyx2PnRpG86wIU0fOQ==', NOW(), TO_TIMESTAMP(1779281969727 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "toxktY1roHeMVQtywZDbHCdlZ9o1"}',
      FALSE, TO_TIMESTAMP(1779281969727 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'montseeli2025@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1779281969727 / 1000), TO_TIMESTAMP(1779281969727 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'ozzygarc24@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'ozzygarc24@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$Sjjxm/WBo4BDPA==$oGmTVb5kbMdrW0iF+jGMh+OC7JW7wbBCkbJplYcgFffLaRovEbbsq7Y/f9WrSg2IHi+RW3KQTnfkVK4nZqAxyA==', NOW(), TO_TIMESTAMP(1776216943240 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "tx16FRhVpGWdGwfoKOFlvw5rXI72"}',
      FALSE, TO_TIMESTAMP(1776216943240 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'ozzygarc24@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776216943240 / 1000), TO_TIMESTAMP(1776216943240 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'blancaflores2704.bau@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'blancaflores2704.bau@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$svGBrDXv6Ou70w==$Xncdt5ApE5uoXPlaj+K9lkQhVXSz8flN11CdOG2BfCEyBcRnRP9tn+sgpQOs/FmE/T1RFyH35jtSxRGjTj7fOQ==', NOW(), TO_TIMESTAMP(1771296796295 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "ty3zXELqkmd5DTylt1aS0MPlrOF3"}',
      FALSE, TO_TIMESTAMP(1771296796295 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'blancaflores2704.bau@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771296796295 / 1000), TO_TIMESTAMP(1771296796295 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'titit.gaye2110@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'titit.gaye2110@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$iDDCZunFcFWDQg==$MuMcw/IkXZ2ifStIox2ye+V4TfRiQs0+2+7Vx8aUP5q9HoQnK08/wbLb5oW5r80dwCMmdorAp+cYXKQJZO7Hmw==', NOW(), TO_TIMESTAMP(1776228946854 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "uE0V3samUeR0AaHaMCRinYFUdXR2"}',
      FALSE, TO_TIMESTAMP(1776228946854 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'titit.gaye2110@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776228946854 / 1000), TO_TIMESTAMP(1776228946854 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'daqer2412@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'daqer2412@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$F+h40qFJF50zcw==$3Ndj3x4lcrrVXdMDb+EyuZfiPACZ5p5oZN48cdgqYaGna6d34fMKW7ZUfqeUOZeCgrHlJYiCxgOXq1oVqUvDcQ==', NOW(), TO_TIMESTAMP(1777006547145 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "uFaH9biT84c3I3wUOYUbNMfoWQO2"}',
      FALSE, TO_TIMESTAMP(1777006547145 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'daqer2412@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1777006547145 / 1000), TO_TIMESTAMP(1777006547145 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'juanmoraga20005@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'juanmoraga20005@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$mrZ9JE5YcT8F/g==$H4dKYoNubtff4SpB61KlyxGcsd8hhil4DSYH4O+djIHWvXvIqDpza3LLuSKkkH6GZM9hCq8LcJU3/eanfUETiQ==', NOW(), TO_TIMESTAMP(1767862723685 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "uGOekSTFRCP20cws5tuNSLh59wj2"}',
      FALSE, TO_TIMESTAMP(1767862723685 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'juanmoraga20005@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1767862723685 / 1000), TO_TIMESTAMP(1767862723685 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'zluisalberto450@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'zluisalberto450@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$2MoiO6u83Xq8BA==$cxBT5663b9hg5XXipQHHe6d2SbG0A9zUGvQVcg8jbVhN+/AFgpK08TykAc7v9YULlJMpylog0ShdTIjKciWEZA==', NOW(), TO_TIMESTAMP(1775790445706 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "uGPqbpgiTFXALAU0NUgKH2A4mxT2"}',
      FALSE, TO_TIMESTAMP(1775790445706 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'zluisalberto450@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1775790445706 / 1000), TO_TIMESTAMP(1775790445706 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'abaquc@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'abaquc@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$cwySicKqF3Lh4Q==$KOi3w8eivlcm1xPvXjdszn9CWy3fuALMhZ5ANXxY6WwtZ4A0CZzxIZtW/gw5bkp+8Z6Sv3Zm3BELpgNtdAAVAA==', NOW(), TO_TIMESTAMP(1776231740002 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "uIYeQlQrmuU5pwCVvdMGgEZ2ke42"}',
      FALSE, TO_TIMESTAMP(1772935859082 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'abaquc@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776231740002 / 1000), TO_TIMESTAMP(1772935859082 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'paubear01@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'paubear01@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$HHS0oIXUGQJorw==$X+ooRQtkxU/Hrzt0dlJivHILE65TaGmUcAJpBgOh9VhoNNfAN6I1EYfB+GU2f9LraDio41wPeUdothSzaIx88w==', NOW(), TO_TIMESTAMP(1771492545861 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "uIZH2oNcyuTw3qHyJ0LmvOUSORJ3"}',
      FALSE, TO_TIMESTAMP(1771492545861 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'paubear01@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771492545861 / 1000), TO_TIMESTAMP(1771492545861 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'marelyramos750@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'marelyramos750@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$3w7nv5vZLPRgug==$9osdg1069eyx8yIeKO12Jb6eiNOnCnEWlI7AzRMGpc9hM8FcmJVXHFmOHuVHibwQoXzlPBd1LQWZvvhCzt1C7w==', NOW(), TO_TIMESTAMP(1771278064101 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "uOjevUmaMsV1tCrJPZzCmoBtYNV2"}',
      FALSE, TO_TIMESTAMP(1771278064101 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'marelyramos750@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771278064101 / 1000), TO_TIMESTAMP(1771278064101 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'franciscoperez3209@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'franciscoperez3209@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$y/HEGN0mQSZeHA==$w4COMse7FrLKBaLJcfsHd39n72hi+73m1tfd1+BtIram04akMpX9eftpPnPP/soQRpY2JczGH2fJsKestvRP1Q==', NOW(), TO_TIMESTAMP(1771276332960 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "uRT3sGr1aJTNZn3m6FMLmavZHZ93"}',
      FALSE, TO_TIMESTAMP(1771276332960 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'franciscoperez3209@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771276332960 / 1000), TO_TIMESTAMP(1771276332960 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'mich.mosant@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'mich.mosant@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$0hcAhuUg+mvyJg==$zoJ3fuEVZNp6yRgVAI5SJBDUB7FSb1EwtMii/TNylOESBM5ZnJ6FsRG1z303oBOIRUC+eHfN092PTMJR4r+Kpw==', NOW(), TO_TIMESTAMP(1776397847917 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "uRwPSW7aKyXIz52wWtusk9L7s173"}',
      FALSE, TO_TIMESTAMP(1776397847917 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'mich.mosant@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776397847917 / 1000), TO_TIMESTAMP(1776397847917 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'brake.george16@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'brake.george16@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$rnzli1gFSe0sPg==$3bEfi4eJ0Kmxb6cdeo00m+caKELvX33Lvs9Erp/bGOf1AQeVkCswLtLZJKrxQzxL8zjQbdvDBcPvxYrq8NT00w==', NOW(), TO_TIMESTAMP(1776370008273 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "uSYqp0k6RgXuqGHJ9M2O0Z8hvmC3"}',
      FALSE, TO_TIMESTAMP(1776370008273 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'brake.george16@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776370008273 / 1000), TO_TIMESTAMP(1776370008273 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'rdzkahory@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'rdzkahory@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$MlMCAoiERqwgvg==$jquUjj+EWM9sYTaT9Zx9/qzwHgH6V0OKjvwpcoSgqtnDZMErPafv0bOmfbzo051uQv9SeJ+OZsU8RFPgYaMJgA==', NOW(), TO_TIMESTAMP(1753866139267 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "uX7S1J3CHrffEH6jNUOT6Lqaj2s2"}',
      FALSE, TO_TIMESTAMP(1753770023563 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'rdzkahory@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1753866139267 / 1000), TO_TIMESTAMP(1753770023563 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'miltondejesusramosmartinez@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'miltondejesusramosmartinez@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$LTmfxKHIqH4jdw==$NOvNSyg1X8C+R42teC1Enps1arlwyoc8qalaYXoc53ewXA2vqDGy/wbuR8ZIcJbEuh9MZN4EWmwuJ9GBSeNSEQ==', NOW(), TO_TIMESTAMP(1771505898287 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "uYYkueALZ4ScbEdSmhH7RPEQV0w1"}',
      FALSE, TO_TIMESTAMP(1771505898287 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'miltondejesusramosmartinez@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771505898287 / 1000), TO_TIMESTAMP(1771505898287 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'manuelavazquezico68@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'manuelavazquezico68@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$GyD9yLJ8RIzCYw==$Q1xBCuWxTnnIruwDbgSbUa3R7tPVmrzjvsASX1c9p1o3pRWbBsUtWgnkRvroMHVDl0QX+SZHgJvD7ENCQK2C9g==', NOW(), TO_TIMESTAMP(1771299423072 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "ucAnve2I88dYefjHSwgkDOEV8mE3"}',
      FALSE, TO_TIMESTAMP(1771299423072 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'manuelavazquezico68@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771299423072 / 1000), TO_TIMESTAMP(1771299423072 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'lunita190889@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'lunita190889@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$4BEgdoBFi5Gyfw==$9o1yfAEf1P0clsQNKQiBQaaJK3x8vhd4nhERdS9NOcJlfap7+USRfv8su+a/vkFp8mLEoMIxRpNK/k7jJoTXxg==', NOW(), TO_TIMESTAMP(1771389881036 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "uh598HCW6GXQy4wYbTzgGTfzSbt1"}',
      FALSE, TO_TIMESTAMP(1771389881036 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'lunita190889@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771389881036 / 1000), TO_TIMESTAMP(1771389881036 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'rodriguezmoralesjonathan490@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'rodriguezmoralesjonathan490@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$IGZ2/e4YKur4aw==$mE2uNrtELvYYAAg3AxAx+fljaef3PabIxnVbI1IGv0gEDrxw+hSxjkrC8wuOf20FY0Qz/FWmBmkpWLsxiNmmLw==', NOW(), TO_TIMESTAMP(1759569066084 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "ulKYL71VQOcrG30yXE5j2FECPqy1"}',
      FALSE, TO_TIMESTAMP(1759569066084 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'rodriguezmoralesjonathan490@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1759569066084 / 1000), TO_TIMESTAMP(1759569066084 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'carlosgomezsantiz79@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'carlosgomezsantiz79@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$ly6a5kwLq7xjRQ==$BueiJM2DZEaPAnfbqOcfPq2KsvhIK/os//EYX/uWITtLHfYtIR3tYXRoKwjDvpnG3rFBGhEbmSJW50y3SzenrQ==', NOW(), TO_TIMESTAMP(1772853607246 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "unuEQQhN7KfY6z2AeYkZFtKfM0o1"}',
      FALSE, TO_TIMESTAMP(1772849980052 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'carlosgomezsantiz79@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772853607246 / 1000), TO_TIMESTAMP(1772849980052 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'gabrielapinacho13@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'gabrielapinacho13@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$OK3bd+eAWDurEA==$xImiBOsLIVWsFWGDenAfD3keB6t9R+nEk8aVDqokXxyZ8/LaVpQH24iYTj+n84E/BbVDzCKKjEWNvWEm+sCJmw==', NOW(), TO_TIMESTAMP(1778890872958 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "uqdfYdBn5OMOu9jkjIro7RyMTxC3"}',
      FALSE, TO_TIMESTAMP(1778890872958 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'gabrielapinacho13@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1778890872958 / 1000), TO_TIMESTAMP(1778890872958 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'jalfredohdezfonseca@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'jalfredohdezfonseca@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$0RmuA3Lr+7kDqA==$masVi5/GLD30X2aDf5gIciOxJQmpOP5x+eZaWblDMZ1ItJUyxonkXXRg6KOYNO52NOLMGTQcIwi/Gvp1sM2KKA==', NOW(), TO_TIMESTAMP(1762298160972 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "uqmoCLssddfytbmvm7NjXZhJLcI2"}',
      FALSE, TO_TIMESTAMP(1762298160972 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'jalfredohdezfonseca@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1762298160972 / 1000), TO_TIMESTAMP(1762298160972 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'zaira3711@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'zaira3711@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$h95MQLS9Y/k+sQ==$5bX6URihQSWPMU3oQWRPj3E3MskYGWAKx4DciTiTSSsdARcHuq3TBlf/Pcf1f6kt/zZoOBBpw6bYF5TsYtY8+g==', NOW(), TO_TIMESTAMP(1765481936116 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "uyJkqqylWfOHxSV4dE2FPP0tTZt1"}',
      FALSE, TO_TIMESTAMP(1765481936116 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'zaira3711@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1765481936116 / 1000), TO_TIMESTAMP(1765481936116 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'isaiasom@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'isaiasom@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$BiZuLx4US7+O0g==$0p32vQO2oSm9sROzNDsrnPApb8o/T4eR2NqY7jRBZ8ZicmleSEntgQDkK66rX5IHtC1KZUMFQ3EhO9BMk/GVeA==', NOW(), TO_TIMESTAMP(1776229146121 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "v4gMxh1lddhS5Ll9xSAJbuRjPmr2"}',
      FALSE, TO_TIMESTAMP(1776229146121 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'isaiasom@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776229146121 / 1000), TO_TIMESTAMP(1776229146121 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'jesushc3225@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'jesushc3225@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$Sufqq5qBDUJM2Q==$FV/Y0TvU3GWh7o7H/ulu9CgrY0dheveRZBwcanCLBKeMZLmiwba7JHj4L/H1Az4vMJq4LW1IlqKu+mHwALQfpg==', NOW(), TO_TIMESTAMP(1774798482125 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "vDhxFH8y7ZNCmDfgX1srtDKJUw22"}',
      FALSE, TO_TIMESTAMP(1774798164322 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'jesushc3225@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1774798482125 / 1000), TO_TIMESTAMP(1774798164322 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'maguderena89@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'maguderena89@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$b+8VZS49P2Li7g==$iuDkbwg5tXTZBcvTiebz5sVXYjHkSc8zXcSiPBREhOffmCm8IPeG6auLB+KCzES/qLvasGDDjFsn9Hh22kXgUA==', NOW(), TO_TIMESTAMP(1772051921220 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "vEtjRFyxtiZnyb4uilfsNNWh2V33"}',
      FALSE, TO_TIMESTAMP(1772051921220 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'maguderena89@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772051921220 / 1000), TO_TIMESTAMP(1772051921220 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'dyc2728@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'dyc2728@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$YGu1tiX2f7hyHQ==$b/Zm79YRkhzPZuLwkJxh8CQTZtC1hl3G1k498v22mV1ejOZMXHdVXmpEmEWyDbXdS1SLDgJBvdqboD3cb6KmLg==', NOW(), TO_TIMESTAMP(1776225599705 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "vKmu2WA5pWYmTzr8ewLgAncBV4r2"}',
      FALSE, TO_TIMESTAMP(1776225599705 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'dyc2728@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776225599705 / 1000), TO_TIMESTAMP(1776225599705 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'margaritamendez945@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'margaritamendez945@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$UdwEXMoUN3FxVg==$pGVXzcHWE/T67wPit7IM+035iSJdf7m+pIb6q1/YzTE8nv0fC0f2NaCMVYp8eKUSLxNOm0Fvvz4Lsvp4Q3Llgg==', NOW(), TO_TIMESTAMP(1772339673376 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "vNlw1vcjMaeaaBz5C1o7FU79Qxq2"}',
      FALSE, TO_TIMESTAMP(1772339673376 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'margaritamendez945@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772339673376 / 1000), TO_TIMESTAMP(1772339673376 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'sofiaosorio.ac@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'sofiaosorio.ac@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$afEjrA1iOtEv8Q==$JuTkFaOlO0jrXSsKz8JKMSrV3cthW/vO7h8VUq5a3++OjLAhC3GNyDuvzsqnU9IRkjQzZcmDmr8fiZF5JmU6SQ==', NOW(), TO_TIMESTAMP(1771448413098 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "vOQdx3ORzTTzLT7IsijHsBRlBT62"}',
      FALSE, TO_TIMESTAMP(1771448413098 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'sofiaosorio.ac@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771448413098 / 1000), TO_TIMESTAMP(1771448413098 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'patocris63@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'patocris63@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$QnxzSZv7lL+Cpw==$805y3VEN9A6dgjN1TGJk99b+s6bvI442LWcNYirgmGRibGgn2paWLyk3QCOya8zHAALpUr1RAxXSWjpz+g8EsQ==', NOW(), TO_TIMESTAMP(1771287870582 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "vSNfwA87V7OAaFuz7056bJ7M7H82"}',
      FALSE, TO_TIMESTAMP(1771287870582 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'patocris63@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771287870582 / 1000), TO_TIMESTAMP(1771287870582 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'oscar_flrs@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'oscar_flrs@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$wGI58ozCx8N6nA==$3MB0YOGaA3hOXmRunMeGa2Sww8ZvXv3a9x6txRJJjQrNgrGm+UPrDg6hOOrt0I2ptrU1Qzk1Y+drxGZ++DN/SA==', NOW(), TO_TIMESTAMP(1765871306149 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "vTPU0LavlHXeKvyWPEwpeaQl3qn2"}',
      FALSE, TO_TIMESTAMP(1765871306149 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'oscar_flrs@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1765871306149 / 1000), TO_TIMESTAMP(1765871306149 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'sanchez.mari702@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'sanchez.mari702@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$/FB7P4eQY8hDLA==$Co9s8QZzZ6NfSclAK2KJ8J0uyQIriQBnNN3Eq3fiKS3gsIQASq0dA6USTzPsZc1T3I2LU3NztT7v9jgLZtIBoQ==', NOW(), TO_TIMESTAMP(1776223954035 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "vX3XNT0l6xWxQ4Aip7w0DKctVat2"}',
      FALSE, TO_TIMESTAMP(1776223954035 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'sanchez.mari702@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776223954035 / 1000), TO_TIMESTAMP(1776223954035 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'yanincy31@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'yanincy31@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$vFeXwyp5U0D37A==$N811SrSa9IxotYqtOMsWB7pfA/+cYNroiss+wCct+Qn4xI8Kab3NVVAncjEB6QaFurkRXEPF9x1jebdXItIBXg==', NOW(), TO_TIMESTAMP(1771296696938 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "vXkOcOM8p1foTMY9jYGr4ZKhGLJ2"}',
      FALSE, TO_TIMESTAMP(1771296696938 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'yanincy31@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771296696938 / 1000), TO_TIMESTAMP(1771296696938 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'leydijhosiqueycastillo15@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'leydijhosiqueycastillo15@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$85l1ltYKTXwaRg==$BTULjqLV25vzu/kVpM4tX2UgvFGkmFxmGvFgMWqRrIvd6kODtvx7CaO3N8iMvoP9wMajAl9xU37S+uYx8PZRSQ==', NOW(), TO_TIMESTAMP(1772762227905 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "vYZmPeIdKcQBaZ2LtAhzMEj25L32"}',
      FALSE, TO_TIMESTAMP(1772761801979 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'leydijhosiqueycastillo15@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772762227905 / 1000), TO_TIMESTAMP(1772761801979 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'mariobd46@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'mariobd46@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$byQ4r7bphtNcSQ==$Bb3s4ppXcScyvQYrIgWC3creY3x4NPqmrZdR3rNW9npXccYumYVxcNgtq1p+du2BchpuIEExQxFn3t22DXTRaA==', NOW(), TO_TIMESTAMP(1776318707708 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "vZY019mVnKOKGJXtQVfzGKlI6wL2"}',
      FALSE, TO_TIMESTAMP(1776318707708 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'mariobd46@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776318707708 / 1000), TO_TIMESTAMP(1776318707708 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'tlme100@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'tlme100@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$+0P+FcfDBGRZCQ==$D1m4asTP+bYJlZWpvZpcje8c6F08Sc6tVfVglx7wHFW0KZDBgNibwNj9ChTGx8uP8MDo7lS1KTAXKGauRl/zkw==', NOW(), TO_TIMESTAMP(1774039718727 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "vfv7Z6yP70Y638zx6CDmQrf3NNs2"}',
      FALSE, TO_TIMESTAMP(1774039718727 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'tlme100@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1774039718727 / 1000), TO_TIMESTAMP(1774039718727 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'luisfevale2010@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'luisfevale2010@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$RuNlUB2tjAPNfQ==$Q5zvahJ2XOl3ONakFRLleV5ZC8YFC+x4s61SYqGG/WDKMQdr9Izcj1Kwv8vty0Sk+L614KnyWe+zzzDOh+nyTw==', NOW(), TO_TIMESTAMP(1776227502350 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "viV3HbN1eIeXXJAwkFcKg9QAysb2"}',
      FALSE, TO_TIMESTAMP(1776227502350 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'luisfevale2010@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776227502350 / 1000), TO_TIMESTAMP(1776227502350 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'fakecheko@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'fakecheko@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$xtw9CGNLu89lTw==$pVcyq4r12kfzV/iWpbqN+Q/2Xf118iGGUMEigHlPCg1ienBpSseUn12fKDCCNj+91UuyW3LQ57GYF/4ggZE+Lw==', NOW(), TO_TIMESTAMP(1752807400700 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "vj3OZMKBKDafkyI95tq6U65rgWg2"}',
      FALSE, TO_TIMESTAMP(1752807400700 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'fakecheko@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1752807400700 / 1000), TO_TIMESTAMP(1752807400700 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'wilkaisergerardo@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'wilkaisergerardo@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$Rnf+NS0wEh1FKg==$vd99Ei9n5D2lZFRkBiUYya8/Kk4cHmpPfPBuTqpoOI1w5wcCBwZZ1402gvqxLNSshFN34/tDEGW7v7VIG9fbfw==', NOW(), TO_TIMESTAMP(1771623075206 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "vjPRQvJqHuWM5L8OAUZ6g7R7mpz2"}',
      FALSE, TO_TIMESTAMP(1771623075206 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'wilkaisergerardo@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771623075206 / 1000), TO_TIMESTAMP(1771623075206 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'karen.codigo@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'karen.codigo@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$wJNrPxWkEKd3Aw==$bpXqYVrVi7iHYo8jxE7Y1/A5anNE+9mx9pq1vD+CoB7216OIRp8jYABibObM3HV1VsqnIDR32l02q6Is/IrAiQ==', NOW(), TO_TIMESTAMP(1773109392459 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "vk3wM0N0iiUH0GKKuyT55WlMOgF2"}',
      FALSE, TO_TIMESTAMP(1773109392459 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'karen.codigo@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1773109392459 / 1000), TO_TIMESTAMP(1773109392459 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'gabychmor@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'gabychmor@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$9z7Y3CkLckfk6A==$ex6pc31jBbpi/R/kaWRkfYH+CsI9WD9Uge9ES1fCcECnaUjS5swNFtEeobzKlnuHuUZF+N4l+HV1WT/rSONeIA==', NOW(), TO_TIMESTAMP(1771298825616 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "vmWo9J2hg1VGpucWZpiNYXIkvrq1"}',
      FALSE, TO_TIMESTAMP(1771298825616 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'gabychmor@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771298825616 / 1000), TO_TIMESTAMP(1771298825616 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'joselinemarenig@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'joselinemarenig@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$WTXpiuTD0Gup2g==$1fJ6CAeRzHD4caaHQ4jgXM7GYiP3IabsHCLaFRrF/0LUykLTDro422RNiJvu05kIaEVY5yzbGv2M269v8H9ZCQ==', NOW(), TO_TIMESTAMP(1776298700130 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "vmnQ61SDyXNZPaxoTB2GzmcM9cD2"}',
      FALSE, TO_TIMESTAMP(1776298700130 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'joselinemarenig@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776298700130 / 1000), TO_TIMESTAMP(1776298700130 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'fm4319839@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'fm4319839@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$Tv2z/j/N6X6CEw==$lUqAQauvoVhgfilqF32RcunLiFSBdg/I2ppattZyfIhN3IaQLFfkKCRxp3PgZhol/1b1cAXyTPcQAv4CtAAMLA==', NOW(), TO_TIMESTAMP(1751507003939 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "vtlJoO60uXRz18LF74ZyHbvya6f1"}',
      FALSE, TO_TIMESTAMP(1751507003939 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'fm4319839@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1751507003939 / 1000), TO_TIMESTAMP(1751507003939 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'keihernandez1007@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'keihernandez1007@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$N9Bm87pV+TzUJw==$4xhoV1WjKKC5xKYIFHdlHFzhXNGuF497Wu6T1bJf8GTfrUXg6XnPrBQvHEukZCiCxSd8hwRWnw116g8YkaXujg==', NOW(), TO_TIMESTAMP(1776180301125 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "vvsgus4IQYWVMU05yF53mObCgtJ3"}',
      FALSE, TO_TIMESTAMP(1776180301125 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'keihernandez1007@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776180301125 / 1000), TO_TIMESTAMP(1776180301125 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'delgadogamezrodrigo@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'delgadogamezrodrigo@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$Sg93uP3ysHAiYg==$a8gQGjVs+7n6Phw/rso74uA2nBQUmWzPF4gKDYJPrKC+HXRjFtLqZJvZF5t7jzeM9Z8jorz86HlSg9HSgWqK3g==', NOW(), TO_TIMESTAMP(1751394283894 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "vxuc17r0MlbQxTe6cv8E4j0n1mU2"}',
      FALSE, TO_TIMESTAMP(1751394283894 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'delgadogamezrodrigo@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1751394283894 / 1000), TO_TIMESTAMP(1751394283894 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'luissalasaguilar27062002@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'luissalasaguilar27062002@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$LrLw7kCMV8M1tg==$bG0TFlKFxT6WYn3QRJ76fuO2tA1Q7YWh9imd3SAw918prGZmwn5HZSOtEHQyfMZ70HTA4Dr1fSNeCWFTJ9Zf+g==', NOW(), TO_TIMESTAMP(1753291793722 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "vzwhNfYYpeU73YFf1x14svHnN5G3"}',
      FALSE, TO_TIMESTAMP(1753291793722 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'luissalasaguilar27062002@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1753291793722 / 1000), TO_TIMESTAMP(1753291793722 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'osiris881114@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'osiris881114@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$XEwZIja51uFXcg==$DQX/usu+B/sQzc56tHOLACYuHeFlT8o2M5vvxxXD+lGzh+QHEp8kephHkMzwrbazy5wf3RgDzmavuTsEvTY9Iw==', NOW(), TO_TIMESTAMP(1776219639351 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "w5QeTZAMZ9SDIqpHR5atuhjXi3N2"}',
      FALSE, TO_TIMESTAMP(1776219639351 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'osiris881114@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776219639351 / 1000), TO_TIMESTAMP(1776219639351 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'juancasas240698@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'juancasas240698@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$3NY1Ryy0shuAjw==$xfq8tIKi2CDlRyOP6vISWeF2UdVMm931brKYHQYJJF32AF8XXAFrVV8f0qpr/DlBlQ8pSv0LKWcWbIRqXp82WQ==', NOW(), TO_TIMESTAMP(1751876986429 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "w5nG45y4fufLzvyfTFFVInmt8tq1"}',
      FALSE, TO_TIMESTAMP(1751876986429 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'juancasas240698@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1751876986429 / 1000), TO_TIMESTAMP(1751876986429 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'obedmisael@yahoo.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'obedmisael@yahoo.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$/MpLJRnccZsisg==$IkLpJk0QfQAwkIpAqH54hGvLDkWyFIHxV4ShlrtK0jGIVN90W1XID4N+0WefT+rrh9S245MosoIo/UD16j3sRA==', NOW(), TO_TIMESTAMP(1771025680408 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "w5s5rXLPfIgCa7BMfY1Q1qAitij1"}',
      FALSE, TO_TIMESTAMP(1770942577602 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'obedmisael@yahoo.com')::jsonb,
      'email', TO_TIMESTAMP(1771025680408 / 1000), TO_TIMESTAMP(1770942577602 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'decelisbaldomero25@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'decelisbaldomero25@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$lnx7ikIKOZe/tg==$VRyktmwJwGe67YHP1oH3L/4lBwzj+t6N9teluan9AhKPGa6SIQYYVSAvRn7kh+HnhzlOFQ1Cqo0zZTQUAIkMGg==', NOW(), TO_TIMESTAMP(1771737797675 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "w71ZXUNrmiejKDJ7cw2UGcVIGFh2"}',
      FALSE, TO_TIMESTAMP(1771737797675 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'decelisbaldomero25@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771737797675 / 1000), TO_TIMESTAMP(1771737797675 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'dna.schz.schz@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'dna.schz.schz@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$j0IUIGgaBlKADA==$AH3Lax30PUYSgaiPXu2LwKMasvIzgoFxg6YdQgRxS5R07Vcw6ZqRUNfE+f7cVuKD1q4xcSlxksWFlkQF9KGs6w==', NOW(), TO_TIMESTAMP(1751579075009 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "wBSGPqy6DmP0u4bcjUzWja3kwvp1"}',
      FALSE, TO_TIMESTAMP(1751579075009 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'dna.schz.schz@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1751579075009 / 1000), TO_TIMESTAMP(1751579075009 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'ramipro115@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'ramipro115@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$vvS3fEByY27wfA==$CVP1mQxy2g/rJKWLvSRpRddM3pNOaVDmPQow6Va+LjK1KMqNMdpe//a2iJ0yBK5SIqkoOy2gRLjlGMLgek8d0Q==', NOW(), TO_TIMESTAMP(1776316614062 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "wEc5Uu5rOOTrOEEPlT3lZJq26972"}',
      FALSE, TO_TIMESTAMP(1776316614062 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'ramipro115@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776316614062 / 1000), TO_TIMESTAMP(1776316614062 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'brianayareli07@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'brianayareli07@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$pbZV1aq8yTF+ng==$XCvOU2QZ6C9rqdKRxr8jz545yELCYRFnQJVJlU6xs8hctQ83amki7IM5B1amQ5V51h7iV2irwKlBlDOizzwmCQ==', NOW(), TO_TIMESTAMP(1775352703520 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "wEqbca40XAbnjwiuHOtMpwceBtB2"}',
      FALSE, TO_TIMESTAMP(1775352703520 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'brianayareli07@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1775352703520 / 1000), TO_TIMESTAMP(1775352703520 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'andredaniel007@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'andredaniel007@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$Zp9ITjUVhNDn/g==$2OKRbIvQWHwQcm/tH6jL+NrUdRpWTDbcLiNfw3DryOJgEX0Oot2Xl3jEC+XkrZy2Mr+06kkb2CWiL9CIMwF7mQ==', NOW(), TO_TIMESTAMP(1776230477747 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "wN9W2HtckeYsnOzoYK666XvVeft2"}',
      FALSE, TO_TIMESTAMP(1776230477747 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'andredaniel007@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776230477747 / 1000), TO_TIMESTAMP(1776230477747 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'armendariz050198@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'armendariz050198@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$F13vA+H1ioZt8w==$xUhNU0tJ0U9+XV+EDKdkjZUAov42WWG2keF/XI3R6nexBE1GrsBcakoWmipr31gW/X3W8lZieP8EJU6esgixKA==', NOW(), TO_TIMESTAMP(1762998614547 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "wPUVt3ZR28avTmN7AjbprE7bxoz1"}',
      FALSE, TO_TIMESTAMP(1762998614547 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'armendariz050198@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1762998614547 / 1000), TO_TIMESTAMP(1762998614547 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'lopezrod37@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'lopezrod37@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$rZwbbLPqFZLdtw==$SgLR1N+0Knes0bgtzUFHyKbIlJju7hBJOqJVwncrIX6/B66SjKAWo3sUrjSp0uPDfjii28K4QlTQaV4TmqA4uw==', NOW(), TO_TIMESTAMP(1776229411346 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "wSd8NjaeU3eE2ME6igCIfyPmc1u1"}',
      FALSE, TO_TIMESTAMP(1776229411346 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'lopezrod37@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776229411346 / 1000), TO_TIMESTAMP(1776229411346 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'barragan720520@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'barragan720520@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$iFfSmHBhG6aS2Q==$TDbXaaYxshhKBLQgvhMM4l/VmfNT5hdUhuiBljdEiV7NQVzzWQG6gydLn2Wzz+5f1lbQHKYql8CIHN6OFGgTGA==', NOW(), TO_TIMESTAMP(1771367626994 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "wSooswEofXUjXmjubwYUg7t4jaQ2"}',
      FALSE, TO_TIMESTAMP(1771367626994 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'barragan720520@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771367626994 / 1000), TO_TIMESTAMP(1771367626994 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'bbguzman80@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'bbguzman80@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$iGBoQzzS0idRHA==$nlkc1pXby0AacfYT8qQTWO4fF2JrOW+wVdgzu//TZnPsX7klL7Lpm77WQf0Pf1XjrDWEyM2NJabSEjvcRD1Txg==', NOW(), TO_TIMESTAMP(1774064044768 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "waDMGeqB7CYHLBtp0BFbFruZ9TH2"}',
      FALSE, TO_TIMESTAMP(1774064044768 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'bbguzman80@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1774064044768 / 1000), TO_TIMESTAMP(1774064044768 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'dianamart1704@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'dianamart1704@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$tnGrX/HkA9MOWA==$85KrZzKR7RiPa3R3zwO5bI1HIm00tw/DRSKl59ZgyBZ9RyOj/ggJEglkYd/ZKiFbOLiXj61loCURvefTfvbEVg==', NOW(), TO_TIMESTAMP(1775483896170 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "wdUEwefFkRWVjgdn224Asr9FSZd2"}',
      FALSE, TO_TIMESTAMP(1775483896170 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'dianamart1704@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1775483896170 / 1000), TO_TIMESTAMP(1775483896170 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'gironsixto88@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'gironsixto88@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$7JqOxqqrN8eRmw==$urqN0B6kmxxR1sZdzxcLa1LRbH6j/F0p++NKxvbOcqnl43munPTJAJBindo3nM9oeNjC8UPu5Aw9EBO5HmZSNQ==', NOW(), TO_TIMESTAMP(1772592087714 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "weNRjpqnFrS4L8Tx7mKj2z2CELA3"}',
      FALSE, TO_TIMESTAMP(1772592087714 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'gironsixto88@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772592087714 / 1000), TO_TIMESTAMP(1772592087714 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'gabriela.morenomiranda@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'gabriela.morenomiranda@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$LB1ZkHh9Jpdc8Q==$OZRPQsnKf6JbpJtmf+kgiP/SO9gO+TrvZnawhl3XSXOFDt7hUN4NE1/KD3Hy5O8Nk8RleiqdD5sVUnRf2otAQw==', NOW(), TO_TIMESTAMP(1777501293300 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "weoktE5PUcM6OYZKCwzTmC2aSgf2"}',
      FALSE, TO_TIMESTAMP(1777501293300 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'gabriela.morenomiranda@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1777501293300 / 1000), TO_TIMESTAMP(1777501293300 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'xiaomi.temple.destroyer@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'xiaomi.temple.destroyer@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$Uk214HIgkPQRcg==$Rg0gd1y4QRn9uYR1x8BGpTrle+FsN37k2csjIrLK8VY3IMg2rk3aRMWmkrWTdWYuheheekcmkwXkYCfFGPBBmA==', NOW(), TO_TIMESTAMP(1753303779174 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "wg8M0mwZR0aKwTyjWOH2cm36ag13"}',
      FALSE, TO_TIMESTAMP(1753303779174 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'xiaomi.temple.destroyer@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1753303779174 / 1000), TO_TIMESTAMP(1753303779174 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'laguapurapura@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'laguapurapura@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$mq+aVgy0svi1Sg==$C9Trnx5yjq8N2sQurLvFvpBaQNrWdLzfo9MxI8MSeUICOXDD0XXCkYoaC6A9lLH3P6tILZrfohVZXH8wBxXGmw==', NOW(), TO_TIMESTAMP(1771289899236 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "wmPUJCb0rxXAW6rd9o8Iy9A5FxE2"}',
      FALSE, TO_TIMESTAMP(1771289899236 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'laguapurapura@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771289899236 / 1000), TO_TIMESTAMP(1771289899236 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'cindyramos013@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'cindyramos013@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$48q0Df1SSDSfPg==$q5ZNWQNPbEJkO3bPnGUp5pVL9tac/dmC6bt74eBn1hb7NDnfWw9ElrQMgKmm2S3f210ChBiqkiUERARYF2rdzg==', NOW(), TO_TIMESTAMP(1751823580528 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "wvOIGhAXQvZ6RyhzWtKyxckCMXJ3"}',
      FALSE, TO_TIMESTAMP(1751823580528 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'cindyramos013@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1751823580528 / 1000), TO_TIMESTAMP(1751823580528 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'gerardobpenagos@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'gerardobpenagos@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$7defOnqOXFIZYg==$AmaQpQD/iJ9I1AgAxDTQxm+LRsevr2ljjio7TxLz16UkwF26LkzAFiLc+c5DOYWZ1TZPKnsi8dhnQtnWQg/iLg==', NOW(), TO_TIMESTAMP(1774102304319 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "wvlqOTCxiUPzOjLtFaGDjiQwFQp1"}',
      FALSE, TO_TIMESTAMP(1774102160314 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'gerardobpenagos@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1774102304319 / 1000), TO_TIMESTAMP(1774102160314 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'gabrielagloria368@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'gabrielagloria368@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$A1Dn57RuRcd3eg==$9UnV2hopw6F8tskXshJbjH6RZnBVAl8RHpXAOb81gAlZABzPgMCwc6U9GPV7SeFL+zFVqHZMQFQYutrp1Ckm9w==', NOW(), TO_TIMESTAMP(1751563798593 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "x5cGCRQO5rdKOFsPawmP0JdIrLC3"}',
      FALSE, TO_TIMESTAMP(1751563798593 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'gabrielagloria368@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1751563798593 / 1000), TO_TIMESTAMP(1751563798593 / 1000), NOW()
    );
  END IF;
END $$;
COMMIT;
