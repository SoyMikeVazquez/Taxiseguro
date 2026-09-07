-- Lote 1 de 4 (400 usuarios)
CREATE EXTENSION IF NOT EXISTS "pgcrypto";
BEGIN;

DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'maguitonajera78@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'maguitonajera78@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$Tpn5yPDDUvAg+w==$7AFwE6wkF4m3ayBTB3XiJkPd8foJSJPGdpxIIOFYUvRfFGOUMh4Kd035xfZene+BehaB5WiRF2j973o1p56KtA==', NOW(), TO_TIMESTAMP(1776272076686 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "00gjCgyTLPbKIZqCi5OdzycHuqQ2"}',
      FALSE, TO_TIMESTAMP(1776272076686 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'maguitonajera78@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776272076686 / 1000), TO_TIMESTAMP(1776272076686 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'williamsmendez1810@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'williamsmendez1810@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$YmzHT+QxXe1p0A==$B5/vKEFiqaV5V+Iz+kxI7wlT2nolYKf0c+HslakGoTjztlXSHoCnevej81scsxggCVamWBtZkF7BqnaV/BKfaw==', NOW(), TO_TIMESTAMP(1776222034368 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "08Ve6Qs3y0eLrOr5EAvDLspB4HL2"}',
      FALSE, TO_TIMESTAMP(1776222034368 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'williamsmendez1810@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776222034368 / 1000), TO_TIMESTAMP(1776222034368 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'yuzeberecruzmoreno@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'yuzeberecruzmoreno@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$9pKgvuRBoOcitQ==$MHuTDXoRJoOHYzRXPUgujhX/Q8xFNDFK/owt3GmGpeASd7vBpQkOuzbglsW2YHrDsg7kSjra2SkP/79VlghaAQ==', NOW(), TO_TIMESTAMP(1771537716088 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "0BSbLHIfWbZO84pSGe7GpzmyO332"}',
      FALSE, TO_TIMESTAMP(1771537716088 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'yuzeberecruzmoreno@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771537716088 / 1000), TO_TIMESTAMP(1771537716088 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'carlosalbertorangellopez114@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'carlosalbertorangellopez114@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$RWJLEsZ0cFY2Ag==$TBMuH0/uHgBNytnaDmm6b2fbDRmWS7fIAGRW7FNTJqJlvrE53bz3fDg+EDuBRnTrY9jszpdEtkXyKdnhtWExZQ==', NOW(), TO_TIMESTAMP(1751524087345 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "0DocklCLOpdoRcxRMNnwwOl8MdW2"}',
      FALSE, TO_TIMESTAMP(1751524087345 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'carlosalbertorangellopez114@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1751524087345 / 1000), TO_TIMESTAMP(1751524087345 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'rf.zambrano1236@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'rf.zambrano1236@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$1BSPh0yqJiSuYA==$O+XGBW3KxXEnb3VG/Yw8T7cDwsZ1JqRsP9cGb7PHbeIW7eeoNoW7hLonZoFGV35tmBPrwuHjcy2cnyrFeI+elA==', NOW(), TO_TIMESTAMP(1776896935951 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "0E9dEGzOfQZB6XjpSVWQvleSuOL2"}',
      FALSE, TO_TIMESTAMP(1776896935951 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'rf.zambrano1236@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776896935951 / 1000), TO_TIMESTAMP(1776896935951 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'ale.loza.c@outlook.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'ale.loza.c@outlook.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$BuL+d+kSPyelpQ==$K1xTmeld46OXNBAhYG1fhn67y+JpdKZiFbXV4OV7WxT50ygHZD+d3EAlZ4/00qZPav74eBNSWf6CC5EIvHnuBA==', NOW(), TO_TIMESTAMP(1752879789780 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "0FMJtOsIC8UWS8LNEKcRPk4XyBy2"}',
      FALSE, TO_TIMESTAMP(1752879789780 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'ale.loza.c@outlook.com')::jsonb,
      'email', TO_TIMESTAMP(1752879789780 / 1000), TO_TIMESTAMP(1752879789780 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'chemagtz85@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'chemagtz85@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$aUEAVE2cCAsrgw==$0ahMHh6GQrryxoA1iHad/r4oQigZrSCjtxhbaV2VrMJ10jtvGT2NWM425uVlnGraD8HunXPiS6OkpoQRaNkhWA==', NOW(), TO_TIMESTAMP(1774318828618 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "0FfSfrqRF5bkgZWsXBHIdBdWMfc2"}',
      FALSE, TO_TIMESTAMP(1774318828618 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'chemagtz85@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1774318828618 / 1000), TO_TIMESTAMP(1774318828618 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'sergio.checko.o@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'sergio.checko.o@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$KAgFcUGnGF48Pw==$klDkT30SJ3+YGJSg8dXC9UbsCCCMQhSFA2aPvMZt7FgV1bY9POj+spfk2CzzzkqaHSfCjNohiq012cTGQUN2/Q==', NOW(), TO_TIMESTAMP(1770440654132 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "0IHKJENCPLcTYpwYeX1Lq9Ha1rO2"}',
      FALSE, TO_TIMESTAMP(1764112130762 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'sergio.checko.o@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1770440654132 / 1000), TO_TIMESTAMP(1764112130762 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'anetteguillenballinas@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'anetteguillenballinas@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$S7iXndm5rrq9+Q==$l5YltJ6AA5Q3xLuxJCR0pdMkPJ9P07pN+z8WLqQT+dz7p11zPJgrWCbAbJusPcUWUt5Uf1t/Yip3/DTMyXbEig==', NOW(), TO_TIMESTAMP(1775095569265 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "0Ie0T8EaPWcbuZsA1WHnSJ71USB3"}',
      FALSE, TO_TIMESTAMP(1774754195204 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'anetteguillenballinas@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1775095569265 / 1000), TO_TIMESTAMP(1774754195204 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'trejo_yuri2912@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'trejo_yuri2912@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$Ebs31FGwIGiw1w==$stBCDId6yjf6aFdZEXDP17tmdFr2ZKGnCuyzS31Kv+E+y6BOodJ0aUcOrmhzzWU5wEYNiSNt0CbCLWy+kkJc0w==', NOW(), TO_TIMESTAMP(1776217136743 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "0IqoSBBL30fnNXotQC1o4f07dpg2"}',
      FALSE, TO_TIMESTAMP(1776217136743 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'trejo_yuri2912@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776217136743 / 1000), TO_TIMESTAMP(1776217136743 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'natalia-mesquita@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'natalia-mesquita@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$tDKmOsK39oJAWA==$H84Er0mRe+ZT1THZBSYUF/HfISOWCa0BamVS2C3B0RQ2v4q5X8D/JOgeYCbrAVJxWfD7NqiJimPQRwUjCreUDw==', NOW(), TO_TIMESTAMP(1771288242163 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "0MZsn6dwk4R4rG352sPQCGKFAT12"}',
      FALSE, TO_TIMESTAMP(1771287709008 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'natalia-mesquita@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771288242163 / 1000), TO_TIMESTAMP(1771287709008 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'mcd_cancino@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'mcd_cancino@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$47wBhwoLe9moHg==$JaVwM6t5zPd6EoVSY3sQHo6/gqDTQ2xxMX9UUFZY5wIldWPDcsIPOeYR32BEBrV4xxeBk6a6ZJKCZMRHZu0vTg==', NOW(), TO_TIMESTAMP(1780210511332 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "0S4UVBX1UmWDEzl87SJg8zusGHT2"}',
      FALSE, TO_TIMESTAMP(1780210511332 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'mcd_cancino@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1780210511332 / 1000), TO_TIMESTAMP(1780210511332 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'yesada2091@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'yesada2091@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$us2UVV7z1UsP5A==$4gLt5kHkT9ZvqND+NJmxSQrztiVxqQP1GeETvHiAS8Vt3KPjU26jOIQlgGpyNk648t0r3PShUeDTce8TnDEDnA==', NOW(), TO_TIMESTAMP(1776217890022 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "0SuS25oRR3UGy8XaxvryT15MQ4t1"}',
      FALSE, TO_TIMESTAMP(1776217890022 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'yesada2091@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776217890022 / 1000), TO_TIMESTAMP(1776217890022 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'cashowars@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'cashowars@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$dA9ky3iFl+Ow+g==$m7i/UEH/lw0gc3Z0dP8sr51x8JOgiWTNG1ucAwExs7HY6/B0ZxqGKJLaSBWvkw06y85fdb45j7uvbl/IdAqcBA==', NOW(), TO_TIMESTAMP(1774047856621 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "0Tm1LXAXtyN1t0t1TdrTmLryZDg2"}',
      FALSE, TO_TIMESTAMP(1774047662654 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'cashowars@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1774047856621 / 1000), TO_TIMESTAMP(1774047662654 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'fabianrodrigo3@icloud.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'fabianrodrigo3@icloud.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$tO/CFyzV9olTyA==$/e9VDp5+ddZINyYr7vzxXSQgvx0pSxsFNw40CN+O9AtAeaqzUzTA7JqhVNCr/i5Rd/BkRkDjjxM/qguMjPpb3g==', NOW(), TO_TIMESTAMP(1771992167145 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "0X7DImE23XTkPuDvEZ1IJmGS8X92"}',
      FALSE, TO_TIMESTAMP(1771992167145 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'fabianrodrigo3@icloud.com')::jsonb,
      'email', TO_TIMESTAMP(1771992167145 / 1000), TO_TIMESTAMP(1771992167145 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'familiaurbina945@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'familiaurbina945@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$5OrSg5KV2/2aXA==$mp+h+mrw05K67YHenxS16YRcON7NJYd6+OMxauj3C57LI3g3Lze1p43+vqXUGIqsw7Wbe6LzyfwbnH51+bF3Xw==', NOW(), TO_TIMESTAMP(1776114143552 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "0XTjJmqyIPhdPPAUZa2fV9l46IQ2"}',
      FALSE, TO_TIMESTAMP(1776114143552 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'familiaurbina945@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776114143552 / 1000), TO_TIMESTAMP(1776114143552 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'morzi_17@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'morzi_17@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$KyDVM/VA+OjKkg==$zUCWsOssFNpKxuBhrzoXIbjaBLgaYxHh6qw3ZJIkQ29KGX8XIy5GBs0FY04B8xtl6jSZ1q+Edqn4T3/+a7mSaA==', NOW(), TO_TIMESTAMP(1776573212244 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "0iDjF3wbZbNxmtn8DTDN6Y9bIMR2"}',
      FALSE, TO_TIMESTAMP(1776573212244 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'morzi_17@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776573212244 / 1000), TO_TIMESTAMP(1776573212244 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'transportistasunidos.17@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'transportistasunidos.17@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$lsb+uLBjX365OQ==$9EjPpSYhwiFIz5ajQn1nJaLOXmz1+0ojAlHS0MZXT6ZQkBUF7b/BISDt70nFMIwzGPLS3bhiBk6WmaQ1Pdrtvg==', NOW(), TO_TIMESTAMP(1772369996622 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "0lU3X5vZ00TwGO7RIYjROczHlf23"}',
      FALSE, TO_TIMESTAMP(1772369996622 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'transportistasunidos.17@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772369996622 / 1000), TO_TIMESTAMP(1772369996622 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'juan11dietrich@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'juan11dietrich@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$gyV36etik8pHQw==$ALERRzjrfiQmTowJgB1ujAUKfWtw1/Dy5EWupvjwbQ0xqyZOPkixlRl5lwJfNWs4f2E36wVHEZFhO4FsIZm95g==', NOW(), TO_TIMESTAMP(1773294324074 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "0qbuvyl6V2UX1nqjJGZCi5AFibA3"}',
      FALSE, TO_TIMESTAMP(1771275108815 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'juan11dietrich@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1773294324074 / 1000), TO_TIMESTAMP(1771275108815 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'natanael.avalos@outlook.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'natanael.avalos@outlook.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$KnMr0Qo8RXd1NA==$cbms38CUAriJSa6S/fpDuQeHvxbqyhBFz+byu0CgZVU/vzgYHHx4TfKzG0ivdG+fSt3cFye9G7yhvTn1jNcBKQ==', NOW(), TO_TIMESTAMP(1752811017945 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "0zRcKkzKibZabLCzmEzdkvD2bpI2"}',
      FALSE, TO_TIMESTAMP(1752811017945 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'natanael.avalos@outlook.com')::jsonb,
      'email', TO_TIMESTAMP(1752811017945 / 1000), TO_TIMESTAMP(1752811017945 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'fridagvaal@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'fridagvaal@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$Kv3oH8kxqDbt8A==$O3pczIq2CXBnghcxw4u2MEnRZGZ+C5ez2xSGdaiLaDeBw2UXNI4QHlVn+Ij9FU74Wl38wJk9Iz41j4l8EUIRPQ==', NOW(), TO_TIMESTAMP(1772645398536 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "15EAUWl8eCbMdCZSFCzf51vbbwU2"}',
      FALSE, TO_TIMESTAMP(1772645398536 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'fridagvaal@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772645398536 / 1000), TO_TIMESTAMP(1772645398536 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'ederneftali89@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'ederneftali89@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$vyTlaMY0UbQjlg==$I0aIbo5PAelV91+Oo71xV0UX5SfVNRMovsOcjMotOCOThaKEhPfyV8LbxDfjG/V0vA9d+VOfl8LfjNk/euxQIQ==', NOW(), TO_TIMESTAMP(1772991117527 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "15hJAYqPm9RmeF6RYCY7Y1nUNp42"}',
      FALSE, TO_TIMESTAMP(1772991117527 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'ederneftali89@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772991117527 / 1000), TO_TIMESTAMP(1772991117527 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'gradel_528@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'gradel_528@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$POfVkDdFtymQKA==$IEfj8ccFPF1ePK1aiMJSdwPkPNOhInfQT/+ukAQnCu1+VfiEhHt/kPPecthSWyQPMEkaTPUkPyYL31ayYbbRKA==', NOW(), TO_TIMESTAMP(1778713453082 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "18yfv1ev96dAx1R2jFfZyx3o90M2"}',
      FALSE, TO_TIMESTAMP(1778713453082 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'gradel_528@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1778713453082 / 1000), TO_TIMESTAMP(1778713453082 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'janedelice2@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'janedelice2@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$vcDUjHYjMmX5ow==$2Y3kSHClMPJqlUwn0rTjqQ0y3EX4b02awi8+jkLj0MqKDum9cl+7uWW0D9kykaa6CKHC/o/646kCS//KHdtRyA==', NOW(), TO_TIMESTAMP(1771293753428 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "1AvqnHB4COakftrtnSNcAAZyJeV2"}',
      FALSE, TO_TIMESTAMP(1771293753428 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'janedelice2@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771293753428 / 1000), TO_TIMESTAMP(1771293753428 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'carlos-6913@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'carlos-6913@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$RzJj6GJEqi/lQw==$/cKHjwu+A9Mxoa6+XY05YUNOAGi5cJoAUi1EafQuUwmLJlMJvZNrQdVOnI9yJpkj7uil2Mb5qONIpYfvzcjO7A==', NOW(), TO_TIMESTAMP(1772851204012 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "1CyzR2RpEncZl4KT6qDG1qip4Dy2"}',
      FALSE, TO_TIMESTAMP(1772851204012 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'carlos-6913@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772851204012 / 1000), TO_TIMESTAMP(1772851204012 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'adriluhdz@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'adriluhdz@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$+Oix7FlOmSqXNA==$uthZ2b4h1HcabJ6ffgY/3XFqRGmB4hd/SjEydOaBKI3tQ8aCBwBcYn+EkxzAxuf1VS3ESo+APCDbDat/KNG0XQ==', NOW(), TO_TIMESTAMP(1771342854246 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "1G9KwDcZ3GPv5s9RMUWSogW4EOR2"}',
      FALSE, TO_TIMESTAMP(1771342854246 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'adriluhdz@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771342854246 / 1000), TO_TIMESTAMP(1771342854246 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'fuente.anye@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'fuente.anye@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$lHigq9yZHHxcmA==$Xhbi+12f3coMPYnXAU5BV0l6cLuFkwh519OKBEJmUPLNi9oAPW7gUpct5foGMJFCGwtJckZNcMJow1WrGks44g==', NOW(), TO_TIMESTAMP(1771286965831 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "1GvlmVLBgEbPf22NN487iKCT35a2"}',
      FALSE, TO_TIMESTAMP(1771286965831 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'fuente.anye@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771286965831 / 1000), TO_TIMESTAMP(1771286965831 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'alejandroerick750@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'alejandroerick750@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$zCOF1GMeJE3PVw==$Ir/yMt+WOj5CkhPyKqi3pMEiqwCbX3RTjfebQFsiaOuvi0kfVi8IV1eX+MX4ImCbzkvYZCGkldfLtUe7HTxJEw==', NOW(), TO_TIMESTAMP(1753472507177 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "1R9h7ANQA4Vr21ACpr7q1rSjef23"}',
      FALSE, TO_TIMESTAMP(1753472171110 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'alejandroerick750@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1753472507177 / 1000), TO_TIMESTAMP(1753472171110 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'jessybt98@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'jessybt98@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$rGWdXjskLpXn9w==$PspXUaE/wtEZk0Z6aEN7gfsXcBwZJSl/FvGpSDQc9hmqyqqqwFykJKgOdXX2xpUpCgW4tMwT2J/D+3wxflW3mg==', NOW(), TO_TIMESTAMP(1776222693833 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "1Sk4eq93yRTMz8qf8cKmwVFSMxw2"}',
      FALSE, TO_TIMESTAMP(1776222693833 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'jessybt98@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776222693833 / 1000), TO_TIMESTAMP(1776222693833 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'isidrogabriel00@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'isidrogabriel00@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$nCwNzlEI24ZDOQ==$8qgRf2U4Sx2mj51+pZoRtRgsos+I54xyjSETzkUFOaOiA7Be7PascQVMHO5LB5BH7QI8l+wlFvQcenAnAN7uGw==', NOW(), TO_TIMESTAMP(1754390012986 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "1VVQMNm10yM83in994QR6lgla8e2"}',
      FALSE, TO_TIMESTAMP(1754390012986 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'isidrogabriel00@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1754390012986 / 1000), TO_TIMESTAMP(1754390012986 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'rog500847@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'rog500847@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$hBDEL7aPBKyFCg==$ZEpz+DmHeQhrQ3+nwLGetTWlfBbN+uMW6OnCtrizL86GR0pXofniIzQmVWXnMbJWAzbhXNyiwstMYo11YPhcMg==', NOW(), TO_TIMESTAMP(1771286077078 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "1aJCTuB2afZUxX0aCCX9gJZgmGo2"}',
      FALSE, TO_TIMESTAMP(1771286077078 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'rog500847@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771286077078 / 1000), TO_TIMESTAMP(1771286077078 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'jmlievano7@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'jmlievano7@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$CAPhGvd8shw8mg==$vgtCtfWi7WxPddJBSOgZk4O7HxAieMnBhAnPlceTdsno15GuDsdVgTQjcGsAvitKJ6ce8XWOAS0hrw5h4KpkPA==', NOW(), TO_TIMESTAMP(1771356076974 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "1bcgGEOpJoUUQg823tZ8gdPzc4R2"}',
      FALSE, TO_TIMESTAMP(1771355422810 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'jmlievano7@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771356076974 / 1000), TO_TIMESTAMP(1771355422810 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'kevinalejandroa42@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'kevinalejandroa42@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$dHB7qGyRqHhQig==$tGjJduNAnC5Cup+01vtp8vv+nDWU/L8hjZx0Lwan6pULg566EwmCNn4TTO9micdiL0J5Nta6M8qa4FwMph4dcQ==', NOW(), TO_TIMESTAMP(1771274034271 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "1cfZlpx1H3R7gf5CCzPiCXLz5Vd2"}',
      FALSE, TO_TIMESTAMP(1771274034271 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'kevinalejandroa42@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771274034271 / 1000), TO_TIMESTAMP(1771274034271 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'estefaniacourtois@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'estefaniacourtois@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$L2cxmdSE0JjH/A==$IqArDXTb9Q/QvlermY7+EYf81Rg1eRN1sEPterzh7lL35B/AGf5jiE2Lzeb5EEqnpKb9NfN3JmCeYnfr2FlxYQ==', TO_TIMESTAMP(1772568447026 / 1000), TO_TIMESTAMP(1776980989470 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "1g6FyaIQasaiI5AJOiCfiaIOcos1"}',
      FALSE, TO_TIMESTAMP(1772568447026 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'estefaniacourtois@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776980989470 / 1000), TO_TIMESTAMP(1772568447026 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'palomas1540997@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'palomas1540997@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$XjDgF29jc2kGKQ==$SgWmfLkiezhDuRZh3Na8wVgdqrN1VNYVlAqdLeQ2LrEIRJbPtzLila26SsB2ncuhi9pHCa5RiuXIeiGQKHsYxg==', NOW(), TO_TIMESTAMP(1771484060425 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "1gRqNTIC7sSiSjOcivlegk2NZQ13"}',
      FALSE, TO_TIMESTAMP(1771484060425 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'palomas1540997@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771484060425 / 1000), TO_TIMESTAMP(1771484060425 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'admamo4545@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'admamo4545@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$YGDncEp2kJuYmw==$CUi50FLoMjbx8XRPCRqRnX3F6vVWsozX06nYiXnUioP5ErmMpKEBoCEGjyHPv4+kKzDUCeExnT7+JPa5bI+dKg==', NOW(), TO_TIMESTAMP(1772331677929 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "1jA74TucZJeNeOnY6gnHtjQBGkx1"}',
      FALSE, TO_TIMESTAMP(1771290014763 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'admamo4545@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772331677929 / 1000), TO_TIMESTAMP(1771290014763 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'flortovilla21@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'flortovilla21@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$JyI5oS1X9192mA==$6nKRTH/19y9cEeYRXEexGmpFqutUZl+o6o6zoee/KGxja+YwbWLetxogxdA6ag1jEXyZPAH1h9VS5ojQVkzUWQ==', NOW(), TO_TIMESTAMP(1776639105584 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "1p4UWaVMSCQEMsEvRbLZ3PhzRpN2"}',
      FALSE, TO_TIMESTAMP(1776639105584 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'flortovilla21@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776639105584 / 1000), TO_TIMESTAMP(1776639105584 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'jorgevaose@yahoo.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'jorgevaose@yahoo.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$OZsoHYGehMD2Gw==$hhjrL6+CWsasBdavsiDWS8KRXN5oGjievRLc5NZ4CSPtV4sLeqnlfPNhPsdWOjxfoadtjInYm/2c9fzO9bNB4w==', NOW(), TO_TIMESTAMP(1772141357363 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "1ud1ZOBgGoWcLB1nsNTw5qgrS6z2"}',
      FALSE, TO_TIMESTAMP(1772141357363 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'jorgevaose@yahoo.com')::jsonb,
      'email', TO_TIMESTAMP(1772141357363 / 1000), TO_TIMESTAMP(1772141357363 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'gomezgranadosjuanpablo@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'gomezgranadosjuanpablo@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$KUENrwk1L/50wQ==$xih5QtkbCuwMK9JtZXkpbFgtUF8GjjbXFd+Pa0Er0M0bH6XEJaUV4F4UdkuuSsJ3hBUpZrYGxr4LMQ4ry8nGUg==', NOW(), TO_TIMESTAMP(1771605792372 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "1wcBV4uOAOTKKA6DkBTYsjGOyLA2"}',
      FALSE, TO_TIMESTAMP(1771605792372 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'gomezgranadosjuanpablo@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771605792372 / 1000), TO_TIMESTAMP(1771605792372 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'ricooo55@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'ricooo55@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$y3MvzyLtVQhH4g==$iJLl6n06TzxrcTOeH58ohzB+q4smK6r1Uz1uGNqa+8+Xdi1dv7iwp6pbGUQQ8Z5fgYKI8iODbdFxv94cufdysA==', NOW(), TO_TIMESTAMP(1774919567151 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "1xfWPfo42lWG5Xi3cvv8qjXQIen1"}',
      FALSE, TO_TIMESTAMP(1774919567151 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'ricooo55@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1774919567151 / 1000), TO_TIMESTAMP(1774919567151 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'marthacde14@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'marthacde14@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$kQSJMb81BEX8pA==$6g1kpuHSo01/scjkA+wnBAjB4SB4Mpyh9eRdRfzIyhcSJ4kFk+TnmYwvydjG0YVwj1awvB9RqOqEKmJ9dm3dsw==', NOW(), TO_TIMESTAMP(1776216058430 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "24MkokLnKHRXTQpOaHvzrc8f1Hy1"}',
      FALSE, TO_TIMESTAMP(1776216058430 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'marthacde14@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776216058430 / 1000), TO_TIMESTAMP(1776216058430 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'isaiasherro@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'isaiasherro@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$BAZFxuya5jJusA==$Uh+AsWos/0Agfua0BVxb5u8Nq8PGxN86ZqM0oSKeibdjRX0aehbK4mCINevR/rB2/rDkxpgp/IPMHoVQYxbGXA==', NOW(), TO_TIMESTAMP(1771602420224 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "26nyxKr31PWGkoMRXXW3DOKKdSP2"}',
      FALSE, TO_TIMESTAMP(1771602420224 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'isaiasherro@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771602420224 / 1000), TO_TIMESTAMP(1771602420224 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'blue_2390@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'blue_2390@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$M1Mnc41k1zydOQ==$qHhbko5Or97fs7Sw594RYUXZUVSW8J9QRtBl0sQy7roF8ygEkBfFqYUHzU4A/Z44lqzyKf7wu7kSDMx/4UZPTQ==', NOW(), TO_TIMESTAMP(1771290123284 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "2810ZfcP1Od2JX0bHybWbeF0xO72"}',
      FALSE, TO_TIMESTAMP(1771290123284 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'blue_2390@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771290123284 / 1000), TO_TIMESTAMP(1771290123284 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'arlo9728@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'arlo9728@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$2y2zoO4y2npBaA==$hGJrq9fUANB7XISQyMT5IuYT+VNL2DCQM6h7FfQ992WUNPZyV8z967/RIDYGSP1TyTWk/ozOrWPhtXIVg75Vog==', NOW(), TO_TIMESTAMP(1771371435188 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "2AXleHp8GZXlOym9c9c6RVONIQg2"}',
      FALSE, TO_TIMESTAMP(1771371261262 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'arlo9728@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771371435188 / 1000), TO_TIMESTAMP(1771371261262 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'tobal19@outlook.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'tobal19@outlook.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$/sPVMvdVfIRZNA==$uNYOR9I3cDI65gvLZCuf6JUg1AgpWEL/KtsCwl3PZnMh7HzxQhtSp1ly/N3Z3M2+uOPG9givHhHFO5t6V4ew7w==', NOW(), TO_TIMESTAMP(1776216833185 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "2H03xDt1NTd7BxU8TDqaEuBEWJ93"}',
      FALSE, TO_TIMESTAMP(1776216833185 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'tobal19@outlook.com')::jsonb,
      'email', TO_TIMESTAMP(1776216833185 / 1000), TO_TIMESTAMP(1776216833185 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'jorgelic21@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'jorgelic21@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$DMawMLpo+mAdjg==$u9BqH8O4qhvFAxnrky02QkQ8SWGzWN42rXOS//+jRmgmhbmgsFHmFIMJQZTxttSiypa2exO2w3xoZnJRTn+J4w==', NOW(), TO_TIMESTAMP(1774114974749 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "2JXBg04zJjhVULU5NtJDXxZ2LhT2"}',
      FALSE, TO_TIMESTAMP(1774114974749 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'jorgelic21@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1774114974749 / 1000), TO_TIMESTAMP(1774114974749 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'yinamontejo98@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'yinamontejo98@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$nNdOdaPnxsnn/w==$fAf+x1PAgKD11sOu8YBc+YKRaROO08MCfXYbQJsY6z0D1g7zqZWaUG57TelFUwPLiZGl24xyLWNdJjRDvPoC/Q==', NOW(), TO_TIMESTAMP(1771289717776 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "2OPJ76tQTnNMoIgkbTb7TmiXhJr1"}',
      FALSE, TO_TIMESTAMP(1771289523924 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'yinamontejo98@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771289717776 / 1000), TO_TIMESTAMP(1771289523924 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'nopalariamx@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'nopalariamx@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$GzcB/zD58GBpfA==$7HyxV6XHqybXwpYA4v3UeYfEaQpzC/Y3BtwXaJn8C9cfcTZcVt94kdg4FEVms2n+cPwpHlp6ItQRb38iS2O2FA==', NOW(), TO_TIMESTAMP(1752423042250 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "2OnhSfIDwWSqOVFweFuTDejtDUr2"}',
      FALSE, TO_TIMESTAMP(1752423042250 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'nopalariamx@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1752423042250 / 1000), TO_TIMESTAMP(1752423042250 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'jorge.delgado.csm@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'jorge.delgado.csm@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$f21zFx+7gdlUKw==$l/+i2/L7z2cBQ8OlixBUKE5L0RMqqdtq/OwdDWcubv8pbKYnQgxfy54UOPQgqjpTRINh+ioJpHNHcZ+qbcpFHA==', NOW(), TO_TIMESTAMP(1751514717833 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "2SZ3njMvkFfezoRmfk1BWNfpcUx2"}',
      FALSE, TO_TIMESTAMP(1751486484038 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'jorge.delgado.csm@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1751514717833 / 1000), TO_TIMESTAMP(1751486484038 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'karivepuerto2002@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'karivepuerto2002@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$7oOw1si0j5QBsg==$BwubYpx4WZhMDLN63UDDIASwC/d962WKA5lwXHzSQXweuv1jCDYmJjsbCTJ04fmZibOHDq0e5Vpw02gSGR9png==', NOW(), TO_TIMESTAMP(1763756447138 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "2UpOeQlaqBZCrYSMem69nlvHRyx2"}',
      FALSE, TO_TIMESTAMP(1763756447138 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'karivepuerto2002@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1763756447138 / 1000), TO_TIMESTAMP(1763756447138 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'abi213357@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'abi213357@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$nHQBNYF+lunfsQ==$VobvEqWsmy+jSpmxk92uPLqct0k5jUhJLmIKnsYCERLYoXj6M9t5UIsHs2MEMmDSFqJOG/Iftp4b+ngCHqLPkQ==', NOW(), TO_TIMESTAMP(1778762365930 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "2WS1XVAVdmhIv1TmMsFMqp3B5B52"}',
      FALSE, TO_TIMESTAMP(1778762365930 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'abi213357@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1778762365930 / 1000), TO_TIMESTAMP(1778762365930 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'rubi30494@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'rubi30494@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$Lm/LVBZcsQmPhw==$1FYL/13y21Zyw9AF97eNTKIZ82RNyOYoB64kqd5WiZKDMTus3OLzvJvtgBeXxRE3wVCufn0yaDAlLYsOrHLaUw==', NOW(), TO_TIMESTAMP(1775321567017 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "2e4wlejV4KR9FOlWr1s1fNYFyfA2"}',
      FALSE, TO_TIMESTAMP(1775321567017 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'rubi30494@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1775321567017 / 1000), TO_TIMESTAMP(1775321567017 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'anaflores9494@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'anaflores9494@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$hv0SAuE4K8wSQw==$WIBq9VvBug4Yh0yRef3P7QQqY6RCJApUI3C3KwNf5vkkWVOyJ1ysPOJRfp2RweemQmlb4Z3SnqPsBmJuRrH8vA==', NOW(), TO_TIMESTAMP(1755292016443 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "2fiwflq6QNaQnAXOwVVJTkVlWhC3"}',
      FALSE, TO_TIMESTAMP(1755292016443 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'anaflores9494@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1755292016443 / 1000), TO_TIMESTAMP(1755292016443 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'caridadcoronel1@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'caridadcoronel1@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$hCzDAMPBozwnjw==$FhY1weONY1ysQiyKGaEY/tOqETWEyv/L3/jXzvJObcfi3p+/Y48SgybVzbVPM/+h6mxQgHu93AOn5KFerSEhgw==', NOW(), TO_TIMESTAMP(1776276850255 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "2ga3c2OqMoYiOLvQSHayBoHeNHY2"}',
      FALSE, TO_TIMESTAMP(1776276850255 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'caridadcoronel1@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776276850255 / 1000), TO_TIMESTAMP(1776276850255 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'marcoantoniosantiago16@gmail.comm') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'marcoantoniosantiago16@gmail.comm', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$n0IKVDVdoN908A==$P9fYnF1whadz/7gi/r0CRFr9La9QDCG6fqLNWLCfNAeSNfQubODLCH5MAlZGRmXaGZ2g37FVMO98KNXvN6ORiQ==', NOW(), TO_TIMESTAMP(1771273533039 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "2jNM6Feoswe4yB6fOt0Lmag6NQr2"}',
      FALSE, TO_TIMESTAMP(1771273145971 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'marcoantoniosantiago16@gmail.comm')::jsonb,
      'email', TO_TIMESTAMP(1771273533039 / 1000), TO_TIMESTAMP(1771273145971 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'mike.vaz@hotmail.es') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'mike.vaz@hotmail.es', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$EvZDMVObbrRwtg==$syWTtTx9jEyEWth5bhNhCWkDxNLRPQOqg09lRIEo4XVO4HjFwKVvJign5t+KqRuPssZzY/GdasuCR4dJXRGlFg==', NOW(), TO_TIMESTAMP(1771799975338 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "2pGkD22tWNfbtqVFfXokJv7fKxr1"}',
      FALSE, TO_TIMESTAMP(1771788176958 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'mike.vaz@hotmail.es')::jsonb,
      'email', TO_TIMESTAMP(1771799975338 / 1000), TO_TIMESTAMP(1771788176958 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'reginovaquer@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'reginovaquer@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$xJkvp0ry40MP5Q==$PxPVXlX9reucvnvZFQ7Sm/btSJlclD0HGjwMLsFYLNxYSEqqGyWvvaHRz2Ty7KOQGxqcgrd5g/LHrPVZbyPVTw==', NOW(), TO_TIMESTAMP(1771946944384 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "2tMEWqbeJIgxEsvlIJVYpzOrF3y2"}',
      FALSE, TO_TIMESTAMP(1771285351211 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'reginovaquer@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771946944384 / 1000), TO_TIMESTAMP(1771285351211 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'adanpuch17@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'adanpuch17@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$F0bABCrY5gMreA==$JJrB8gwRz9LVbzdtprdDTFM889MgiAd07wN72rKAYqQqkd6YSO/WCQiKEn5ozcXiAKd0E4qZtg2PjqGMRPQsug==', NOW(), TO_TIMESTAMP(1772149592560 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "2wNn16dRXJX1sG4GuUUJgWxIt8D2"}',
      FALSE, TO_TIMESTAMP(1772149592560 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'adanpuch17@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772149592560 / 1000), TO_TIMESTAMP(1772149592560 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'raulmartin1998diazlarios@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'raulmartin1998diazlarios@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$+Lm60bztKNQVog==$tAXEd04sB1Txm5aCwnmZhBxkuAlQrQXbT5pAWfqDh26ovpxA2G2JsXQf68U2DqNq9VvzwWcsaX9ai9MeYdBUXA==', NOW(), TO_TIMESTAMP(1771694577421 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "338JaT7MdWXHkk9UUS1klgyGWod2"}',
      FALSE, TO_TIMESTAMP(1771694577421 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'raulmartin1998diazlarios@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771694577421 / 1000), TO_TIMESTAMP(1771694577421 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'alfongj10@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'alfongj10@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$d5Ks4VeER6yL0A==$qd+kYAnke2seBTyBlaF0nY549BWnoegJU9jUe7r4s0JtG7f8vCzuVr78qGPwYtLOGEpnnRRciJmJqO2u+EYIlQ==', NOW(), TO_TIMESTAMP(1772431089879 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "33BW678N0uQx846AOfSzi49QkZi1"}',
      FALSE, TO_TIMESTAMP(1772431089879 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'alfongj10@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772431089879 / 1000), TO_TIMESTAMP(1772431089879 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'sg8413101@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'sg8413101@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$5TQK6XORBaYTWw==$LL+DUvpHKjkT1GUzJi2v8QGiSVq2K8u3F697js47d7pPi9c0lvZ7YVnr4r4A25v9Xij/Mwj+YefaBCNAYrkhrw==', NOW(), TO_TIMESTAMP(1772328119905 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "3AVBDvocckYXhGiUUF93R4Ea3ak2"}',
      FALSE, TO_TIMESTAMP(1772328119905 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'sg8413101@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772328119905 / 1000), TO_TIMESTAMP(1772328119905 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'carmen251020@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'carmen251020@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$0gBuz8taOOejtg==$/feXrJ/HPgK3ROgzSyhbD9OTA0rmGVFcSbAoO1AJkfna8alBJ8WKjdK7ocV3hKGWkscHAG8ovdcCI+FxS3KhKg==', NOW(), TO_TIMESTAMP(1776275489124 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "3BoJwYLGeiezv0JGLUOp4o5YYyr2"}',
      FALSE, TO_TIMESTAMP(1776275489124 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'carmen251020@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776275489124 / 1000), TO_TIMESTAMP(1776275489124 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'aicm650204@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'aicm650204@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$OuP8FfGvdtjQZA==$1CF+6JF2gPR3Wp+25UfapXOeEOnvpW+hkqWjr5lFPsKAdmW+Er5XKzk9RXtxJNta1Yi/3XuuvAzzG7MYZ58D0Q==', NOW(), TO_TIMESTAMP(1763762975679 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "3D2Bxe2MBPeBtVi3STbDvNs39rF2"}',
      FALSE, TO_TIMESTAMP(1761158296320 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'aicm650204@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1763762975679 / 1000), TO_TIMESTAMP(1761158296320 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'felix.castillo10438@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'felix.castillo10438@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$aMzl8p0DoEAZVQ==$GBTqViaxYvDKdbz3ygwBL9GkpVWLh8WkqJTJijZ7fUlknWcBByBy42z7ZcGiNx+hdDzUmeQP/nFrPQQo5CgRdw==', NOW(), TO_TIMESTAMP(1751484440127 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "3DJ9qzHQGPPhK9MIeJgzIzj2g0I2"}',
      FALSE, TO_TIMESTAMP(1751484440127 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'felix.castillo10438@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1751484440127 / 1000), TO_TIMESTAMP(1751484440127 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'dulceacosta841@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'dulceacosta841@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$7/3jegSoT2jezQ==$4ZYs7CVbSayIVsjD87M6YriPlKmyG+R3fVscZ+6zFJhoqnJk0UNQbryhl07Q10vYmHtuTpKFRi64Ket1gi+WGg==', NOW(), TO_TIMESTAMP(1774067735363 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "3HCqwsORiHZ0yFx13HnLHO0OE7i2"}',
      FALSE, TO_TIMESTAMP(1774067735363 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'dulceacosta841@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1774067735363 / 1000), TO_TIMESTAMP(1774067735363 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'pollooo192021@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'pollooo192021@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$3/f2LitDlNST8w==$o4k4qll63AQU1gS57b88Ax2AGRTrOewOTpFeSd5dR1qlTXHlrfyi//mVTpI/HZ735++TPeqAU1AfkOQJD8VVbQ==', NOW(), TO_TIMESTAMP(1777768264123 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "3MzPF1M0iyQsAmzwR7XHKWXbw6t2"}',
      FALSE, TO_TIMESTAMP(1777768264123 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'pollooo192021@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1777768264123 / 1000), TO_TIMESTAMP(1777768264123 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'al7110818@gmal.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'al7110818@gmal.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$w1Ol/zFB/DLFZg==$T6GssH5DTTK2uF1TRQ5jc8dvGTywjWdCdsYDImBqTx4W0tWhkyZJkQb0GzWMNFYkcaBIrWc5tALzBxjBUchVyQ==', NOW(), TO_TIMESTAMP(1776219114025 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "3O8L4bscprTch3VZeTQ3wPQaanH2"}',
      FALSE, TO_TIMESTAMP(1776219114025 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'al7110818@gmal.com')::jsonb,
      'email', TO_TIMESTAMP(1776219114025 / 1000), TO_TIMESTAMP(1776219114025 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'iuqodnahc@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'iuqodnahc@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$vXSIvGoTFnF9zg==$QQNO8idTsazjhSojCLjjCT88lkBzuyeKJHnVo+xoZh5zh/tVTLEBhafJ7GSJBxG9UPiV9FNaTAEPPnCzrqMelQ==', NOW(), TO_TIMESTAMP(1773716823715 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "3Q5b2mMrn5P72zJhS6LbPddRHgq2"}',
      FALSE, TO_TIMESTAMP(1773716425802 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'iuqodnahc@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1773716823715 / 1000), TO_TIMESTAMP(1773716425802 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'salvadorhernandezmartinez1970@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'salvadorhernandezmartinez1970@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$Tq6e7c/WBBQdBw==$xdGb2KV0psjvsLRkSz6PBiQLJ0fwPGMK7ZAwX8nPfKbUwK5UuJNXjrTX5zHKAdFkQmsPgUwuCI8P0W/vJUvbPw==', NOW(), TO_TIMESTAMP(1751484426478 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "3Q6O7DnAO9dc6H2tAV7JamkalhD3"}',
      FALSE, TO_TIMESTAMP(1751484426478 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'salvadorhernandezmartinez1970@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1751484426478 / 1000), TO_TIMESTAMP(1751484426478 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'interialjm@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'interialjm@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$+prQ5Rsu0dCjSg==$98UqjzFR91FAHN20DCC4a7ShGd1mC5p8LV1bEaAL5dfoXV7mdzmevj7Np4nBQppUjWl11oVSQF8nLCe72CEjyg==', NOW(), TO_TIMESTAMP(1751601516377 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "3SuatUXDfMMGg8PH6wjPacBXd712"}',
      FALSE, TO_TIMESTAMP(1751601516377 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'interialjm@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1751601516377 / 1000), TO_TIMESTAMP(1751601516377 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'julioc.valdiviezo@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'julioc.valdiviezo@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$IZVMe+mkKMKM0Q==$UUL1QX4dY0PfIx+AcsrOmlyRMg88BgvNCY33uXVbqhFvxTUZSk7Qr9kaG5vy6S8E+F8fKAK+N5+DBQcM0VGLEw==', NOW(), TO_TIMESTAMP(1771654598886 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "3Yaekab3euOIpX5OYwlPygllzuw1"}',
      FALSE, TO_TIMESTAMP(1771654598886 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'julioc.valdiviezo@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771654598886 / 1000), TO_TIMESTAMP(1771654598886 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'eduahsp@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'eduahsp@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$T63FwhFr7Slwig==$CGK+YHOUFS+pPs+kRxvMNXPDbCeMZFywbGNSqSmCpGakRv0XIKASAK6eq8kWzrwwcrfIq6+gGSyt8VBxH3R76A==', NOW(), TO_TIMESTAMP(1771299606554 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "3gN2bsIXapgEfQ3MDQc2JvZEHr82"}',
      FALSE, TO_TIMESTAMP(1771299606554 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'eduahsp@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771299606554 / 1000), TO_TIMESTAMP(1771299606554 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'jazmingj96@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'jazmingj96@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$zqbeXtKz7hMUwA==$0Lxfmr//pWCmLd7YxwdAf9ch1uSXWpi0rhVxT12Q48HcfAkmsdAnszSQ4+jdbJA0S1X1lh0zu/jDdQBMqqEGpg==', NOW(), TO_TIMESTAMP(1775363873772 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "3iKViNvMSmVs0P6azJdyEhV3ch73"}',
      FALSE, TO_TIMESTAMP(1775363873772 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'jazmingj96@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1775363873772 / 1000), TO_TIMESTAMP(1775363873772 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'zorrosguada@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'zorrosguada@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$m8XD+ILNk8X4RQ==$4dt2EcfDG9C7Bq60Rf1z6RgNEB/WfXJLrFrewQi8UvMtVll54aT/cUWb7SVlvMvjoroYgeZtRIzn2AtQFa/G3g==', NOW(), TO_TIMESTAMP(1778561166979 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "3ivhajZ1QRVlnbpDSpQCCqsCHy32"}',
      FALSE, TO_TIMESTAMP(1778561166979 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'zorrosguada@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1778561166979 / 1000), TO_TIMESTAMP(1778561166979 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'anguloruizmiguel@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'anguloruizmiguel@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$A84S218t4Pglrw==$0K4/0QPT2KIAI5XIKOZhhV0vjI3zcaud0H+si6B+Tt5zn5ofJl08f8sCaKDhXMaFuMpxRU12w5Dh/K2kEEA9jA==', NOW(), TO_TIMESTAMP(1775004350005 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "3k90m9o9AScQmBW4gJO7OLV4LT72"}',
      FALSE, TO_TIMESTAMP(1775004350005 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'anguloruizmiguel@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1775004350005 / 1000), TO_TIMESTAMP(1775004350005 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'alfred08062002@icloud.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'alfred08062002@icloud.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$2q2fHtTizzcLRg==$ypMKT9T7Ja/EIGkKVqecXi3+foX25G35FCGmMyudEgnyJF3Y9GmvOYKXjYMI2+cSvcUexOV+BhJRkrHz93FSCQ==', NOW(), TO_TIMESTAMP(1771281537568 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "3v1EA4GXS1hulRYy8Daver6MJY03"}',
      FALSE, TO_TIMESTAMP(1771281537568 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'alfred08062002@icloud.com')::jsonb,
      'email', TO_TIMESTAMP(1771281537568 / 1000), TO_TIMESTAMP(1771281537568 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'leorag25@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'leorag25@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$BauK2j91K45peA==$fkXrjwRgWQEmlfodVrmSoclWp8U/OVYT5fN6Fa+rXX6Cz3RfmPaD3AYvW9W/9C33QCfH4SqDAOFoDmFI0IXtVw==', NOW(), TO_TIMESTAMP(1772508944799 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "3vtlR39HXEgZzOg4wwiKu3Re89y1"}',
      FALSE, TO_TIMESTAMP(1772508944799 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'leorag25@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772508944799 / 1000), TO_TIMESTAMP(1772508944799 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'isaias170598@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'isaias170598@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$JuXz+xMdjmdVqA==$VREYJj3e0Jd1Xrle+eeQue6kEX1mTOh1F8nb0sqvExpf9NzTgV350xV3I8fy1Pk66jCltDF2r+C0LeCAYeP+DA==', TO_TIMESTAMP(1751395748054 / 1000), TO_TIMESTAMP(1751396149334 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "3wR0WFHGk1MZdp7Jl4juwirNFfO2"}',
      FALSE, TO_TIMESTAMP(1751395748054 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'isaias170598@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1751396149334 / 1000), TO_TIMESTAMP(1751395748054 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'diegols9696@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'diegols9696@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$C2XgllUVv+W44Q==$QEJJhH2JlOPlYoQ+E57hoN3hOCammy/pAPZZYhcvFD13sqac8Oxc+OGgug21flr8V0rjZzKgNJPJYyZuaQtUkQ==', NOW(), TO_TIMESTAMP(1763763244801 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "3yAY2spLIHee0huHamOEwG9nCmR2"}',
      FALSE, TO_TIMESTAMP(1763763244801 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'diegols9696@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1763763244801 / 1000), TO_TIMESTAMP(1763763244801 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'osamayoa5@gmail.como') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'osamayoa5@gmail.como', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$WChLKZ6mS6Bwfg==$+cXHujoPHLV2IxlOaBGpJf/x2muqM4nQikAPtuL3aXjwdwqF/pzrkw3gbjBoVcz+NU37G5tVeAD5NTE66jgawA==', NOW(), TO_TIMESTAMP(1774202535095 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "3yDn4fIdy8grZwPRBR12UCN27d03"}',
      FALSE, TO_TIMESTAMP(1774202535095 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'osamayoa5@gmail.como')::jsonb,
      'email', TO_TIMESTAMP(1774202535095 / 1000), TO_TIMESTAMP(1774202535095 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'anaisabelg105@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'anaisabelg105@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$qaWYSWOmmJEr6w==$t+qMKK90peCPrMJzGHtBtB8OuW91d8R42RNomIWTBgt+TFH8fGIz1wUyWfshmrFYQHKAVfAVrgPfOLCItmcvJA==', NOW(), TO_TIMESTAMP(1778047575696 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "40LFEN47DVN4C187VXYM9G9uP2W2"}',
      FALSE, TO_TIMESTAMP(1771279073089 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'anaisabelg105@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1778047575696 / 1000), TO_TIMESTAMP(1771279073089 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'nayeli27_7@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'nayeli27_7@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$DiPEcIZR4Ofl2g==$ofwgau5Bcdyl41xWQMmuJi+IOB75NWabNA5mNMBV1Y0M0zN4OkYfFzPkExcJBQ4fM8Hh0HtcAMUz9mt01U2UBg==', NOW(), TO_TIMESTAMP(1762885565608 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "48Kwq1Z11RgfggPC1lVI7oDTjVI2"}',
      FALSE, TO_TIMESTAMP(1762885565608 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'nayeli27_7@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1762885565608 / 1000), TO_TIMESTAMP(1762885565608 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'erickhernandez7295@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'erickhernandez7295@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$rA2CNIbYztaxDg==$V2NwBXcsPaaIugMHyscYNsVvnpVkn68p1lNSGS/H4bjn2YuKyN/6p4nyoiorxZhJwQhjtFRLTkRiFnWOVIaz6w==', NOW(), TO_TIMESTAMP(1771282984434 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "49mWacsu3DcoteqQ8Y6k0CowjM63"}',
      FALSE, TO_TIMESTAMP(1771282984434 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'erickhernandez7295@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771282984434 / 1000), TO_TIMESTAMP(1771282984434 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'geliarcos2016@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'geliarcos2016@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$n6dr4VZMpr2UYw==$im5PCAdWkpymTKM74rPIALcOp/1mtta6fAN71fDJpitlXEHHZNSmiCfa3fjTH0Q5UMA3hry91S+pvxNx/KrVig==', NOW(), TO_TIMESTAMP(1773716837550 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "4Do5jbbx3yX62dQwRyCQWFlCuZW2"}',
      FALSE, TO_TIMESTAMP(1773716837550 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'geliarcos2016@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1773716837550 / 1000), TO_TIMESTAMP(1773716837550 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'gramajo_navarromartin@outlook.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'gramajo_navarromartin@outlook.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$X93KpJgJXUbS/g==$3DOLwwZmY/1wpENht7yRaNQUZcI0vzHqLXINdlb7z+rKPltuX1603pnEplCQKiltd64QjDly2N0TKTdxrVxiew==', NOW(), TO_TIMESTAMP(1771286808169 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "4G9JMnh8tyeyuO5sSAZMJCZNWZ83"}',
      FALSE, TO_TIMESTAMP(1771286808169 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'gramajo_navarromartin@outlook.com')::jsonb,
      'email', TO_TIMESTAMP(1771286808169 / 1000), TO_TIMESTAMP(1771286808169 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'hilda.servin@yahoo.com.mx') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'hilda.servin@yahoo.com.mx', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$s/GTzbtkS+EaRg==$GYeWeJgr/aUiU3OJnr0eNp2nvcHZxyqfNitk6mjqnMNsyDJVDZ99bE/UkOQfvr47tiVaQ/QiXJ9/qQxjX3Iu7A==', NOW(), TO_TIMESTAMP(1776451613779 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "4HQ62xy4E3hUH4uYLjscVCJzAoj1"}',
      FALSE, TO_TIMESTAMP(1776451613779 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'hilda.servin@yahoo.com.mx')::jsonb,
      'email', TO_TIMESTAMP(1776451613779 / 1000), TO_TIMESTAMP(1776451613779 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'lopezgonzalezcinthiaberenice@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'lopezgonzalezcinthiaberenice@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$yHxHkXa12ND9/Q==$Be+qTcBUKn7EIO4y/Fgy7jfh4XwLhAQg0RDHDlHke0wegB7rLDy5D2CCVh3CazrOKbFt/XpPTnDWm1j1jzzVOQ==', NOW(), TO_TIMESTAMP(1764519755360 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "4IRTXTnPife0GQxNSdAAcEc3xHz2"}',
      FALSE, TO_TIMESTAMP(1764519755360 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'lopezgonzalezcinthiaberenice@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1764519755360 / 1000), TO_TIMESTAMP(1764519755360 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'jessivaz@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'jessivaz@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$ETBs7Sk9sIv7jQ==$5dqpFa8iUujoRgd3V7/Ay+qfsZa9+ZrDuKuKEEB5CnIw/7ECdB6bYm73rTW36Pjee5PlxxBGRaTPgKjFJ2tBEw==', NOW(), TO_TIMESTAMP(1771272601268 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "4KjFAXEuvSOnnISNV1uDgF4qT5w1"}',
      FALSE, TO_TIMESTAMP(1771272601268 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'jessivaz@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771272601268 / 1000), TO_TIMESTAMP(1771272601268 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'edobalderas388@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'edobalderas388@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$gfKCbpUNt1ywIA==$/te8sxmHElrKg+wszdObo97U5Yv5wMTyq8zieHaKQ4EvQtmTXlYUleagb1kBwlc3+mXdik47CtCB1+/Q0c9KTA==', NOW(), TO_TIMESTAMP(1763338132593 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "4NBQ2ouBzueM76BgkfjGEAGTlYB2"}',
      FALSE, TO_TIMESTAMP(1761736726751 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'edobalderas388@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1763338132593 / 1000), TO_TIMESTAMP(1761736726751 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'karmen14dic@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'karmen14dic@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$peNzas0T1MaBbg==$apLAUrxkORjjgoDoUXog71NtvYDyBeRjI3mxA2xKN0XsKySx545qjY1CfcRacwl1HlSd+dgbgOlyuHz57miTGg==', NOW(), TO_TIMESTAMP(1771417826323 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "4QUWj9v1nZS8VSIDnjxQIWN933R2"}',
      FALSE, TO_TIMESTAMP(1771417826323 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'karmen14dic@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771417826323 / 1000), TO_TIMESTAMP(1771417826323 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'armandotrejo942@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'armandotrejo942@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$6rfOn5yMV9iH8Q==$uCex1jIHWLforh1nCAduM+iZwGqzepaXyxELcy08P3SAFf/Psq2g0CdLHRPr9ylinq56K9xdkpnBtehw/bDAgQ==', NOW(), TO_TIMESTAMP(1776292172689 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "4Sayf4Gvvia3TnHzlHXBxPM5wiB2"}',
      FALSE, TO_TIMESTAMP(1776292172689 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'armandotrejo942@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776292172689 / 1000), TO_TIMESTAMP(1776292172689 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'yahirluna621@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'yahirluna621@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$vpdTp7znHfz96Q==$rNS2NqIDXA+QtVL6QKuKskBStt+iFUwyrVOF59cR8Pvd1cbc8zqOZ9vcGsWZVw+pgbuJ8wsacBZ4tetpVQZn/w==', NOW(), TO_TIMESTAMP(1772153495586 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "4TVH4YAbebajhnDDqB01Qxy5K3j2"}',
      FALSE, TO_TIMESTAMP(1772153495586 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'yahirluna621@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772153495586 / 1000), TO_TIMESTAMP(1772153495586 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'ziuunevez@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'ziuunevez@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$B76m7B2fJ9Y0JA==$mUvy2y38IvJahTuuvLagcdkiAq4yrsUNVxzT5s23lZrWEol+lv8eQg1ZE0uO49XpB7f1ljSdvuoUODzxZv+V+Q==', NOW(), TO_TIMESTAMP(1771273254361 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "4V8nUqegEeYxsyuWVn1OZwYmmWQ2"}',
      FALSE, TO_TIMESTAMP(1771273254361 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'ziuunevez@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771273254361 / 1000), TO_TIMESTAMP(1771273254361 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'montse.ojealtuzar@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'montse.ojealtuzar@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$ZpMTLGnTIxBQlQ==$oBkRqoo8i4qdtjT8q2CHTGUrvRVWf+UOZ3pwUlY+eOb5SMt0PMFCITgjBsYUmbFqcyzWA0oqQlLYDqAvXMt5jA==', NOW(), TO_TIMESTAMP(1776289054931 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "4Wq6vvt11TSUbdS5RGbM6aoKvJL2"}',
      FALSE, TO_TIMESTAMP(1776289054931 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'montse.ojealtuzar@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776289054931 / 1000), TO_TIMESTAMP(1776289054931 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'erick.lopez85@unach.com.mx') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'erick.lopez85@unach.com.mx', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$GVhLosP6qI8KwA==$SOJR33QC6eXrGId+0kPYFdaxAB4zUVJ2W6X92OfB8nvRz/DmnWBEzxqLZIFAtD6BHuWMyfwEXL7Gm4ZRpdZ8Wg==', NOW(), TO_TIMESTAMP(1772919628016 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "4gfHkg9f1WcbTeD0FBV6QqWxozG2"}',
      FALSE, TO_TIMESTAMP(1772919628016 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'erick.lopez85@unach.com.mx')::jsonb,
      'email', TO_TIMESTAMP(1772919628016 / 1000), TO_TIMESTAMP(1772919628016 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'erikrodriguez1946@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'erikrodriguez1946@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$udagB2FtAcfJfA==$UlwYcZlL77Godpjrwn+MRBS308OWgwYmz0ChapgsOzu/FdfHNb2QfNM+1dBAncNqshNrYh1S0JowGZMzLMpggg==', NOW(), TO_TIMESTAMP(1777351648285 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "4hVApsQXiFhIQ0YaoBneOaBcSDV2"}',
      FALSE, TO_TIMESTAMP(1777351648285 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'erikrodriguez1946@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1777351648285 / 1000), TO_TIMESTAMP(1777351648285 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'misael12_gomez@outlook.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'misael12_gomez@outlook.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$shgbBmU0pihrig==$EfLKgIt17xLkswMwc1FyhyodV7HnhOG/BWcgfbt/0OPNUKLtUfYqqGp4Td+maOj+ILsh/DRM/irPv35sr/wpXA==', NOW(), TO_TIMESTAMP(1776665551672 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "4nBUVVZzhXQeIfUqHKkLN74fz1w1"}',
      FALSE, TO_TIMESTAMP(1776665551672 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'misael12_gomez@outlook.com')::jsonb,
      'email', TO_TIMESTAMP(1776665551672 / 1000), TO_TIMESTAMP(1776665551672 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'martinnafate27@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'martinnafate27@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$ATAIlWvubNAKSA==$IZzKuO6l+BIk527Qhv/268cHvN0UHtNM6z1/+cyNSo0U5WRtRsUO2oj6lETsp2keBjEjDsQh9JAGR6QQGBKUMg==', NOW(), TO_TIMESTAMP(1772326857065 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "4oa5kw7jWsU7gIB40ZqAbHnQ2Ga2"}',
      FALSE, TO_TIMESTAMP(1772326857065 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'martinnafate27@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772326857065 / 1000), TO_TIMESTAMP(1772326857065 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'ortajarex@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'ortajarex@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$4/aP/2NDqq+pqw==$FQ040qrBrR0Ih4LNfcmfQiVgrf5mw5xrAQ56FfwoAeFz8SsvVKwmCpax9TdhfGnYlsJRc9tZTWj3JPHs72XzHw==', NOW(), TO_TIMESTAMP(1751475223382 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "4oguqtJe4MP1bW8RZeBOporMVlB2"}',
      FALSE, TO_TIMESTAMP(1751474052374 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'ortajarex@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1751475223382 / 1000), TO_TIMESTAMP(1751474052374 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'dinaduartemartinez@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'dinaduartemartinez@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$d2BK1Kzd8bFtNA==$GK2VQGywJmfkw9ihk03+xI+oDUksm/kH21Rako48TdTZq7nBzbBJqOirAgpysbJpNGjstJdpWaarOrED3LXh9g==', NOW(), TO_TIMESTAMP(1752783928712 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "4vMsNlDcTCWsolImfkH7KuAXeF63"}',
      FALSE, TO_TIMESTAMP(1752783928712 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'dinaduartemartinez@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1752783928712 / 1000), TO_TIMESTAMP(1752783928712 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'y_270181@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'y_270181@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$viK+pW3m8Yqg9g==$woi7bVES3kujfrTlnNPuCAZ6DELJo4stJJfbqp9bnV4pLJUPEo75PzQc91qUAsChGcH2VZFcDb0SUPIU8cmJGQ==', NOW(), TO_TIMESTAMP(1773542924780 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "4yKmuXEN02XdiWr15c0fiICKkfY2"}',
      FALSE, TO_TIMESTAMP(1773542924780 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'y_270181@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1773542924780 / 1000), TO_TIMESTAMP(1773542924780 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'ancheitamaria3@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'ancheitamaria3@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$BxiTyg5DIN6NiQ==$zT9LuQ7m9oKGtDg/8yrUPZ3V4pLtC+lKgEKfmbo/fuZ4262s5QTRkAXoZ/V8tJlUe3hc2anU27Nv+GvnMMkPuA==', NOW(), TO_TIMESTAMP(1772166634458 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "4znuoDxnkPMqV6slaLy1W0Dk96D2"}',
      FALSE, TO_TIMESTAMP(1772166634458 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'ancheitamaria3@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772166634458 / 1000), TO_TIMESTAMP(1772166634458 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'ryan.gnar@yahoo.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'ryan.gnar@yahoo.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$vfB8VUGEswlgwQ==$uh9LtYAhB52N/DONHnpXoyCWSUXeyl1+Qee+OOCzouthfFFR+fSecdRC3zjg+zgnsX8hY/WSaOjlLVT292gzoA==', NOW(), TO_TIMESTAMP(1766508761199 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "521iqA2FEwedFkKZ5lI32giIyEc2"}',
      FALSE, TO_TIMESTAMP(1766508761199 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'ryan.gnar@yahoo.com')::jsonb,
      'email', TO_TIMESTAMP(1766508761199 / 1000), TO_TIMESTAMP(1766508761199 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'betopriego333@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'betopriego333@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$pPvp+/l3PaYQ9A==$s3fbjkQN0d7ZbzkNEQJjRIggKdDKbLgUO6zKioJ+EBd9yo5jOXSWgZBxb5iWyXGFKNLoyDdefqeEsc/N/S8gMQ==', NOW(), TO_TIMESTAMP(1771279126327 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "52DGI8nq50htgNDY4z89S3R0kH43"}',
      FALSE, TO_TIMESTAMP(1771279011944 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'betopriego333@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771279126327 / 1000), TO_TIMESTAMP(1771279011944 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'edgarruiz669@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'edgarruiz669@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$FrQo7rKYwYaG1g==$T/JvP7Qm20geUaaZRSGseTFTHcGHlmWmVJG18+vnbZ5eeCr3fJHE2Q63ZWWjMD3Bii1eeXwgWGwUIHoNPbkuQQ==', NOW(), TO_TIMESTAMP(1776703251035 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "53A0koTlfDfGrL2VDMHP3cqsIxz1"}',
      FALSE, TO_TIMESTAMP(1776703251035 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'edgarruiz669@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776703251035 / 1000), TO_TIMESTAMP(1776703251035 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'juanchevylopez@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'juanchevylopez@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$WvUEACjvckNKwQ==$6rcwtisBqdk+pk1o+2NcAN/4D29N8o5rn5qcfbjs/8T6LhK76wiFUWeBQ2i5A/z6/aPyqne8grypN84nifQiiQ==', NOW(), TO_TIMESTAMP(1771646095369 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "58Z6In0zs2ZshZYsFQipPygE3q62"}',
      FALSE, TO_TIMESTAMP(1771646095369 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'juanchevylopez@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771646095369 / 1000), TO_TIMESTAMP(1771646095369 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'titanfal355@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'titanfal355@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$k+MkcTi2l1/etw==$blI2CBx3F/DBisi4Ra7Yg0QL1BjDvIWdRgMOzklZtP9LUxaNuX6OshTQpM77qrJrrQ99tS0pihX6f/cbzwpfVw==', NOW(), TO_TIMESTAMP(1772173288721 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "59q5xob83WUAVZKKquVmw1d1eij1"}',
      FALSE, TO_TIMESTAMP(1772173288721 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'titanfal355@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772173288721 / 1000), TO_TIMESTAMP(1772173288721 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'rubih8210@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'rubih8210@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$TXoAxxLca/NHrA==$yrGCPQBzWs5zTWxSavCabZ9+UJSkmncELfx+agafjYp439LGhvuNubczsKq7R7PTu6LxOgX25IAu1rs8+GHjkA==', NOW(), TO_TIMESTAMP(1771274195215 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "5AWf5uY34VMucy9T1gf748U0lGt2"}',
      FALSE, TO_TIMESTAMP(1771274195215 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'rubih8210@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771274195215 / 1000), TO_TIMESTAMP(1771274195215 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'yaderialonsoramirez@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'yaderialonsoramirez@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$MnCWnn6Wh7HZyA==$Jx+oYfdWRtyymy4l/HckYlaymEFFV99X7v7LyJKRTual130hOiSvLQRtGauNxjAyAT3LDUdnhN3PjnRNWItTqA==', NOW(), TO_TIMESTAMP(1771361589064 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "5BFBh7SmxZTGWrA3rhowNiyHUS62"}',
      FALSE, TO_TIMESTAMP(1771361589064 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'yaderialonsoramirez@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771361589064 / 1000), TO_TIMESTAMP(1771361589064 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'rnangaa@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'rnangaa@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$6WHU5JyzMDTDgw==$NOCLfFPHB8y93QMfeqvxO9jTeoIUX080sqLt+7E6Lm9Eq+Oe0DlVZ5koczJaqFIezEBuuECPmPY6Jx64TW6Miw==', NOW(), TO_TIMESTAMP(1772143622826 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "5DNGVf7KNwUMSFE6VN6KeBoWWYi1"}',
      FALSE, TO_TIMESTAMP(1772143622826 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'rnangaa@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772143622826 / 1000), TO_TIMESTAMP(1772143622826 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'mercegonzalez.1993@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'mercegonzalez.1993@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$TX2UzFJG0WqrEg==$iTI1K/oBe4dDuAb8G7Q1VqyUunr4rCApTsLlPQyowF/lYzZrl6zyErU+4W0bSbzYhWKtklav1iANHeQcVMba3Q==', NOW(), TO_TIMESTAMP(1772115805556 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "5HgD4MefyzV8qEpPkjurEb5BNo72"}',
      FALSE, TO_TIMESTAMP(1772115805556 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'mercegonzalez.1993@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772115805556 / 1000), TO_TIMESTAMP(1772115805556 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'minaso0215@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'minaso0215@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$IEjcJ1oA+kLIfw==$IBJa1iaBYDgfuSBcBAk3H8fhR1AGyjrzm838+kPZpQZnnqJcUIgsivo4yX1/BQDVB+bqAOKzW47zrysl9g5wtQ==', NOW(), TO_TIMESTAMP(1776221208466 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "5LhCPKgsonasbtGpgX1bgLMMaFQ2"}',
      FALSE, TO_TIMESTAMP(1776221208466 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'minaso0215@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776221208466 / 1000), TO_TIMESTAMP(1776221208466 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'lucideysi22@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'lucideysi22@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$ZKNCow+WFBT+sA==$z1T33/79Mm+SpO+VmYFkL0v/hQAhHwtct9rZqwsW2NW6ho/GoPH9t3EsTQoax6jb6pFSbF0gf5qGthkad7rtog==', NOW(), TO_TIMESTAMP(1771435302288 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "5P9LJ1nnjoZjF9o6QhE3AaCqpRz1"}',
      FALSE, TO_TIMESTAMP(1771435166830 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'lucideysi22@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771435302288 / 1000), TO_TIMESTAMP(1771435166830 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'chema.a.mendez.3@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'chema.a.mendez.3@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$EfYdaSvvYDidlg==$Tp4RgX/ECEIO7q5b1cyJ+37QOX1JYtwZ633BzaUgBKHXCLrQVowwGhAq/KbM4dagbRW0JZbu/5tHgJ8+9siELg==', NOW(), TO_TIMESTAMP(1771436557563 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "5PmuhtBaSjVorJMh5MgFymsvpWC3"}',
      FALSE, TO_TIMESTAMP(1771436557563 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'chema.a.mendez.3@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771436557563 / 1000), TO_TIMESTAMP(1771436557563 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'marco.gutierrez05@unach.mx') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'marco.gutierrez05@unach.mx', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$Vq1Pr1cUnn53Xg==$hZGCGeowjp6KpnHkgonSnENN8wZ9FlMHbP16HA/fjcnydsDc0wbzuyZziCeV4YhzAlqjnhklKoDq/0dEWrPmlA==', NOW(), TO_TIMESTAMP(1771294921046 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "5YsRY8iSJmh2P5sbcEIGJBqOsWw1"}',
      FALSE, TO_TIMESTAMP(1771294921046 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'marco.gutierrez05@unach.mx')::jsonb,
      'email', TO_TIMESTAMP(1771294921046 / 1000), TO_TIMESTAMP(1771294921046 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'alejandrovazquez2432@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'alejandrovazquez2432@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$xhZrrhB3TFkXSQ==$Y9V879vfahW572XnB8OBo+oeXkpt7PEqnc6SWdDyXIZrI3I7UzZDJ1SutAdUuKlNW4giJGcsC9M+B+lYS8xi+Q==', NOW(), TO_TIMESTAMP(1774309983063 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "5ZHlvCUSngbRzxXMaffjXLHcUtE2"}',
      FALSE, TO_TIMESTAMP(1774309688298 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'alejandrovazquez2432@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1774309983063 / 1000), TO_TIMESTAMP(1774309688298 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'yesmendez2255@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'yesmendez2255@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$NEJPgRMHGkkLhQ==$5zJ37kc0HarSIbtmT8rJU4hGa8rO38howTtRbr8W0S6DV75Y+k1T0WOkznCoSik5SsRzccec2gQpnxyRlXaLLQ==', NOW(), TO_TIMESTAMP(1776218231222 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "5c37Og07gyWtD36OJPYLAmb608r1"}',
      FALSE, TO_TIMESTAMP(1776218231222 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'yesmendez2255@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776218231222 / 1000), TO_TIMESTAMP(1776218231222 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'genaronarvaez46@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'genaronarvaez46@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$AqqmdGDQcrJX6g==$VJXXPXva3VXVDdhAIlrmC7tpX9E7hwjqO8OWIY4qDWUT/mHeo6fWS9BuzHdlHdGsGq8IjLMyM8ITu2icqqbgHw==', NOW(), TO_TIMESTAMP(1771298231889 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "5dq6NWZAqTdrhfaUaOpZhA0dCop1"}',
      FALSE, TO_TIMESTAMP(1771298231889 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'genaronarvaez46@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771298231889 / 1000), TO_TIMESTAMP(1771298231889 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'salvadormtz779@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'salvadormtz779@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$+iKENxxn034T4g==$QLwY1w/WPl6hFvs0BMSjDst4E5uJ5kTv2qg9KZZKLHFH9vI2sNsnoMYvhDo0um/fUrhT5lhAU+Rd9N2gwpNinw==', NOW(), TO_TIMESTAMP(1753397689283 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "5m2q3U8lQYeE1xT3iQ1nASlZtaB2"}',
      FALSE, TO_TIMESTAMP(1751424780999 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'salvadormtz779@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1753397689283 / 1000), TO_TIMESTAMP(1751424780999 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'vanegmz2605@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'vanegmz2605@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$ghmSZ4JyhwrZZQ==$CDsV5UG16d5z+hRh7B8LyliSoeudB/tKGBzlqYjSS06Ze5+bmT1mGX4aj2jESq2InFKLonYaYJBr36h45mjFsA==', NOW(), TO_TIMESTAMP(1776223443898 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "5npqdT8NUCaM7CCwOZaG5b9wuT92"}',
      FALSE, TO_TIMESTAMP(1776223443898 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'vanegmz2605@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776223443898 / 1000), TO_TIMESTAMP(1776223443898 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'edyh77960@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'edyh77960@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$nKyJR9cZem7gTA==$YBtNDU8esamgjD9nauTKuaNqoHqrrT2aeQ2aoLPlqMarCPY88FZNgGxpqJJWqgGceCjWpqcwUhxolOyOMlAGYQ==', NOW(), TO_TIMESTAMP(1771298282495 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "5uYQw0YuCBajtJqDCdiNjylsn3x2"}',
      FALSE, TO_TIMESTAMP(1771298282495 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'edyh77960@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771298282495 / 1000), TO_TIMESTAMP(1771298282495 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'jenriqueeperez@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'jenriqueeperez@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$xcYKKK7SCVKahw==$yD/XU8zeJw8RiFa9lXjO6G0+aVNBxFyC7FVry+IhOXaPXCXc5jtni/QOhjE71jZ+yLluTSV7lLnjeSenjjKe1A==', NOW(), TO_TIMESTAMP(1753071245590 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "60p3sXZRNxaCVdXV16fsJpHOjav1"}',
      FALSE, TO_TIMESTAMP(1753071245590 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'jenriqueeperez@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1753071245590 / 1000), TO_TIMESTAMP(1753071245590 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'gomezmagaly86520@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'gomezmagaly86520@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$N01v7dNb5NKEBQ==$slA5lM44TYLqq6FpVRB7yEvk0dwWTg8LgVUCDv2Z8pPr2tAcXwM3r8KN7r5E7z4ljKN9oa08sn6q8ySanoqlzQ==', NOW(), TO_TIMESTAMP(1771284693342 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "64nkEpbarlUR251O3wlu1tZRZPI3"}',
      FALSE, TO_TIMESTAMP(1771284693342 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'gomezmagaly86520@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771284693342 / 1000), TO_TIMESTAMP(1771284693342 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'perezcruzmarthaleticia1@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'perezcruzmarthaleticia1@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$vtitJ+4i2k7puQ==$f4333IOcnbxF1ACDR+7v94DV+8rU5+m2vkEmE5/bY912YkvqVVneIPhrfknIRfp23H3lsA9Qy5D9wBqZ8B/auw==', NOW(), TO_TIMESTAMP(1771301523563 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "64uLql2AMEc0uiBJRW5EgqD8k9w2"}',
      FALSE, TO_TIMESTAMP(1771301523563 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'perezcruzmarthaleticia1@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771301523563 / 1000), TO_TIMESTAMP(1771301523563 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'guillenalma@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'guillenalma@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$kSKvja227mhTOA==$EYbm+wXqUd3Rl/oTK+bURsogFxGmlAdJk0gW7jZlzcfbS/kQeOfxHTOFdhHPa7NGc4BJXpAhzvbsUyHoczX8Uw==', NOW(), TO_TIMESTAMP(1768893494709 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "65HKGzOKLyftug84zGwSNJGQK293"}',
      FALSE, TO_TIMESTAMP(1768893494709 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'guillenalma@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1768893494709 / 1000), TO_TIMESTAMP(1768893494709 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'ng90ml31@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'ng90ml31@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$Nk8FCD2OMomKFA==$N7PVe4VP+lKQ3RARjrX8KurG1BahaepQZcECcUbbdNB3bVW6Vmi1jU8WZiNAUiPtQB9JEN4wc/X1LWvJqq3VlQ==', NOW(), TO_TIMESTAMP(1779488028802 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "68DJhtr0K1SwP1pPh2SuR36yi4G3"}',
      FALSE, TO_TIMESTAMP(1779488028802 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'ng90ml31@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1779488028802 / 1000), TO_TIMESTAMP(1779488028802 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'bueresarahi@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'bueresarahi@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$xWgU0CqzUj6jyA==$Ei9XqHuT8m26Bn/ydtWQi6MkD0WGEtZXHUXDcOgH00WSsHPNjEIkZPmYd9i12MqxXfcZkm62igj3CJlUTRlcvw==', NOW(), TO_TIMESTAMP(1771550219357 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "69zoOLnqlUe7R8u2BO1nWskChjb2"}',
      FALSE, TO_TIMESTAMP(1771550219357 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'bueresarahi@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771550219357 / 1000), TO_TIMESTAMP(1771550219357 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'giss13jp@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'giss13jp@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$OqtSq97DmjvOhw==$K+OiG/fAOsKukuWcIDkY/2NGzfgo4tgkpl26zkV1Wo5T5vJ0f+kDclOUOQnh1+OoYUi6sE10SYbioszQZdi21g==', NOW(), TO_TIMESTAMP(1771801302960 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "6AIZ3ITra1bENqjyaDX31ThZYA42"}',
      FALSE, TO_TIMESTAMP(1771801302960 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'giss13jp@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771801302960 / 1000), TO_TIMESTAMP(1771801302960 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'julymary190909@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'julymary190909@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$NK7A7HGWLibUsw==$C/xC0qu6jGk5YrTHTeLCJu79PTHkBCcAOVKbN3mp/gORJzl6RmSrXwPoyLcc7XijQ8Kh6KThI1pMHre4Zm9BWQ==', NOW(), TO_TIMESTAMP(1771721549238 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "6AWU1xIJAIWLrznwFIFUqqJdQmK2"}',
      FALSE, TO_TIMESTAMP(1771721368205 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'julymary190909@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771721549238 / 1000), TO_TIMESTAMP(1771721368205 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'diazperezevodio@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'diazperezevodio@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$kTY8G1Wajcg4JA==$3IBavHWrEuLB1+WdZGgiFM1Vp7nyhtUZUb+xxSOHwGDMZaPBVmYbIjhh8AYSMRMgJfTKSH+IUcT9JMpzfmHqWQ==', NOW(), TO_TIMESTAMP(1776214844246 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "6ICZCRE6UdMnpG61meDnXkbpSWx1"}',
      FALSE, TO_TIMESTAMP(1776214844246 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'diazperezevodio@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776214844246 / 1000), TO_TIMESTAMP(1776214844246 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'noegh9@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'noegh9@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$d/JKJR+SAjFbdg==$bqB5NC0Kr8cZzYNaVTAZsxzjBzx3tcpXBbTNNim4mEXP0AS7ESjG21PDG+R8Wam2c/lEeNu5aLQFOSqCPoH09g==', NOW(), TO_TIMESTAMP(1771276640144 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "6IqXCbshlyOW3DHtpr4ztpbQBk42"}',
      FALSE, TO_TIMESTAMP(1771276640144 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'noegh9@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771276640144 / 1000), TO_TIMESTAMP(1771276640144 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'lic.velascomorales@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'lic.velascomorales@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$2R1pVxKwrG1MJQ==$50bg+wtEX3usDZHaO1fFFjkqWQrMhzSFnO+MjCiUFwg8vinfNLJAc0h+eT8ZMezwKGKfwR3d2Ad56w6+M4XZmQ==', NOW(), TO_TIMESTAMP(1771278310683 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "6Rr8JIiAR7U6eYYOzzaZYYYN8cm1"}',
      FALSE, TO_TIMESTAMP(1771278310683 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'lic.velascomorales@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771278310683 / 1000), TO_TIMESTAMP(1771278310683 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'ert@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'ert@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$3By3/r2k/ur3/A==$lziYukmfxInGu/eHwaycFhO9oFGP69usluv8VrKEBhcLKn1tByFusKsdqdy+GT2KLdYWrWdy1MKYzdrT3fZw0A==', NOW(), TO_TIMESTAMP(1775000341525 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "6SDbq5uRPBUyh7v3wZPOtqulrBm1"}',
      FALSE, TO_TIMESTAMP(1775000341525 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'ert@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1775000341525 / 1000), TO_TIMESTAMP(1775000341525 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'rlievanocancino804@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'rlievanocancino804@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$ZkPTruzJUve9GA==$a3StE4Bhv+3YBMIFrbwSYpNwjYUxvxKiLeUYIW7eT+k1h8B8vjcXu9ACRsqBIeKbVZCQi1k31U9/+u5cIgmKxw==', NOW(), TO_TIMESTAMP(1779058598319 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "6T5dlbbewMa9WlM9HA57cscEnWx2"}',
      FALSE, TO_TIMESTAMP(1779058429883 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'rlievanocancino804@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1779058598319 / 1000), TO_TIMESTAMP(1779058429883 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'ever.escobarv@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'ever.escobarv@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$ZxzlNpGDJrRLCA==$/2eXzQmCYDv4fmPGzou/95C0iU7c9x5anf7gfDVAC217pvqgleyDy9UCh4hkGUtefpiTm74YlyyaYxD3RZCLVA==', NOW(), TO_TIMESTAMP(1771292827245 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "6TGbpuwMarb7xJE0ZoDvO4xrjBx1"}',
      FALSE, TO_TIMESTAMP(1771292827245 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'ever.escobarv@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771292827245 / 1000), TO_TIMESTAMP(1771292827245 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'jaqfani0795@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'jaqfani0795@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$koFSfFS2cLbW3Q==$2nCr1iM8Tf4buRO06stE2LBwIBWdV974awFbxqenMLdkDjqXBZ66JdHi0WM07unUyBfo/gT4yYTm+cWxkj+X6g==', NOW(), TO_TIMESTAMP(1773793430526 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "6UnMliJZINQlvJIfO3oL1hIcBOt2"}',
      FALSE, TO_TIMESTAMP(1773792788477 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'jaqfani0795@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1773793430526 / 1000), TO_TIMESTAMP(1773792788477 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'menlopgg@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'menlopgg@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$42pb9fnlyw2m+Q==$5uKND83ktfbdRh1neW/Hmj92Qo3z4wsDA5cTYG2NNUWR+nFGcn1xz2zVqirXLfUapj7uLRaV9MqbnCBrLo63Vg==', NOW(), TO_TIMESTAMP(1774655751724 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "6b5H1l1QbFSiXBF0F5KBS3wbrnj1"}',
      FALSE, TO_TIMESTAMP(1774655296938 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'menlopgg@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1774655751724 / 1000), TO_TIMESTAMP(1774655296938 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'gomeznoemi905@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'gomeznoemi905@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$3VirmpZ1w0LzoQ==$3gjloWLQf10pnArQQ6+c+lG68vWKxCpPBSLNp5UYhWnq7KdHQTTkoszbQyA1dwg0U9ewLj9NPzmEJAlpLdKFKg==', NOW(), TO_TIMESTAMP(1776275814925 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "6efxFtG6yGOleJCeGVdJz2Crfx82"}',
      FALSE, TO_TIMESTAMP(1776275814925 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'gomeznoemi905@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776275814925 / 1000), TO_TIMESTAMP(1776275814925 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'monserratrodriguez010601@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'monserratrodriguez010601@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$Bq4DHmhv024wog==$d76jc8Wker/hvuPRO+2lLPNEwVa8yBWyq2XlUx6SeuRaKRANWRFE2Pn6vJtN0tdQP/fVbbwLRB1WuIV2qeCNdg==', NOW(), TO_TIMESTAMP(1751627640347 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "6mseoG1gBaWyUUb63asi7XQCp7N2"}',
      FALSE, TO_TIMESTAMP(1751627640347 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'monserratrodriguez010601@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1751627640347 / 1000), TO_TIMESTAMP(1751627640347 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'irasemaroblero881@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'irasemaroblero881@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$gicTFdK5eyBgVA==$/ns3ee0RAG41Ef0dd+ig9hJvOvO99+fcAScqZ2SZEWLglqq5gieJSqfh7Z0OLqy9mzF0O1fRjpU2SQMZYSXVWA==', NOW(), TO_TIMESTAMP(1774067859573 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "6oK3o0ApfLNgj7bvpa58NdRLUbF3"}',
      FALSE, TO_TIMESTAMP(1774067162738 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'irasemaroblero881@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1774067859573 / 1000), TO_TIMESTAMP(1774067162738 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'vane14hm@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'vane14hm@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$S2UDTRsAU1cSWA==$fXXfi43einMJgJNDGQE8Sc+ZiYE9L1CowYxj6kt03SI/9946+6/h3+FfwM8caFymQU7OvQMmJjcQlW9SmJMXCQ==', NOW(), TO_TIMESTAMP(1776278539985 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "6psB7PgWaHghAzw3RZBVBovelYh2"}',
      FALSE, TO_TIMESTAMP(1776278539985 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'vane14hm@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776278539985 / 1000), TO_TIMESTAMP(1776278539985 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'merce04891mer@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'merce04891mer@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$8ub1+Bk595Nkpw==$zy57/OdJTxNmsKi4SREfpXHpPHupfxc+lD84H6t50mXNps5IbTGJbgHwc/dzg95oTUh1KqDD07kcVa+N9C3qGQ==', NOW(), TO_TIMESTAMP(1776226954368 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "6qX5C0SC9LfAx6IMoeoxG2hNYXw2"}',
      FALSE, TO_TIMESTAMP(1776226954368 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'merce04891mer@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776226954368 / 1000), TO_TIMESTAMP(1776226954368 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'cancer_aggc@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'cancer_aggc@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$9ewEGHPnOX6ZkQ==$l7A/Zy6I6lksVqlasgHPtWQ0rk/pNuuJuQc+VBr6p0BqOT0TWtKOj798/WKtcPFAH/p/rlTA6raj3dlRls6ANA==', NOW(), TO_TIMESTAMP(1776214991122 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "6rdeBmwt4JSn81KYKGJIGT7tEvD3"}',
      FALSE, TO_TIMESTAMP(1776214991122 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'cancer_aggc@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776214991122 / 1000), TO_TIMESTAMP(1776214991122 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'silviazlievanocordero@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'silviazlievanocordero@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$GgO00lEMGeKKxw==$uAZ99VjHqXTFntZdmTDhPFZ1lIxxPmEffTIfsdL0QQ1KFYlu8NMlv3fbU79HZBrFjLoEPjyb7pEBEvxowzZcrQ==', NOW(), TO_TIMESTAMP(1776222933598 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "6rycSsGyfPMq22syt3sMej7mnoP2"}',
      FALSE, TO_TIMESTAMP(1774320217217 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'silviazlievanocordero@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776222933598 / 1000), TO_TIMESTAMP(1774320217217 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'meerce98@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'meerce98@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$YpC/wdbjhQv+wA==$RH+WWcqPIWv+15h8tgotOs4f6Am0We0tzAsFaJRCiBr0HXYX3rHoDnWLPAddhh3J6j+8FI55TyXKTOkObofLLA==', NOW(), TO_TIMESTAMP(1775183405710 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "70aIC0kogfhWgiM2u7utfL3hlXC2"}',
      FALSE, TO_TIMESTAMP(1775183405710 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'meerce98@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1775183405710 / 1000), TO_TIMESTAMP(1775183405710 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'teresa.garza@insertec.biz') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'teresa.garza@insertec.biz', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$ecfE++hEDoWVyA==$wntYd0loWdPBmnTEh/5DDDdjjGwPVjtco9DuBmTtFx60AkHIDB0BSxPVOwucdAFGKstWRDWKOGnwoOlXvcbF8g==', NOW(), TO_TIMESTAMP(1775504805742 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "7AHMiKk0GrchfmpWIy4JMmyZBPi2"}',
      FALSE, TO_TIMESTAMP(1775504805742 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'teresa.garza@insertec.biz')::jsonb,
      'email', TO_TIMESTAMP(1775504805742 / 1000), TO_TIMESTAMP(1775504805742 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'guillermoceronam85@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'guillermoceronam85@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$nC9mXlYyM8zqBg==$z2dkAi4+oUpj1DWquGxFXX1hkZsRIei3rHUpqwIdEvIT7l7g3ooxkzyCEFhjhR2A7Tuq9BiMAXRx3JSCveXHKQ==', NOW(), TO_TIMESTAMP(1751468722887 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "7JXmR9KzrfbekFHf3tJ8xuM4ypn1"}',
      FALSE, TO_TIMESTAMP(1750823401714 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'guillermoceronam85@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1751468722887 / 1000), TO_TIMESTAMP(1750823401714 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'camd444444@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'camd444444@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$8tuUW6VMsACQdg==$1R/Gnh15aablq1ciJ7ZHR9CzEtjQSCxE2+x1UE3mzif39LhSIe9A7AcJs+9mr6TPb6Lp2VrcnXqryRi3cHz/dw==', NOW(), TO_TIMESTAMP(1776220970566 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "7JgZHRhcNEakxgDSQwZknTE4VYq2"}',
      FALSE, TO_TIMESTAMP(1776220970566 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'camd444444@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776220970566 / 1000), TO_TIMESTAMP(1776220970566 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'lic.albertokin@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'lic.albertokin@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$InvFIQIDckFvTg==$dFwg/3bGZON3zrHQf34piRyFl5OG9qHre7GuRk8TEjBRpZGz71/jO+cjclUKTiRPMm5Iyq7lnQm7YJRmSRD4yA==', NOW(), TO_TIMESTAMP(1773673187837 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "7VJ2s7z5FZfsOpow3bZKFourbMl2"}',
      FALSE, TO_TIMESTAMP(1773648203772 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'lic.albertokin@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1773673187837 / 1000), TO_TIMESTAMP(1773648203772 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'edithgo107@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'edithgo107@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$k/cBEDXi35aQtQ==$4q1Z5gWEko6OX1Ae6egkHWIAX2lCzKyGvWKuqMm24epQEQvSEh+GC/EavWBaE6syfX0vwseZ2gXvkLQtAlW0CQ==', NOW(), TO_TIMESTAMP(1778906932021 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "7bB0fAMxewXZr1IlvDcaLGLc3h72"}',
      FALSE, TO_TIMESTAMP(1778906932021 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'edithgo107@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1778906932021 / 1000), TO_TIMESTAMP(1778906932021 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'serranopapas123@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'serranopapas123@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$ftx07PYewA6jEA==$L8uggAIZjvShDSjC2RGyaTxmDJ7oDMnDtEl3FanPsUT688Bc8G5I9SxZoX7EvFjmQfPtFMvNTPr06z15kOpCNw==', NOW(), TO_TIMESTAMP(1776880261463 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "7cf7AmT340VaICuHMFuBhbPQXqt2"}',
      FALSE, TO_TIMESTAMP(1776880261463 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'serranopapas123@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776880261463 / 1000), TO_TIMESTAMP(1776880261463 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'rha.chiapas@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'rha.chiapas@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$EN5pWFJtz85tKw==$yEfCy0JtnXDnezxLIS2ZGDd8Gm4H+HYcWVcfTvYb0ow7WLV8WOhFlhAtzSQ0ApB5zblgGexeKPjeW0ijK+7GHw==', NOW(), TO_TIMESTAMP(1772323094011 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "7hei3qgmA8feVg3Ba4oUFZvCPGH3"}',
      FALSE, TO_TIMESTAMP(1772323094011 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'rha.chiapas@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772323094011 / 1000), TO_TIMESTAMP(1772323094011 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'benja_hd@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'benja_hd@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$J7fAjFpEFg3NtA==$h4nl8vkJf7JyPmR6ZiCXwzdpi5g3Lz+sbULE4lHVVIPO9pYz3bc3Jg6Fgh7LdrvMZx/4Kb5LxYhSr4rzWKoV/g==', NOW(), TO_TIMESTAMP(1774840293597 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "7jmLhosrjuPHH7pdfnEnESx3r2b2"}',
      FALSE, TO_TIMESTAMP(1774840293597 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'benja_hd@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1774840293597 / 1000), TO_TIMESTAMP(1774840293597 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'temichrocio596@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'temichrocio596@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$3FY6ZysC2L6n8w==$cY8R27RzSEtJU3U5bl5HE9v9ql41c1B3NVVdEp8K1fZBrz+W0QXA0pGQ4SEiFRUeUd0pAbbLXE7iMieo86egNA==', NOW(), TO_TIMESTAMP(1771301720215 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "7kHwffKZ6pNdcCGv3JSJajf3Gop2"}',
      FALSE, TO_TIMESTAMP(1771301401516 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'temichrocio596@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771301720215 / 1000), TO_TIMESTAMP(1771301401516 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'ksalome21@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'ksalome21@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$b1l3qDCuXvE4+Q==$qKvumw4svNESV2GgAgnlXFao080f1tsbgbpffTWlPN9sh+CCKcJHPuH0zYcKSOTyqEZdwZR/v95KmendBNbSPg==', NOW(), TO_TIMESTAMP(1772244174128 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "7lMt1FTkknY7DitJviD0PIQlkGe2"}',
      FALSE, TO_TIMESTAMP(1772244174128 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'ksalome21@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772244174128 / 1000), TO_TIMESTAMP(1772244174128 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'carlosaguilarchavez@icloud.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'carlosaguilarchavez@icloud.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$vrG9dPLvJCu0oQ==$sog+PaECAuxCT/J7uT/tHuDunfXwN6c0ZSaI7K4srg4jBcCyzbTRHlaZHOTzAz1LrY1y8gOgQSB2n5eWY/iLQw==', NOW(), TO_TIMESTAMP(1774039654622 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "80Jfr34eGrTw1zUtr3ySWTRwb6B2"}',
      FALSE, TO_TIMESTAMP(1774039654622 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'carlosaguilarchavez@icloud.com')::jsonb,
      'email', TO_TIMESTAMP(1774039654622 / 1000), TO_TIMESTAMP(1774039654622 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'futama36@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'futama36@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$sxyh3l57xMOiTQ==$bWxXZu2hvW1e1Lj7ZsJh/E+CjVnawgQvW3JHzop5iaBjM3FveiceC34NG4pBLlOXOzfcrN9T3XXdElB3FVLX2A==', NOW(), TO_TIMESTAMP(1772136780292 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "82eqhkPsOrYB5cprxjJHltuqNgF2"}',
      FALSE, TO_TIMESTAMP(1772136780292 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'futama36@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772136780292 / 1000), TO_TIMESTAMP(1772136780292 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'mendezmiguel74204@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'mendezmiguel74204@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$vCdyYngc65r4GQ==$F1UOKJ2nGHAeWh2MVAQnNfMy30T4JDiOUMcz5nGZomPwxwz081/TzfrUbTXrvCq8RiI2pVCtWUBLrFwE4DOHcA==', NOW(), TO_TIMESTAMP(1776228247114 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "83To3YvXwngSdgMzc4VdibtefPa2"}',
      FALSE, TO_TIMESTAMP(1776228247114 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'mendezmiguel74204@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776228247114 / 1000), TO_TIMESTAMP(1776228247114 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'ofeliamijangos430@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'ofeliamijangos430@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$rJum5cWsaPYfkA==$LwSGHdxIHYYm9DnE/gzVydE1AC2oxPjZHXqsx265bUhd4w9VdXlqB2dFLlzGJgNn/zNVI759zH5ht80oWbayXQ==', NOW(), TO_TIMESTAMP(1771340149188 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "87kDrUec2UM3CeZt6lo6sW8adrw2"}',
      FALSE, TO_TIMESTAMP(1771340149188 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'ofeliamijangos430@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771340149188 / 1000), TO_TIMESTAMP(1771340149188 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'jcgarcia_24@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'jcgarcia_24@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$e+Ti56gevbu9YA==$2EBd6i4tdizWD1/eGpI9f8VairyMHLK/UlSgYIRw/KsvP9WNlyM1xWp2vV9GF95g1d7YRlt5W5kzLogig9tu8w==', NOW(), TO_TIMESTAMP(1773088245092 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "88uc8se6s6gj8No2oY91BPzNVOA3"}',
      FALSE, TO_TIMESTAMP(1773088245092 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'jcgarcia_24@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1773088245092 / 1000), TO_TIMESTAMP(1773088245092 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'mezalisbethgissel@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'mezalisbethgissel@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$rypRuuouzA+fMQ==$FZNHvjh/9EdN1nmk0Co9gpHbCGe+6/mXySOT0ynUKQB0IS6pdQD2XyFC5cmFOv5dfs4yx2BZMJWVNL0ZBZ03eQ==', NOW(), TO_TIMESTAMP(1773702758274 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "8D8DFOAQPsUXv89wG6DrXX87L1C2"}',
      FALSE, TO_TIMESTAMP(1773702758274 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'mezalisbethgissel@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1773702758274 / 1000), TO_TIMESTAMP(1773702758274 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'alx282194@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'alx282194@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$QrLEo8NPS0lUTA==$qc/L3vgjh5xW/UgZzurEbnkIVWVcURmwW6rcLnfq+uGRC9jFOxV6Qj9Ez7XDsfolLWS7olPWxhYxEUUIsUdtHw==', NOW(), TO_TIMESTAMP(1753147093505 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "8Ec7gtJRTqOsGcIqyBp3VMrBElh1"}',
      FALSE, TO_TIMESTAMP(1753146876147 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'alx282194@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1753147093505 / 1000), TO_TIMESTAMP(1753146876147 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'ejem@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'ejem@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$t+sbuuEq0oriPg==$VGHm/ImXOW1mND8vqM2Oq/GrOR37zvV56erGDsFoNzD3VeqqgMfHUfV4VkG/cCUvfKpPZl745ywHbkLcp8EtUA==', NOW(), TO_TIMESTAMP(1774880337976 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "8Fb5tovwr9UPrlpFzQTvby7CzTY2"}',
      FALSE, TO_TIMESTAMP(1774880337976 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'ejem@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1774880337976 / 1000), TO_TIMESTAMP(1774880337976 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'alexissalsanama1213@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'alexissalsanama1213@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$gOIJKY1voUBr1A==$jiVdDYalti4W1eq+xmrVvx9GQuVe2HwFvEd/Rz3PKtKsKPVKoasYDmP3wWstvM4OIcy0X2KXaPHPYJmdxulARQ==', NOW(), TO_TIMESTAMP(1771304269267 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "8IfmXojp74VZLx3gNVfDNyPTOkO2"}',
      FALSE, TO_TIMESTAMP(1771304269267 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'alexissalsanama1213@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771304269267 / 1000), TO_TIMESTAMP(1771304269267 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'omenh@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'omenh@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$waNY0RgwLqrwuw==$9cuGIMaPfxMcLvt5vDlbxM0gYqXyvce3wY87IxLqWu8gAVArEOSBIxu/+rux2SolEg4+xp+Vl7HJeVrZrgLXuw==', NOW(), TO_TIMESTAMP(1753469359571 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "8MmVMNme4BavpgsjOFrQSUz9YgY2"}',
      FALSE, TO_TIMESTAMP(1753469359571 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'omenh@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1753469359571 / 1000), TO_TIMESTAMP(1753469359571 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'daskermonzon@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'daskermonzon@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$s4P6KPzNKrJzug==$+s1vp9k5CuCpyCel3khaknw+Qbm1IFDb/VCaDjTuSsqug0i+t2tkG3nrE63hhJFUd2x6UYkyEDKCOOPeJb4SNQ==', NOW(), TO_TIMESTAMP(1771279867748 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "8UnmWFj2D7Us91BfLa44dvitIOW2"}',
      FALSE, TO_TIMESTAMP(1771279867748 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'daskermonzon@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771279867748 / 1000), TO_TIMESTAMP(1771279867748 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'eg901983@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'eg901983@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$jMuNQ6tcdf3Plw==$/ei/SFSNDI+2sBgh0jfJcCLrKOcXlDxYktP2s2gW6WhhX/yAKRVR6s5I97XXw0wL8XG3DmWlylAVnMtZATjUVA==', NOW(), TO_TIMESTAMP(1774447130821 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "8a8D5rJSGJdsevheu0dYmLsjV2s1"}',
      FALSE, TO_TIMESTAMP(1774412383681 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'eg901983@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1774447130821 / 1000), TO_TIMESTAMP(1774412383681 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'erikvel2022@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'erikvel2022@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$3CgyUiCEGcQQBg==$Q5GqewltLSFsWo9J4Xjw/F7UySsiIVvISRjEDkjJveOnZg5DfWCy2vHItGa+AgfQ87C6Z/TY9crpVZ1OPzzlOA==', NOW(), TO_TIMESTAMP(1774889949086 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "8buKd4SUDfNmSw2C1BHoO0JXVpw1"}',
      FALSE, TO_TIMESTAMP(1774888908349 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'erikvel2022@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1774889949086 / 1000), TO_TIMESTAMP(1774888908349 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'dirigiendolomejor@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'dirigiendolomejor@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$P/cNXAQVZ694pA==$acQEU2QPrjPfvfRijmfNXWpGp3/37jutKAxWyE8s57aDhFZzgANMIyXyTgIE5IoPMeFFo8GYdT0ZHSXPYyHy4Q==', NOW(), TO_TIMESTAMP(1751392112738 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "8ceYb7I3jdXj36iXRYZymWCSqpr1"}',
      FALSE, TO_TIMESTAMP(1751392112738 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'dirigiendolomejor@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1751392112738 / 1000), TO_TIMESTAMP(1751392112738 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'tovilla@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'tovilla@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$hhgr1i4Fj6fXcQ==$bduSyITEbTee9RANKdbVEm0sww1oyYul6i2Y5Niy3M4vpynLMw3DTmt8aTmy8TykS9qv/ZcV87HJ3E3gKUWmdw==', NOW(), TO_TIMESTAMP(1774749880030 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "8dawF3SZmUf31DdKRvSOYYYn4uk2"}',
      FALSE, TO_TIMESTAMP(1774749880030 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'tovilla@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1774749880030 / 1000), TO_TIMESTAMP(1774749880030 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'wilbrmndez89@icloud.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'wilbrmndez89@icloud.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$XSSvdAPVBExxwQ==$98uwJovN76vtts5yQB+nVxvwDVwTXE5Nc6uXAiJoqTdQobXB1AWQpq+DpV4FAeADlxgbB+aVre41O7goSswNPg==', NOW(), TO_TIMESTAMP(1771732222005 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "8h1i2WPmfSMS1d1r1utoPGaRvNR2"}',
      FALSE, TO_TIMESTAMP(1771732222005 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'wilbrmndez89@icloud.com')::jsonb,
      'email', TO_TIMESTAMP(1771732222005 / 1000), TO_TIMESTAMP(1771732222005 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'aevillediaz@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'aevillediaz@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$+NlFgxK2KXSY3A==$0XoPGmOZjxzuvlCquMH/mosHYkSViYPd1Z6JGR33/4qT3HSA0bbIZvJVSMQXzxjAP2JYKbUHd/yyl6HWyOYArw==', TO_TIMESTAMP(1751406826308 / 1000), TO_TIMESTAMP(1751406826308 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "8hn7AdvpKSZIwfQmUhE0q7ud7Gc2"}',
      FALSE, TO_TIMESTAMP(1751406826308 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'aevillediaz@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1751406826308 / 1000), TO_TIMESTAMP(1751406826308 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'yuricorzo@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'yuricorzo@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$qIE95oYVBAQ26A==$wtzW/VX1+MLRKgjmFMpcOMfha5GyMgOHaOnfxeHeByNwdUlpiGfV6gKLmlXhKrRqrSzKGOreWNgqc7kaCLum1Q==', NOW(), TO_TIMESTAMP(1771382446711 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "8hu0OBUgcNZxgFZehgqP7eZVzYe2"}',
      FALSE, TO_TIMESTAMP(1771382446711 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'yuricorzo@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771382446711 / 1000), TO_TIMESTAMP(1771382446711 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'escanervazquez88@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'escanervazquez88@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$OxyWVTr5FKo6Ow==$j7SEhLw2u2N9ytlpFrK98dE2aYbz3shxWjTLU9pQdSuln9vPH68nfo1nyrJiPFT1A/SSsS1dsfPFIs6nRlHLsw==', NOW(), TO_TIMESTAMP(1775355211277 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "8lXBGND5KHUkOiCiZgqXFKjf7qa2"}',
      FALSE, TO_TIMESTAMP(1775355211277 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'escanervazquez88@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1775355211277 / 1000), TO_TIMESTAMP(1775355211277 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'ildaservin@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'ildaservin@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$sni0+UkWQ1JheA==$YI/5DyKBneAZ7xIBzTFsTmri3nwSrCh9XPyKRrg8a91YVgR5toqQYNIcukk4cc3Fggem6pEg9yhv/axzZGgryg==', NOW(), TO_TIMESTAMP(1776451811549 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "8qn7GsGxuDQdRX7Tj44Hya50HIE3"}',
      FALSE, TO_TIMESTAMP(1776451811549 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'ildaservin@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776451811549 / 1000), TO_TIMESTAMP(1776451811549 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'aloarias235@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'aloarias235@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$Y0aDU7w+N/8btg==$hJHOrLlWfZ3OwT/7MdYkCa5HqOkbM6U9abuG1xz7xFK5zGa97RsxUiFw0dAqUgU7A+zgtz3PBsRcYW/1ddDWvg==', NOW(), TO_TIMESTAMP(1776223188916 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "8uoTice9BbMHYwTtp8MveZxz9JK2"}',
      FALSE, TO_TIMESTAMP(1776223188916 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'aloarias235@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776223188916 / 1000), TO_TIMESTAMP(1776223188916 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'hhsvsu31@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'hhsvsu31@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$3ICHahrqyUSqqQ==$PFxtqZOmFGbteGwkAufQyBe67Y0p4/Kruc9XGYuPCd0k/SM0CAABn63doczfKD1T0B2ZdcbTILDzyUFkdcJhAg==', NOW(), TO_TIMESTAMP(1771468527243 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "8ux3MeupyrV2kOoX5PI59THoOiq2"}',
      FALSE, TO_TIMESTAMP(1771468527243 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'hhsvsu31@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771468527243 / 1000), TO_TIMESTAMP(1771468527243 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'julioemma06@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'julioemma06@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$Kz+YftJXkL3BJQ==$zxU5aGyTUZUqZUJYxWpCQFLU/4i0+G8DsB+5ezGYSlQCc2b3pdoO642yDg7+V8UJW2uzM7SOcro6Gye9+HIoYg==', NOW(), TO_TIMESTAMP(1765423163390 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "8x1KhmkskwhG9Bxs68VM2hu1xTC2"}',
      FALSE, TO_TIMESTAMP(1765423163390 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'julioemma06@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1765423163390 / 1000), TO_TIMESTAMP(1765423163390 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'arfc.n.04@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'arfc.n.04@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$M5OG4W5MI0mDwA==$iZWpdHJ/IzLSwMDFp3tiAqeeXYNulsotJyhxW6Yluq0EwEYYOI+t4cB8ebRg01afOV6Xb6t2DWmVirXrj8Nbeg==', NOW(), TO_TIMESTAMP(1778438085706 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "8zN7pdTPzuQhwdINXvgxlgnBw6G3"}',
      FALSE, TO_TIMESTAMP(1778438085706 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'arfc.n.04@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1778438085706 / 1000), TO_TIMESTAMP(1778438085706 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'cindyballinas@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'cindyballinas@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$PRXV/5d4WgEpDA==$KEJ23lDqsb2+FoQssSRLO47/CfASMyHkjPXeHSAvJ3onpVCo0e8mjfFM482ZcCDmgT6n6EMAtxpEU+atsJlkrQ==', NOW(), TO_TIMESTAMP(1772942520402 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "8zY91zv1NXUZvDAyU5YgrusjB2V2"}',
      FALSE, TO_TIMESTAMP(1772942520402 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'cindyballinas@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772942520402 / 1000), TO_TIMESTAMP(1772942520402 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'ric55laz@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'ric55laz@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$T1I3S+GM8fG6xA==$R/mXaxXIjGKCsaiETGrGUyLSsFisVWv/eoiQO4nSK/QCOe16xozPVwhM8FrqL+N1HzxzCoP+fo6sSCHxEhyQkQ==', NOW(), TO_TIMESTAMP(1771454964145 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "917PxUCbaOZp8iGTv4OYUUBaIKM2"}',
      FALSE, TO_TIMESTAMP(1771454964145 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'ric55laz@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771454964145 / 1000), TO_TIMESTAMP(1771454964145 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'andreamija24@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'andreamija24@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$G918WKYXq0Fi+w==$K9txZo5OjwR7pnv7XVhfciDz4oH/EE3A2CQ0g3a/b7zAgaFB8NXZzE7DeYxNBQ6Wq3Jwp2Ul1z9rXs55DP9MaQ==', NOW(), TO_TIMESTAMP(1771692183013 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "94d2LuMo2OWpa6kX68uufwQLBfP2"}',
      FALSE, TO_TIMESTAMP(1771692183013 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'andreamija24@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771692183013 / 1000), TO_TIMESTAMP(1771692183013 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'chofisin02@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'chofisin02@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$6LGLu9mId+oT4w==$RReKr4+G3vzLM9wqUfrM+yEOy+Phw5zohDPuNZb8yLTWblW1qSUcNWXgTBlSk/sRpFXt7dK7M33tqnYWcNrtPw==', NOW(), TO_TIMESTAMP(1772239353824 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "96EBjfbuFThhGyhIy5CJ3jqpR722"}',
      FALSE, TO_TIMESTAMP(1772239353824 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'chofisin02@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772239353824 / 1000), TO_TIMESTAMP(1772239353824 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'erickyobanycruzguzman@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'erickyobanycruzguzman@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$fv/fd0R0jig7Qg==$qnUyJWgi8wRQ5zgl/gXAWb2WLCfXcfWndbUW+WD+FIhqV/NWfzdQjkeyWA2ohyi2N5njL1mvFJCP1Grju3VRZQ==', NOW(), TO_TIMESTAMP(1774362243441 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "97c9MArJleTrcl3itd8rTDYBwxF2"}',
      FALSE, TO_TIMESTAMP(1774361942227 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'erickyobanycruzguzman@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1774362243441 / 1000), TO_TIMESTAMP(1774361942227 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'mercii31011990@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'mercii31011990@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$INQ/N2WDM7zinQ==$WAzPukAe/mX/Swbd63frV6hS7iR/wDdTW/lsCi4L4OJ5rsKxJf9KRIUuBlqKRs6GJRjftIyUpvM7EjMJonuRTw==', NOW(), TO_TIMESTAMP(1771290498506 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "98e07faoLFffOrp58BGEPqvUGZw2"}',
      FALSE, TO_TIMESTAMP(1771290498506 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'mercii31011990@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771290498506 / 1000), TO_TIMESTAMP(1771290498506 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'robertorojas141721@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'robertorojas141721@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$JVcHw3WI77RndA==$92NdD9mFpT3N6o8nVTGvO8x+9eH6XsWBW+AcMtozSKRwGr1KE6J9YuzMnzfvyumZ6JiESlELOzhbOV5SAY6MuQ==', NOW(), TO_TIMESTAMP(1775081988736 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "9C1ATOKYmwVaAPvgRvzUmsFj4yn1"}',
      FALSE, TO_TIMESTAMP(1775081988736 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'robertorojas141721@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1775081988736 / 1000), TO_TIMESTAMP(1775081988736 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'juanmontoy436@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'juanmontoy436@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$yGBvYH2HVXuEpg==$uaw62X6pLuFTNI6I7Mfm6lXpOFFxIDHzXyUJYf+Q3KjZNmI10mL3GXiMCHToZA84/rJgXUFlJrVg01OGLSv53g==', NOW(), TO_TIMESTAMP(1776220749479 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "9EGGskWSrJOD7oZJgM2T92rDBAI3"}',
      FALSE, TO_TIMESTAMP(1776220749479 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'juanmontoy436@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776220749479 / 1000), TO_TIMESTAMP(1776220749479 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'fatimalopezalvarez4@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'fatimalopezalvarez4@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$AsKQk1I8mtD+ZA==$P4hwzYLuZCmDlUBJ79DNe5hkubhWbbzArjC7H34J/A4YsPY7C6usdnSAU5qofA7Ut+KLtOjhjcZmbADXs/7wRg==', NOW(), TO_TIMESTAMP(1772929876049 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "9ELak6jUz7cAibp4WfYsXDwAW3C2"}',
      FALSE, TO_TIMESTAMP(1772929876049 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'fatimalopezalvarez4@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772929876049 / 1000), TO_TIMESTAMP(1772929876049 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'andresgo6800@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'andresgo6800@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$d5z6LOgYUVlnzQ==$jD/fdUbMmpxYXXoZqD7HPB5QKPabozepn3srI2eoB3vzlo97+na8fAmuFbWNEgy+53VVAVrKIdAgEoVlEZgZpg==', NOW(), TO_TIMESTAMP(1776217553771 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "9ELb5Qfbk2UExf9JjpPlGrWHUZi2"}',
      FALSE, TO_TIMESTAMP(1776217553771 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'andresgo6800@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776217553771 / 1000), TO_TIMESTAMP(1776217553771 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'spiturers_angel@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'spiturers_angel@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$Ywk91u6GhPFcpg==$yo7Pcec1/GMVr3hgn4Xt0scMAuzSjwjG2f28AtbdHQ6BpCeU86hJ2yI5rwArc0LJIs+pGPrKFoqegQw67Fp18g==', NOW(), TO_TIMESTAMP(1773116562344 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "9EazMxj53Yeku0qqNK469exmTFg1"}',
      FALSE, TO_TIMESTAMP(1773116562344 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'spiturers_angel@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1773116562344 / 1000), TO_TIMESTAMP(1773116562344 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'jlcastah@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'jlcastah@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$zhWP5JNS/XckDg==$2LaTK8c7D0hJoJmoKfUAUI12DxG1NCRJtDMBNhPlwBJHrJa3TT/g/iSmoDsieXTAG/iUDn900i6MtAIamTZ6UA==', NOW(), TO_TIMESTAMP(1779933665739 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "9Igqq6a3HDgk4lQhm9TepgXri433"}',
      FALSE, TO_TIMESTAMP(1779933665739 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'jlcastah@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1779933665739 / 1000), TO_TIMESTAMP(1779933665739 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'trejolievanof@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'trejolievanof@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$XA1rLOrhswqYQA==$3k6QqGjW5O8ABgSOs8DTF5id3MdYN9QAdmf78Vh9Z6zq0FBwlsCnGvj5K4aqY9VKo+XL8A+vWfmaOHMfwsZStw==', NOW(), TO_TIMESTAMP(1771306278632 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "9KreZn8AmsP2WlxkokcJ81hHdxp1"}',
      FALSE, TO_TIMESTAMP(1771306278632 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'trejolievanof@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771306278632 / 1000), TO_TIMESTAMP(1771306278632 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'lopezangelmoreno190@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'lopezangelmoreno190@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$VkUA6d9OztAu1g==$T9J6BD+yTPoltfu0/3RYIuKX3NBWIOxtesHmEwauYgZ1UIjnJM4XUo4uftGIFGPzwdrJw27Q9BS+iCGjBV3xwg==', NOW(), TO_TIMESTAMP(1771788236084 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "9LdSH4zRXTYb3iXs6rLc0QMSiSf2"}',
      FALSE, TO_TIMESTAMP(1771788236084 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'lopezangelmoreno190@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771788236084 / 1000), TO_TIMESTAMP(1771788236084 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'josemagogu1@yahoo.com.mx') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'josemagogu1@yahoo.com.mx', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$DIpgQClz8F97LQ==$MgPb/Is7N15cACOEv9QUA2sALpvrx3OzVgY4YaAY7ZbeK5AmLf3rYDD6j+Jr53fCx2VZ3bCmXG+JlqWV33yoKw==', NOW(), TO_TIMESTAMP(1772944155426 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "9Mn0ujRejmgWhMbPqJnNsEFWEhD2"}',
      FALSE, TO_TIMESTAMP(1772944155426 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'josemagogu1@yahoo.com.mx')::jsonb,
      'email', TO_TIMESTAMP(1772944155426 / 1000), TO_TIMESTAMP(1772944155426 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'mendez24elisa20@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'mendez24elisa20@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$bqR+oqb+aTjMZA==$YqrdAf1IJ+ptlPnLuCab9JmEdrUAWVaV6Z8tVota4Um6f9iWdyV0XgfsHnvOQeDhFQnroIf6pLwLvSu7+itWIA==', NOW(), TO_TIMESTAMP(1779295412241 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "9QgU04LNnIbfOtIG912tB0so7tL2"}',
      FALSE, TO_TIMESTAMP(1779295412241 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'mendez24elisa20@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1779295412241 / 1000), TO_TIMESTAMP(1779295412241 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'dianapaolabasan@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'dianapaolabasan@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$Kl1g++++qhvCFg==$WiUTOsz19h8G1aK+X9Vt/hqWAHbV00bIWxDFkZAi9ZCgUvnwv3aN8ruJbWNlJ6f/wlK5yIBJap9GFfxXm8EiiQ==', NOW(), TO_TIMESTAMP(1774236160509 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "9RyANJl4pVZJYTNYsQNBN5UtYEZ2"}',
      FALSE, TO_TIMESTAMP(1774235904870 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'dianapaolabasan@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1774236160509 / 1000), TO_TIMESTAMP(1774235904870 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'arqluisporras2020@outlook.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'arqluisporras2020@outlook.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$m6Tszc2SR9QOkg==$u233XgLmy56zTEbMOorcYJbv2BeCujBfSOEXVqz3iOIfdHdNWTmMhUEF+ma3EQLeu/U3R4Ctcgx5kFilNeE+kQ==', NOW(), TO_TIMESTAMP(1771275155097 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "9S4rgGQb9sRsOwJ1h6wQAhgIpYG3"}',
      FALSE, TO_TIMESTAMP(1771274902806 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'arqluisporras2020@outlook.com')::jsonb,
      'email', TO_TIMESTAMP(1771275155097 / 1000), TO_TIMESTAMP(1771274902806 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'alvema907@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'alvema907@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$ZV1HplS0oo/eiQ==$UAzla/hwKxkES310qtA1ZlFj1s6xKVWk8epCwfaF8DRYYJifFJxz6wL90LqjUvKhKkckpj2DlkgDrtpTouZ21A==', NOW(), TO_TIMESTAMP(1780018629984 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "9UAjp3Ba7RO0Wi8YaiF05xOZzBS2"}',
      FALSE, TO_TIMESTAMP(1780018629984 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'alvema907@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1780018629984 / 1000), TO_TIMESTAMP(1780018629984 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'anagabrielabalbuena8@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'anagabrielabalbuena8@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$PKss1DXlCTXqQQ==$ZLUeylVy7GwppT47cN3E8VfcmFMcNSYuLKGqC1kx1WDLCOmZj0DndS3JWQZvUBfkwi9E/GgaMXnc37jSq4pw5g==', NOW(), TO_TIMESTAMP(1772886800152 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "9cTQOjkhPJTYnfhtAfbSW2PqPBg1"}',
      FALSE, TO_TIMESTAMP(1772886800152 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'anagabrielabalbuena8@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772886800152 / 1000), TO_TIMESTAMP(1772886800152 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'aaronmerino007@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'aaronmerino007@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$TlhXgstin/ZgQQ==$J5SjuKpwx4RFOOaFxh8+JeIwinfSK/utWFNV9MzXGx+TfdEZ/Dna/aUJY+ZqkyfTxfA1Nb2WUQqQPsOvVIKqRw==', NOW(), TO_TIMESTAMP(1774153432593 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "9dkrXQ0f93RvUBHJTtz4oASsmg12"}',
      FALSE, TO_TIMESTAMP(1774153432593 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'aaronmerino007@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1774153432593 / 1000), TO_TIMESTAMP(1774153432593 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'hermelindar092@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'hermelindar092@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$1jFHvJKggV8eqg==$gUed9WzGtKZAafw5+rl0myWIZcBo+YnSKAE2v86baufgMGURhSID3idIvJG4ZGI6tGBZuur4CxrwoR8aENl5MA==', NOW(), TO_TIMESTAMP(1776276210242 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "9eFWINl4vcgTSYesJXKG753LDOS2"}',
      FALSE, TO_TIMESTAMP(1776276210242 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'hermelindar092@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776276210242 / 1000), TO_TIMESTAMP(1776276210242 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'lorerm2118@gmail.con') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'lorerm2118@gmail.con', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$4GVoVF6UXDgDfA==$qK10gvGWnahD3LFUzuu3B2Vq9WkqiT6Ms5igt8nBTZira1qt/bt3mivbrOIGI+sBm5SY+X3ax0vaiWYx/M12qA==', NOW(), TO_TIMESTAMP(1771284353039 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "9gCo4lnqdUVy0FHs5V8OztX2bGV2"}',
      FALSE, TO_TIMESTAMP(1771284353039 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'lorerm2118@gmail.con')::jsonb,
      'email', TO_TIMESTAMP(1771284353039 / 1000), TO_TIMESTAMP(1771284353039 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'andersongiron02@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'andersongiron02@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$1mUliOYQ6WsfFw==$CD7c9oDNLcAox3/yo9I2Ml+IXiupPNc1tRQSWRq8zZht2oWL9lPZmB4Nfx/rOWwnFHRjkf+LTW+f4kadnfyJOQ==', NOW(), TO_TIMESTAMP(1777250996569 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "9hbzPBYYp7MUioOPO6UVc3D4RVK2"}',
      FALSE, TO_TIMESTAMP(1777250996569 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'andersongiron02@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1777250996569 / 1000), TO_TIMESTAMP(1777250996569 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'csolorzanobermudez@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'csolorzanobermudez@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$co0G51NBqwle/A==$C/mHGCVvUY9kpiPfbc7qn+xzOJkQ3O5Ld5aM9NE3U2Yh1i6rVxPv0wX2xg1QypvIWkUDBNxtYJkG92z1/SDrfg==', NOW(), TO_TIMESTAMP(1772414760706 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "9hoM04v53jVt7TE2Vs8DjyzJecA2"}',
      FALSE, TO_TIMESTAMP(1771640380490 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'csolorzanobermudez@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772414760706 / 1000), TO_TIMESTAMP(1771640380490 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'jairni28@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'jairni28@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$/VZ/VY7p8lb0VA==$bRaGQHARQ7AkydbxhcWycZgo/I3TwotY/bbciHR9H7EAO4YqZTC80LrBZw5eRR6JPO2N7RFEq2mj/7Yb4A7D4w==', NOW(), TO_TIMESTAMP(1752954546883 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "9kKixb3yvaYaCwmxCwqjmf6dSiB3"}',
      FALSE, TO_TIMESTAMP(1752954546883 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'jairni28@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1752954546883 / 1000), TO_TIMESTAMP(1752954546883 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'munekita.0645@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'munekita.0645@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$k7nJThzhuuORog==$x+0o36wUMRBiB/TnrDN4NW3HvOWUzc2foE4Iv6AobpR+D0pgDBi9qZpm50lILKGZgBFpOPzyTgaR7Jg+4pWL5A==', NOW(), TO_TIMESTAMP(1774801933206 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "9locXKKzOZNaAnLNvUjcdrndPFH3"}',
      FALSE, TO_TIMESTAMP(1774801933206 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'munekita.0645@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1774801933206 / 1000), TO_TIMESTAMP(1774801933206 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'gg102298@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'gg102298@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$lowGzShQZoW8Yw==$evg7htqbUPYFm3fWrZgfJmTR3RT2VSrfyJUZ0ESSxbuRZUPw0dnmUsJGdd7jFqGvwqmiZ5bhr4f4vu9BISHXig==', NOW(), TO_TIMESTAMP(1771284044172 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "9o1nadscsJRbgqweMBmIQeamxDG3"}',
      FALSE, TO_TIMESTAMP(1771284044172 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'gg102298@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771284044172 / 1000), TO_TIMESTAMP(1771284044172 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'ibereduardog@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'ibereduardog@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$FsmqUyHAsZFxFg==$5Wi5KneztTBq2mwa2tq0wAGYHz3Rf8vDYPkDX9V2pw2PDPKQTcZyaUV9WP4xOlRyALvzt5pVxbgy51rfJE2kPQ==', NOW(), TO_TIMESTAMP(1772915446424 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "9rGQlIQ1GafrtY1q5WRWhr0baVh1"}',
      FALSE, TO_TIMESTAMP(1772915446424 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'ibereduardog@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772915446424 / 1000), TO_TIMESTAMP(1772915446424 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'aleruiz25t@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'aleruiz25t@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$sebVZOHCInIk6Q==$qyQ0qT2ZBK4+llMOhDEvAr0+FFXbb6gN4AUlG/X0nHvwK8+gJpb5Z14cJXadZ1oS16X7oZT3t9kkvELLQQioRw==', NOW(), TO_TIMESTAMP(1771335016727 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "9wfGRh42bJY90xM7xNhZIpuTSCw1"}',
      FALSE, TO_TIMESTAMP(1771335016727 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'aleruiz25t@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771335016727 / 1000), TO_TIMESTAMP(1771335016727 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'ozunacesar83@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'ozunacesar83@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$xEm+3pOIcIgz+Q==$zOh6VxUhcfGeiCIZELu1EIqgKKqotZ48r11ILePoyh9sv6TpzPPW/+7+JLnQMIXooJi/DDv9QG0nFsOPLh8HMg==', NOW(), TO_TIMESTAMP(1771537778205 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "9xYl2oPyF1gH8H7d6V1BEUmtSsp2"}',
      FALSE, TO_TIMESTAMP(1771537778205 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'ozunacesar83@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771537778205 / 1000), TO_TIMESTAMP(1771537778205 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'isc.airam@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'isc.airam@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$TfysNqVwrzGWRQ==$9FDpvwKCqrV5sGsFfqws9Ui8LXkLxJhYJzVCoCN2UV5V7HAhPgOv3KvZoUaL8+vj6pB0/TgQhEQxfb96uWd9vg==', NOW(), TO_TIMESTAMP(1756688279731 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "A2TvgbgnpaQBntljO0O9SaiQGnY2"}',
      FALSE, TO_TIMESTAMP(1756688279731 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'isc.airam@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1756688279731 / 1000), TO_TIMESTAMP(1756688279731 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'tonomoralesruiz@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'tonomoralesruiz@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$e+CW+7dO18JnBg==$cKO1aPN9b+vpsD9rtK53cL6TJVBqxtNRI7UlVZW749wC85jckEAHOkjDOX/DdyAiQDPgKvJuQR8tWDRvOfi3Ww==', NOW(), TO_TIMESTAMP(1772250292084 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "A3QeAzfXV3X5jd2JVvHmtC0hsqi2"}',
      FALSE, TO_TIMESTAMP(1772250292084 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'tonomoralesruiz@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772250292084 / 1000), TO_TIMESTAMP(1772250292084 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'tady1409@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'tady1409@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$cZpFP4RQGYhN/Q==$4yM9h5hCidwFwnpbsR9IjAAjRg1LizIQHh7SCT7fZ00hK+GSOCfg/zl5wCj1QNpualTIOBJOLOcs0JM2dHXtPA==', NOW(), TO_TIMESTAMP(1771269571442 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "A50mN4XjwoO06a1D3a5kBqRCMbT2"}',
      FALSE, TO_TIMESTAMP(1771269571442 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'tady1409@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771269571442 / 1000), TO_TIMESTAMP(1771269571442 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'dp203187@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'dp203187@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$7FSNym/qz1UCQw==$0oQzKUaMLXFjCtgibRFooZSSAsOt19pU/D2nPOJh0VZLmAOly/d1v8oJKW2IFNMMSLk6c70PCbDej/TIkz5rRw==', NOW(), TO_TIMESTAMP(1768257652811 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "A5YvwGnn7VW07YYhtLNh7EPdSVP2"}',
      FALSE, TO_TIMESTAMP(1768257652811 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'dp203187@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1768257652811 / 1000), TO_TIMESTAMP(1768257652811 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'emmanuelestrada274@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'emmanuelestrada274@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$rYIwLBZiQXIsww==$6Dj7Sa35RFVfyKQ3Sw2NtdSJ0DmXtREvBCNNMsiG4Vw5bMR5CsQMb0/n9aEhZb8Cbt9ipns+gisEx177O8nolQ==', NOW(), TO_TIMESTAMP(1778440680401 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "A86wXpoOXiS8migULlWTIpyGpZf2"}',
      FALSE, TO_TIMESTAMP(1778440680401 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'emmanuelestrada274@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1778440680401 / 1000), TO_TIMESTAMP(1778440680401 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'fernandasanchezjjeo188@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'fernandasanchezjjeo188@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$NYTpHbXCcGcMQg==$TpqWfk37+uf9bOZUqQCMlGY3wyRZnzpH6qr6oFkUGfOnfSlIZj6bKSEvHOzo1+ziuR2Vpzg8VACdRaortBJlUA==', NOW(), TO_TIMESTAMP(1773363555812 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "A8Kg3KOMyBVGdxysImpuRIRoJL33"}',
      FALSE, TO_TIMESTAMP(1773363555812 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'fernandasanchezjjeo188@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1773363555812 / 1000), TO_TIMESTAMP(1773363555812 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'hagnusj@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'hagnusj@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$hGdt8H/Ai4vLmw==$xUBtNbkQLmZK2Uy5gNfesw1Qeq7UhHi3gfC3MtKddb0zKR6DKsBoWgyc4CZYVbc3m7X0IWw5v555prEldOmwhg==', NOW(), TO_TIMESTAMP(1771435805505 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "A99o580oQvR2AeuJEhbQobG4HWu1"}',
      FALSE, TO_TIMESTAMP(1771435805505 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'hagnusj@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771435805505 / 1000), TO_TIMESTAMP(1771435805505 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'ing.joaquincarpio@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'ing.joaquincarpio@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$EFlGsNPN8xohSg==$Kgy9Ul2Zfg6GDmciYO9E+jjfhmlkN07yvaUS8cbkZ0O9Z7qlYKvgqA4EyXhbmi8XK07Xfht1GpUJ+ctqi1WeJg==', NOW(), TO_TIMESTAMP(1775273258402 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "APL9FLSC1tPlXFV5TDNrY1UnzSm1"}',
      FALSE, TO_TIMESTAMP(1775273258402 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'ing.joaquincarpio@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1775273258402 / 1000), TO_TIMESTAMP(1775273258402 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'verrho@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'verrho@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$Kr1Dn6I3x2elQw==$YCpekMZA8Pw2PikQXC/LaqJ1auJ7Z7dvxUfCHeGciBr0fXSSH6uCvYz3FsZQmbv80i42aDt6Nr5zYmkuQH6+Vg==', NOW(), TO_TIMESTAMP(1776218901936 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "ARCaeV92EHPatQQATTAAFMa1W2L2"}',
      FALSE, TO_TIMESTAMP(1776218901936 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'verrho@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776218901936 / 1000), TO_TIMESTAMP(1776218901936 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'limdiaz4@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'limdiaz4@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$0n2sRDE2YA82wQ==$CRQhDKtEBj4qn4P+VTQ11isdBZp8RM9MuWI5aMqCnYYJ+WY47613eRwZ+mnO+Qo8acMwt/xt0bnJc8AZFG8krA==', NOW(), TO_TIMESTAMP(1772305834201 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "AULSfwjC7tVC4lgBhLTWgqOnRSw1"}',
      FALSE, TO_TIMESTAMP(1772305834201 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'limdiaz4@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772305834201 / 1000), TO_TIMESTAMP(1772305834201 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'alfredoperezlopez84622@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'alfredoperezlopez84622@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$A4FQNop76NR7dg==$EKYwK4nuLIIrKJW7pdWI428YR8nplwD7ASpjt3oMeomEvaNspB5aH5zP+7McZlayDJJYqeTupDyg00i/x/BtPw==', NOW(), TO_TIMESTAMP(1771455135373 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "AVFLlCEfzxgPVDeN2U6BiPCMt5z1"}',
      FALSE, TO_TIMESTAMP(1771454825355 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'alfredoperezlopez84622@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771455135373 / 1000), TO_TIMESTAMP(1771454825355 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'lopezjimenezn708@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'lopezjimenezn708@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$i0BqTjpNxoFkhw==$lUmjF1Yo+Jtkf7OI3hI7izB0y9+QUoC2qHT/o1YajK5nDtGk+2Co787nJQSMQUS2mnrNawyLSOOT98nqjQTCsg==', NOW(), TO_TIMESTAMP(1771690867679 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "AYtRLUpk9BhEYung8AqgRB8XmEx2"}',
      FALSE, TO_TIMESTAMP(1771690867679 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'lopezjimenezn708@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771690867679 / 1000), TO_TIMESTAMP(1771690867679 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'felipeentzin35@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'felipeentzin35@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$X+M618tBn8mLHw==$qWMQ6++WHwTG4DrSnQWZXbR7oHmWHl+aaLVceODDOlqrj9hPZEnlwvCfVyRCWpc7bJbt+qVMN6gQeAzl9va6xQ==', NOW(), TO_TIMESTAMP(1773890867130 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "AcBAcHedLgZOfxTQe3SGAeobqSC2"}',
      FALSE, TO_TIMESTAMP(1773890867130 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'felipeentzin35@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1773890867130 / 1000), TO_TIMESTAMP(1773890867130 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'rovelotomas8@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'rovelotomas8@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$nlz1ROURGa9Tbg==$Zt8LttBcrQZ/HDimqpWxhuPXgWrFOPoQDU1173uYZ+5futsvf3B1r3ij6QeqZmiTkPeXPLypyiCLYEuoti9+Rg==', NOW(), TO_TIMESTAMP(1775356550008 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "AcnR9cfrl9MMNDQi3TDrQlnYlTB3"}',
      FALSE, TO_TIMESTAMP(1775356550008 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'rovelotomas8@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1775356550008 / 1000), TO_TIMESTAMP(1775356550008 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'oscar@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'oscar@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$FmQKwaZR11OZFQ==$qdqROXBPCmYM+XzAjvHddzqZ2dQeNyBaW+NNvYxpraDnHha6uFkddUy2AfTchMafaEUs+l7zESLY9VfsAhNoQQ==', NOW(), TO_TIMESTAMP(1775964595450 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "AdUlRwyS1AWdemTbiwEr9mR8cTX2"}',
      FALSE, TO_TIMESTAMP(1775964595450 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'oscar@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1775964595450 / 1000), TO_TIMESTAMP(1775964595450 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'ezkrapii@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'ezkrapii@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$u54wXcLz7OyxFQ==$BbMy1TkCnLICxbt5ULeUou4HEYt3drSETbq8uC+QpWmLUJTYxoVHbegqX89H8jb5dY5adNzKmyN7fUdJ/xHMSQ==', NOW(), TO_TIMESTAMP(1776056527641 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "AftDkEoiVqXqHWAc6Apz30J1uVX2"}',
      FALSE, TO_TIMESTAMP(1776056527641 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'ezkrapii@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776056527641 / 1000), TO_TIMESTAMP(1776056527641 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'enfoqueexclusivo@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'enfoqueexclusivo@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$eK1j3mzYPi5pjA==$Do7Ey9qZX+FWvY7XinStpMToINKt0DT9uvrDDTuRz3czKCt5yNEoIAs46TCbRVbrNyrErqLmgguyuzYnZr1zXQ==', NOW(), TO_TIMESTAMP(1771275434866 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "AgD3TgWPkhUO4Ji3zmTLHPdM2xj1"}',
      FALSE, TO_TIMESTAMP(1771275434866 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'enfoqueexclusivo@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771275434866 / 1000), TO_TIMESTAMP(1771275434866 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'duranmontejorogelio@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'duranmontejorogelio@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$Ex6WMY+3nRvf3w==$tLv1W9or58UatmmTZ66gsVw/Moue4o8u73Wy50WTozIYG1HpOVquIfOn+IqkNKwG/JmYNdVAx52FWFKt5bno2g==', NOW(), TO_TIMESTAMP(1771812131107 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "Am81yRcISWWxXmS3RZs81yqLGMj1"}',
      FALSE, TO_TIMESTAMP(1771812131107 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'duranmontejorogelio@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771812131107 / 1000), TO_TIMESTAMP(1771812131107 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'alejandrorivera7797@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'alejandrorivera7797@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$E/w5kfUHDv+vYA==$D+8/QU0xb0v97oZCNBzPxozP3wQYte401YKBRwp0ptrWKYkVSqpZvhEVmdVDR55yNGkhzSQzXvT69BE3g7Vpmg==', NOW(), TO_TIMESTAMP(1753287646815 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "AnFNUm1lSrZBXL5vEJy37BDvHIG2"}',
      FALSE, TO_TIMESTAMP(1753287646815 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'alejandrorivera7797@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1753287646815 / 1000), TO_TIMESTAMP(1753287646815 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'mgvicko404@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'mgvicko404@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$d64rGER8Sf1c3w==$doCvV3g1XhCWwSMEYPFhyvLZbnP6q9ekA0QLwSPEymSdhghcQsyp99q1tJdxi0bt+VTPNz6S5+yktcQudR+PQg==', NOW(), TO_TIMESTAMP(1777168890115 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "ApGy4AgJzzVPQ4SPVnoEYsIBQSq1"}',
      FALSE, TO_TIMESTAMP(1777168890115 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'mgvicko404@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1777168890115 / 1000), TO_TIMESTAMP(1777168890115 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'frmu_1610@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'frmu_1610@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$aL56S+NmBCyugA==$iTbZnboprerHhMrBhFJNFZNRZpCvXVSe+xcpA//aMIa1OtTYTgh+bfL+cLe0iey6L5dn2pPdGR/0TgumAUo9nQ==', NOW(), TO_TIMESTAMP(1771279780649 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "Apu0BlBVv9OFR2q3OJ901tVFmWJ3"}',
      FALSE, TO_TIMESTAMP(1771279780649 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'frmu_1610@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771279780649 / 1000), TO_TIMESTAMP(1771279780649 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'marioxyz63@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'marioxyz63@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$YthE83fVe9727w==$otQvTQzFRAsPl3Vyj1ILfZQn6ARng+CHJL6xErfecEYDbS/4s7VEo7jU/IbHTquSQenpR7hUrRY58zLtutVqFw==', NOW(), TO_TIMESTAMP(1753637498801 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "AzJenTlvhdZPMrzTAgelVKA8ls93"}',
      FALSE, TO_TIMESTAMP(1753637078664 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'marioxyz63@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1753637498801 / 1000), TO_TIMESTAMP(1753637078664 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = '6630karla@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      '6630karla@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$CvgaybuiKLRFEw==$RjPSxNJlFjlX9MhXgYPUmO++5JHd3+LGKay6y7zOJiy0w5Tuy5gzRa/q09EAJpNBMh21fW4oWTUBx8idxwc+bA==', NOW(), TO_TIMESTAMP(1777086107905 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "Azzmb0HWXZY1wIwqc3NVink1DKR2"}',
      FALSE, TO_TIMESTAMP(1777086107905 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, '6630karla@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1777086107905 / 1000), TO_TIMESTAMP(1777086107905 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'montoyahiberr7@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'montoyahiberr7@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$Q0MQAUnRJaL9kw==$cSJZN0s6YHUgyOEQxMJ/n9Utoy3oAfgGVsCEOvrwLD5O8bJJF5v55EQCeXVNJocVBClyWP3O0oIHxcawe+bf+A==', NOW(), TO_TIMESTAMP(1773211271810 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "B03KOqAiWeZlWFophftnyzJz8W62"}',
      FALSE, TO_TIMESTAMP(1771293663069 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'montoyahiberr7@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1773211271810 / 1000), TO_TIMESTAMP(1771293663069 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'susalenasanchezflores@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'susalenasanchezflores@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$6DmedZ8KKEEXAA==$FLcuTv0jjWwyzc+Cc1j+p/FjiTp1nxR55CcwaYQMsEVNL+K744LIz4Qu2h5l+PNV8DuCWYESv+buRLcfkYJYCw==', NOW(), TO_TIMESTAMP(1772216439916 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "BCcYVUoY6pPW6DOFfW0tpZY8BYg2"}',
      FALSE, TO_TIMESTAMP(1772216439916 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'susalenasanchezflores@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772216439916 / 1000), TO_TIMESTAMP(1772216439916 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'wiquirue.86@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'wiquirue.86@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$seS4a9DpVuSWQQ==$95MSsYwonYS/f04Z11Y4dJyIN62ZK5bBKNtO9q9RGbVJxdqyTUK8fCp69wWBUMKw1++NHyrnnU5ssFV82dzwBA==', NOW(), TO_TIMESTAMP(1772093357584 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "BGdMx6g5dtNy4T9NWQ3x8FUZ0I72"}',
      FALSE, TO_TIMESTAMP(1772093357584 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'wiquirue.86@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772093357584 / 1000), TO_TIMESTAMP(1772093357584 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'jaquelin111mar@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'jaquelin111mar@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$AtYd30OsIXNXdg==$WtsaTebjorlaekfjGZ+qMIeJCgxT3hfzwNsHXCSNlJgrpy9qmlas6JVXGbAih1NPKK1P/i/TS1E0s0c41Oq56A==', NOW(), TO_TIMESTAMP(1772052417692 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "BGn1ZzW718U6px6T1lWN6c9UUX12"}',
      FALSE, TO_TIMESTAMP(1772052417692 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'jaquelin111mar@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772052417692 / 1000), TO_TIMESTAMP(1772052417692 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'dianiyaz@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'dianiyaz@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$lxnt83HgyZ53Rg==$VE+I1oM/2OzA0sHloHC6Wtj+nFFskXMmMgKHj8lYCxGTYTRAsTvTq5k6RKh90ZjE+B7ZQSgF4W2cey676nIS5A==', NOW(), TO_TIMESTAMP(1751403363914 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "BHx9N0oGHxOV0Vko13pQk0IYUiT2"}',
      FALSE, TO_TIMESTAMP(1751403363914 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'dianiyaz@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1751403363914 / 1000), TO_TIMESTAMP(1751403363914 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'aurorabaltazar2212@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'aurorabaltazar2212@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$IyCiHtJLkXOcDA==$4g2DNoG2pepBA1vwgeSFxHWR/IWelobq2ozcF34UeMuReZioPjM2xnXPBysrWACDXvmYDqDgLx8rroy2EYfyoA==', NOW(), TO_TIMESTAMP(1771799035483 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "BJlzqOBTVUgyrqTTXfpwsQkzV3q2"}',
      FALSE, TO_TIMESTAMP(1771799035483 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'aurorabaltazar2212@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771799035483 / 1000), TO_TIMESTAMP(1771799035483 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'quimicasancris@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'quimicasancris@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$Uqnrn5vzsmh4oA==$mtvbtIg31tzD4H8tkQhgAYHcb/3m2fDxFnl2IrAH2P3PaCePs52GYnXIjGB7UVwPImhMYy2Nxg1lT5VVZOkh9g==', NOW(), TO_TIMESTAMP(1772234047371 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "BMMygQML4IYqHJ6ThvMWqoEWLra2"}',
      FALSE, TO_TIMESTAMP(1772234047371 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'quimicasancris@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772234047371 / 1000), TO_TIMESTAMP(1772234047371 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'yadi_cancino@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'yadi_cancino@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$RbGPyEr3rLOGuA==$f7XHYIAuNvm8KFDyb5EKrc2PZTEFPmoCMsh+ebdA+Z8Y0eQ7IngurruYMEO0KVCCTgS6qrqJW+JDMY3sNn8zzA==', NOW(), TO_TIMESTAMP(1771286264159 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "BSCK9MwMgcYEEEwEBgOJYQmFQk33"}',
      FALSE, TO_TIMESTAMP(1771286264159 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'yadi_cancino@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771286264159 / 1000), TO_TIMESTAMP(1771286264159 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'lievanom72@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'lievanom72@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$MJTvtRjBUXYP7A==$O6nKIh2sSKPummJbizwM29diWlXdzf1DxIOaYf14eRlaTm8f1Rx4dlAjj5x5jMymikbUWNXpo+3qw3mQXlP0Zw==', NOW(), TO_TIMESTAMP(1776354391241 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "BSZNhu8qTrWfclvHfSrGHEXRFOw2"}',
      FALSE, TO_TIMESTAMP(1776354391241 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'lievanom72@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776354391241 / 1000), TO_TIMESTAMP(1776354391241 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'asb8411@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'asb8411@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$dHR2ykoxoeIpmg==$HiU6ZRoJu1xSzeW6iGAmp3jIzL4atBLbGILpiZDtWBYVeWycx6xDXylfOA8X/KcR+SHHYXwKFnKhqAmE7EuYkg==', NOW(), TO_TIMESTAMP(1752896159830 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "BSsu6zkGkocZ1AqpeXURia8Z5jd2"}',
      FALSE, TO_TIMESTAMP(1752895478774 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'asb8411@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1752896159830 / 1000), TO_TIMESTAMP(1752895478774 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'lic.manuelgzz@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'lic.manuelgzz@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$lHjG9rMY3AUA0Q==$ni/K7DjavHWBSaCV40TZXDFJaBtLeYOQkQWrS5Slw9lRB1EKeYXkR1Usm8j8vDZ+sGSwJ6zdIFk8lqRLuLFz0A==', NOW(), TO_TIMESTAMP(1752807144875 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "BTLa6RBGwIfJYtwh87vFEALNI3t1"}',
      FALSE, TO_TIMESTAMP(1752807144875 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'lic.manuelgzz@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1752807144875 / 1000), TO_TIMESTAMP(1752807144875 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'susanaramos211328@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'susanaramos211328@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$B1+K38eOHKbgsw==$cEpUugwhe7sgm4kuhFh79dShvvCVRGDTThp0EyKojAwlsps3T3s7nBoC1fWnT9vpO7nt8leHSg68QTWbOUWNdA==', NOW(), TO_TIMESTAMP(1771720142175 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "Ba2uSL3UETSS8SKs6jp1OOLBo3i1"}',
      FALSE, TO_TIMESTAMP(1771720142175 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'susanaramos211328@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771720142175 / 1000), TO_TIMESTAMP(1771720142175 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'yahirdeje@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'yahirdeje@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$1pK84YbEKUoDnA==$m6onO9P5CakAZoVcExwdVbokoF/ld2RauVoO2uJLU80rkUswT5unSNJorKJx9HShgfrikWPdaY2z8lVtZ2/1Gw==', NOW(), TO_TIMESTAMP(1773549285701 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "BcZnNnYKGVT8sBt5U8ssN2CcLZn2"}',
      FALSE, TO_TIMESTAMP(1773549285701 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'yahirdeje@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1773549285701 / 1000), TO_TIMESTAMP(1773549285701 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'laetcegv@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'laetcegv@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$Z17v/pC53INFNQ==$iI0MBIMx36CMilLICYJwxtVyp8QHSD5ng5QLbpbySWuYyXZpBasXpkHG4lsF0Loph9Jye/7Bk0hzf8W9yB9mpQ==', NOW(), TO_TIMESTAMP(1776224144509 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "BjRtzbCYs9QohNsjpfjBABhE4332"}',
      FALSE, TO_TIMESTAMP(1776224144509 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'laetcegv@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776224144509 / 1000), TO_TIMESTAMP(1776224144509 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'ggm-110@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'ggm-110@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$CX+khnB+z/RrwQ==$XmDi9T8VHZfv1gjfw3PZHUEl2uII++/Kb2p4HeQro9X/aug6nUDJMwm7Ln2YpuDTfKd0v7cvDeIg3+2Fp4okUg==', NOW(), TO_TIMESTAMP(1776274984147 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "BjrDldyUktN60A9oLjqPtJsYa6n2"}',
      FALSE, TO_TIMESTAMP(1776274984147 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'ggm-110@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776274984147 / 1000), TO_TIMESTAMP(1776274984147 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'meky1097@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'meky1097@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$AICt3a/hCNkfAw==$dzZqeilf1AX6KZ81Pn2f/kVFCrXStS/zFZmAcy3EPN5/GGHFA3cqduPcJHucU8NLDKH6eWi0YWKqS8AQEA62Zw==', NOW(), TO_TIMESTAMP(1777697027597 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "Bk7AS4pYpDeRpFdQpPr5Ey7YCxM2"}',
      FALSE, TO_TIMESTAMP(1777697027597 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'meky1097@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1777697027597 / 1000), TO_TIMESTAMP(1777697027597 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'castrocastrofredy13@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'castrocastrofredy13@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$Xqf/O2yiKemlZw==$CHhrCPLYXTUTtDFUf1C75urWc22wecm0QaSocEjbzH+4xDJ48a8dvUhb7DN2XRosj6VYP0x3bqoyEHioGzQ/vg==', NOW(), TO_TIMESTAMP(1772570791016 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "BlLRwgIKoAWTVDbM4vvtTKQ2vz63"}',
      FALSE, TO_TIMESTAMP(1772570791016 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'castrocastrofredy13@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772570791016 / 1000), TO_TIMESTAMP(1772570791016 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'lcar74525@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'lcar74525@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$RKpsXJ/ZocfwBg==$K4spl5FEgdHZ9jvsOfCDbW3CdG2P3K+6W8556Dd9fTOehZAuuAYIbnDITEJLDdlbpfIpvgrLeNkCakmPjS6Hgw==', NOW(), TO_TIMESTAMP(1771289698950 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "BoZzADcu4QTofxoW4PDNdQRdL303"}',
      FALSE, TO_TIMESTAMP(1771289698950 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'lcar74525@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771289698950 / 1000), TO_TIMESTAMP(1771289698950 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'cid_170597@live.com.mx') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'cid_170597@live.com.mx', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$dpawVQzHxBdHmg==$qK8JcysKnIKAH9rZucCONjvzL8MqVioK2hwC4iKh81/RrS76vhPigGdwNNBg1fQeOk9Y/zihXgqlF+Cs/N9ccA==', NOW(), TO_TIMESTAMP(1771274095353 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "Box5bkGDOYe11fvRYGxdTRthF6F3"}',
      FALSE, TO_TIMESTAMP(1771274095353 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'cid_170597@live.com.mx')::jsonb,
      'email', TO_TIMESTAMP(1771274095353 / 1000), TO_TIMESTAMP(1771274095353 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'luisantoniolp456@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'luisantoniolp456@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$TaBhVMOT+pLbVA==$tRcJ2s6ql9KPXwvZHaKiGRGYS5U5sJAuDI0+dV2O+awQij8X+BHgJmDmD2wHdA6YV7ifhEQkCfWu8zKAiTpvUA==', NOW(), TO_TIMESTAMP(1771276194596 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "BpLkiOGdB1Qm584Dp2YMMs2cXbo2"}',
      FALSE, TO_TIMESTAMP(1771276194596 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'luisantoniolp456@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771276194596 / 1000), TO_TIMESTAMP(1771276194596 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'erikcaos10@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'erikcaos10@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$LCtU2TRRDPt97Q==$ZDU0wicCv1BY6VhVQR7vKLG//fgJ2/DQlaDpDmZo2PTwBYDjuTR5/pxXhvTTsJ2Pvav38rlNEwerJcWh+yxM+g==', NOW(), TO_TIMESTAMP(1771280782159 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "BtqiWSlY5hNR6M3hI0J1ho89ChP2"}',
      FALSE, TO_TIMESTAMP(1771280782159 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'erikcaos10@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771280782159 / 1000), TO_TIMESTAMP(1771280782159 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'cursosdedecoracionelglobito@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'cursosdedecoracionelglobito@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$hpl4NWSJPRhqCQ==$OzFMXt1AWeFdLNFPiwOFKmVgOgdzJKRieel6nTSNoOaB3EgJ+/tb/TqcT5P+krjPELTOrB2RBrJuentSnJGmBQ==', NOW(), TO_TIMESTAMP(1757011142726 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "Bukr2wwprySabhAVss5NpOHrIvE3"}',
      FALSE, TO_TIMESTAMP(1757011142726 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'cursosdedecoracionelglobito@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1757011142726 / 1000), TO_TIMESTAMP(1757011142726 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'vag_abundo500@hotmai.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'vag_abundo500@hotmai.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$J7myXjyu23c9xw==$NGEmd9y6Jbs13zpciXDEx/gfIA9nC6EZVyoaa54ttGAEC1I1FZzptfMz5k2JwMzjxH6GUctzNBORP4St6okoPA==', NOW(), TO_TIMESTAMP(1764731000400 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "BwLb4pBUJwSOgrFArPIPLcUaing1"}',
      FALSE, TO_TIMESTAMP(1764731000400 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'vag_abundo500@hotmai.com')::jsonb,
      'email', TO_TIMESTAMP(1764731000400 / 1000), TO_TIMESTAMP(1764731000400 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'ricardolazi1977@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'ricardolazi1977@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$eous23ld//flEw==$GiqJmtt5GQmmgUqRr3qRNgFgS1dE6Ffrr7ovV4chbFKN9FL/Ap4C/q4qkuychvMmFmNXUff3OBYYlgVZqc6FGg==', NOW(), TO_TIMESTAMP(1775953115650 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "C3E7UgGMJ0dcKDxWosYDWu4KZKt1"}',
      FALSE, TO_TIMESTAMP(1775953115650 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'ricardolazi1977@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1775953115650 / 1000), TO_TIMESTAMP(1775953115650 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'sofia.trejo10@unach.mx') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'sofia.trejo10@unach.mx', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$/0gjkwvvm9+Gvg==$gsq78VCjXSfgtqafikUsRy/k/Nl37mBdr0bBXM5QVaxPM/YgdDfQuAHchsVu9Vgn5m9zk8BF7GUhBRFw6H9+Tw==', NOW(), TO_TIMESTAMP(1775242798200 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "C4M4MAkhTOOY3lsgNW6ZFD3AVsD3"}',
      FALSE, TO_TIMESTAMP(1775242798200 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'sofia.trejo10@unach.mx')::jsonb,
      'email', TO_TIMESTAMP(1775242798200 / 1000), TO_TIMESTAMP(1775242798200 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'srcarlos0310@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'srcarlos0310@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$ni96aIfP2PtMkA==$kCcICqixyNyBIbX4eWUELPFVbL1pCt5vv15Gq/0xwRs7YP5R/Dql7MlvHas3wpQDLbP2v2GR2TbQYHsJeXkVww==', NOW(), TO_TIMESTAMP(1776225654672 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "C9m1r3IHWCTTF9cIsvRtGLZXx932"}',
      FALSE, TO_TIMESTAMP(1773013160663 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'srcarlos0310@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776225654672 / 1000), TO_TIMESTAMP(1773013160663 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'telita.2522@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'telita.2522@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$QxGTy9psO0qd6g==$9Vly+aLDhrb75lHNw37h+hPDfiNxDLeKaLVuTdpWn+tTCIlMYZG3vza4BuLF+MjQOQZauC6MFzd7rd7EYGMX6Q==', NOW(), TO_TIMESTAMP(1761855873512 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "CAHropi2e9OYNbADaGyKSyWG5192"}',
      FALSE, TO_TIMESTAMP(1761855873512 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'telita.2522@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1761855873512 / 1000), TO_TIMESTAMP(1761855873512 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'abarcavazquezangel@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'abarcavazquezangel@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$tPHy24V77Kd21w==$1UqUEADOufbA4+lHOMNtDsNGqpKrWG1zZX7bPPKP1vMKWPN7ofv+h66ytb0ptStr5nTjye7pSJrJdAs+enaPmw==', NOW(), TO_TIMESTAMP(1771553040908 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "CE1LLHOAu4WkJxLVMIWtxyx4hIT2"}',
      FALSE, TO_TIMESTAMP(1771553040908 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'abarcavazquezangel@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771553040908 / 1000), TO_TIMESTAMP(1771553040908 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'mezalisbethjissel@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'mezalisbethjissel@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$1q9I+zFqjTngww==$G586iWq1wlYNBxRMvEk/hFn2VUMmhx1E+5+jz4LIl/oWthJNJLHTZzxL7/yjsRba6AVCVt+XjLdUPSvd1BLfaA==', NOW(), TO_TIMESTAMP(1772861572397 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "CFMHn3s0f6QJceU5bq8qKsrLoEF3"}',
      FALSE, TO_TIMESTAMP(1772861572397 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'mezalisbethjissel@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772861572397 / 1000), TO_TIMESTAMP(1772861572397 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'gilberto.feb80@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'gilberto.feb80@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$p+uQkDo60wzdDw==$e0ZVYM4mPRZ3CuDNCnoljGFEP4FqjaWhCUc04x9ivXw/kF1erFhKBP4q9rtCL63RmuTpZlRGosDzg6V1hGAWuQ==', NOW(), TO_TIMESTAMP(1772405650532 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "CJTyxJaPc5aGzSYn6ynTWbEeb2a2"}',
      FALSE, TO_TIMESTAMP(1772405650532 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'gilberto.feb80@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772405650532 / 1000), TO_TIMESTAMP(1772405650532 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'erca02@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'erca02@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$PVrzyhWAGZICfw==$D8HpDB1yty1e5E9OQ2fAYxBvzcQQj+wxxgATmVLLTYR6JdDKOz33g7Xak361kWufKe+LbIywsX/psD5aBUrY2A==', NOW(), TO_TIMESTAMP(1744674858894 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "CKqlZSDcQtaGZnhMmBT3ltXHmlq1"}',
      FALSE, TO_TIMESTAMP(1744674858894 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'erca02@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1744674858894 / 1000), TO_TIMESTAMP(1744674858894 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'danieladiaz100301@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'danieladiaz100301@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$aD4yzdAm0GkouA==$zdQ7Pm+0OkPecx3QwKWz5RfncmOMPCoXbgkoEnXffrUnVB+A4yuowxOQirWdyb6EeELYD8RVSdpEhfXXJxv6Iw==', NOW(), TO_TIMESTAMP(1771280602417 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "CRIQswAjUbTPBqB2avqnq0a4fMt1"}',
      FALSE, TO_TIMESTAMP(1771280602417 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'danieladiaz100301@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771280602417 / 1000), TO_TIMESTAMP(1771280602417 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'moisesestrada85@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'moisesestrada85@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$W4wRRHiF8Arizw==$Xm+mv57NWakKIdlRzaubNnAz6FwWWwTpGQnvUzsxVMCAwLWYfNcmj96ZhHp4KKySIdMAY7L/ZVlz9S8qfg+xIg==', NOW(), TO_TIMESTAMP(1774067445438 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "CTOAGnVMJBfV70FOTuifi8aPRlh1"}',
      FALSE, TO_TIMESTAMP(1774067445438 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'moisesestrada85@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1774067445438 / 1000), TO_TIMESTAMP(1774067445438 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'roberto1974tc@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'roberto1974tc@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$4jNf2AlAVmqq4g==$RRHPUgNXhdc1y3Qdjw44IFpCbL8i6+1+FMCgJdqpYOcv7/FsvIKqhgBwPi6/a9LAGOOcYB942Fvq1now5pk4sQ==', NOW(), TO_TIMESTAMP(1752943343159 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "CTin2szXtaRB5B3a0vmXszUgrDh2"}',
      FALSE, TO_TIMESTAMP(1752943343159 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'roberto1974tc@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1752943343159 / 1000), TO_TIMESTAMP(1752943343159 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'rogelio260789@outlook.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'rogelio260789@outlook.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$cCpObQqMzLoLFg==$/OD4piY/DS88eqJIB7Z+9oTAseudBwiyYBz1hGtmIYN/FgzljG98dg/DXWDO2lTrVHzIG2fTSq9ywOXviHGB5A==', NOW(), TO_TIMESTAMP(1771286105768 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "CYNVDg1pOCMqwJochuvdiSkKqaM2"}',
      FALSE, TO_TIMESTAMP(1771286105768 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'rogelio260789@outlook.com')::jsonb,
      'email', TO_TIMESTAMP(1771286105768 / 1000), TO_TIMESTAMP(1771286105768 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'zaima3711@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'zaima3711@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$NQBct1ROfGpcOQ==$o6qcRMAKR/HPikfXK9NMMzxqGAXcsobTzcArS9/lBoNgJuBy529u93E3m/57aBFQxW+gaaYU1CDkUon8PI6MUw==', NOW(), TO_TIMESTAMP(1765482226874 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "CZKYymIfzMOxS1u6LUhrkbKU1Ms1"}',
      FALSE, TO_TIMESTAMP(1765482226874 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'zaima3711@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1765482226874 / 1000), TO_TIMESTAMP(1765482226874 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'rafaelpilicastrodaza@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'rafaelpilicastrodaza@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$HW19vGCP3ZIXcQ==$DOmgNQh1gnUrMPBjC4fqxVmFExPq4+hf2bxzYbkpvlEJnio6umaILhBsjT8z7ut8lFFhgq8BjrvVur0BLVafVw==', NOW(), TO_TIMESTAMP(1771507538316 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "CfGvpVok1NXVw9KMLTjVPa3ZBt12"}',
      FALSE, TO_TIMESTAMP(1771507538316 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'rafaelpilicastrodaza@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771507538316 / 1000), TO_TIMESTAMP(1771507538316 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'javimalpik@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'javimalpik@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$J3zXPpqBGg/B6g==$oGvD3kK2rZ6r83t+jqWv6CpM6WuPtaSQWCVGKDPIyyhHwGZELyrO8KQCr5o8+tmwe+GZJoX+iRu68LMIOjDXzQ==', NOW(), TO_TIMESTAMP(1777098222999 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "ChjAazkqqMQa1C5XRaxosOCj8jn2"}',
      FALSE, TO_TIMESTAMP(1777098222999 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'javimalpik@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1777098222999 / 1000), TO_TIMESTAMP(1777098222999 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'isa_88_26@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'isa_88_26@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$SWoqo+OBjjtJ0g==$WsliXArcffkXqNUT0appAvYtvntqKgbXaLOu7SrhhfVZBeed9dXYU+/XD4ojA6CLJly0ip1JuuEJCxfdRg/HGw==', NOW(), TO_TIMESTAMP(1771301205100 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "ChzVqkCMc9dHUrU0Lmspe1YRvw12"}',
      FALSE, TO_TIMESTAMP(1771297667671 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'isa_88_26@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771301205100 / 1000), TO_TIMESTAMP(1771297667671 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'casalara8a@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'casalara8a@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$99ohiNsZU3Vqxw==$j1gx3VsMnQmv1f3aYggvQV74GVEhvjy/x4wTrrMuy2QwRzBTwGQerDnUwyGx/epvz4/NiNEg0mfmo3S2A0KU9A==', NOW(), TO_TIMESTAMP(1772685662295 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "CjYHkoqqU4O1iSGwnguGU9AyO0y1"}',
      FALSE, TO_TIMESTAMP(1772685662295 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'casalara8a@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772685662295 / 1000), TO_TIMESTAMP(1772685662295 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'recinosmiguel14@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'recinosmiguel14@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$w1k9VorDxK7dMA==$gu/IYlc2fRM5aFIeAfxwFLK0zoSmgjerMN5kw6Y+qtc52P9m3LEIQZ8v6t7VT+JyPG7nrcAdU89Hiz7LX6yfNw==', NOW(), TO_TIMESTAMP(1771275210571 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "CoukEG56zrVX6UlwW0nwTbh6GlN2"}',
      FALSE, TO_TIMESTAMP(1771275210571 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'recinosmiguel14@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771275210571 / 1000), TO_TIMESTAMP(1771275210571 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'chary120388@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'chary120388@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$m5xZecCr2eDs+g==$m/KfhA0lE7Zq3cZHEu+6eh+AbtunQfOWWahauhG2sHrTf+hnl4dp8IWYRNk9b7j2xv5EduMma4/+c7z0wyucqA==', NOW(), TO_TIMESTAMP(1771677808035 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "Cphv7fOZPtZ2G6ESQt3JYCT1LpC3"}',
      FALSE, TO_TIMESTAMP(1771677808035 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'chary120388@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771677808035 / 1000), TO_TIMESTAMP(1771677808035 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'cacho.77730@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'cacho.77730@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$WuXzTG/sPVDX+Q==$o6yYnPmDrV/aIfK7P7MxxxVzjStF27JL0qUWyqD/vi1Fl2N7EztkDTroK3tEYzl51NdRTkviiALys89bWEUTcQ==', NOW(), TO_TIMESTAMP(1753459448073 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "CuhwNgmwZ6YVu6nnj8UzP25VZm62"}',
      FALSE, TO_TIMESTAMP(1753459448073 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'cacho.77730@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1753459448073 / 1000), TO_TIMESTAMP(1753459448073 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'toalaeduardo676@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'toalaeduardo676@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$xakgDJvFqviabQ==$R3fWhTdYF4aZKQ2pQbdgSPPJzsujj5amZvs/bJbzKr1rAiLfjDmYaaNEIlhdZBG+q6Q4gR4K+nGiK/e68gaZEA==', NOW(), TO_TIMESTAMP(1778201868327 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "CvtlSS3ZTsZMpALjntmI4TplxNE2"}',
      FALSE, TO_TIMESTAMP(1778201868327 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'toalaeduardo676@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1778201868327 / 1000), TO_TIMESTAMP(1778201868327 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'radiostaxisbodegaaurrera@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'radiostaxisbodegaaurrera@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$O+uSTO1Af+6Lxw==$s8pvuOY8eO6ZM64iIkHeSQOhgufrEnsJ2SgN1VXJNUK9rlpt5GWcrqxLEY1BSfVVhVogIFRA+aMMZJ94U6e8qw==', NOW(), TO_TIMESTAMP(1764249130252 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "Cx7B86g46GdMONqnZ6zUdz1wMjV2"}',
      FALSE, TO_TIMESTAMP(1764249130252 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'radiostaxisbodegaaurrera@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1764249130252 / 1000), TO_TIMESTAMP(1764249130252 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = '300587alex@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      '300587alex@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$vyp/ujUNWYKsEw==$dUbJ3LDrQVc5fuj341I0SftD4Yz+2SsJ08bJkGND+2/MHhnpMd+T+D467M+jv0Er7N3KfE74gWJ3dkdCJ4b8Qg==', NOW(), TO_TIMESTAMP(1774842257160 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "Cy6oFiGEi9OhYgliX6X8SaISXwh1"}',
      FALSE, TO_TIMESTAMP(1774842257160 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, '300587alex@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1774842257160 / 1000), TO_TIMESTAMP(1774842257160 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'dylanpatch@rocketmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'dylanpatch@rocketmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$otomQt4JbIAmFA==$zMUE9WgV2KfXNIcUMVJiSblNubeEqlMbfJ5bju3IeJmx6i/WDmbfwWha1po+C97purdqMH0YMQjDr+7V9O8+hQ==', NOW(), TO_TIMESTAMP(1776016144698 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "D3qfjEPo9teelbA6YYOXsGe1PTk2"}',
      FALSE, TO_TIMESTAMP(1776016144698 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'dylanpatch@rocketmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776016144698 / 1000), TO_TIMESTAMP(1776016144698 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'berod2430@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'berod2430@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$u/SFekjMrxCUzQ==$0CaejLZnvC8qLAbrAUtyqk1Y8F+JZschZp0PiGwL4GiPQmVx27LYKxHaZConLYPatMjbytxWe3cuIKW0WqPx3g==', NOW(), TO_TIMESTAMP(1753557999193 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "D8nql0K2gtQPY2xs51uVj478lZ52"}',
      FALSE, TO_TIMESTAMP(1753556472616 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'berod2430@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1753557999193 / 1000), TO_TIMESTAMP(1753556472616 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'angelesgabriel73@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'angelesgabriel73@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$Dw0dRIbMZ8kmbg==$/5dBSnsquUL4eFGzguWq1ZYI5UTiNEej3HlIsXR/cKgyYStltr1KayYpN0852rjWKsx16Fi+Itxq4KWrb3XRxQ==', NOW(), TO_TIMESTAMP(1753696654016 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "DCOHdk9jd1YsPCD1n2wZlkuSDxk2"}',
      FALSE, TO_TIMESTAMP(1753696654016 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'angelesgabriel73@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1753696654016 / 1000), TO_TIMESTAMP(1753696654016 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'vazquezlievanoramoncrisoforo@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'vazquezlievanoramoncrisoforo@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$76fBnI2/XNNdHg==$nYVhG/DRf61ruRm/pcN9FqH7drpzQWJSDqkzwUt+OYKnrAUthcIVxiO6FnOin/tnPl4IQhetxYnJ+47B5/N5TA==', NOW(), TO_TIMESTAMP(1771359336788 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "DFlVCeTK9BM2usvgoRzfawtpSBo1"}',
      FALSE, TO_TIMESTAMP(1771359336788 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'vazquezlievanoramoncrisoforo@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771359336788 / 1000), TO_TIMESTAMP(1771359336788 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'mart1n.lex00@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'mart1n.lex00@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$FT+cetSwxE+Wlg==$aCxBfQKaeE89pbqCyHIXRu6ntSPWgYvH72KmTQ0TKdYZ3QQ/EQ54QskuiKT6hNcQB+cNT1brS6oAXs1sVEy31A==', NOW(), TO_TIMESTAMP(1778725936340 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "DKUMmgfL5nbp9NpLfe3fiHLlJ7l1"}',
      FALSE, TO_TIMESTAMP(1778725936340 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'mart1n.lex00@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1778725936340 / 1000), TO_TIMESTAMP(1778725936340 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'cajijaimelda@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'cajijaimelda@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$XgEMwROpa8B4ig==$cNKq4usqibqG0Ww2fSssT2MJcpaRwR93FTrciCwrQwlYiyZikykxe9LaLK6x71Jf8flMZTnDhPJdUrTR4Umd/Q==', NOW(), TO_TIMESTAMP(1778018927243 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "DLFXqDqDTKNylXCjg9CA0NRWA2z2"}',
      FALSE, TO_TIMESTAMP(1778018927243 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'cajijaimelda@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1778018927243 / 1000), TO_TIMESTAMP(1778018927243 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'anadulcerincongonzalez@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'anadulcerincongonzalez@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$ZW2gky8pIPAkng==$MCeF3hAHzfpz6VUDu2fUGBI7w2kMfsDNz+jgWe4rD5lcW9s2/gW8DpvsBzBDMCrlJuSzl9ODdgCxPKW+nrKQdg==', NOW(), TO_TIMESTAMP(1774793235668 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "DQ5z8Ti9shhTBKlx053B6GrZrdj1"}',
      FALSE, TO_TIMESTAMP(1774793235668 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'anadulcerincongonzalez@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1774793235668 / 1000), TO_TIMESTAMP(1774793235668 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'maxis-1234@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'maxis-1234@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$JHKjo9DXLNDLTQ==$YCa0bAh/9zFE0JZlqXIaUAV9ZrQGB8Yekel01hKW4OjlVSYpKYRfCc1s76L/59X92myQeFK2V86eCuSD3re3Lg==', NOW(), TO_TIMESTAMP(1772907868640 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "Da2P9y8mUvW01VCWbRz5m4U9e2r1"}',
      FALSE, TO_TIMESTAMP(1772907868640 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'maxis-1234@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772907868640 / 1000), TO_TIMESTAMP(1772907868640 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'felipevazquez022490@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'felipevazquez022490@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$x8UvZFU5FSnsUg==$JKMw6r2MDMhBA39DlDYVnCA4tARiK8I6DKt38dq1VUpd2VXKg875ya8TNoFrhXTRzPn5rfMbrdxrtnbSH9cICg==', NOW(), TO_TIMESTAMP(1771899880405 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "DbjG63tJpaaPaNQ8nP5tON4CfNZ2"}',
      FALSE, TO_TIMESTAMP(1771899880405 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'felipevazquez022490@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771899880405 / 1000), TO_TIMESTAMP(1771899880405 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'rogeliopedraza4@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'rogeliopedraza4@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$ytICh47MtioGtQ==$5jcN7Y01KapzdEy7vuw5IL6ktheC5GIA4qVHVaBrF098NYsC1ZEb8qXJdoQfNnGIzQDRa5yMkJCRVN21URNSUQ==', NOW(), TO_TIMESTAMP(1769829385844 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "DdkcmXiXPMM277HUE7qa21KNcMM2"}',
      FALSE, TO_TIMESTAMP(1769829385844 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'rogeliopedraza4@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1769829385844 / 1000), TO_TIMESTAMP(1769829385844 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'alejandrobautista445@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'alejandrobautista445@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$cC4+g6tIOTHf/Q==$Rv1OmzwbBzjOivWKgsildPT5lBmpQRrv3Gryjxhzhpp0nhakykXF6fVFfC+1gTLeosr3tqd8LE+vR3K/Bzpvtw==', NOW(), TO_TIMESTAMP(1753439560977 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "DhOeISGuwvQby89hAMArSHwkNBG2"}',
      FALSE, TO_TIMESTAMP(1753439560977 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'alejandrobautista445@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1753439560977 / 1000), TO_TIMESTAMP(1753439560977 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'galleraramos5@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'galleraramos5@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$KHG0HwWxzSALGw==$UnYxovu0Ae+msPJo7hPSYMYsgsEkch/43FI0qXziwmhoh7zxu6YUYMIbhg6PntxRrifvW7i9+qVh6PHoiC85Sw==', NOW(), TO_TIMESTAMP(1771468043152 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "DqJti0I4aJhGH4r8lxqXYok8vqp1"}',
      FALSE, TO_TIMESTAMP(1771468043152 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'galleraramos5@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771468043152 / 1000), TO_TIMESTAMP(1771468043152 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'gomezgeovany007@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'gomezgeovany007@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$9XRdXnBCWVRLrg==$cHPdjNjAQCiFKJRRGKljhLiKlTSp3oYDLRGmkOdtdpV3DaCeRgzT6X+ngalLk031JSYsVHwBwedlKUD3heoJkA==', NOW(), TO_TIMESTAMP(1771534543267 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "Du6kOTKBHdhjvfgmkHGfzSynhkG3"}',
      FALSE, TO_TIMESTAMP(1771534543267 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'gomezgeovany007@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771534543267 / 1000), TO_TIMESTAMP(1771534543267 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'jphfgl@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'jphfgl@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$DwURN/iW8nMsbA==$awx76tz/3LFdXubrQG0Da7B+4tdkobgLr1aM40WhNkl2zRzKtI+pavOdePtLE5IaMi8P3kXKJ/tuaKBDimmTfQ==', NOW(), TO_TIMESTAMP(1753485582324 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "DvEpzroNtJVZMteOr1XC6ZI2XOD2"}',
      FALSE, TO_TIMESTAMP(1753460909907 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'jphfgl@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1753485582324 / 1000), TO_TIMESTAMP(1753460909907 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'latifaidoudi89@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'latifaidoudi89@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$ExGmO764R4/coA==$wazs7WocdvxLLPBT+PS77RRDSDFRc8uX/S8tcbgikEo/rdxaRRxKg9kPdi6ukAGU8n0307LDZb26Max7v8saCA==', NOW(), TO_TIMESTAMP(1767471119350 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "E2OuC7PZ3WZ8hWzxXjzSTgbXHKA3"}',
      FALSE, TO_TIMESTAMP(1767470762841 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'latifaidoudi89@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1767471119350 / 1000), TO_TIMESTAMP(1767470762841 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'arlethf2802@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'arlethf2802@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$+hH/TDIhr00gnQ==$BmXvOmBf25QREZp1ZlF3bOuhfa5kYlYoD/9stIhg5UvXsA4AqWvwxyjiSW0QFwRY3lvhk4GhJMzhUQ/fJ0Xn1w==', NOW(), TO_TIMESTAMP(1771705035861 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "E45Gya1OPEYxKalkBaOslnLw0O73"}',
      FALSE, TO_TIMESTAMP(1771705035861 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'arlethf2802@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771705035861 / 1000), TO_TIMESTAMP(1771705035861 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'gladysperezra@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'gladysperezra@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$y9loZj1lwaqiaQ==$g4NWYgoHJf4D6tVlRK59FM2G+i06xZEZ7QUloOxLw7XiAgxrKC3F+o5OgSoHxO1X+tZ6678txyhQiKqRqrEo2g==', NOW(), TO_TIMESTAMP(1771281628283 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "E5g1SHCHnGg5qUlLTOTzjjTM18w2"}',
      FALSE, TO_TIMESTAMP(1771281628283 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'gladysperezra@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771281628283 / 1000), TO_TIMESTAMP(1771281628283 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'marusiapolam@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'marusiapolam@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$uiI/n9N50ZWd0g==$KFOHXqSwcdEY0iOPXhhr54TXruK8VBTOflQaFzy8pUxu8zv7X2ebEyvTc+Mwr4VmJzVUnIiDEa5EGdtYhwagyw==', NOW(), TO_TIMESTAMP(1771283135655 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "E6G53IUk2JgJbdv7cbr1UZuIv1B3"}',
      FALSE, TO_TIMESTAMP(1771283135655 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'marusiapolam@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771283135655 / 1000), TO_TIMESTAMP(1771283135655 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'dindaroff@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'dindaroff@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$e7H/8qdPewaoug==$5WmbZILfXwgwzYNdgU2Sx9fD1z74NSPe638Xnur7fgwZ+2ERNBmVKjcTWLwQbhiunbS8d2ksYxf9rVm8HW8hYQ==', NOW(), TO_TIMESTAMP(1771281394301 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "E7R9xmEmgdZPUANACTusYjHAyQV2"}',
      FALSE, TO_TIMESTAMP(1771281394301 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'dindaroff@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771281394301 / 1000), TO_TIMESTAMP(1771281394301 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'genarocoronel917@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'genarocoronel917@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$I443AXuqtiWpRQ==$mslOd2tzNX9235lDO0C7oJO1jf/UFZ2VvIxVZtJYEgKMyfNjBwhbKN7BKmvii+RD1maPDqO9CD4oy7EZD2hVzg==', NOW(), TO_TIMESTAMP(1776224128915 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "EA79GAY3MvOJgOFYwvsGCrcTH2s1"}',
      FALSE, TO_TIMESTAMP(1776224128915 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'genarocoronel917@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776224128915 / 1000), TO_TIMESTAMP(1776224128915 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'totick14@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'totick14@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$vMAleVodBNkZPA==$Fxnvo9efE14kSKc5oxKBXO8TDgJST77HlwstF02omipPztmzJVSHnNuHnOxf0tcFANuOVPrKgaiNTM+gxOzuDg==', NOW(), TO_TIMESTAMP(1774069822293 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "EBxIBLnhA5Y6AKxowkUIJpEb1dE2"}',
      FALSE, TO_TIMESTAMP(1774069132660 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'totick14@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1774069822293 / 1000), TO_TIMESTAMP(1774069132660 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'javierpz582@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'javierpz582@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$r2CnHO0A3I73Wg==$r/WGZrwOy7G1QIM07HEsKZI2Lob1wCrHdaa6YdmPjBdRAitTilmr38BFo2/Bynyaq7mHuXrktBiKJmqfcCFgtA==', NOW(), TO_TIMESTAMP(1748976877158 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "EClbdswjBfNox1DlBJyZ26xdpGy2"}',
      FALSE, TO_TIMESTAMP(1748976877158 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'javierpz582@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1748976877158 / 1000), TO_TIMESTAMP(1748976877158 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'osamayoa5@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'osamayoa5@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$bqBXblGPYgARHQ==$I4ECcuGiiNQi/VqJIZdUSTNitD/F5VpeYY5ldmIGfDyLcdTLdfzfDnA+yCNkeOPDlRrH5BxQq87rV+qLaz+7XQ==', NOW(), TO_TIMESTAMP(1779205365963 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "EDL3OgJTDiYXEhVzA4CTAGpn5Ue2"}',
      FALSE, TO_TIMESTAMP(1774202909410 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'osamayoa5@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1779205365963 / 1000), TO_TIMESTAMP(1774202909410 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'ed0248567@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'ed0248567@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$/DtMrl9vdlxmlw==$5pi45eycxWVxg1Wm80N8Ebz82dOVh0ncLAVtV1iBBPbkEe18Gl/ekuJdCmJ1tMkYoQSsEsvy6rcwdeNjIPSODA==', NOW(), TO_TIMESTAMP(1774183922527 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "EJ8r0mZDANSSl0AP8nD8lyy8vww2"}',
      FALSE, TO_TIMESTAMP(1774183922527 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'ed0248567@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1774183922527 / 1000), TO_TIMESTAMP(1774183922527 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'alejandroespinoza1022@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'alejandroespinoza1022@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$Msq+wRUSu+RG+A==$wokTdVpo73VDl/GvYqCCvs7rNaxo40AzjYH7Tx4c8x/pkn6gMaoPbZbNbuH5fsobhFFnwxuWJbM+oVPYhar+WQ==', NOW(), TO_TIMESTAMP(1766525558019 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "EKhpaYzzrsMVlakqq9KOCmlktZN2"}',
      FALSE, TO_TIMESTAMP(1766525558019 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'alejandroespinoza1022@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1766525558019 / 1000), TO_TIMESTAMP(1766525558019 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'curbieta86@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'curbieta86@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$qQ5n1YTMYSBGkg==$4FWum7Wx1qYvOlvDS4Ztc7Fmrg7Q4qa4+gNqKvlJxwMn7hWxmBHC2B5Jvp5+zddKmBeiq2mnsAtNgtxk0p8xTA==', NOW(), TO_TIMESTAMP(1773827757976 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "ELubQyZ4yeRad8LEZzFM8nLBA3R2"}',
      FALSE, TO_TIMESTAMP(1773827207536 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'curbieta86@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1773827757976 / 1000), TO_TIMESTAMP(1773827207536 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'alexgomezjimenez1991@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'alexgomezjimenez1991@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$tum7nGFFHW+5ZQ==$1lUaaDAAzWJLc5GciAXKNF4SWHk6gKEa8K3TgsHMoplj2L6NIy5dZFjkB4ZRaNcLsBwGAlh1tzpbk/sdvEgJWw==', NOW(), TO_TIMESTAMP(1776218873174 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "EMdTTGzzb2hbskH2PV10qKoZwkm2"}',
      FALSE, TO_TIMESTAMP(1776218873174 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'alexgomezjimenez1991@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776218873174 / 1000), TO_TIMESTAMP(1776218873174 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'eduardoespinozakramsky@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'eduardoespinozakramsky@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$g9psn8t8n80lmA==$wTfiSGqvqKhK2CAB4uBbseaMwFr2Eg8+hOJ511ksKFGsIxjoOU4UihbA4G11cB87ffF5TirtszrWdeQNNbc1UA==', NOW(), TO_TIMESTAMP(1777068526978 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "ENHP2foab4WEPToUie3UgoXhTl83"}',
      FALSE, TO_TIMESTAMP(1777068526978 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'eduardoespinozakramsky@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1777068526978 / 1000), TO_TIMESTAMP(1777068526978 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'adano1.202@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'adano1.202@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$RlMNoF5cJbtAOQ==$uLw2eEkXCNkOv22vXtzJ3wFs+VrOIOa2HQvvPjmhc7P0NgPCBsxB9T93eNwYj4jzUR582D7qwCt3SSrXNeXX9Q==', NOW(), TO_TIMESTAMP(1772298963873 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "EO0bKdxUgLSH2e7vfSQ3XWJkv9d2"}',
      FALSE, TO_TIMESTAMP(1772298963873 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'adano1.202@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772298963873 / 1000), TO_TIMESTAMP(1772298963873 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'vazquezpablofernando8@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'vazquezpablofernando8@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$kdGGXqRF82eJJw==$Kdi7X+TFKLliRLkDlki0ZVFWB8stMJGejA9qdHt6RByNNz61HBXhz7y5dRsIxtL8WWr5XRJEVaAOuj8eQd5VqA==', NOW(), TO_TIMESTAMP(1776299916249 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "ETPoM1drWzaNIER5XnQTFDZlOHP2"}',
      FALSE, TO_TIMESTAMP(1775070660087 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'vazquezpablofernando8@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776299916249 / 1000), TO_TIMESTAMP(1775070660087 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'ceydi97@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'ceydi97@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$+yDpBbj6WPqwDw==$bIlOIac87toxYEM17NUd0YY7JjCJFpb1wao/Q62irSnCtoHlNkblD5YUliqSSumUMmo91QQgwn/seEgdNgFezA==', NOW(), TO_TIMESTAMP(1773038191095 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "EdR6uNqPz7dKR0GmwgTMJ3gwXr23"}',
      FALSE, TO_TIMESTAMP(1773038191095 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'ceydi97@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1773038191095 / 1000), TO_TIMESTAMP(1773038191095 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'briandraw96@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'briandraw96@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$fYVF4X3l8j2srA==$7E0xaqY87vwErqYmHCRF5381pd9KYZyQLKWtpqb57mvQTFDPT3XnSGFSgxxqlPmjoDj0Gf2Wx2oQoHJXU/njoQ==', NOW(), TO_TIMESTAMP(1778383462349 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "Ej97Ru2uKZVBycGpWXWlmdMCix02"}',
      FALSE, TO_TIMESTAMP(1778383462349 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'briandraw96@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1778383462349 / 1000), TO_TIMESTAMP(1778383462349 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'melloprime12@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'melloprime12@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$5nhGlqsuk2KF+Q==$NV++kx/Dhyztm9niBFs8D9vDtW/vVC4SmKc5818H9Jf3BVxOHNqITfMNzF9REgQ8sadMhqyYgfUwkVl/wrFV/A==', NOW(), TO_TIMESTAMP(1771303694909 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "Ek3rzYqx4UbhCFuddI4tGb7UFVw1"}',
      FALSE, TO_TIMESTAMP(1771303694909 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'melloprime12@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771303694909 / 1000), TO_TIMESTAMP(1771303694909 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'daniruhe11@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'daniruhe11@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$xStYM+k0rPnxzQ==$7gF29dJ4jnINRki5zwHEPmTB9N1dCuibG9G/qtr0c5StPO+csfZPyjnk1BdBrhxSB4WEjLNqkMstCkkyUJbu7g==', NOW(), TO_TIMESTAMP(1776218164322 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "EkumEPI9CLZ1viAqvPl5OMucXaG3"}',
      FALSE, TO_TIMESTAMP(1776218164322 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'daniruhe11@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776218164322 / 1000), TO_TIMESTAMP(1776218164322 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'rodo.guero24@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'rodo.guero24@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$YzTAVWPq1M4vtw==$j0k2oJOIfgK3OwAkxcvq+jFCzqWwCfKqFlVOJV7SrDQyeW9K5ax/MhEhWwZFN5TQ38BecWo1CzDHI4TM2Eagww==', NOW(), TO_TIMESTAMP(1771300313087 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "Enn9evNLXcPk0h2MPs2moqzwRsr1"}',
      FALSE, TO_TIMESTAMP(1771300313087 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'rodo.guero24@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771300313087 / 1000), TO_TIMESTAMP(1771300313087 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'rasec87lara@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'rasec87lara@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$8h7QroPq4kYzug==$ecpC2zOBE3nP8AKwXn+DfElB+rO9FcZ3By4U1yjbIm78a8Sxwui6iSnGkeeohfBxH6MfVu42DbdueHP5XfpO/Q==', NOW(), TO_TIMESTAMP(1769457357824 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "Ere0wP32LWQBjP1z8MKjJ4F2UZm1"}',
      FALSE, TO_TIMESTAMP(1769457357824 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'rasec87lara@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1769457357824 / 1000), TO_TIMESTAMP(1769457357824 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'sornelasp86@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'sornelasp86@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$IZ2xlBHaDqMaEA==$l0yD3Di3civlo8FlaCANdPV/zA9cEWxYwuH/0RxfECL1HBV6TvHxbHPmSTh2x0jWEZT0oW/scDjWEPor6nK85w==', NOW(), TO_TIMESTAMP(1772994717256 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "Ex1U9jiT5zYlYPeRaFd1aJrya5n2"}',
      FALSE, TO_TIMESTAMP(1772994717256 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'sornelasp86@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772994717256 / 1000), TO_TIMESTAMP(1772994717256 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'o93lah88@outlook.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'o93lah88@outlook.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$v78CyEWsoOPXig==$2MbQxmPTThm4crilVmA6Mo/pJEAWNYdv1kMm2mZ9IBVJvx1mcQiA66TSKvI5WrXlK9Sv+SiVY/DHhWtUbFw+Vw==', NOW(), TO_TIMESTAMP(1771276601703 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "ExH6lWjdZ5ZL3OqWoaYkzoxtIB82"}',
      FALSE, TO_TIMESTAMP(1771276601703 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'o93lah88@outlook.com')::jsonb,
      'email', TO_TIMESTAMP(1771276601703 / 1000), TO_TIMESTAMP(1771276601703 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'vidalcavazos@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'vidalcavazos@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$HXYf3wwthK3QWQ==$p1tvCm0OTy4b84sF8yIad/uT53dQHl59084mzMCKEL544srW1hUUnn18caG41feSmB178fL5dhn+NeTxBF5IHw==', TO_TIMESTAMP(1747097282701 / 1000), TO_TIMESTAMP(1776274804368 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "F2jtbU6bW4dQ0XkX6xUs0aCenxH2"}',
      FALSE, TO_TIMESTAMP(1747097282701 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'vidalcavazos@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776274804368 / 1000), TO_TIMESTAMP(1747097282701 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'lauritha.santiz@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'lauritha.santiz@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$ubHwjKwxm2Fqmw==$i5Q4p5ssn+Jmdcqe+s/g+zCzHTqvKBbY7ztNMniQ8Aj3rS/CHDN75Xin86muLmkLWv1GZBx//fE0u890AsNhCg==', NOW(), TO_TIMESTAMP(1774764546401 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "F3a0dJHzCpPF4n1OC6o6DXhbtTV2"}',
      FALSE, TO_TIMESTAMP(1774764546401 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'lauritha.santiz@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1774764546401 / 1000), TO_TIMESTAMP(1774764546401 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'garciabalcazarv@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'garciabalcazarv@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$remxfFnMDGxXdg==$1Fu3dsdwaIZtFHyF8pldIwO1hSu83pxi+0k8RXC2bWzVg00zH6HOd70WPRJfOCfc88hZZiOMQiwsZpP4abfZ3g==', NOW(), TO_TIMESTAMP(1776275213206 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "F3fSsJ9v6GRU78Ib9RjK4m1nAIM2"}',
      FALSE, TO_TIMESTAMP(1776275213206 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'garciabalcazarv@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776275213206 / 1000), TO_TIMESTAMP(1776275213206 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'pgomezdiaz932@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'pgomezdiaz932@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$30O980IOrlJq8Q==$1gNIPUMI2xnbd0aTWQ3F5meUkvBesCPqXWBEh4mETmzH1FAEPKczM70QxfmcHPFx/57RRiXejaGzPx9o1ZVDVA==', NOW(), TO_TIMESTAMP(1771283728198 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "F4oNhOEJqPVxbnmZ1nZryLpYHL73"}',
      FALSE, TO_TIMESTAMP(1771283728198 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'pgomezdiaz932@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771283728198 / 1000), TO_TIMESTAMP(1771283728198 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'nico27768@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'nico27768@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$lz4/r1Xilg4xbQ==$7rO44bxEOJM7ZZHBLicHvJYpMyvEzWQtrkOOl0abnbyx1nn5Bp5HP6DuyFGWiIT1Ih6PWLSF22/qcG1b2CmqQA==', NOW(), TO_TIMESTAMP(1777266948021 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "F8KS94snToOG17yp4fxGEtbmXzH2"}',
      FALSE, TO_TIMESTAMP(1777266948021 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'nico27768@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1777266948021 / 1000), TO_TIMESTAMP(1777266948021 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'md.castilllo@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'md.castilllo@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$y8dM1awz+aA8rg==$Ry8WjB+wYOr/qESsi2TzRhfhyvg/3topgFGjVdaqn1TiH7U9r1HRb6mKdULqjlGalRaCxA/DimbpgDdnt9wqIg==', NOW(), TO_TIMESTAMP(1760536127822 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "F9faD4EFOuPIGxqi9VAX4nCOaFR2"}',
      FALSE, TO_TIMESTAMP(1760536127822 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'md.castilllo@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1760536127822 / 1000), TO_TIMESTAMP(1760536127822 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'esmeraldacruzmendez1@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'esmeraldacruzmendez1@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$jZ+GnwgF/asr+A==$LSBaKUBG4D1eBHxHvKRDLuJP+nPZ5xot7hV1Dn7OWBVo2p2/Qa4dEaex3Roi/5/9JUetl+iQ22jgXDp1jj109Q==', NOW(), TO_TIMESTAMP(1776302596925 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "FAtyelsdcLU9FgrZkVohWuVGcBv2"}',
      FALSE, TO_TIMESTAMP(1776302596925 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'esmeraldacruzmendez1@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776302596925 / 1000), TO_TIMESTAMP(1776302596925 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'lauuuuvp@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'lauuuuvp@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$z9NZTN1tYVbhSQ==$bRZCISwqiR/OgkjCVQq3KWx7ANQ61Cv54mrS/4psLbMvaK7J9UyGTm6LdYKkIkfyXc+EWcu8naeUM05kXxtdTQ==', NOW(), TO_TIMESTAMP(1771288141239 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "FC7o44ZVf6Qw4LPeltwLEqxUQhh2"}',
      FALSE, TO_TIMESTAMP(1771288141239 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'lauuuuvp@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771288141239 / 1000), TO_TIMESTAMP(1771288141239 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'alangael700@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'alangael700@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$lznTM02zCk0SlQ==$Wz2XNoW2ADxp00CE7UmEWNz8nux/B1NYe2q9UQStAFw73j7tiZKW1Rd+WZSw4I6vp9ELpSTo/CUpMLtmE1bcnw==', NOW(), TO_TIMESTAMP(1751813429967 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "FCX5mXZ3SMdrFKJleSBP0Ql1mGI3"}',
      FALSE, TO_TIMESTAMP(1751813429967 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'alangael700@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1751813429967 / 1000), TO_TIMESTAMP(1751813429967 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'anacanther@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'anacanther@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$IIorFBddX80Bbw==$RQ4nhGV9Zb97cDBKnXNPjT/YEQzASTI0nwMcCReSf+iQKS084u5OoL8HfktY82oClZNGyw+ALGspLBDL+G5qyA==', NOW(), TO_TIMESTAMP(1776217694327 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "FEM4j7utuSTPOTidGwLO6pMInRk1"}',
      FALSE, TO_TIMESTAMP(1776217694327 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'anacanther@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776217694327 / 1000), TO_TIMESTAMP(1776217694327 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'alonsogomezsamchez@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'alonsogomezsamchez@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$5Ce9Rs/Eh2WiVw==$JBil9d099lnLq6c0Dgz4Qhw00WR1w/u5tAZWSitnQ4S5daI9MkNGKIPTKKcU3KGTsq4zP6jOlUdf6ktrp441Sw==', TO_TIMESTAMP(1771277585087 / 1000), TO_TIMESTAMP(1778600311903 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "FJrURMozS9etZlNmzTBzASVsc4W2"}',
      FALSE, TO_TIMESTAMP(1771277585087 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'alonsogomezsamchez@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1778600311903 / 1000), TO_TIMESTAMP(1771277585087 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'jluissantosgarcia@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'jluissantosgarcia@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$wGoGJgF0vwvp1w==$skh8v/vSzhY9tSXoP/7jANKRGt5LjFNzPMeXPBH47c7dHe8KgGpCpuIJXkLfZV6s9CbgI35vf3DwbCRfOgPvLA==', NOW(), TO_TIMESTAMP(1773438205025 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "FMyLPye29FNl61fXU1MevkcTFXi1"}',
      FALSE, TO_TIMESTAMP(1773437721361 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'jluissantosgarcia@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1773438205025 / 1000), TO_TIMESTAMP(1773437721361 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'rafacomanche57@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'rafacomanche57@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$WAOhPmeOi4IZ1w==$35Ib7iwSuW/b9aGAhHC+InrZGrcMwVyfBI/1Mi7MfMM2iZvifqhe2FrCWPkGQusYXjs4E4A1s5CuU1oBpPGwWw==', TO_TIMESTAMP(1771550088259 / 1000), TO_TIMESTAMP(1773445166077 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "FN2vumwM9YZdJ8a1femZE8TjG553"}',
      FALSE, TO_TIMESTAMP(1771550088259 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'rafacomanche57@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1773445166077 / 1000), TO_TIMESTAMP(1771550088259 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'tabom961@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'tabom961@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$z6qHKcsf+YXdRw==$FjLGwSOhd7Tn6ezHwVSwV4qdmJh9K86XK0gIyxJsyh3foQwPtsU9FM9my3z1ULM7MazbHZJ18Isiye3BfqSN+Q==', NOW(), TO_TIMESTAMP(1751622838986 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "FNtIrxYqG1XBQYnRkrQ8eoSUm9n2"}',
      FALSE, TO_TIMESTAMP(1751622838986 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'tabom961@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1751622838986 / 1000), TO_TIMESTAMP(1751622838986 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'tonielpoderoso@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'tonielpoderoso@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$Hk6+Ed817dZuCA==$Ukz12Gud+PsiKJPA1YFZhQUtAqb0TulrA+Ar4IGJZoBJHSL367AqiYbipp+FLLK0Hv0Xb/EfhMhRxBABHie4sA==', NOW(), TO_TIMESTAMP(1773555368386 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "FQeuObUWlYdzq18LO4ganMiEjlh2"}',
      FALSE, TO_TIMESTAMP(1773555368386 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'tonielpoderoso@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1773555368386 / 1000), TO_TIMESTAMP(1773555368386 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'luisitorey0666@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'luisitorey0666@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$BmeTNQCbB3U30A==$/IFcYZYrVK+gL7xZGVUcAvK9jX6VHpWt+Z9W0v6F5SwsbDymbAem8WQLE1m73RYOVWH8+atFwUdiIE5RFrPGSQ==', NOW(), TO_TIMESTAMP(1771650786040 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "FSh9xsLgYaOaoOww2ayPIjxeij03"}',
      FALSE, TO_TIMESTAMP(1771650128797 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'luisitorey0666@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771650786040 / 1000), TO_TIMESTAMP(1771650128797 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'abarca449@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'abarca449@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$RXI8Az16+fQJmg==$chmgO/PmPmlS4DW6Y+De/Y9Mv0QlSKyjt6HV7PRDnIlS4UQmO65U6NpSiugEWn8stSyqZuAJvRV25ynFnqsWMQ==', NOW(), TO_TIMESTAMP(1771554738156 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "FSogPYmdzKSCCFH9BecIcERfSZv1"}',
      FALSE, TO_TIMESTAMP(1771550151186 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'abarca449@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771554738156 / 1000), TO_TIMESTAMP(1771550151186 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'bolomnegro@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'bolomnegro@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$d6yoJD7iTJ2kNg==$g6OTZHeTHlpApN31WYRJxlTK4KgY9UY6zRU85IKCSCTUsQBcdTNB3AMO/VE0eQuDhqgmGjl3bhg3Ov/5K5txbQ==', NOW(), TO_TIMESTAMP(1769457506799 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "FXGBKyZssbWTSrHGJEzHQpKhboC2"}',
      FALSE, TO_TIMESTAMP(1769457506799 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'bolomnegro@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1769457506799 / 1000), TO_TIMESTAMP(1769457506799 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'rkike7305@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'rkike7305@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$qaN73/ot3fqo8g==$c3sigdofur5qE1YVE2FZL71wlCos1Aq+RdE5ehkgw17pRpickUkbY79nh1woK7kGjCdHV87jBBkAIwhue/AD8Q==', NOW(), TO_TIMESTAMP(1771302378980 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "FZpusDY6njaerZ5rJWKqifLkNPa2"}',
      FALSE, TO_TIMESTAMP(1771301983604 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'rkike7305@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771302378980 / 1000), TO_TIMESTAMP(1771301983604 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'garciamartinezrocio000@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'garciamartinezrocio000@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$rMGcdq+TT4gxKw==$RXHFyN+9Z41dcZE1a/2kKuKZXBod1EGIQyMCcCOXzN1R/bWJ3Xd/8UyvchA75loIcTuDQa72Om5noDVm4V9Akg==', NOW(), TO_TIMESTAMP(1776299478805 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "FkN5y3Lm0wUZej2FzBv2njiqdsb2"}',
      FALSE, TO_TIMESTAMP(1776299478805 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'garciamartinezrocio000@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776299478805 / 1000), TO_TIMESTAMP(1776299478805 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'monserrathfarrera9@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'monserrathfarrera9@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$iB7plNjcOv9+HA==$UCuDGxiW3KR8PaKbfT1A6g5QR7hsgdw2zX0RZDSXTlCjSteG3JVXj5VBWNAP9fMVosHIPlT/kWV1+aU0XdkEfw==', NOW(), TO_TIMESTAMP(1773979800292 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "FlN0X2jDYycECC0y18F8rzO5Ofz1"}',
      FALSE, TO_TIMESTAMP(1773979511631 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'monserrathfarrera9@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1773979800292 / 1000), TO_TIMESTAMP(1773979511631 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'perezdelgado1593@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'perezdelgado1593@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$mWQPQpnjEIbc/w==$QNhc76d8Fa5eUuC6y6Ox8eDILHvNDECExeU9cqMsnY8fdnLJo34KyA+7WRxZ/b4TR9+amca58w9oYWB5ZeXvSQ==', NOW(), TO_TIMESTAMP(1753456717165 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "FmoP49rVreVAlymJa9KPJMcpeRd2"}',
      FALSE, TO_TIMESTAMP(1753456717165 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'perezdelgado1593@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1753456717165 / 1000), TO_TIMESTAMP(1753456717165 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'kartergomez@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'kartergomez@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$vRQQUUvcZ9rEvw==$nm0DCjq6z3MPaPZJqzOdiKqwVt8AMj3a656TbeLtI1xWIcvnutUI0oWQrxRIxfnV9+PkuLkEjSt1QCwVX3J+dw==', NOW(), TO_TIMESTAMP(1776252769793 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "FmtBDZ0fp4SHUdJgQexgd0QRj012"}',
      FALSE, TO_TIMESTAMP(1776252769793 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'kartergomez@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776252769793 / 1000), TO_TIMESTAMP(1776252769793 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'rald101296@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'rald101296@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$aqufm0y9D+F9xQ==$V5nsdw2aRjFBhBcvH7RaT8UghhNieiP+9ziSornzPgyvGJ/IeedjEJ7SY9ukH4e3A0OUxBpVmuU3Svr2MMNxzw==', NOW(), TO_TIMESTAMP(1776274846512 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "FmwIv79YNSTF5oE3vRpw1nooPp72"}',
      FALSE, TO_TIMESTAMP(1776274846512 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'rald101296@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776274846512 / 1000), TO_TIMESTAMP(1776274846512 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'vag_abundo500@hitmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'vag_abundo500@hitmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$ns4vKcvDbS2opA==$tMemraWZrwRaOI6Telgxi//TccMr6y7Iut4QN2aHRmgux7pVMW0svbFUUp6m5Hx8q1d6Sf8ffJxsnfzjYmy6LQ==', NOW(), TO_TIMESTAMP(1767928275966 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "Fr2neHUmr8WoFMFrpE3MAzDTJG93"}',
      FALSE, TO_TIMESTAMP(1767928275966 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'vag_abundo500@hitmail.com')::jsonb,
      'email', TO_TIMESTAMP(1767928275966 / 1000), TO_TIMESTAMP(1767928275966 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'corzglez@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'corzglez@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$iI+ftiDnfnA2vA==$TbzdHa1qZnTSzCDb2UAgGMpXp3m5T25nos68kRNmx8t2O6oru3R7crxApC+6jh4gber3WULOeqvQVVcycvfcbg==', NOW(), TO_TIMESTAMP(1752205101609 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "Ft514hc329cHgXhE0tJoN7NeVK42"}',
      FALSE, TO_TIMESTAMP(1752205101609 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'corzglez@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1752205101609 / 1000), TO_TIMESTAMP(1752205101609 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'soluciones.financierasrl@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'soluciones.financierasrl@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$safcFzty+uVgnA==$Q//O8nbLqXKBLewC9kgwSTixnVyLRtwY5oggNLKPHYU+Xs83o8KoRbXUHvRIN0nL2hC6mRrCRwvrxuCMjnC+fA==', NOW(), TO_TIMESTAMP(1768820988569 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "Fvhp8h04GXXMVzNkfN5GkW8A3qs2"}',
      FALSE, TO_TIMESTAMP(1768820988569 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'soluciones.financierasrl@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1768820988569 / 1000), TO_TIMESTAMP(1768820988569 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'cgdg70@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'cgdg70@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$EGJ9PMpvmnIq2Q==$ymVAVnGEDtSe0xuJpxhX7rXSQXrhFgGVZq64FFs9X072S0at7/i0fASdYUJNvraDEeaOG3K6PwzoriZ70lxizA==', NOW(), TO_TIMESTAMP(1775694439753 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "Fx83PZcLPHMg6ebuAhlCMKtPtLz2"}',
      FALSE, TO_TIMESTAMP(1775694439753 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'cgdg70@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1775694439753 / 1000), TO_TIMESTAMP(1775694439753 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'pebc280722@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'pebc280722@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$DBXBxaFuw+Zhaw==$JKkpZKPT+ersXMljuqTIUmjaPypYV2zWhgDx1cgvH9Rz8/vMhTk0GX8kmAOsCHbiKjek4nAkzCDOn5fMBran1g==', NOW(), TO_TIMESTAMP(1751486292807 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "G1yL8j64nHNDfGk7zKV0CjXfDsF3"}',
      FALSE, TO_TIMESTAMP(1751486292807 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'pebc280722@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1751486292807 / 1000), TO_TIMESTAMP(1751486292807 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'eliagv6569@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'eliagv6569@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$CggP7pxOStXNxg==$YYLIVhz+5vHkOBCHLXIHbHjL53Fo114GQDNMUsghl0QQOlO6FwGGj+OmO4xLoAlII6PhG4g9RPMjy7QtpJgejw==', NOW(), TO_TIMESTAMP(1778844991078 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "G6dZGTl6GuNcR2ywuGtauYl10wf1"}',
      FALSE, TO_TIMESTAMP(1772780454069 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'eliagv6569@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1778844991078 / 1000), TO_TIMESTAMP(1772780454069 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'alexisteco111@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'alexisteco111@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$JBO0LtKCtupKVw==$pOP9SnCnc5cbd705Rl3qFeqCJkqSNbfuUtA0BHoLrwYwJf8MDL1FVvRkzY45qAOfVz9b+f4MLvh2CorkxSE83g==', NOW(), TO_TIMESTAMP(1772893276334 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "G7MoL2dCLBPOVWBf4Zjhhc2m3gQ2"}',
      FALSE, TO_TIMESTAMP(1772893001135 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'alexisteco111@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772893276334 / 1000), TO_TIMESTAMP(1772893001135 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'chivas_edi90@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'chivas_edi90@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$gKMqxDYNkHV1wQ==$Xy54Iyh+cyER4kYi9R0Cb8MJKsNThu52QUmcNRoIhMrnJCQd9Pb5lQwFK/YOeS4QX9j5ZfOQ37pFAHBrQRLxsA==', NOW(), TO_TIMESTAMP(1771638533019 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "GFMH9TdNOrT3vw5rmB8wzyUfyon2"}',
      FALSE, TO_TIMESTAMP(1771591653647 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'chivas_edi90@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771638533019 / 1000), TO_TIMESTAMP(1771591653647 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'azael.luevano@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'azael.luevano@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$9O9hN40UkHJUoA==$FWJjZ9wlx/6LafL+7R/q4DKQmhex9AqfCvlEWCBcagrMQa7N9avbqsvlkZC/8AzU1x9aFyBwvqqD5QtK3rFrkw==', NOW(), TO_TIMESTAMP(1757018786747 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "GGGZZxyrvYb4pqhf9ar1bV24Ise2"}',
      FALSE, TO_TIMESTAMP(1753457823597 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'azael.luevano@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1757018786747 / 1000), TO_TIMESTAMP(1753457823597 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'pazaaron5@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'pazaaron5@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$uC8+lIa+5ddG4Q==$0q55mbtKn5baIDyZn0+0w2oqiHbwRyfxSbDhEThcY3tW3slJAakYIt7sgZ7C8/h9DPeZPMhgr6ygX7i5IriuNg==', NOW(), TO_TIMESTAMP(1773720954727 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "GJDMCK1c5tdVvUxEOYXKYZ5Ddcd2"}',
      FALSE, TO_TIMESTAMP(1773353252121 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'pazaaron5@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1773720954727 / 1000), TO_TIMESTAMP(1773353252121 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'angelleopoldo0279@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'angelleopoldo0279@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$sjKK3AkzRIoW7g==$NvVykRwJufNFPh+GbW/cYr6h1hjf1GWGLnBrhOkSMvvY2Fu7fcKTZssvEtL8tR91WVf/rEXIAMLtqkpHe4x5jQ==', NOW(), TO_TIMESTAMP(1772138547259 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "GK3Mnan8R9ev0UasRlW0IsgsuKS2"}',
      FALSE, TO_TIMESTAMP(1772138547259 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'angelleopoldo0279@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772138547259 / 1000), TO_TIMESTAMP(1772138547259 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'eliezerarcos62@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'eliezerarcos62@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$DS0GKkxzmb8exw==$IEdL7oT+Mbclf2YnqP/1zforky9mFRx/Y0j/4wnZB2Wo0AIX8e/XDHDNTe9waBvQx3ZUmv4jpDPIqaktSDh1jw==', NOW(), TO_TIMESTAMP(1753472398348 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "GO8pBFkJvhZV1OedR09Qfd1TJid2"}',
      FALSE, TO_TIMESTAMP(1751476772597 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'eliezerarcos62@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1753472398348 / 1000), TO_TIMESTAMP(1751476772597 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'alexfgz16@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'alexfgz16@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$NxP3Mcwbja4X4A==$dAZ+2ruVfiMvjHj8jbo4sDDADqGJXmQPUB9t3mP3yLNpKO6RM3OKIW4AlRki6YFt6NrAmCgDMeP8QNofzoi/yQ==', NOW(), TO_TIMESTAMP(1773403063263 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "GP48e6BQrFTcO6PAdVICB3lZRLx2"}',
      FALSE, TO_TIMESTAMP(1773403063263 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'alexfgz16@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1773403063263 / 1000), TO_TIMESTAMP(1773403063263 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'selma.schz12@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'selma.schz12@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$hLNLK3I6pZ79nA==$7G1ByyLuYwJJ7M32zr9oOYnItB27x+C8LZ0f438QcWXCRcbuegv0CyWU7hTQKrBb7gwWoGPf3pgsiiCPxgQ+YA==', NOW(), TO_TIMESTAMP(1778965154698 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "GVUFtpnAh3YpCkVT2CfLl8ie7Wl2"}',
      FALSE, TO_TIMESTAMP(1771277063443 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'selma.schz12@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1778965154698 / 1000), TO_TIMESTAMP(1771277063443 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'rt79tv@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'rt79tv@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$S70PeSD7T4ji0w==$1Fqmc0KGHqVq4cpfIbrl2Qp9e7PEbu5zlmkzv4GZl0wPWg/5i4TIfrhgrq1nWVV+t9vQiI1m+BPVtimfiJPQfw==', NOW(), TO_TIMESTAMP(1768859701027 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "GWizj6kyfzXrKM8IuV6qbtTNXI23"}',
      FALSE, TO_TIMESTAMP(1768859701027 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'rt79tv@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1768859701027 / 1000), TO_TIMESTAMP(1768859701027 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'guadalupedelaros1@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'guadalupedelaros1@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$npsRBfMF7pOhvQ==$HxSohGo7A10TfbN1PNCP3KcgtEvlSIiWAVKyda37M9Ke+zD8DDgD32MAXoKeWCYMq/QkNu7DFdw5tazSViMZ4A==', NOW(), TO_TIMESTAMP(1751632943663 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "GXgxSryieHVaLXjw5LbZyTpthBE2"}',
      FALSE, TO_TIMESTAMP(1751632943663 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'guadalupedelaros1@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1751632943663 / 1000), TO_TIMESTAMP(1751632943663 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'trejo8trejo@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'trejo8trejo@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$2Mox3TPB/EnlIg==$gYfCgLyCf5FtP8FVecwWek89hE+pYvxZreAdevxjryn+dExHye1dOwMSOjmwMCwRu/0yfZzEQUMmmkc8zNgLYQ==', NOW(), TO_TIMESTAMP(1774972922468 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "Ga0daDeTKreDrRPBZGNWcONYqcu2"}',
      FALSE, TO_TIMESTAMP(1774972922468 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'trejo8trejo@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1774972922468 / 1000), TO_TIMESTAMP(1774972922468 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'deya230891@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'deya230891@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$m4eoSsOo7BBZzQ==$IDXjJ3HknHx37css/UlfFT3Fs8zc8PSeG4piY5SvKhe0JJyTB0/8+8LosBHQqiMQgI8hDfCspl2YOKIqpQUrNg==', NOW(), TO_TIMESTAMP(1751984147559 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "GfdLVMQhgDahIDRf3G2iAjhxvkE2"}',
      FALSE, TO_TIMESTAMP(1751984147559 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'deya230891@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1751984147559 / 1000), TO_TIMESTAMP(1751984147559 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'rrrr@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'rrrr@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$D/aFo7VQp2MMGQ==$o53WrS0/PKyh12cBkB2nkp7mBBddHK6EUKUqzDOonwpdW/2qRHYu3xBjR+lNQZ0R6mZh+dijA1EwYBELEG4SlA==', NOW(), TO_TIMESTAMP(1771509160062 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "GjFmuvn40NYXxlcjJg2RLYiWXri2"}',
      FALSE, TO_TIMESTAMP(1771509160062 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'rrrr@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771509160062 / 1000), TO_TIMESTAMP(1771509160062 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'jorgeluisaguilar06030@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'jorgeluisaguilar06030@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$lVnfRsuzzKWyxQ==$jjSM1GN18zQoDMQNeYC/lVNcZC5QoME7HHsSMe2Ca3bCLUHbNd5PynUNhYxvXZp5sxSwdzD6OMVSqSlor/InWg==', NOW(), TO_TIMESTAMP(1753457406008 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "GlM4cr2C4gbADJ3xPkQ199L5oOF3"}',
      FALSE, TO_TIMESTAMP(1753457406008 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'jorgeluisaguilar06030@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1753457406008 / 1000), TO_TIMESTAMP(1753457406008 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'ulisesgarcia1905@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'ulisesgarcia1905@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$blTJ49g1EmBSJQ==$fW6v5N4DS3CgXOrQcbabTz830RbKqYDzCMNIW6fn9zZgzJ1XB+BPgu36s6zaXlzMJ56el6p5ZJCw4D9DLgTYDg==', NOW(), TO_TIMESTAMP(1772761955861 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "GpmwdCsjlLVFwLeZq1WbIhP0Uyo1"}',
      FALSE, TO_TIMESTAMP(1772761955861 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'ulisesgarcia1905@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772761955861 / 1000), TO_TIMESTAMP(1772761955861 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'alejandra.0105@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'alejandra.0105@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$vSKJNQ8Ej1V3pA==$LS+zLYhO8XHXKfNXAG8kyn2Y/NoCjyZLEcCopEPdclLegpVHSGFkCELz2YeXtx2xz2i5ETdV9EcUWUAaipLH+g==', NOW(), TO_TIMESTAMP(1771471578947 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "GsOGgFpwsDRD6Qssp6Han6geRXz2"}',
      FALSE, TO_TIMESTAMP(1771471578947 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'alejandra.0105@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771471578947 / 1000), TO_TIMESTAMP(1771471578947 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'elsisanchezalfaro@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'elsisanchezalfaro@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$wfJeR3oWPEeH+A==$/PhlAEjBoRNDX/mguqGMGVwr136joc5+b7E0TCvwp/OReYPCXnICXjgXElYPRqOSEG8UIJzCSXXhbhBonSNoBQ==', NOW(), TO_TIMESTAMP(1776254337677 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "GzOpyddPwZbEkvnHF0chMGoLEW13"}',
      FALSE, TO_TIMESTAMP(1776254337677 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'elsisanchezalfaro@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776254337677 / 1000), TO_TIMESTAMP(1776254337677 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'yulianitha531@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'yulianitha531@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$hB6r5dn6o+Lvlw==$9Kw3yoYUEWt7YZWAG/WYT0WDBR04N/aPK6H5KLFA/gN7EooaeVPQcofcw4S/xb5JBS8CuwBsMUcu2aWLvFz3Eg==', NOW(), TO_TIMESTAMP(1772138794283 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "H3qqmmxKaPYwRm3EgixnJVWMrZs2"}',
      FALSE, TO_TIMESTAMP(1772138794283 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'yulianitha531@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772138794283 / 1000), TO_TIMESTAMP(1772138794283 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'latifaidoudi89@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'latifaidoudi89@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$6iltB5fHzQfiEg==$mL5PRcq2rSHNwFusVvd/TouGZ8uzuqt8gbIMGs8yiTU0IpVgP7pr+mqOk9Otsd8X/LToyU0/Z3ZCXFeGZGMXIg==', NOW(), TO_TIMESTAMP(1767470762843 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "H45iJptfgRWW2DGkH8xdoJfr17h1"}',
      FALSE, TO_TIMESTAMP(1767470762843 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'latifaidoudi89@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1767470762843 / 1000), TO_TIMESTAMP(1767470762843 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'arbeyantoniopardes@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'arbeyantoniopardes@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$v0bTxP7WIoKMmA==$6dhn97tVA24of9NGW96u7LgdAosTTS634yZ7J2MBalRruktLPnSlicuslzaQmKSw8It5+GIc248QFzNzv05Kvg==', NOW(), TO_TIMESTAMP(1776216559395 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "H7hGlbOg5hcmTX6ehGC2RyVHqBC3"}',
      FALSE, TO_TIMESTAMP(1776216559395 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'arbeyantoniopardes@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776216559395 / 1000), TO_TIMESTAMP(1776216559395 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'chinoalvarez1708@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'chinoalvarez1708@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$b1HOL4o/STifWg==$Ze6HG3WMVEOWygdaPcXNSBpOa59DQO0pwU/m2r+2bTAmg6qFoN5nuCM6/iRJJeGngnemtoQI3qZDexBXK27SXA==', NOW(), TO_TIMESTAMP(1752815831242 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "HAJo0nUHvhfxvl94iHdXNZbumx73"}',
      FALSE, TO_TIMESTAMP(1752815831242 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'chinoalvarez1708@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1752815831242 / 1000), TO_TIMESTAMP(1752815831242 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'kokee12.jc@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'kokee12.jc@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$ANcnAC/YsZQzpQ==$/qVQ2gE4arY7YiYIeHWuzZ4xQLnj61xebfKmFBN+x8WTu/8NjGEDZkoIrszy5O6mnEKUacM41WmvQzmJIDg3eQ==', NOW(), TO_TIMESTAMP(1776709963062 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "HD39NajFzbS0f54lIxHRxIuL0mS2"}',
      FALSE, TO_TIMESTAMP(1776709963062 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'kokee12.jc@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776709963062 / 1000), TO_TIMESTAMP(1776709963062 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'ma.delcarmend.g@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'ma.delcarmend.g@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$zFZmroTrhe0ebg==$4E8FXjFLLBYFnGqRjHvqFOo76Bi95GQSh1aypuXqeIhnZsxit9mBGkwV0C3yOo60MYux7MLfk0jaueW8rruzvQ==', NOW(), TO_TIMESTAMP(1771470290423 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "HI2j4SCv2ZNdjdEREuirrG6PDkl2"}',
      FALSE, TO_TIMESTAMP(1771470290423 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'ma.delcarmend.g@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771470290423 / 1000), TO_TIMESTAMP(1771470290423 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'croblero_espinosa@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'croblero_espinosa@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$WHvOlWNhp+oqVA==$Y0TNSanSUFUk9CX7GPPrXNh33CkFWxSxJuISem+hC1VXGtGlqnuUpqnZ4pdXQP4OXDgSxjaP09DasdexfMc10w==', NOW(), TO_TIMESTAMP(1771345620453 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "HQsaVRUQxbb3K0zUx0bBBq5cJyx1"}',
      FALSE, TO_TIMESTAMP(1771345411970 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'croblero_espinosa@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771345620453 / 1000), TO_TIMESTAMP(1771345411970 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'manuelmope11@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'manuelmope11@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$VbUmLnqDtumNGA==$VqFhWEbktXnmEZJDKpwgh58r+dX/cH4MpKnO3t17lmkOO4jSaQJkvwySwNC2jWYOhvts0zduinpQWsiPOpElrA==', NOW(), TO_TIMESTAMP(1774936770416 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "HRYeZVuejAdsJeJ6PVqrjw7SkCZ2"}',
      FALSE, TO_TIMESTAMP(1774936375618 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'manuelmope11@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1774936770416 / 1000), TO_TIMESTAMP(1774936375618 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'quijanogabriel53@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'quijanogabriel53@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$3puRcOuSWAb/kQ==$kMJ/OYDHRjEWwOczDf5JPyV7aA+9VgofmgIp9M7YKLP9qXIxlMljY1rvaZnkPHGTX3GwA/hb4aPyxA0aS92ShA==', NOW(), TO_TIMESTAMP(1751481974337 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "HTePLrWKgceQoNkr3bpjBsD09At2"}',
      FALSE, TO_TIMESTAMP(1751481974337 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'quijanogabriel53@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1751481974337 / 1000), TO_TIMESTAMP(1751481974337 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'dh.saetx00@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'dh.saetx00@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$4bWItn7PFHDLuw==$aM54047dv2UVHfvzug+qhF8T+GozGBHnUEckX7ixJ0bwais/fkbQYfrjbsQLnYBevVvUho7w4atFbzGzup5pvg==', NOW(), TO_TIMESTAMP(1779596716503 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "HWiz8EHOttMQjyD6V9vilG1Mdf03"}',
      FALSE, TO_TIMESTAMP(1779596716503 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'dh.saetx00@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1779596716503 / 1000), TO_TIMESTAMP(1779596716503 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'alansmsp@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'alansmsp@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$Vj8dvQOQgNFBjw==$dRSVxlK8hB/xc/jQVmHmifdqNbdABa1KRoktpXhJEeCPUtOjrIPHss45Suqi2sGJTCKMLQbY1W2i6G/P+EiE7g==', NOW(), TO_TIMESTAMP(1760533280930 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "HcZ8PJjGcpMxQybilnnz4lw4WVJ3"}',
      FALSE, TO_TIMESTAMP(1760533280930 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'alansmsp@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1760533280930 / 1000), TO_TIMESTAMP(1760533280930 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'marlenracevedo777@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'marlenracevedo777@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$8YxzuomTjDYv4g==$5/fvgFSL80gF3G53ReljBbIXANjyzxTxCLq7iZxKEc6vxNvqQbhsyNklCTONwud6U1vrl1/u2sbZFqtjvgVRWg==', NOW(), TO_TIMESTAMP(1772241408918 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "HiIEj9wQ7qXkSNR0LQaCshSIlib2"}',
      FALSE, TO_TIMESTAMP(1772241408918 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'marlenracevedo777@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772241408918 / 1000), TO_TIMESTAMP(1772241408918 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'lorerm2118@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'lorerm2118@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$Yvwivgsev/I6mQ==$uVADA0TsP4CruYWzCXA0EaD4e6yMNNX43GnHLAMwEW9L66rawZTt8VctK+ODwwcQyeMMjsAFSFrm//Po40nK3A==', NOW(), TO_TIMESTAMP(1771284221479 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "HnliXXYNhYUn1uOcVAm4SHv4czS2"}',
      FALSE, TO_TIMESTAMP(1771284221479 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'lorerm2118@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771284221479 / 1000), TO_TIMESTAMP(1771284221479 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'edydiazmoraless@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'edydiazmoraless@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$ENteCcyu0zJydQ==$tqGrE3pIh6QHGpL2vjJLXhsr37XPyS5tVLW65rUOyz4tmvIOMCtewia49gQzTnD2I6Urk1ysh1rVi2FzQ9KpEg==', NOW(), TO_TIMESTAMP(1776219837049 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "HsnbpAiZ0xhQKaKxo1uq9DiOnmj1"}',
      FALSE, TO_TIMESTAMP(1776219837049 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'edydiazmoraless@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776219837049 / 1000), TO_TIMESTAMP(1776219837049 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'kolo54g@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'kolo54g@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$y4/N0ddEljU02A==$Q1MKHpZ7580mt9EbJISLOA9UKmFIAO440zF7BxHeogz6N7HEL4ugV50b0hICearLl0/5Fancci+6WqKi7ra9bQ==', NOW(), TO_TIMESTAMP(1771335730772 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "HtmdqJZCVWaRQeBzwZM4XxhaV2K2"}',
      FALSE, TO_TIMESTAMP(1771335730772 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'kolo54g@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771335730772 / 1000), TO_TIMESTAMP(1771335730772 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'lupitagomezespinoza@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'lupitagomezespinoza@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$T/nk3QF6hSaptQ==$nA557+OcTKQGZm3rS8JmnmYUnUjUfG/iz4eL2FPPHg74n/cBifcWvj44cpfdHOpR8klJpW7qEb+7FRE2uPDRHg==', NOW(), TO_TIMESTAMP(1771290629593 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "HwvwD56mXZekpUDJwDpZXSfofu43"}',
      FALSE, TO_TIMESTAMP(1771290629593 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'lupitagomezespinoza@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771290629593 / 1000), TO_TIMESTAMP(1771290629593 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'alejandroalarconzapata@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'alejandroalarconzapata@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$bkqXCW/h20QskQ==$S1iNj6AqGlLjtbc0fJdka2jo9qI6wSVKh3nG5+aWP5K5Y61pKS7FtYh1d8WhO3+/voZT4wD03zdao1w1HNWbqA==', NOW(), TO_TIMESTAMP(1771456911529 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "I4c0S19BQcb4JnGhd657mvV1ckt2"}',
      FALSE, TO_TIMESTAMP(1771456911529 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'alejandroalarconzapata@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771456911529 / 1000), TO_TIMESTAMP(1771456911529 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'danieldejesusdiazlopez7@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'danieldejesusdiazlopez7@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$2Ih1lpLHnTtZIQ==$SYXFq0atcKy3Ie7ArdSJnz2Y5b3C3KZ5Og0DMtcVRK47DjTFquBgYKJBK4NrY83QRK/dCejwrz2t5clEjxMO6A==', NOW(), TO_TIMESTAMP(1771299920976 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "I63GlE3k8rPmZp5PgfxfH90AEWj2"}',
      FALSE, TO_TIMESTAMP(1771299438471 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'danieldejesusdiazlopez7@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771299920976 / 1000), TO_TIMESTAMP(1771299438471 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'collazo01junji15@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'collazo01junji15@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$BGgiNPJ7HuQnGA==$Ndm44nHNTwkategmPoOCDtou2j/omqRpTK9DUeH6VjTXC2LLjdP6rlPuFN+BVHbqslyiFgYXedz7YHryifyVhA==', NOW(), TO_TIMESTAMP(1776232690583 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "I9HupOxFkAU5j8YYIeIC7UbA3wX2"}',
      FALSE, TO_TIMESTAMP(1776232690583 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'collazo01junji15@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776232690583 / 1000), TO_TIMESTAMP(1776232690583 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'juanfragaro98@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'juanfragaro98@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$7S5gkM6O5rLmKg==$e334t7+wRnJHBwacG8fFmZUqP7DZ14c2ulBz86Ely+F7zQorPLUQtyjKFuaoi5qS7siv2uxe5cxEpNyxBfr8zg==', NOW(), TO_TIMESTAMP(1752694386511 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "I9sYSpUI73bAHQVfboa37stkCPp2"}',
      FALSE, TO_TIMESTAMP(1752694386511 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'juanfragaro98@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1752694386511 / 1000), TO_TIMESTAMP(1752694386511 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'lucia20romerogonzalez@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'lucia20romerogonzalez@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$IoF1HM2396fmoQ==$dTuQDgZUbTt8F6yNa5Wvj0V3HhPeR1yM6YuufXxKaP4fOGZyrMhuhrh0DP89/Gv3k4G91Xo8Y5skRG2jFUnSDQ==', NOW(), TO_TIMESTAMP(1776520315766 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "IA2zgmAzdFcxTOtgDK0F1EGhU5u2"}',
      FALSE, TO_TIMESTAMP(1776520315766 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'lucia20romerogonzalez@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776520315766 / 1000), TO_TIMESTAMP(1776520315766 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'vianylopez6@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'vianylopez6@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$Rskl2iN+Gbfr9g==$4sNE8X4LG7kAN0z5FQCuskjfGdpzvzuTYm9Ds4dEWLxC6bbCjTHCEviElMhhPq6ZSyX3PxqfQeqUlbB/bdpicQ==', NOW(), TO_TIMESTAMP(1777563210913 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "IAwO4MqRN1czfJNTtptslSwmSTm2"}',
      FALSE, TO_TIMESTAMP(1777563210913 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'vianylopez6@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1777563210913 / 1000), TO_TIMESTAMP(1777563210913 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'yenii.jpt@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'yenii.jpt@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$rHgSJ1Yd/iAvoA==$9rkwMvxkGtoJc9blgHsGpis9LIn2JCsCPFbENENthCL3WJAvp8cZY6roT/xmvEOQelHyP//Idb276GPaltDvJQ==', NOW(), TO_TIMESTAMP(1767315467171 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "IGDKWhzNMwTLGK4L3Hq4lcXC3FI3"}',
      FALSE, TO_TIMESTAMP(1767315467171 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'yenii.jpt@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1767315467171 / 1000), TO_TIMESTAMP(1767315467171 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'qwertasdfgjavs@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'qwertasdfgjavs@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$ohDFTAunpdhKNw==$847BtXF+TNHjZg11J4hzoycd8nRfSAaG251wRCpzsqE/mNp3n49G1nBXJ79aqnazHTWpbGL+YZVm4VyemoF1AQ==', NOW(), TO_TIMESTAMP(1771384075242 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "IKyW5DY0owXbn23q30KZxrY1zD02"}',
      FALSE, TO_TIMESTAMP(1771384075242 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'qwertasdfgjavs@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771384075242 / 1000), TO_TIMESTAMP(1771384075242 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'eduardo.sierra.romero@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'eduardo.sierra.romero@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$SPrZ15qwHO6UIQ==$OIsSK6mQIsb+IZd0BIOdbScprQ/anFAT6LvdcnxX3Un1uQZvYUo/xTxFhLZ5IXGSBivIpdQe5ypt6YrVnbxl6A==', NOW(), TO_TIMESTAMP(1771290115358 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "IMM2x5SWSWep9RWaaW2yFdV5wTV2"}',
      FALSE, TO_TIMESTAMP(1771290115358 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'eduardo.sierra.romero@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771290115358 / 1000), TO_TIMESTAMP(1771290115358 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'adrianamichelmendozacarrasco9@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'adrianamichelmendozacarrasco9@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$tC0Lvhuz6Z36DA==$LPds0+gGddhP8xPW6jWzAzhQxYhRhwWeMWpBFPOVhH2nrWnaR4nKRl4OURC7ZSDvrxdCtKDVub91yYbII4a4aA==', NOW(), TO_TIMESTAMP(1771296558924 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "INhWu7cILiOymu934i5X6e2tO7S2"}',
      FALSE, TO_TIMESTAMP(1771296558924 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'adrianamichelmendozacarrasco9@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771296558924 / 1000), TO_TIMESTAMP(1771296558924 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'sg639017@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'sg639017@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$sOqn+lP16K92iw==$GqixFw3wQRbJljRghy76Wop6+PIoJKQ4TVeM9GWvNrq5OP4B2h9EXDw3R5kq62IQnqaVjYEFMwODemP5278uxQ==', NOW(), TO_TIMESTAMP(1775606733616 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "IRY5qsudvmXQPMDY6yvZqt4yUPi1"}',
      FALSE, TO_TIMESTAMP(1775606733616 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'sg639017@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1775606733616 / 1000), TO_TIMESTAMP(1775606733616 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'paulino_g802@outlook.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'paulino_g802@outlook.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$m2jdOwzDNRz1oQ==$5trqRCtTtn1WqVZoHbQ5X+TJ+p1pybAIDF8Z15CYgdUT54EU4aVRyvAWw3zQpvzUDD89yVfsZ4vxLqQfAi9DaQ==', NOW(), TO_TIMESTAMP(1776225540032 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "ITcS4YnmCTPvoCTTbSF62wzv2hg1"}',
      FALSE, TO_TIMESTAMP(1776225540032 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'paulino_g802@outlook.com')::jsonb,
      'email', TO_TIMESTAMP(1776225540032 / 1000), TO_TIMESTAMP(1776225540032 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'karen.praga@live.com.mx') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'karen.praga@live.com.mx', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$GvgV2tECE97zJA==$qmKhYrd5DtPSLJ9+CdKkvCmcGn5uRhZLgcYySpAwzVVgWHgqmg3nyS6nGTKX8dUff5JRF/1M+ZRYth7fgrsMIw==', NOW(), TO_TIMESTAMP(1751810223889 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "ITptbsQpcUSiAsrcx3JSQjr1Mqy1"}',
      FALSE, TO_TIMESTAMP(1751771326369 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'karen.praga@live.com.mx')::jsonb,
      'email', TO_TIMESTAMP(1751810223889 / 1000), TO_TIMESTAMP(1751771326369 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'rodrigorueda61@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'rodrigorueda61@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$Y5hvuA0lp+Hc2w==$eMKFslVDpVDh63F4XlVBYuZXSBUhAkYX0c6ZbOe4qubKnOaQsHOzKwKqBr2oKcg6WIOk+pdO5IJDtJEuODjodg==', NOW(), TO_TIMESTAMP(1776913459399 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "IVkLomJY1mgkr7E76CyuH6yreN32"}',
      FALSE, TO_TIMESTAMP(1776913459399 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'rodrigorueda61@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776913459399 / 1000), TO_TIMESTAMP(1776913459399 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'jujazmingomez25@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'jujazmingomez25@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$YPiiv9sNjNsozg==$VWRwfUxMJkp2b0i8oyjinMdSlcOcpyOeJSYUbYwsKe7MnLEvlg5cWZkq981xYcxgo+c9a1heV0JUgXUvGdPlFA==', NOW(), TO_TIMESTAMP(1778466246014 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "IWhfDn1HVOUQt8KpDxArdnSlaMx2"}',
      FALSE, TO_TIMESTAMP(1778466246014 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'jujazmingomez25@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1778466246014 / 1000), TO_TIMESTAMP(1778466246014 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'carlaalejandrasr04@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'carlaalejandrasr04@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$kV2INMKfbNJgQQ==$9Oy6+Z5rM+Njre6RMlfFtW8jwaqIrTMTgjYpECXOXf70iQYSLjJwv2KWN76D0IfPQFX3bFFGwJITFtwH4nIGbQ==', NOW(), TO_TIMESTAMP(1776229533068 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "IXHkXb9IYLfEL7xzGzBkknoOfmB3"}',
      FALSE, TO_TIMESTAMP(1776229533068 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'carlaalejandrasr04@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776229533068 / 1000), TO_TIMESTAMP(1776229533068 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'eduardocardona290@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'eduardocardona290@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$iZ4XIhHfZH/iaw==$rp2uooGFwB1pWfyyVrbiBD3tnotIEqbqOr85Lb9hiBKVjvlQ5zgtzUS153CNDpYv1+sfyzXnUf1IL0N+YTim1g==', NOW(), TO_TIMESTAMP(1752983770718 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "IbCQF06OEKhU1yhDJRiALKrthBA3"}',
      FALSE, TO_TIMESTAMP(1752983770718 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'eduardocardona290@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1752983770718 / 1000), TO_TIMESTAMP(1752983770718 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'ajerick.jeah@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'ajerick.jeah@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$gIM50QTfwaxUqQ==$aYezNCBMTyl1qZVqSuFH/UisvdmI+bmKNtoOLxHb4YiO385BJt+vrtLsNpsa6S4FjgCz4sOktUUllCP6y/1cjA==', NOW(), TO_TIMESTAMP(1768174644546 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "IbLWvRmMMGeQZ4viXHpaT2aCZC42"}',
      FALSE, TO_TIMESTAMP(1768174644546 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'ajerick.jeah@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1768174644546 / 1000), TO_TIMESTAMP(1768174644546 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'luciagp_wolf13@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'luciagp_wolf13@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$aWWqZx42vPzccQ==$R/3wjEH3X81BMrT+1wEz78VBEwMAkrWzbY9SCRAiireIe6W44qQvu6squX4CFahGJbjbW08mrKBiSa3Cvq/ykg==', NOW(), TO_TIMESTAMP(1776363538000 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "IdpPPapOtQYoJV5EwVQCJFGnrGF3"}',
      FALSE, TO_TIMESTAMP(1776363538000 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'luciagp_wolf13@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776363538000 / 1000), TO_TIMESTAMP(1776363538000 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'fco.salazar721004@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'fco.salazar721004@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$IG2MCsfQlZu23g==$ObXQYfv45oSN+ddn01ri42N/RCs9TKU1n01pfIVwE72P9NEy5FuxkcYBqvlmvBjfgU1IGNQKT4wSOP7gP4Tqjg==', NOW(), TO_TIMESTAMP(1751830474530 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "Io6h6tQ1bAMmrUJITT8fhLbhKuw2"}',
      FALSE, TO_TIMESTAMP(1751830474530 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'fco.salazar721004@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1751830474530 / 1000), TO_TIMESTAMP(1751830474530 / 1000), NOW()
    );
  END IF;
END $$;
COMMIT;
