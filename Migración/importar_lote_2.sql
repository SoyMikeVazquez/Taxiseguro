-- Lote 2 de 4 (400 usuarios)
CREATE EXTENSION IF NOT EXISTS "pgcrypto";
BEGIN;

DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'pedrolopez755522@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'pedrolopez755522@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$8ARj9ZxpS4kQWQ==$vVMx/raxoCDeM01ieekUWbFpi4INiHLPKbaYSoLWN0gHWPWSrI/PUSl9x0WxOE94kqHnavspQdFjmFszS5WfbQ==', NOW(), TO_TIMESTAMP(1750887234268 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "Iqq4IN9G4DhzMxTENVPC7S36fRF3"}',
      FALSE, TO_TIMESTAMP(1750885493975 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'pedrolopez755522@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1750887234268 / 1000), TO_TIMESTAMP(1750885493975 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'volodia8@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'volodia8@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$8p2gad54kj8GDQ==$qJd0rf8Z3TRxMBi8RJXPKKrbGF1j7gj0zFQzMfP0I/7LUt+hYoD8B+OdkVBneJCbpN4XCI3Qt9ljgUiBEUehFQ==', NOW(), TO_TIMESTAMP(1776220015741 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "IqyyTGJAF0OR0gMGzf5mZEgwrVJ2"}',
      FALSE, TO_TIMESTAMP(1771349427652 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'volodia8@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776220015741 / 1000), TO_TIMESTAMP(1771349427652 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'ric556laz@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'ric556laz@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$4tlrxZC3DXhcMw==$Y8lmk9EqMnQv8Xu26SA/i8S3WhHDrdz29m2nnGZufpN7FEuP+RRm/I4xxIK9LdTm/e6kL9EJRZS3UvHzNwjD2A==', NOW(), TO_TIMESTAMP(1771462416812 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "ItdXO9I6NVOsyRHyZtaMibMPmqD2"}',
      FALSE, TO_TIMESTAMP(1771462416812 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'ric556laz@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771462416812 / 1000), TO_TIMESTAMP(1771462416812 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'alejandro.najera.gomez@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'alejandro.najera.gomez@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$7fUSxkLWSCt8PQ==$zLrlWIJyc/gSNc8j/88r7eE8s28BW/9oSKPomjZRgHZAcJ9tSrqaYGV13DGN9UE/U/nqMatUZWe2V6Osn0s3Kw==', NOW(), TO_TIMESTAMP(1772082251393 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "IuppvPF8sTRjFsMHTKE7PTEMC3N2"}',
      FALSE, TO_TIMESTAMP(1772082251393 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'alejandro.najera.gomez@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772082251393 / 1000), TO_TIMESTAMP(1772082251393 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'joartgr@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'joartgr@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$/JsHe6tQGt/5oQ==$ZIpz1Hf0yGr+Hb26T5xqgA2JNKUMSnu86a+eshQwgLwD7EyCxifUr/DiliIqzA22LAeGRXfyYmqQxrgZiNK+sg==', NOW(), TO_TIMESTAMP(1776214699641 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "IwqKKS8QEgcDUlfMydBzSYxKCZP2"}',
      FALSE, TO_TIMESTAMP(1776214699641 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'joartgr@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776214699641 / 1000), TO_TIMESTAMP(1776214699641 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'franciscodominguez1705@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'franciscodominguez1705@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$Jj8vl+x3IjVbXw==$HzQ04kXX+i1Cyg104MLz91LCoixTgL5208+/DZq++pqXEC4WvVC22tGyWGFHmlLMq0bG3wTJWTtVrnpzwgyyJg==', NOW(), TO_TIMESTAMP(1776576082654 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "J7sN0YdunVTQY5xRmt86Cjjpzuh2"}',
      FALSE, TO_TIMESTAMP(1776576082654 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'franciscodominguez1705@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776576082654 / 1000), TO_TIMESTAMP(1776576082654 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'eduarsalexis17@icloud.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'eduarsalexis17@icloud.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$nSH6PD8oKgub3A==$Bkpiv7BzPg3VV7C3PBH9aPpM3rGFskrfH6MasHDnzOVgciiwg8hcCQEmW2TupGj6jdu+k2LhU1AyU2Cvw9NS9g==', NOW(), TO_TIMESTAMP(1773903952708 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "JDkHNoY41nYoOeBWMxnnPfwLDPx2"}',
      FALSE, TO_TIMESTAMP(1773903952708 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'eduarsalexis17@icloud.com')::jsonb,
      'email', TO_TIMESTAMP(1773903952708 / 1000), TO_TIMESTAMP(1773903952708 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'afi_falobia@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'afi_falobia@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$RGbeHyIx9gz3WA==$K3I6LSLL8WuldVdoefqHMZJ0KtnbD4KcZ5hn2tBmMP079uAJsTPfVGio06f2OCQhidXarV10+knAS2InPChXmA==', NOW(), TO_TIMESTAMP(1779941292015 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "JFs3OYtYlZNaM6pYUlheSOZDn9v2"}',
      FALSE, TO_TIMESTAMP(1779941292015 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'afi_falobia@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1779941292015 / 1000), TO_TIMESTAMP(1779941292015 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'utrilladiego809@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'utrilladiego809@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$Ijshi56zU93GTw==$MBDtIiSv1BQ5Cxv/Y6KxMgt1MrWl/6YWetO6w50QEvE1O1BHNR8eDEOzdlVdHvDWE+lAJA2IpJznHRSxqQPu/A==', NOW(), TO_TIMESTAMP(1771274426722 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "JKXsOUupsqPqoflYT5E74qjvZ7Q2"}',
      FALSE, TO_TIMESTAMP(1771274426722 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'utrilladiego809@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771274426722 / 1000), TO_TIMESTAMP(1771274426722 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'gutierrezgomezluz@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'gutierrezgomezluz@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$kiwoFRS59MhzWA==$CvjLzxyaGtChdBK9KYF6C9epTF9Alvs1vaPqZU+MyB5xgyAbn/bsAx72xBBb4Yl+3vNObsKIKvK9rqDel/1EWw==', NOW(), TO_TIMESTAMP(1776899625749 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "JLdSCHj8JNU9OHCYBT28hPdhBdA2"}',
      FALSE, TO_TIMESTAMP(1776899625749 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'gutierrezgomezluz@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776899625749 / 1000), TO_TIMESTAMP(1776899625749 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'ericsotout@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'ericsotout@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$fEFSWbCxpvO6Vw==$g2yTIkH0SHqNutg6cSQNoTsfSYcD4CQMc9i94JJFRqH/KUVhsjCmy7gc7XBtmrXHt6/gUyjdZasqrWC6tupLPw==', NOW(), TO_TIMESTAMP(1753233075524 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "JMCeTgbCx6Nfom1xFsMvncCYgi83"}',
      FALSE, TO_TIMESTAMP(1753233075524 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'ericsotout@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1753233075524 / 1000), TO_TIMESTAMP(1753233075524 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'gomex2304@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'gomex2304@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$mXH6+1hm7qhmxg==$N1AsoOiuU1d1BBzfTb5oh2HhRYnDcbXwrulYFBttWORww+M3E8WsRAyh3xWf+GuDob82dA/Fu3IwZ6Lr1hoRuw==', NOW(), TO_TIMESTAMP(1772844738007 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "JMkkXnD1PDRTzt57Gt894IjiN3b2"}',
      FALSE, TO_TIMESTAMP(1772844738007 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'gomex2304@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772844738007 / 1000), TO_TIMESTAMP(1772844738007 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'gabriel02031984@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'gabriel02031984@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$e20LQTVQ8Up1sg==$a1U5viw6iEn/RDGjBbuzzyhCM9JWysDUZZrLNVSTGLfdGlNKFQHFvs2c2PKBFuYynF/71OIlnRQpMm8eSWubGw==', NOW(), TO_TIMESTAMP(1772282782730 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "JMt9L5qr3pWM4XpZ8fXjpdx1hKW2"}',
      FALSE, TO_TIMESTAMP(1772282782730 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'gabriel02031984@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772282782730 / 1000), TO_TIMESTAMP(1772282782730 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'armasceleste1@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'armasceleste1@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$liIzKnozlmi/Ng==$PydNarUQL54J7gTU3zJZgMmDaODgNcrDz4HILXZd6SVtdAEfLlMB/VrcJVjFGJumZbS+fIZA6MOln6D78Ys72g==', NOW(), TO_TIMESTAMP(1775362571933 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "JNzkyHKuXRfoQlt5wF5Zy3d3qnJ3"}',
      FALSE, TO_TIMESTAMP(1775362571933 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'armasceleste1@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1775362571933 / 1000), TO_TIMESTAMP(1775362571933 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'a17j1996@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'a17j1996@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$BSRgpUDejTPKjg==$NULtN7ng8k2bD1BgcjMAh2ucQ0M2rXzsi+pR3VKUao8O6HJ9GeQCHjyG9USS+u2d6gBiuu1//oUxIshqp6NaUQ==', NOW(), TO_TIMESTAMP(1776274804551 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "JPYhmW5LmfPHOuwKp2VqgFxUhX33"}',
      FALSE, TO_TIMESTAMP(1776274804551 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'a17j1996@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776274804551 / 1000), TO_TIMESTAMP(1776274804551 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'gomezlopezjaime098@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'gomezlopezjaime098@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$yRiHN87gkKMy7A==$zqiM+Y9PZiNjpe28NisQP74D9pFPL8LCX0zwjFhVDJj/23PuMkE+eBGtJWGoFkBgTz6TYeYs9RACmJa9Oj9K9w==', NOW(), TO_TIMESTAMP(1771637530980 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "JQQmYIMJbpdAyCQJqacctP6hshD3"}',
      FALSE, TO_TIMESTAMP(1771637530980 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'gomezlopezjaime098@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771637530980 / 1000), TO_TIMESTAMP(1771637530980 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'elicruz95810@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'elicruz95810@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$eri7cWwMC3UHYg==$Tm3vdoEuO5UsVxKserIJhYYPA7yGTG+ucphB5bcgG+MB+Rmdt9mvPxjGBph9ycW911tC04qiEnBcQpKgi775bw==', NOW(), TO_TIMESTAMP(1772650071930 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "JWO542d7QwRu2wLJm87tWSxNzyl1"}',
      FALSE, TO_TIMESTAMP(1772650071930 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'elicruz95810@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772650071930 / 1000), TO_TIMESTAMP(1772650071930 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'torresdaniel309@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'torresdaniel309@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$pEFiyDGDWiflew==$Q7OgdTqI83eGWvytS1F/HFoSDlpvfCS54Bs8p0fLHolKy9+3pwu46sWQ4fVy4KJopfQc5slzZ2qrwf96x8tW0A==', NOW(), TO_TIMESTAMP(1771278805553 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "JWR2RbVVtsUe3zoylEUAdvz5IYz2"}',
      FALSE, TO_TIMESTAMP(1771278805553 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'torresdaniel309@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771278805553 / 1000), TO_TIMESTAMP(1771278805553 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'jessi100516@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'jessi100516@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$rutaD/9+JH5hLg==$oUsuhcvoRNtSWNf/idbL9znjAH1dbRP7w5/0uEvh012OA3BHTR0KV8LJOxAug5qOibfVuWCPjQM9OtNt4uyiYg==', NOW(), TO_TIMESTAMP(1772240512788 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "JvjkkDKWQqTMJ0ost8VgRvqCijJ3"}',
      FALSE, TO_TIMESTAMP(1772240512788 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'jessi100516@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772240512788 / 1000), TO_TIMESTAMP(1772240512788 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'gloriadlcarmen000@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'gloriadlcarmen000@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$ql8wNXFLBgP5AA==$9/a2Qg0F8HB07F85PwcqjZleppmSV4fqzU82uH/EM9OwQS5XNEusFQigq4o38Y4Zhna6Yt27p9ykgGEf6p9sqA==', NOW(), TO_TIMESTAMP(1776235200146 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "JvkQYG37aVUeYndOEZHqmSSwXRy1"}',
      FALSE, TO_TIMESTAMP(1776235200146 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'gloriadlcarmen000@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776235200146 / 1000), TO_TIMESTAMP(1776235200146 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'goamuellesysoldaudura@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'goamuellesysoldaudura@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$5Vr1Ddshe+4CJA==$cG9uyiQiXI9mlidvgDhmW9eqebH6aKcwblPHC8RmzGqex49Q6wJQualWHvV9aSMLcKEGV75lTDbw8UxUySwb3g==', NOW(), TO_TIMESTAMP(1771314764123 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "JwwyR5ikZXduMm8LkUEg0CGYqe63"}',
      FALSE, TO_TIMESTAMP(1771314764123 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'goamuellesysoldaudura@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771314764123 / 1000), TO_TIMESTAMP(1771314764123 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'orlandobravo30@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'orlandobravo30@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$1v0yeiT2yO9bcQ==$iJVHHuXXtZKS5HNcm0OAW4f3vHJwZwEgQpFabEQAoiu6CDPuwn/C3SKZwu3inCNx0tCqoR2onA4vhtp/u1Jziw==', NOW(), TO_TIMESTAMP(1770347209468 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "Jx1R0wL6kOd1E0uUM2XHAPxsVtB3"}',
      FALSE, TO_TIMESTAMP(1770347209468 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'orlandobravo30@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1770347209468 / 1000), TO_TIMESTAMP(1770347209468 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'qcielo756@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'qcielo756@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$4EwS4n7voUQFkQ==$PKbuIXHaf0S64irNT4QNg/clu+lJGBeO7HmYrRf9N6Cpm+E8H6PFP/cMyP6IceWjDHFHYdKArfOnz2YryqLpkg==', NOW(), TO_TIMESTAMP(1767294511492 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "K01W9Urn6qQ3aNSGHJqUK5PMObS2"}',
      FALSE, TO_TIMESTAMP(1767294511492 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'qcielo756@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1767294511492 / 1000), TO_TIMESTAMP(1767294511492 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'cl0236797@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'cl0236797@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$3h+luAGZkLrkuA==$TyirxiP5NX2ysXBj8rSjIVq5NA0IdkN2gzICFBHtYOfsahwgXPXkA9N7E4tigp87jxClwbdu4gDtl4GZXTe3lA==', NOW(), TO_TIMESTAMP(1771276130329 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "K1JmVn1mXTVzQC845c9QoZ5ORD22"}',
      FALSE, TO_TIMESTAMP(1771276130329 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'cl0236797@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771276130329 / 1000), TO_TIMESTAMP(1771276130329 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'rl656515@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'rl656515@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$yqeBeBFlXO/jng==$s+B4XfqE+t4mcIukMkDbaTT4sHn+FKjuEXGwOEo7Vdr8U9nHnGoAtFW+VKggDBD/FBSm5oyO61kRe7jWso4BvA==', NOW(), TO_TIMESTAMP(1778704845436 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "K1WWgk6xMqf8MsGPzH10NwGZQSx1"}',
      FALSE, TO_TIMESTAMP(1778704845436 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'rl656515@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1778704845436 / 1000), TO_TIMESTAMP(1778704845436 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'francleo486@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'francleo486@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$2ItZ4QoICHMrYw==$s2aCcpU9Fz+MjhdEdExdphRCC7gUc8JmbPNqV4BAKNUfo1k/VX2O0I1FSPA6LbhNNawGUiyyOToL9Gpg6CWWnQ==', NOW(), TO_TIMESTAMP(1757363299542 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "K2CwvDM1ZlgfcpiwaidC0zJaaDk2"}',
      FALSE, TO_TIMESTAMP(1757363299542 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'francleo486@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1757363299542 / 1000), TO_TIMESTAMP(1757363299542 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'itmendz666@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'itmendz666@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$HIGXaNQ3Z6cKLg==$qnK+cdXkb9JUVsoP3uBfFQp7Hf0pIhcpJKG2deRTV0WDF1RLhO1DVIRY7u5ntqaM0wNcBfJexqY4acS1O8xP2g==', NOW(), TO_TIMESTAMP(1771291158351 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "K4L9HF0MnVbBiu7aR4cudcKQF7p1"}',
      FALSE, TO_TIMESTAMP(1771291158351 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'itmendz666@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771291158351 / 1000), TO_TIMESTAMP(1771291158351 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'hslydtb@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'hslydtb@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$6LoufHld9F8rNQ==$8UHXYSI5JkgilROkAbRG1pcxe7nHhjUgFYvcG3yVO+dZMSuaum1gMylxEeMvcbEBE11vMJObNB2i7fNnsT7tJA==', NOW(), TO_TIMESTAMP(1753470087480 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "K5YDQKeW4ca2C3Xa6sJzSdNcuml2"}',
      FALSE, TO_TIMESTAMP(1753470087480 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'hslydtb@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1753470087480 / 1000), TO_TIMESTAMP(1753470087480 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'merlacastillojb@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'merlacastillojb@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$OYgD0hBRQwaILg==$jpQdTCOsqEmxE+HEKvcjSctBUo2eDM+gF9EcQQ8WEiYZ9gDI8g3fBB1wRPTzOU44/EOIQhl8pEqAupIVUXqg+A==', NOW(), TO_TIMESTAMP(1752820346493 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "KBesoJoNKxfyF8n0NirszEBlt9n2"}',
      FALSE, TO_TIMESTAMP(1752820174123 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'merlacastillojb@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1752820346493 / 1000), TO_TIMESTAMP(1752820174123 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'federicoalejandro16@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'federicoalejandro16@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$tAECTmDpckr5Jg==$YjYp2BQaPpEecYJTAJ/4UE/zOvFWon2s9TozIwfN09JTZOYJodKCuntnmJb4AYdC5fB2EYK4rQG87rONBkR07A==', NOW(), TO_TIMESTAMP(1771297039134 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "KCz1azGflbaUWds2dD27xRyEOVv1"}',
      FALSE, TO_TIMESTAMP(1771297039134 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'federicoalejandro16@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771297039134 / 1000), TO_TIMESTAMP(1771297039134 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'quintoshugo66@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'quintoshugo66@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$fnYgzg3WlzG9UQ==$T8en/ppsNzSbKobct/LVfn/SB1WQYSKsXdtkbrQesKAZZV8qdGZMZkwQ4nGO8YNe5k8qD4I+VM26ApIa3Z3IqQ==', NOW(), TO_TIMESTAMP(1753735195363 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "KHZiRgnSpmg3hijSKyhEn67pKJi1"}',
      FALSE, TO_TIMESTAMP(1753735195363 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'quintoshugo66@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1753735195363 / 1000), TO_TIMESTAMP(1753735195363 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'brendaesthergarcialopez@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'brendaesthergarcialopez@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$eGihtDxVxaADWA==$T+8SAjuz56vppBRtJdTRJMhPM+VJwY2nA31Ie8Dy+0lvT7bEztDKlYO6YhN3KNdWGa7FHl+Waq6qy+Nf1tGlcA==', NOW(), TO_TIMESTAMP(1772471697601 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "KIxhXSePSBM5TWaWZQqTbg07yo73"}',
      FALSE, TO_TIMESTAMP(1772471697601 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'brendaesthergarcialopez@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772471697601 / 1000), TO_TIMESTAMP(1772471697601 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'karla28791@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'karla28791@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$ZhfGWxLOw2nvgg==$UokJf7YVZqJIheLlXgpVBdDBC6oW0WHwlr//GwufHa0KsjQ6s8hnNq1nkxrt0v5nEDboaPvAfHniSvrOqdJwlQ==', NOW(), TO_TIMESTAMP(1772681257835 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "KOlol5W4gFgAJsTuQ5Aoys7iOFI2"}',
      FALSE, TO_TIMESTAMP(1772680830176 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'karla28791@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772681257835 / 1000), TO_TIMESTAMP(1772680830176 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'gabbriela.acosta@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'gabbriela.acosta@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$6sWU1YteGHem0w==$1xAN8EAorpUmGJ29pbxMLYsPLjS36X1XRVYVFT+yjMmc4vyo8XsgOuA6ecxwDXiO9bFoueNq7idvugOiuwMxHA==', NOW(), TO_TIMESTAMP(1765698414798 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "KSlwuWHc2mV4CtqdLrpWdoIjxdv2"}',
      FALSE, TO_TIMESTAMP(1765698414798 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'gabbriela.acosta@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1765698414798 / 1000), TO_TIMESTAMP(1765698414798 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'saramoreno617@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'saramoreno617@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$CDwxd/mE1V42pA==$e0Hy699g8njp5vPHJDQcZutB4ZAMgrPqKJ9sg7WDqmSQwN2yxpU/9AIFZm+z48NdODNlPkeQsVPNczMtwC/7qw==', NOW(), TO_TIMESTAMP(1775835669333 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "KUmsATXriObgtniuv1VYzOg9NhC3"}',
      FALSE, TO_TIMESTAMP(1775835669333 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'saramoreno617@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1775835669333 / 1000), TO_TIMESTAMP(1775835669333 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'uzker98@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'uzker98@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$1i18ex8JiDeVvw==$sawYgDtLrnat/lm2RQd8n7OBOf+JlapbwOtFUKdXkTrbYC5EDJZXl7xHmGQOdqpjWpUqvqqJD2ZJ8TeCMD/eHQ==', NOW(), TO_TIMESTAMP(1771278800259 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "KXXoj8OkF1Vlk40yDAkYf6wzzji2"}',
      FALSE, TO_TIMESTAMP(1771278800259 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'uzker98@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771278800259 / 1000), TO_TIMESTAMP(1771278800259 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'miguelangeldominguezalvarez@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'miguelangeldominguezalvarez@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$kcSE+tAk/S+zkg==$Mw7jfYpzvC8wk+YqGbwiwLn5rH/trM0ODQFbZfeSyii113jBpQtaDbVgNR2QJrwSj+Pvt69xNZnU/i+j6NWUKQ==', NOW(), TO_TIMESTAMP(1776224692901 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "KZSZfbFw9ahlFBF2MGmhQLqHq923"}',
      FALSE, TO_TIMESTAMP(1776224692901 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'miguelangeldominguezalvarez@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776224692901 / 1000), TO_TIMESTAMP(1776224692901 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'jany_leo@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'jany_leo@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$jG95jxoGMhCOqQ==$YcWVRZDcgAjsIpGuWsaRmXnzOPV/32K9snGWgqFZs8bT1leFMNNhfGXDIqC18SgceSVLdgMnnrcjXG/Huy0Vow==', NOW(), TO_TIMESTAMP(1773779282275 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "KaNuYHEX02fIRzJTXx5hLuaArrg2"}',
      FALSE, TO_TIMESTAMP(1773779282275 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'jany_leo@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1773779282275 / 1000), TO_TIMESTAMP(1773779282275 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'candidoortega500@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'candidoortega500@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$9maM1Ly5XoQSCw==$CLuxbXrTtg6Vm4u6gGIhBbf4H30qnRDPCcIMJ2jKqsCFf+fL1NgXzfk46oo2mNcfnmotvRpkAcZmv7OGuqNnbA==', NOW(), TO_TIMESTAMP(1763212017282 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "Kc5uRfaTJ0N61scPYlpf2NgrIkq1"}',
      FALSE, TO_TIMESTAMP(1763212017282 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'candidoortega500@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1763212017282 / 1000), TO_TIMESTAMP(1763212017282 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'vavc.uach@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'vavc.uach@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$MAJHQ+5SdJLolQ==$ZJcWKsOElPxigoNCXaAoIWP4pv/bQwGWREYiO8KLomF05VT7y5NExyYRXypU9vqo58lw9Zt55aVSD5OeILyG9Q==', NOW(), TO_TIMESTAMP(1772339467370 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "Ke0AIJqGGqZXOhqCyPaAB3Co3ul1"}',
      FALSE, TO_TIMESTAMP(1772339467370 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'vavc.uach@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772339467370 / 1000), TO_TIMESTAMP(1772339467370 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'gersson-jose1314@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'gersson-jose1314@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$XOXmjEfJWM9jHQ==$RzjPhUQrTogXxKvTq5uCa6xHfZE2PQjUDh3QvuurN/Wd3jxTUAzdOOpbHecZ/yZjMzqbgCQCLnwG7Qsr64BPdQ==', NOW(), TO_TIMESTAMP(1776218591092 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "KmCP2cgRgdQa52j27e26S1WUliP2"}',
      FALSE, TO_TIMESTAMP(1776218591092 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'gersson-jose1314@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776218591092 / 1000), TO_TIMESTAMP(1776218591092 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'l1289trampe@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'l1289trampe@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$XFW96BefFWDUOQ==$+aWK8R3+vm89FmgpUJKI4yTq+MkgdcMdZUbw4ednfvrGaTe/JEIMHvgSMOXkvT/8QiBmk64wewRMXHkCICVDFg==', NOW(), TO_TIMESTAMP(1777305626937 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "KxugUtUGevTRNAj0aQhxcvRv8Jq1"}',
      FALSE, TO_TIMESTAMP(1777305626937 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'l1289trampe@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1777305626937 / 1000), TO_TIMESTAMP(1777305626937 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'osvaldoruiz81215@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'osvaldoruiz81215@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$EvRdjvYSvAaW1w==$g32jEBOypdFhA4sIiiee1GOmJEAZkoWE3B4lTJOXklNI8yDRRta/V2dKlwqQ7x7VJWYFuUZaWduOKxHe802UFg==', NOW(), TO_TIMESTAMP(1771278063953 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "L1XGe2U5EKYMeLvwqfBPokg5ODa2"}',
      FALSE, TO_TIMESTAMP(1771278063953 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'osvaldoruiz81215@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771278063953 / 1000), TO_TIMESTAMP(1771278063953 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'sandyymorales12@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'sandyymorales12@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$6ec9t1ZzZDYC2g==$yUbqxXKidHGdKe6EfQIkTxWiLdum6DDmRBysyUI810IaPgF0iHhzIELkpdKSNX5zUnCRtG8NtTboQSeZDFsLPQ==', NOW(), TO_TIMESTAMP(1776221057519 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "L8QJWsGlv1ZEhC0GeTJD0hR4VBC2"}',
      FALSE, TO_TIMESTAMP(1776221057519 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'sandyymorales12@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776221057519 / 1000), TO_TIMESTAMP(1776221057519 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'alex_mog29@ooutlok.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'alex_mog29@ooutlok.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$BTIRnNMMApdtNA==$3X3ikD/ro4yjzU8oglhs/c4mPEfMfxMNf3DS8Pi9eholC0n+NNBTeCiicn8Zpf+0brQlBZJd5Q6FUXWPWBHcMg==', NOW(), TO_TIMESTAMP(1773341146223 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "LAOzqJ1Yybg2No61KOxPCSGJ2tI3"}',
      FALSE, TO_TIMESTAMP(1773341146223 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'alex_mog29@ooutlok.com')::jsonb,
      'email', TO_TIMESTAMP(1773341146223 / 1000), TO_TIMESTAMP(1773341146223 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'lopezortegacarlos581@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'lopezortegacarlos581@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$85FNzFv9654beg==$JH2p9nQJ9IDpE1iRDOkJMgmqd8Eyk6FQ/KZM+yJh9sNXFPBqjslWI2fceV9C5CDVLVFBbUdtetcGWE6sUYCNYQ==', NOW(), TO_TIMESTAMP(1772146254445 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "LAm4at2nA2S0lXZ0xkaq5wwjgln2"}',
      FALSE, TO_TIMESTAMP(1772146254445 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'lopezortegacarlos581@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772146254445 / 1000), TO_TIMESTAMP(1772146254445 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'abraham180705@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'abraham180705@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$ueYbvscVU2aXVw==$NoASmNyS8VNhDE3RVkS15YJn5nbtPKbrOBdozg0o3Y44bGA8Bv5cbYbWKPlXJMdLPG3LjS8Di9YU/MifsH2oAg==', NOW(), TO_TIMESTAMP(1777657209738 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "LC2fpHwdNbfscAvo5G56ysy4qur1"}',
      FALSE, TO_TIMESTAMP(1777657209738 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'abraham180705@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1777657209738 / 1000), TO_TIMESTAMP(1777657209738 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'rosysantome7@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'rosysantome7@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$P2QbbqhwXNDlWA==$TElJ+TGPWGwRjlMcdIdCHaHgfppu3DZ0ikNEtbtUpuucmy9ccKpfgTYgtnSKKK4NIlXq9U0gMrdPu27zZM5E+w==', NOW(), TO_TIMESTAMP(1772628126481 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "LGCQsQ15lmWQRKogrNz2ClgFIUE2"}',
      FALSE, TO_TIMESTAMP(1772628126481 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'rosysantome7@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772628126481 / 1000), TO_TIMESTAMP(1772628126481 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'tombarrera@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'tombarrera@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$6gZ+EFU4CdWjXw==$StLPt0X3ToA6P9slIWqW56I2cP7x3YC7Xd0zTDmBMXEB4B8UKORM+cFfEX0K3myBWLOsHHIsOdCDJf/pGTY3ZA==', NOW(), TO_TIMESTAMP(1768242602317 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "LLGQPhmRUrbJC62fn6ypUN8X3cu1"}',
      FALSE, TO_TIMESTAMP(1768242602317 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'tombarrera@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1768242602317 / 1000), TO_TIMESTAMP(1768242602317 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'ivan25091971@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'ivan25091971@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$C2DLzAuYycVc+A==$HQMbcOrhaCLqbf8mHTlhk7BneSL7wY8mruPAD6JYN5UntO6EtTzBkkJsgJkazxt1V7mYDCD/XTqaL2kYb9k7DQ==', NOW(), TO_TIMESTAMP(1772391282153 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "LNXLv8twYQRCmBpf7fERihB4XUr2"}',
      FALSE, TO_TIMESTAMP(1771733099557 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'ivan25091971@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772391282153 / 1000), TO_TIMESTAMP(1771733099557 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'leti_6_4@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'leti_6_4@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$BM4eK55I0gF+UA==$ZV484Jfnn4Jq/lecGjf0sGyZZ11Fui0a3tIJz+lLNNu4uWziRaZibmf752J223f+gGWX2xR/QXBl/eTcn9RUew==', NOW(), TO_TIMESTAMP(1773109625714 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "LPQ15pMOhma38Em06E0gBmqe0qV2"}',
      FALSE, TO_TIMESTAMP(1773109625714 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'leti_6_4@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1773109625714 / 1000), TO_TIMESTAMP(1773109625714 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'leonel11775@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'leonel11775@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$/mKDr5NhcY2brA==$Ry4jfn6M7qOmw1CB1Fl67Np88y2vrMWD0RZSjvZIYpsjsk7/WC+OZXYw29XFj1qBa6OG0J2HZeNQcxuwrW1WEQ==', NOW(), TO_TIMESTAMP(1771701983381 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "LR7tqWUXICh8YmQhbUbqbE99k6O2"}',
      FALSE, TO_TIMESTAMP(1771701983381 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'leonel11775@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771701983381 / 1000), TO_TIMESTAMP(1771701983381 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'marlenbautista606@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'marlenbautista606@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$p+6xozPzcOutMg==$FFIyPgSRg8LHAT1i57JCzGj5P0XjIzdgp0PwiqkrwxJydCDP4bR6l/Kn9HRRui6NXRJOEsu6CwsIOE2hZLDMFg==', NOW(), TO_TIMESTAMP(1771293716773 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "LRjExGfUyNMMgx9TQ5vfx5WDlRY2"}',
      FALSE, TO_TIMESTAMP(1771293716773 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'marlenbautista606@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771293716773 / 1000), TO_TIMESTAMP(1771293716773 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'juanitoto2000@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'juanitoto2000@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$bnk6+oL6alOLaA==$EhggMRxHwpLSvvxm4s48N4to8hb3a5LoSGB8Iin7l3ePuDs2QgiIsQZejTbxW3iixcDn1gxEIgNbaa2347XqWQ==', NOW(), TO_TIMESTAMP(1772327703176 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "LSG6ecGkXCeRAJGecfy3ix31sPo2"}',
      FALSE, TO_TIMESTAMP(1772327703176 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'juanitoto2000@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772327703176 / 1000), TO_TIMESTAMP(1772327703176 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'sofiacameras7@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'sofiacameras7@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$X7PI2y3Da4fCiw==$DOGD8eI6pRrD+AVwD3I7n9T48cv1IWS3AzEc0+n28m1CDH6C+pxi+fGfUmK3ncsR/dDRqTOPOsC0gz1GcoQ38Q==', NOW(), TO_TIMESTAMP(1773897723269 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "LasArTHHvZYDXZo9DKPr8RsFfN22"}',
      FALSE, TO_TIMESTAMP(1773897723269 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'sofiacameras7@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1773897723269 / 1000), TO_TIMESTAMP(1773897723269 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'riclaz55@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'riclaz55@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$ONuntUUfmoSYJg==$E8jM+jR4nO/SyYhTHfvstrNHcQzP8CFpNOpYWU6Lu8+4mKKC+QPDLyYvIcWy1+kbwpQCeAP7K3OHIlJSh6hwAg==', NOW(), TO_TIMESTAMP(1771455178989 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "Lck3Zb0V4EXFS6IneUeeBdVkmQ43"}',
      FALSE, TO_TIMESTAMP(1771455178989 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'riclaz55@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771455178989 / 1000), TO_TIMESTAMP(1771455178989 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'sergiodejesus118@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'sergiodejesus118@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$RVpwXvMCDeG8QA==$wkozjO/aDuRVwDL7IyNICDSVpfkfautRExnfdfIm1xHASfMg8VeHr3jTAGeb9kE4GAM+nbebN0Icu6j4u347zg==', NOW(), TO_TIMESTAMP(1771283681589 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "LdiAwkZi6hWw7SJriCjy9LMdk2g2"}',
      FALSE, TO_TIMESTAMP(1771283681589 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'sergiodejesus118@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771283681589 / 1000), TO_TIMESTAMP(1771283681589 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'armandorponce0082@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'armandorponce0082@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$4IW6cBOG02G1Ww==$WFVTju2w4IsovjeAPTH4LnWnYQZ2L7U0OR2ioKwgkcQO0KwHIBBIAVSbuKG1vv5KfPhv+OYmqTTRZhm/7aXOwA==', NOW(), TO_TIMESTAMP(1752727475479 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "Lg73wYCWNngIoc9X9n9asPfQE493"}',
      FALSE, TO_TIMESTAMP(1752694534118 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'armandorponce0082@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1752727475479 / 1000), TO_TIMESTAMP(1752694534118 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'rayito_astudillo@live.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'rayito_astudillo@live.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$JH2Z2ZNE+HfWDw==$xFyvp6KVRy7N/m4bvqbP8vEvyVtrnHto7Tdoo1WcxECd9hzjM9XUjj+alxM7KWnhAORHJEXYkfzHCvoyioom9Q==', NOW(), TO_TIMESTAMP(1774898047494 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "Llr8oGJnFhZXzbfcV4hPVi6ZmOk1"}',
      FALSE, TO_TIMESTAMP(1774898047494 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'rayito_astudillo@live.com')::jsonb,
      'email', TO_TIMESTAMP(1774898047494 / 1000), TO_TIMESTAMP(1774898047494 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'vavclau06@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'vavclau06@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$yX8j1HqrE54eVw==$8EbEGWDV3T45E7BLvxQ0V12iV/iLuGjnyz3tcDSdUBRZmryWwAEpba0VwaTfdTpx2yA3wVQdXIQbqJ+NnJanEQ==', NOW(), TO_TIMESTAMP(1772152086246 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "LnKqABhO9BUOYE9JFi7oW7c83yb2"}',
      FALSE, TO_TIMESTAMP(1772152086246 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'vavclau06@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772152086246 / 1000), TO_TIMESTAMP(1772152086246 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'andreslopez208@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'andreslopez208@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$QvnlnxNU+9MpFw==$t4YRD+hd5yp6u9p59MbWM1o0yx1J/3HlGT6XcdsWYh0xLgHzLVJsy+8olXM2RcTT2reVWrSwHgVYKSRYXitrqQ==', NOW(), TO_TIMESTAMP(1771391181209 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "LnWCTT7Q2nYgUXtCAS3fqn2fsX42"}',
      FALSE, TO_TIMESTAMP(1771390387056 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'andreslopez208@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771391181209 / 1000), TO_TIMESTAMP(1771390387056 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'karlaiviquez@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'karlaiviquez@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$Pc2Bso1L7l8KHg==$NWPsrSiGgNW46ZtcpB24FIxkPyU/e0vNQaSMrS2xHz2Ny4YUPZi20fsYnLrAWLJ9cPuv/7TMfsJLoiORjiK76Q==', NOW(), TO_TIMESTAMP(1779856589761 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "Lr5tiK07p2SIltYL5oNakHxj2P83"}',
      FALSE, TO_TIMESTAMP(1779856589761 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'karlaiviquez@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1779856589761 / 1000), TO_TIMESTAMP(1779856589761 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'yeyo.ontiveros14@icloud.con') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'yeyo.ontiveros14@icloud.con', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$Ej5ssW6rVF//Aw==$54HcRYVsVFblpVRkhVSH512Eo98FV1PYLMZAjsImIJV8rJ2bctTY4n4aPvsv6SZwSf8uHnIKSBRMgzZymL6LSw==', NOW(), TO_TIMESTAMP(1747766356079 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "LrOzZzSxhEN2qJBWkQYp76hVh5G3"}',
      FALSE, TO_TIMESTAMP(1747766356079 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'yeyo.ontiveros14@icloud.con')::jsonb,
      'email', TO_TIMESTAMP(1747766356079 / 1000), TO_TIMESTAMP(1747766356079 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'jimenezruizleonardo11@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'jimenezruizleonardo11@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$PA4Etf1SWHtj2w==$AR7a7NNkRRqQNsfa9NvNVVO3PSTdWyo2fds4l9+Icx/69cqV61MryhZCPl+1QbKkXaH9dqKxESFWhUSGwPdxZQ==', NOW(), TO_TIMESTAMP(1762968419148 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "LvRwGVIitadqSZXf4aKQuWJ2MXo1"}',
      FALSE, TO_TIMESTAMP(1762968419148 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'jimenezruizleonardo11@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1762968419148 / 1000), TO_TIMESTAMP(1762968419148 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'matemonsi4a@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'matemonsi4a@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$CyRlL8lQhat8iQ==$DZ1A8AeCqPPzIUn62QqaOqog9O6MpyLwxlP8+dZDaCRO8C591TEGz/MZK6Bf6vctUDMJO0adNtiqWN6WjQBSXQ==', NOW(), TO_TIMESTAMP(1771296958808 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "M27o2ac56RcISrHAqvsDEhpbxij1"}',
      FALSE, TO_TIMESTAMP(1771296958808 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'matemonsi4a@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771296958808 / 1000), TO_TIMESTAMP(1771296958808 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'hikaro_186@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'hikaro_186@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$iL2wqsDwmqSwrA==$VWPxm4omdzDLUzXyvdZ76jYvsVfXHCu6Vb1hqtEo+mQoKIzfouFdcPinuqUy7dmv7iCrgrdEEF8lG5O2NMPDyw==', NOW(), TO_TIMESTAMP(1772575158367 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "M2bNpXdcPBVuKtdktetXvIlA7km2"}',
      FALSE, TO_TIMESTAMP(1771298203729 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'hikaro_186@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772575158367 / 1000), TO_TIMESTAMP(1771298203729 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'pechrick9@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'pechrick9@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$Eq1g/pWLpdTkOg==$bgFRNL3TXXD/9K/0cUetbIC9uigYBv9FMtB0lMldPOiJs78uI+kKd+fsYOJqoFYX2u5iOwvLHnurREE3uzbb/Q==', NOW(), TO_TIMESTAMP(1771282991536 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "M5FIwH8GCDh1ikhMChTpua6pXr82"}',
      FALSE, TO_TIMESTAMP(1771282991536 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'pechrick9@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771282991536 / 1000), TO_TIMESTAMP(1771282991536 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'ectoes@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'ectoes@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$S0O83TrY/EcvbQ==$Mzw1edzQJ5q9KJr6M2sltAERPn4flE3De4G1f1JgSY84Y7OAKrf6HvOHXrz8nOK9pmfDm+zUpcsU1AEMLhY4tQ==', NOW(), TO_TIMESTAMP(1774328118387 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "MECWz95jvnTlTI82v9kCmKjR4Xf2"}',
      FALSE, TO_TIMESTAMP(1774328118387 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'ectoes@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1774328118387 / 1000), TO_TIMESTAMP(1774328118387 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'nataly_cece@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'nataly_cece@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$EBC44mumBgZBgg==$JvUxudD8g2UtFaw2akA4FG4Q8X+cfOBUapW2pZyRiSFQv34e5iaCZUd3EYkDZFyEA5V7OKT8IA1cVBfd0rQoNw==', NOW(), TO_TIMESTAMP(1771279345253 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "MG3TsBieCtdHmkfya34yeHHC3LX2"}',
      FALSE, TO_TIMESTAMP(1771279345253 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'nataly_cece@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771279345253 / 1000), TO_TIMESTAMP(1771279345253 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'ricardorodriguezgalvez12@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'ricardorodriguezgalvez12@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$5ocfgYFYbTqv7A==$WlhkGglyeg7Pa7fCblpKhtnGpe1VRGPx5Exrl5SO8fjz1kau2AED1DZVr6hFucBmLIB3e+EUW5DdHozzHygvSA==', NOW(), TO_TIMESTAMP(1776873238032 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "MJmEofU8ukMk90aEkl1lvTOLT1n1"}',
      FALSE, TO_TIMESTAMP(1764027426810 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'ricardorodriguezgalvez12@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776873238032 / 1000), TO_TIMESTAMP(1764027426810 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'abcd251117@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'abcd251117@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$MAMzgzS9wxqCPQ==$+yW1CwlktFavarcfEharoeQoswKbCeKgAoHBC+bDZRloCSvt3hgxAGBrsHYJ9g61AN+pzWWaPnXiauq5sQ/qEQ==', NOW(), TO_TIMESTAMP(1765159468639 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "MN7nJni6SSfuVuqrtbQFbud3W2M2"}',
      FALSE, TO_TIMESTAMP(1765159468639 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'abcd251117@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1765159468639 / 1000), TO_TIMESTAMP(1765159468639 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'josepitoperez21@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'josepitoperez21@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$s575j7UnFRVuew==$1E0fEdAp3AGZg+kepjHwfqr5dWTmd6ORxMtmUcz9huXjYFXsWpEXsRqndx3NpDwjSKSkmmBdPQch8eNYFMIbNg==', NOW(), TO_TIMESTAMP(1771274610250 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "MZaHmf4sMFOfoQs8418NB3oBMhL2"}',
      FALSE, TO_TIMESTAMP(1771274610250 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'josepitoperez21@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771274610250 / 1000), TO_TIMESTAMP(1771274610250 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'joaquin727@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'joaquin727@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$Hme5p2MHbheAjA==$Zwy5AwBPi4HtwQLdMyTLEh32fReoptJ4d/1KQNrWBiDKYvDa6UQhp2oYkudyY5qVvb1PpsGoQ8zTL3Z7/qVzhg==', NOW(), TO_TIMESTAMP(1772469605425 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "MdvJnsEqQbYGy4gOTM7bpe5yBIo2"}',
      FALSE, TO_TIMESTAMP(1772469605425 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'joaquin727@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772469605425 / 1000), TO_TIMESTAMP(1772469605425 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'ricardo060802@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'ricardo060802@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$Pv72bpn3aiiAsw==$3PJ/mTy+lfy27bgyD+Q2rGaoGEhg1009OBMpVYwvN5AZvasl9f4sKebJ0TduVHZNydRIveHlS9pWSi5kJQpoAg==', NOW(), TO_TIMESTAMP(1776327147522 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "Mjl14HB1rWTaaZzFp2FrOOaa9uk1"}',
      FALSE, TO_TIMESTAMP(1776327147522 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'ricardo060802@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776327147522 / 1000), TO_TIMESTAMP(1776327147522 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'lopezruizgilbertoremedios@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'lopezruizgilbertoremedios@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$qtb4scwBdLekTw==$9bg74RNKfVBNHvnLavFnLDyNLHl9WoWa6Nd95AIqCyLHmf+Vixau5jTX9suJJcB3u+7UNj63tOV3OLxruwhq1A==', NOW(), TO_TIMESTAMP(1764825258535 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "MlILrakgMwSxDO7UImuf6dEJbHm2"}',
      FALSE, TO_TIMESTAMP(1764806380360 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'lopezruizgilbertoremedios@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1764825258535 / 1000), TO_TIMESTAMP(1764806380360 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'pekersantiz@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'pekersantiz@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$BYqmXiL2Yxj3nQ==$+IYmsXDrnO3FAXT1bMF++65WhV4KxA751P2i7WlKED86pleArcIl19x7TWak7OVCGYzkZEpdLQlqRy7Ribm/UQ==', NOW(), TO_TIMESTAMP(1771512270954 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "N1ucr9kQIiVD3q4gu7IS5qBz3ub2"}',
      FALSE, TO_TIMESTAMP(1771512270954 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'pekersantiz@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771512270954 / 1000), TO_TIMESTAMP(1771512270954 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'santizmario398@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'santizmario398@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$bRjTxmhEcL+l9A==$Q4tisf15yZCKQD5oMS6QLUeiYP6pDV4ek815dqQoKRa0rNxOtavgnnZNiQC4PVBdXCTkAZGU9gnlZDDjRHt11g==', NOW(), TO_TIMESTAMP(1771565955023 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "NB4O6rLXuMUbnvUY9vMNpUKD3sK2"}',
      FALSE, TO_TIMESTAMP(1771565955023 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'santizmario398@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771565955023 / 1000), TO_TIMESTAMP(1771565955023 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'leehakyo94@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'leehakyo94@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$xiAQpqxdMOhROQ==$HnhvTGSSwh3WAYqr1ycFv20+NID05M39LRwIKDtoO49olLBEcYllD78hSauBs0nE3/C1lW7HP6MKH+MGEIU47g==', NOW(), TO_TIMESTAMP(1779812112521 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "NBQqBvZWqLaKX7C3suRQF0CBbZi2"}',
      FALSE, TO_TIMESTAMP(1779812112521 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'leehakyo94@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1779812112521 / 1000), TO_TIMESTAMP(1779812112521 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'platinumakroma@icloud.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'platinumakroma@icloud.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$cQ1L9aMWBWBK8A==$3BYZ893dVf18OstZykgCsJAqklswaZT05tUSlDXVRinBzQf8zrlie9Om0OZmchRY/t8Io0ftWKQoqTYKSNKDdA==', NOW(), TO_TIMESTAMP(1771280652421 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "NBmqj7ryA6cbCetNxh4NULy1I0u1"}',
      FALSE, TO_TIMESTAMP(1771279983826 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'platinumakroma@icloud.com')::jsonb,
      'email', TO_TIMESTAMP(1771280652421 / 1000), TO_TIMESTAMP(1771279983826 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'amaro.and9@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'amaro.and9@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$ECt8lNbdvrzqGA==$L2jkdkU3izh6SkkjkmOFKBUFb11F8ee28dImV/5clwniWci/7igdfnpz5xHqLKpND9G3Yzm7aJklHHfCr8zmnA==', NOW(), TO_TIMESTAMP(1772293779080 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "NKuPuAa2B6P1umwPvwkUYwuBL912"}',
      FALSE, TO_TIMESTAMP(1772293779080 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'amaro.and9@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772293779080 / 1000), TO_TIMESTAMP(1772293779080 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'mfer19934@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'mfer19934@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$AjUorqDB14zcwQ==$SH5rMHoY8rYrrQOWwQvKf4sOK8zNo+hlzAfp9nhwu9UIqKD3zGp96e9sjGkucRMsQjhZOIJKHFKf0ouXt3hKKw==', NOW(), TO_TIMESTAMP(1775663950934 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "NPwxOGThc3fVR6OdQPzMtpX4kaH2"}',
      FALSE, TO_TIMESTAMP(1771331289433 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'mfer19934@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1775663950934 / 1000), TO_TIMESTAMP(1771331289433 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'suriano_euge@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'suriano_euge@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$I2vQOw04GVgX6w==$aY6WX054OfcSUaiK/xV1kJuihd9IT7IqcPnai9KuoX3yZBizUOdo7mRuQ30MT7H5OgnByVqs/B4aeJjOAsZlSg==', NOW(), TO_TIMESTAMP(1773034633387 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "NRi3SAxkTGPdIQKcILBnEScwq2i1"}',
      FALSE, TO_TIMESTAMP(1773034633387 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'suriano_euge@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1773034633387 / 1000), TO_TIMESTAMP(1773034633387 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'yobany5.felino@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'yobany5.felino@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$jvYC3dSTIqu13Q==$noGCRKzyp5ENOQi3xfrcu8dfiCJjPHt44CUQTj/68+nPfQzBDlEhG69Ag+ux2ReYRtgbPaWmE8KdXejhUGmR6A==', NOW(), TO_TIMESTAMP(1774453185356 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "NSOtMrkRiJOExVoKpjj6SELlVG72"}',
      FALSE, TO_TIMESTAMP(1774362538059 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'yobany5.felino@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1774453185356 / 1000), TO_TIMESTAMP(1774362538059 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'juanitojuan482@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'juanitojuan482@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$s16rTJsg9q3dKQ==$uXCqN4n16x7sJ4XjfJaaqr42GO2C2DuUb5Bjpuj5XID28taUNoa5tVwBm9TVRcfuNMvvTgIhv5x3h4i6nqu11Q==', NOW(), TO_TIMESTAMP(1774042226521 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "NccglfAZ8JPt9NYqur1VYQ3qwDD3"}',
      FALSE, TO_TIMESTAMP(1762989549174 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'juanitojuan482@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1774042226521 / 1000), TO_TIMESTAMP(1762989549174 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'hiybn@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'hiybn@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$xV0GytxPJT6ffg==$pGcMbmJXFIsDu5hUzMgu9p219Svs39omufc60mf4HObQdDk2u3iI22qpKf3LZ8l1GawE4eO3NvuR+32ugfvOMQ==', NOW(), TO_TIMESTAMP(1775952186928 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "NgPPgPSi2WPBh3wKbB420IcIJa43"}',
      FALSE, TO_TIMESTAMP(1775952186928 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'hiybn@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1775952186928 / 1000), TO_TIMESTAMP(1775952186928 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'miriammartinnez5@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'miriammartinnez5@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$8ujOg1g6nG3jqA==$tgEr46VHiwEd6xTig2e5nQVIJwZMpGccAas37kB+fi/DicjsyxMTwceG/HuJmC9eJ/x15+3Hiy8UMFspaP/Q4A==', NOW(), TO_TIMESTAMP(1766353847909 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "Nk4oyUzycjb5zOdNVKKUX4jEKKH2"}',
      FALSE, TO_TIMESTAMP(1766353847909 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'miriammartinnez5@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1766353847909 / 1000), TO_TIMESTAMP(1766353847909 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'obdulialopezperez823@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'obdulialopezperez823@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$ExtzE6Wv3A5RRw==$+++J8hdaheeoK737iF3B1X5N+fCuq3W/YuiZBlf0k9d82a4GCg4T+Lpdr2/2xKmZvjBPUvcjoI5aC6Z0jxAWvg==', NOW(), TO_TIMESTAMP(1771477495525 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "Nqachff14zdqIDvRos8T3ckmWxd2"}',
      FALSE, TO_TIMESTAMP(1771477495525 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'obdulialopezperez823@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771477495525 / 1000), TO_TIMESTAMP(1771477495525 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'alex_mog29@outlook.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'alex_mog29@outlook.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$57ZJ2hY1AA7v8g==$Hu6F9ncymBnbievF5MUEuuQ3KbusCLDir7YUNYNnOEADXWZOMFpYQtDmH+uqZLLz6Q/d08pGIJk6Jlndh/LEIA==', NOW(), TO_TIMESTAMP(1773342394312 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "NqmBUJVTDPQdtycq284fJdBCS9C3"}',
      FALSE, TO_TIMESTAMP(1773341530883 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'alex_mog29@outlook.com')::jsonb,
      'email', TO_TIMESTAMP(1773342394312 / 1000), TO_TIMESTAMP(1773341530883 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'admon.solutions.mty@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'admon.solutions.mty@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$NDRH7Z4+Xtp4wA==$x5wFFVVq7I5+68gWEtgFvuqPlkOoAFDF1tWcRew+V+4Np+h/8d2WqTJ7ERvsKP6t9nemZhMe4snRsAgWUGMwpQ==', NOW(), TO_TIMESTAMP(1765871038152 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "Nx1PxvyPO2RVPmYx7apagHgOzpU2"}',
      FALSE, TO_TIMESTAMP(1765871038152 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'admon.solutions.mty@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1765871038152 / 1000), TO_TIMESTAMP(1765871038152 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'hectorlunasp@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'hectorlunasp@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$bTuPQfqK40rB/Q==$f4xDFaXxE5U1dpDT9Y9nv9erhftdtx4oEnQJKdYjBXXMlzj0xPL3HfRkRsDdyUayJGsL3zMy15qNphjnOVHbRw==', NOW(), TO_TIMESTAMP(1771280647610 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "Nz6SKEtZQcTqF8vfxqJ3a15LJ892"}',
      FALSE, TO_TIMESTAMP(1771280647610 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'hectorlunasp@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771280647610 / 1000), TO_TIMESTAMP(1771280647610 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'jesus.13moguel@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'jesus.13moguel@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$mYq8ZkoB73Dhqg==$gGhVUp42GANwIkDF4KIYl/9EM5NNbtNM+LZLzz8rhjxNU90SybOgyfMu+X+Yc7VAssNQXVorDnIT/0yLa/YOQg==', NOW(), TO_TIMESTAMP(1771274392202 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "O6ijxeWnvAXgUBhUuAiuWdBG2qo1"}',
      FALSE, TO_TIMESTAMP(1771274392202 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'jesus.13moguel@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771274392202 / 1000), TO_TIMESTAMP(1771274392202 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'rjs_mx@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'rjs_mx@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$q6AzLgCD1hMFYQ==$X58GhihfBbgKHsTURbK7F8p+qBlhvQeXh0SD2QHgX/ZguWlwLMGBBrFK93NBkYKKZl2VYq1cD92/0uBROlQz0g==', NOW(), TO_TIMESTAMP(1771278120351 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "OBUUGzAg6KVDSGKvbwR9xH2I51t2"}',
      FALSE, TO_TIMESTAMP(1771278120351 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'rjs_mx@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771278120351 / 1000), TO_TIMESTAMP(1771278120351 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'ezziominuttos@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'ezziominuttos@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$tjTi+5CiqSHZgw==$/tAgGr7ntH5BsnIIg8i3oJjsmSdsndfaaxfixxl6GklFfRvdf3D7FyutsvsL+ciJ9KIttVrrUJlMwuj6934m2g==', NOW(), TO_TIMESTAMP(1779488271894 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "OCG3358WhbhkaMC5xSpfvOLDV5m2"}',
      FALSE, TO_TIMESTAMP(1779488271894 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'ezziominuttos@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1779488271894 / 1000), TO_TIMESTAMP(1779488271894 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'chema_gtz85@icloud.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'chema_gtz85@icloud.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$jdaGz36K+5jIpg==$pkVKq6muvZp2pVByDgaevNgV07iy5O6C9+rOjnzcgmwVm/RtV1aZi8axOE3CzZh6lGkHvnManKTbJO/CvIeBoQ==', NOW(), TO_TIMESTAMP(1774318640223 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "OIXhXm6cgjMZ4GRdkVF7SutZI3f2"}',
      FALSE, TO_TIMESTAMP(1774318640223 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'chema_gtz85@icloud.com')::jsonb,
      'email', TO_TIMESTAMP(1774318640223 / 1000), TO_TIMESTAMP(1774318640223 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'jenniferjoce16@gmai.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'jenniferjoce16@gmai.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$4SuT9Apz4EEzYg==$6CNh3OHdRgUr/rxUzS6FfYCV6AH0UbDdqkfd3fpzbtXxbMmeb9l5LkEoYLkYnH9YdxlUV4KQyKV5tLmMhYoytw==', NOW(), TO_TIMESTAMP(1771717339180 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "OMFLpZKlOgc1ExZcz5ig6NqYzS03"}',
      FALSE, TO_TIMESTAMP(1771717339180 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'jenniferjoce16@gmai.com')::jsonb,
      'email', TO_TIMESTAMP(1771717339180 / 1000), TO_TIMESTAMP(1771717339180 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'vaia63@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'vaia63@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$ydP/wUNiRnFQ5A==$ct8KoqAYxVbrayXLPrCr5ETdM1SdRRHVWfQMhAmvpI6s5jgXZDUvEJFPVnnYg67nUWF31q+4hcnYWp+mzeytSg==', NOW(), TO_TIMESTAMP(1751566720925 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "OPAjJ4fF2xfZLSz6LLmz9l6FNZ12"}',
      FALSE, TO_TIMESTAMP(1751566720925 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'vaia63@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1751566720925 / 1000), TO_TIMESTAMP(1751566720925 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'sergioorigen@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'sergioorigen@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$Pib4a5tQuJLh1g==$nHlGXH1nsn0SUcycBhpRpNfE4cEi+Tpj8sg1IDIAnvGDKrxQqcXnJDOl3Lx6KBBrIvXJcoz62bsX09J0P2XItg==', NOW(), TO_TIMESTAMP(1772841663618 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "OQFDIq2RQEWitweo8ZwUvdCmVxA2"}',
      FALSE, TO_TIMESTAMP(1772841663618 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'sergioorigen@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772841663618 / 1000), TO_TIMESTAMP(1772841663618 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'lucy.maza.lopez@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'lucy.maza.lopez@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$2oubZBJIyeubYQ==$J3EJ9SspM7JFxnPUoMQHhx+SQDyBZws8QjuFbp+WVDKbS4hJPqwbCbnVoekSzp5H9E+mER3PLOfS379IaTqJwg==', NOW(), TO_TIMESTAMP(1775137733448 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "OQkSzstk5maqNoeT44CYNwNru0E2"}',
      FALSE, TO_TIMESTAMP(1775137733448 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'lucy.maza.lopez@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1775137733448 / 1000), TO_TIMESTAMP(1775137733448 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'karbelhl03@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'karbelhl03@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$y2ZeV0JkFdum1w==$nMGse8mqBNFfEUYOcUhmlPDxQoKiV5pHQ/tt/6k+zO4uKFRvQ56l7OYf3P8sl1hqpp+x6WxjJQ4qtO184PkWcA==', NOW(), TO_TIMESTAMP(1778957257598 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "OSgmk4Ke85cA7qHnb7LLUB1GEey2"}',
      FALSE, TO_TIMESTAMP(1778957257598 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'karbelhl03@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1778957257598 / 1000), TO_TIMESTAMP(1778957257598 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'angelyael.07.04.01@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'angelyael.07.04.01@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$GIUcS5VECXAtew==$RrgZZop9K3svrEQmyV7luk4ntWgin7+ouSN8mNXEVGy8i3++2I2BNdwdluxppQWBGy7CRzdmwYmNnM9ipFtVNA==', NOW(), TO_TIMESTAMP(1765551711654 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "OVN0YCNYXTdKIriQlrhGUzEi4cr2"}',
      FALSE, TO_TIMESTAMP(1765551711654 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'angelyael.07.04.01@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1765551711654 / 1000), TO_TIMESTAMP(1765551711654 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'gomezlopezgaudencio8@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'gomezlopezgaudencio8@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$XLWXk8YjVTGxdA==$TfaoZnurXc2Q8An0cdkfkqB/hFueDwQNQMBvLw1kdQOqJIOHiXrJsQzZMy6k/wN4fIOh11rOoszQ891prbV+zg==', NOW(), TO_TIMESTAMP(1771887153999 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "OipqF3otqwev7JBucrNW4AGVn953"}',
      FALSE, TO_TIMESTAMP(1771738664410 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'gomezlopezgaudencio8@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771887153999 / 1000), TO_TIMESTAMP(1771738664410 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'roxg91@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'roxg91@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$7DVAX7LO+SSyig==$wX52HdRfxw6DcfMyXLtThF2yc+9BAEksQuj0AEXomuBYXoX7pcsT5yY6vnJUE7NNy5NYwM/TVGcqCz+XOlU14g==', NOW(), TO_TIMESTAMP(1774209886684 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "Ol0NTkFIdJRa0btYSLiqFOtpMuI3"}',
      FALSE, TO_TIMESTAMP(1774209886684 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'roxg91@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1774209886684 / 1000), TO_TIMESTAMP(1774209886684 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'maya.alekxandra.115@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'maya.alekxandra.115@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$id3GwpXd0q1Xhw==$0aBOymVlpOHk1DcYXycNtj0mMYTmSXPtthPHZeSSwsQ3jrLJAv4Zr6Zs3lLyFsqio63QIWXZQBjWCnydnvTSJw==', NOW(), TO_TIMESTAMP(1771270937929 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "OweOThCDF2Xw0CTs6FXVDHUZpyi2"}',
      FALSE, TO_TIMESTAMP(1771270937929 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'maya.alekxandra.115@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771270937929 / 1000), TO_TIMESTAMP(1771270937929 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'ronshonk@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'ronshonk@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$gmOBwXQd6fPyuw==$zAzSCU9YMpm/awXuUhSibSrP2ZS/6Qe/5YtAba5Oh1s1/mZiBt5yzsQfluTyDB8O+vEdYpEHVE7nwk9qU/rENA==', NOW(), TO_TIMESTAMP(1779186527164 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "Oy5SfuE76RNhKCItB9ecETKVggL2"}',
      FALSE, TO_TIMESTAMP(1779029892963 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'ronshonk@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1779186527164 / 1000), TO_TIMESTAMP(1779029892963 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'martinezelsaaa@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'martinezelsaaa@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$hX0CWms6F9ywDg==$iuXI03A7vF2xp4cXGgnU6ym8WaNH5IFgTgpAPmAEa/1SdNzBjC4gdSLBp3BFetmTGYTgRMVb/3gzcjMfMXVbKA==', NOW(), TO_TIMESTAMP(1773025679800 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "Oy7zi2IeNbNEIxn4hsrtSb1TAzg1"}',
      FALSE, TO_TIMESTAMP(1773025679800 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'martinezelsaaa@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1773025679800 / 1000), TO_TIMESTAMP(1773025679800 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'gaelsant094@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'gaelsant094@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$XxKuvdt3LFA39w==$Dqq5V6KkvHDISm55LiLNPNXwkHe8JFkFteTNST5YW8sSG4fF3tOVok4pc0AOzzPkvmqwcL4TeZjIrR/zkh/7ng==', NOW(), TO_TIMESTAMP(1779167591679 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "P2CYk2KC0lX5WtqSRSIhRgkzMP33"}',
      FALSE, TO_TIMESTAMP(1779167591679 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'gaelsant094@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1779167591679 / 1000), TO_TIMESTAMP(1779167591679 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'bcndelay@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'bcndelay@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$8Wd9wQoTFR26YA==$qq1uIsS7Ye5rZcd0FS47SatTorHkoz693n5KG3mJUHjVC2r6kp+Oe6io3jZpuuPQTlf+rTuwU5TW/X/AcpVOpQ==', NOW(), TO_TIMESTAMP(1774800386107 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "P3ec0l2sy5MrhH0NV0vhwWU1Adn2"}',
      FALSE, TO_TIMESTAMP(1774800144732 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'bcndelay@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1774800386107 / 1000), TO_TIMESTAMP(1774800144732 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'alberto_balcazar@live.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'alberto_balcazar@live.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$UFjD8lt1Sd0qYw==$GiX8oMzcb3gdcnn/dYBLWOvdWfi8B0Ta1rfSzXQgaA6qo1HhOVFBplhb7JR5efnwN7S5i11GZq6Rt3ZKe67O2g==', NOW(), TO_TIMESTAMP(1751512734612 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "PAGkGn41EFWohvvWGl2LaSe9kw62"}',
      FALSE, TO_TIMESTAMP(1751512734612 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'alberto_balcazar@live.com')::jsonb,
      'email', TO_TIMESTAMP(1751512734612 / 1000), TO_TIMESTAMP(1751512734612 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'chavitopetul@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'chavitopetul@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$BRcyBfD/mllmwQ==$2nVYLXyvS7ODQPVzAseyX6+9Ka1Jxr9ywuBRU9Y0Bzak6+wIPKOmKYh2enEvFFWYH8ynANioZB3Pqv0OpBOFzQ==', NOW(), TO_TIMESTAMP(1775047497672 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "PCvwdrHQHZS86eUdov9szeLnMpO2"}',
      FALSE, TO_TIMESTAMP(1775047497672 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'chavitopetul@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1775047497672 / 1000), TO_TIMESTAMP(1775047497672 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'jesusrolandoguillenperez13@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'jesusrolandoguillenperez13@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$n9trKUnqn7ctCg==$ONNNZdUnh6Xnoc7CGp0Exg/JJZ75WcVd0upBoTIb2SlWURJRTT6TOEVZrSTPmw+u3RSw0y/rFjEEoB5+0GNZOQ==', NOW(), TO_TIMESTAMP(1753153925924 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "PHoaHr01DgQ3rJMYUKfGHT17jLv1"}',
      FALSE, TO_TIMESTAMP(1753153925924 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'jesusrolandoguillenperez13@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1753153925924 / 1000), TO_TIMESTAMP(1753153925924 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'keremjesus@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'keremjesus@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$PcTpMhY5H385lw==$1FyEmc76crJxZGkUTDOeDlpjPgTi4FhrZYmYZUUDvjF+NAf/4f9XrC3Y24rP901xO4wg3HcP1Eumbol0fWvYtw==', NOW(), TO_TIMESTAMP(1776274406966 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "PIUsFGahQRb4XQoul6Jp3mufxZt2"}',
      FALSE, TO_TIMESTAMP(1776274406966 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'keremjesus@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776274406966 / 1000), TO_TIMESTAMP(1776274406966 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'luisan0427@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'luisan0427@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$mu2UyfHlSViThg==$AoM6O9jQGPzCjFjlLbn6OpTi5dIg6RjIFxdyFzJyqp37GpY/Q1Z++GJfpKm9cZID4KXjdl29r/ZAGkqsENZDgQ==', NOW(), TO_TIMESTAMP(1776389814749 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "PJfjWos94lRusGiqVH2T8fnXu2q1"}',
      FALSE, TO_TIMESTAMP(1776389814749 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'luisan0427@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776389814749 / 1000), TO_TIMESTAMP(1776389814749 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'geovanimolina16@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'geovanimolina16@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$UsxlQnbn5KuvXg==$3zbKvcVBvrSROozgFY5RnZnufengsI20r9awItBqOhGqWoEwsJrOJKUgYVGyOV+NaL1dl1LtxzT49BRAEA9Xwg==', NOW(), TO_TIMESTAMP(1776447518599 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "PTXmzM4dEfeB5w1XTc5y7eY2svG3"}',
      FALSE, TO_TIMESTAMP(1776447518599 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'geovanimolina16@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776447518599 / 1000), TO_TIMESTAMP(1776447518599 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'sanchezloeraatomas@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'sanchezloeraatomas@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$4kZtL6YEkVYASg==$5PVmnN21R5RT81hS4XRZs8ykmpRnjkHY+kDE1mnBabxniiZjo9cwJY5p2PECYHp4BLM2M+Cj4yTKDVebVZPuXw==', NOW(), TO_TIMESTAMP(1753427429923 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "PTlkY1VliTTahlrBNK76zSKokOX2"}',
      FALSE, TO_TIMESTAMP(1753427429923 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'sanchezloeraatomas@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1753427429923 / 1000), TO_TIMESTAMP(1753427429923 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'patysantiago12@icloud.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'patysantiago12@icloud.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$p0tcxvZmBc+M/Q==$EUYK5w/pbm+Bm/lSZVL5TT/GnAsaPaWVTUualPNGeSjkcVLzupo1ecbAKo81xAtR64/Aggs57l87+mg2BxK+CA==', NOW(), TO_TIMESTAMP(1776246621372 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "PVUkgO2nIQSXRluBQpomQEbQaAW2"}',
      FALSE, TO_TIMESTAMP(1776246621372 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'patysantiago12@icloud.com')::jsonb,
      'email', TO_TIMESTAMP(1776246621372 / 1000), TO_TIMESTAMP(1776246621372 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'escorpionjmc@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'escorpionjmc@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$Lnfw9+9MPwfAJA==$zWm8/Wc7Ys3aq0OYlaS7nNsLaaRZsT4qbFek/DBgcIzQPhzuvZWdKE7Opfza+ZRIYiXvdOoJmsZ6j1DnCjU2Xw==', NOW(), TO_TIMESTAMP(1772241555655 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "PZpvM4wJLUQNaCWSNxawbHaUsMR2"}',
      FALSE, TO_TIMESTAMP(1772241555655 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'escorpionjmc@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772241555655 / 1000), TO_TIMESTAMP(1772241555655 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'axample@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'axample@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$XyumrCfIdXuLqA==$j7VLce4YJuK/xYkthYI/EV0A4LIaOnn+y0AZGBjmmo4fMuZCk25tJmKS4Er3mBjjo/sZX621ulXR774Jka2FPA==', NOW(), TO_TIMESTAMP(1774985694017 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "PbfgvzoP4JYPXPJ6PEs71jdqvvm2"}',
      FALSE, TO_TIMESTAMP(1774985694017 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'axample@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1774985694017 / 1000), TO_TIMESTAMP(1774985694017 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'deroelpulgas@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'deroelpulgas@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$wY6PpkN0FnnDWA==$po3qJNPS5rj2/FX4gGaNzfgtl+dy7+ItbmwGBvC88Cx98Hisp0oPcODvuMRRXI6OObh20xbytsgtQuHohOmtUA==', NOW(), TO_TIMESTAMP(1771291588997 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "PdJji9gIF8bzfcyNEGgJCZR2tpN2"}',
      FALSE, TO_TIMESTAMP(1771291588997 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'deroelpulgas@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771291588997 / 1000), TO_TIMESTAMP(1771291588997 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'quijanog224@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'quijanog224@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$aJescxrWNZNLKw==$XPZJKTpWZ1tRfqcCjYLXBirUPt4T9UjCY+OJcMBALCjwchZG33aEPmAHQFOL2bepnoIFLPXZLLzGCz1jaEO6Hw==', NOW(), TO_TIMESTAMP(1751585993636 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "PgJmkcH7gtNE8dxOrqmAShwozG62"}',
      FALSE, TO_TIMESTAMP(1751585993636 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'quijanog224@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1751585993636 / 1000), TO_TIMESTAMP(1751585993636 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'gramos7913@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'gramos7913@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$ZeJ1GEz+7KW2DQ==$fW72eHvV/tgOL0bYNBfa2EMN86jNgqyKQ2/miMrXpvbCQNGJrUnXRakVGbuuCIpDglKKYngjj2CSII7PqalAHA==', NOW(), TO_TIMESTAMP(1773467834350 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "PsCZsGIzVtYI2RwcFJtt4yTjRHv2"}',
      FALSE, TO_TIMESTAMP(1773467834350 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'gramos7913@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1773467834350 / 1000), TO_TIMESTAMP(1773467834350 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'ingridlizcano97@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'ingridlizcano97@gmail.com', '', TO_TIMESTAMP(1747778167160 / 1000), TO_TIMESTAMP(1747778167160 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "PsCt0VNfCvcqbStUwjVtlXYPeQt1"}',
      FALSE, TO_TIMESTAMP(1747778167160 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'ingridlizcano97@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1747778167160 / 1000), TO_TIMESTAMP(1747778167160 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'ruizromelia659@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'ruizromelia659@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$0Q/kr7/W51uiig==$tmkAC4k7a/QnPQqoG5G6SaIRGvc8bHx4+PDdI+dRHjpHMm8EG7HzQZt2cYs2s5gRf4/RHxwZYdy6mlH1LgSuYw==', NOW(), TO_TIMESTAMP(1776229804491 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "Psxwaa7khsSdjiU6cdl7UXi8Oxy2"}',
      FALSE, TO_TIMESTAMP(1776229804491 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'ruizromelia659@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776229804491 / 1000), TO_TIMESTAMP(1776229804491 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'jmauricio.valdesb@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'jmauricio.valdesb@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$bvlawyBgkm0eZg==$YY+2iMvm9hdu62I1gMgBZ+HBmgdd+Pd5ODA13XkSUZ3V1gNgfqtJb+mHK9k+TDWjfF52E0gvhLOsQOe0fIlltg==', NOW(), TO_TIMESTAMP(1751340549793 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "PtF0k5geG9bzYLapCLBSNyQ4Bdj2"}',
      FALSE, TO_TIMESTAMP(1751337634606 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'jmauricio.valdesb@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1751340549793 / 1000), TO_TIMESTAMP(1751337634606 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'veteleau77@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'veteleau77@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$iLQYsIfDody9hA==$oH8olwFAaLxlk+bgPdQokpvccOYxp+GkT3VmZy28Ym1X19fo3CHtkhWNHtw8hN0t1mMYvG5ysykNONcUmyDxzg==', NOW(), TO_TIMESTAMP(1771725134342 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "PvrhaKIqm0ddj4iaCeNnjOC1pZ42"}',
      FALSE, TO_TIMESTAMP(1771724846182 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'veteleau77@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771725134342 / 1000), TO_TIMESTAMP(1771724846182 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'guadajimenez28@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'guadajimenez28@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$NV2/swsDug05fQ==$xHiK0MXDJZqz3XqfeDT21hPpwePjAOd9Twb4ps/sKatQ+dqH803mvCun7OL/QV/8KxJofEdx9Qc7s1L+HI+tHg==', NOW(), TO_TIMESTAMP(1771427842562 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "Pz23GcYO0TcNnJhYtFUvQJGmo7j2"}',
      FALSE, TO_TIMESTAMP(1771427842562 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'guadajimenez28@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771427842562 / 1000), TO_TIMESTAMP(1771427842562 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'paniaguarubiel1@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'paniaguarubiel1@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$5OqxPGnqQoSmNQ==$4lQ6zDTKblf7nRQHyCx4JfFQLTX0CfWL4D7RyG7erRzo/nKBwEC7oUzrqCaFUHeriZWa3pcThgtLPL0Rehf8LA==', NOW(), TO_TIMESTAMP(1772236228822 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "Pzk0KlCfEOPdDhMJ9rf8zeS6QgD3"}',
      FALSE, TO_TIMESTAMP(1772236228822 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'paniaguarubiel1@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772236228822 / 1000), TO_TIMESTAMP(1772236228822 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'lupabica@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'lupabica@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$qv6lrsrWA50GuQ==$rm0jzykM8nL/c00f1rBdwflU2J/xc+PBXutTXhyMgTPpZrSKLiGyIaMNytllr2jLHbpp7c9sXi3E50gUO4c2cA==', NOW(), TO_TIMESTAMP(1775697288728 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "Q1KNkOkv9HhXeobDsRRAnumiV923"}',
      FALSE, TO_TIMESTAMP(1775697288728 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'lupabica@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1775697288728 / 1000), TO_TIMESTAMP(1775697288728 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'paquitalopezruiz56@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'paquitalopezruiz56@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$FNrP57hShFX9Tw==$OLp0TIS6FmVMzpzI8r+ptNJHOtRVNrPI0GWFNHjPRt83FnlNjbLLl/rKqPFzjR3qzj17vzQjTduCKOSV9OKEuw==', NOW(), TO_TIMESTAMP(1771857424867 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "Q2YfxmSh8nVzHn9vvdGH0ze1NCi2"}',
      FALSE, TO_TIMESTAMP(1771857424867 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'paquitalopezruiz56@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771857424867 / 1000), TO_TIMESTAMP(1771857424867 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'tonyhpmessi@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'tonyhpmessi@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$yWgq/mH8EQy6qg==$w3pRbTl9hNjFA/xTNduM1CTEgfq5eRglDT81QIen4jZ8I1HB9DArAjKby4/JKIemJa5TINh9khSn10s9kVxz4A==', NOW(), TO_TIMESTAMP(1752525469980 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "Q8WRN6XDIxeuSrU5clZOEjNYjpf1"}',
      FALSE, TO_TIMESTAMP(1752525469980 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'tonyhpmessi@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1752525469980 / 1000), TO_TIMESTAMP(1752525469980 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'klartobias33@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'klartobias33@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$S5AxG1P6UaJkiA==$WRFG4P1/MghhiIq1GxW1aY6U5Tj7K9SB+/1x1YewOM0OGH0MUuhNavN8cCAs0nfFZY8LefgIr6bWQ5+xecL6hw==', NOW(), TO_TIMESTAMP(1776228774925 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "QIDAIUs0Mohgut6tCj9q1qt1Taj2"}',
      FALSE, TO_TIMESTAMP(1776228774925 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'klartobias33@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776228774925 / 1000), TO_TIMESTAMP(1776228774925 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'abisai281220@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'abisai281220@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$z/DVI/F6mKMYnw==$ev/I49XkwQMkmz/oPEfgftocI4seAUqvV0gcnD9NYGdJmLg+R3VEISUUeaSpcPf7+tlk6Jrs0eGOo4UJWBOs5Q==', NOW(), TO_TIMESTAMP(1751525193667 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "QJH7J6IZ5ZQ5ZisQYhtNdIcWcjP2"}',
      FALSE, TO_TIMESTAMP(1751525193667 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'abisai281220@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1751525193667 / 1000), TO_TIMESTAMP(1751525193667 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'criss_290525@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'criss_290525@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$pzT6mqHgOOZn9g==$v29EIeR9pTuoq0D9Ny5v218icPBWkx1wae5wtnGYy9OMcqFPTqHN1hCpIVGVQzVOSpKYymllPFYE25sj94chpA==', NOW(), TO_TIMESTAMP(1772137715407 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "QLO3rcvHNZdxDAeQdJL7XVI8NMi1"}',
      FALSE, TO_TIMESTAMP(1772137715407 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'criss_290525@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772137715407 / 1000), TO_TIMESTAMP(1772137715407 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'ricardoarguello406@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'ricardoarguello406@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$k7UNsR+l6WlEGw==$Fw5/BHDf7n/v4/aguAjo06gQYs0WuApEuuGeVssQUPsaN+YMNPEioD7aIDnvowmsWvTEGXNqM+loCLFwev4Qjg==', NOW(), TO_TIMESTAMP(1778873234819 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "QNg9sQ3eDDcNz4NrfCcVJNmVGcI2"}',
      FALSE, TO_TIMESTAMP(1778872739595 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'ricardoarguello406@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1778873234819 / 1000), TO_TIMESTAMP(1778872739595 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'brenda1140@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'brenda1140@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$ik9QnPL1fdvwyA==$X8TXwFvUHGkcMqp7gNnuCk+By8SIGBt1e/xkrb9jIyEz8qcQkX5WBpN2vfvndlmbIC1wcq2K3qrumJIDhdq/UA==', NOW(), TO_TIMESTAMP(1775974812758 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "QQc8Tkntm7b7jrwmUITbvl3XPVF2"}',
      FALSE, TO_TIMESTAMP(1775974812758 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'brenda1140@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1775974812758 / 1000), TO_TIMESTAMP(1775974812758 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'nichimamtel@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'nichimamtel@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$8wpKk8AonullBw==$uKkO6hYo3YcYWSnJdD3jqLuCH3AuFSlYzjd8aIoZWPdXIr0kWdyYztVS2nYTNA215aEdNi2STdPXji3jsOuWBQ==', NOW(), TO_TIMESTAMP(1771778343821 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "QSFIkcbtpVVvmnFV2h2j2saibp03"}',
      FALSE, TO_TIMESTAMP(1771778343821 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'nichimamtel@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771778343821 / 1000), TO_TIMESTAMP(1771778343821 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'marcosferguson@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'marcosferguson@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$0AkpzJp1CwuYdg==$ZjR4eCCzb8lIlKyg/ThCQQXO98I5YZgI/tLkI6W+dft4KfPuOKtUS7I8vGLiFJh+q44btgJFXxH1AVydVqc7XA==', NOW(), TO_TIMESTAMP(1776266186884 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "QXvLsyqFt1V14CLCHt29LOpCG612"}',
      FALSE, TO_TIMESTAMP(1776266186884 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'marcosferguson@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776266186884 / 1000), TO_TIMESTAMP(1776266186884 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'karlapuente429@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'karlapuente429@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$jccOU/yBknHF5Q==$qwdh+rNtLyJWNsNcGdmM+F25TPhKv85K0ToIK+U3XlwNsLvg3dd/HsGVX/c18yT2ZCJMfOvo17rRtqb5iQxtvQ==', NOW(), TO_TIMESTAMP(1751606147333 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "QYzyxI522UVubQUeaoiNeOY7Axz2"}',
      FALSE, TO_TIMESTAMP(1751606147333 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'karlapuente429@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1751606147333 / 1000), TO_TIMESTAMP(1751606147333 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'marhernandelopez65113@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'marhernandelopez65113@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$66R5D3x2+XPxAg==$hkLnTeqLouleVJLis6+EkGl85ib91MOvMmRORdpPESERxJ0qPhB4OysbNnZPO+q2zDeKSeK1KZSowijCTOV71w==', NOW(), TO_TIMESTAMP(1762902190238 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "Qisv8bD4fugq3tZp8yk9Jp6hAsG2"}',
      FALSE, TO_TIMESTAMP(1762902190238 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'marhernandelopez65113@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1762902190238 / 1000), TO_TIMESTAMP(1762902190238 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'vanegarciablanca@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'vanegarciablanca@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$pjy2XFZ3lf2DDA==$bw9/GvanR6ZRpD48RgZpNAk7l4USaqpU8oG/W2Z0hBKhNvCODHvxbNiUWeGoSMbhI7INmuEq3NTbIcKl4d4ogA==', NOW(), TO_TIMESTAMP(1771557546522 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "QjVEUdyhziYSRwZPREVq7nCooeg2"}',
      FALSE, TO_TIMESTAMP(1771539440633 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'vanegarciablanca@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771557546522 / 1000), TO_TIMESTAMP(1771539440633 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'paulorodriguezmartinez6@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'paulorodriguezmartinez6@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$pGSQNXoBIs8GJg==$pwueAwH7t0HsULHTC8h5uisjjy7k/t1hF3pF6OrZFWKqKfUcyZsDht9pVC9mqMnpyEramAWRAUh0PKq5SQ+ghw==', NOW(), TO_TIMESTAMP(1772964522794 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "QtKXRXuHxIM6v8JS83wSr2Dgowi1"}',
      FALSE, TO_TIMESTAMP(1772964522794 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'paulorodriguezmartinez6@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772964522794 / 1000), TO_TIMESTAMP(1772964522794 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'beatricpt@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'beatricpt@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$vC3TePv/b+GZWA==$Q33bRJYK4uUUY6T864VIl8br/fqiDkJ7T/+Swx6Jj0Nnr4NC4Jmb759nl73c2YyMV2uqJUKOj3mWXYUXRr0P1A==', NOW(), TO_TIMESTAMP(1771309341575 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "QuTfoCCYHKc17BWie5QFztVJ1Vg2"}',
      FALSE, TO_TIMESTAMP(1771308602278 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'beatricpt@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771309341575 / 1000), TO_TIMESTAMP(1771308602278 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'oscarrosalesruiz96747@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'oscarrosalesruiz96747@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$7ICvRIG1zd/5Lg==$rrIz4/QkQuuzsrEsYF6bUkXerE7o8iePXRg46dU4lZX/De3L9q6YMHBubVcKIJFkWDS5TAzGlV+Nh5wLcCmGag==', NOW(), TO_TIMESTAMP(1762998187438 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "Quz2pQX80mRRyeaKQ8l2Azuj02x1"}',
      FALSE, TO_TIMESTAMP(1762998187438 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'oscarrosalesruiz96747@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1762998187438 / 1000), TO_TIMESTAMP(1762998187438 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'nadiareyes827@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'nadiareyes827@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$ikn1tF9G8Bn+Rw==$ESLOTB5tjf0bqJ2a/qsPl57nzaMbKc80hlvnTZa0jFb4Wy0VY50QerY24WsoKYd5Ns2BRNg18ilksVHUH8wLEQ==', NOW(), TO_TIMESTAMP(1772933776002 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "R0XUvfZW1NUiHKjAUDDnyhFTjvH3"}',
      FALSE, TO_TIMESTAMP(1772933101163 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'nadiareyes827@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772933776002 / 1000), TO_TIMESTAMP(1772933101163 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'cpvictor.casio@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'cpvictor.casio@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$oQZbdlvKev4c+A==$rVDUHJdjD/xKOwrIur0VM/Hd741nZKHMEnmocyn4aIM2JkWUIpmhhzrTwPSOAD7B4EsQnxm5Wfw6nOZxdmCUcw==', NOW(), TO_TIMESTAMP(1764114793218 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "R4OSsPszgecANNQNJg5KFZbLSHL2"}',
      FALSE, TO_TIMESTAMP(1763392989438 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'cpvictor.casio@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1764114793218 / 1000), TO_TIMESTAMP(1763392989438 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'rickpesa9@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'rickpesa9@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$3tZ/07Gne/WBVg==$Xa3g27cvi9x4HzCA//LoMEIZHtx/NaWCy7EVyIiBtnFuLvIUaJD/n56GxidMw0Ke+Z6HApVRStkc5435ruOjNQ==', NOW(), TO_TIMESTAMP(1776561272303 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "R4UTGvbFzRPYiBAkf6CSq4O2chs2"}',
      FALSE, TO_TIMESTAMP(1776561272303 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'rickpesa9@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776561272303 / 1000), TO_TIMESTAMP(1776561272303 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'fbpg116betypg@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'fbpg116betypg@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$OWOMtxufzvRm2A==$YcNObgdeLb/td06wXwP9jhoIr9HwxXxpZP5Yqq4xQFQy4n7FOcBwwxrseSZQzvoh3GXTxct8CJXxHBL5bWedUA==', NOW(), TO_TIMESTAMP(1771302579627 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "R5T6IaUNIDbtbiKNsWUiJoKfQjI2"}',
      FALSE, TO_TIMESTAMP(1771302031327 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'fbpg116betypg@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771302579627 / 1000), TO_TIMESTAMP(1771302031327 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'emerith373@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'emerith373@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$I6YteNYJ0l8LQg==$/ehJDAsHLyhvcamL5RVnwwkIItl82LHUMcv7zA39biUG8D6ym1eONPxZnamnTnGeUeuNLUTnI9HXu/6Bki87lg==', NOW(), TO_TIMESTAMP(1771288901653 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "R6kwJx6YVOX2UPwRiRKwuT5pXSm1"}',
      FALSE, TO_TIMESTAMP(1771288901653 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'emerith373@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771288901653 / 1000), TO_TIMESTAMP(1771288901653 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'merry_rouss7@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'merry_rouss7@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$iBQBbDOnbGpc+w==$f+4PCS4d9BKjteyzOU7XBL73EliAIO5H91Tl4D9lXP1F+UhAx98Hxrha0oQ/apZdmusBp3JO61hx0AhmI0y6YA==', NOW(), TO_TIMESTAMP(1771455925318 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "R7ZO6ujPWNYaz8P0aqNYY8l8Mhv2"}',
      FALSE, TO_TIMESTAMP(1771455925318 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'merry_rouss7@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771455925318 / 1000), TO_TIMESTAMP(1771455925318 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'angeltunita5@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'angeltunita5@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$Igi8vlEgBnzqBw==$/oUfLZpY82TONfbuLfenOeY2lbN4aColAReLZ8KaEs8we+r4vk0iiazYTCrSRcXNp0A2d0gSjCLElsG3xEpKGA==', NOW(), TO_TIMESTAMP(1751433539174 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "R84v6amyRTW2aQH0CmfNbcWMUZa2"}',
      FALSE, TO_TIMESTAMP(1751433539174 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'angeltunita5@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1751433539174 / 1000), TO_TIMESTAMP(1751433539174 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'andreagomezsantiz27@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'andreagomezsantiz27@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$tQbWVl3JOY+k5g==$zO3nHw0klN50ht6yvs/6+scJLP5aduOuYKt686Qn47d8ptg55t+/I46kxZIvuOVkvYqW3oc3NSmlgLXmHaUHqg==', NOW(), TO_TIMESTAMP(1775739750445 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "RAWNK7lCpPN8TXIIuYRKuHfQcFy1"}',
      FALSE, TO_TIMESTAMP(1775739750445 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'andreagomezsantiz27@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1775739750445 / 1000), TO_TIMESTAMP(1775739750445 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'cabace7505@gmail.comc') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'cabace7505@gmail.comc', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$rFbMFy3P5li47Q==$DusE3aFuKbPgwFuPnRrZsciaPiXf4l/YQVyAH+I7hXoZB7c8hjUoOZhFznu3f54pboGbKkSpfYs3lH8tzCZ5hw==', NOW(), TO_TIMESTAMP(1775000227013 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "RAkiafDZNWOwq5zT2guOB3K23hB2"}',
      FALSE, TO_TIMESTAMP(1775000227013 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'cabace7505@gmail.comc')::jsonb,
      'email', TO_TIMESTAMP(1775000227013 / 1000), TO_TIMESTAMP(1775000227013 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'majoespinosaj@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'majoespinosaj@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$u3ACGN9nUev/3g==$REiXOdEIJqOVyQEV5UWdoGMOnzxGMMEamiNpiQjYxLplclvatYtXDw3RWeIn60jLSVs7dK3B1eKsJarKCHezeg==', NOW(), TO_TIMESTAMP(1771275049512 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "RJJaaaTDHDbuenilaBE5eIKxOrp1"}',
      FALSE, TO_TIMESTAMP(1771275049512 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'majoespinosaj@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771275049512 / 1000), TO_TIMESTAMP(1771275049512 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'anacelia0507@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'anacelia0507@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$ZVJjP4aCIzeulg==$RozU6Kean5dvYXDyUx5rvNLoGImZCfkbI7KIyejVvI39opq2BOgmB0V/hti2yroO8UCIkPHRk5/9KWHKTKfXVQ==', NOW(), TO_TIMESTAMP(1776225159240 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "RLtKqoejwNcaB0Hy4XfWsAtAjTu1"}',
      FALSE, TO_TIMESTAMP(1776225159240 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'anacelia0507@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776225159240 / 1000), TO_TIMESTAMP(1776225159240 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'robertgonzalezvalente@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'robertgonzalezvalente@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$BmjbuOc8zny7MQ==$zVHBXhf5KHS8o8d/I21Q8EdyQ6B32Pq+1iwdbn/AIhD4J8zQLktBk5Xwen/dgb4c1hSHJk5wYVdh+0LxUbBo9A==', NOW(), TO_TIMESTAMP(1752597035749 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "RMbFZ9oDY1VrCj6f8XL9a6CcCAx2"}',
      FALSE, TO_TIMESTAMP(1752597035749 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'robertgonzalezvalente@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1752597035749 / 1000), TO_TIMESTAMP(1752597035749 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'mervy_b@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'mervy_b@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$t08DBKw/g34bow==$7nlwaEhXmUjrQWnrkTzho6xdczS/1QOO+MR6P3u95yLHdggBLO9D7znn+deHjDP40BT7ic8xdjOm4QLdjZuTfg==', NOW(), TO_TIMESTAMP(1774332183461 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "RNwXr99yLOfiIZcbuGRRBeQxZjU2"}',
      FALSE, TO_TIMESTAMP(1774332183461 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'mervy_b@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1774332183461 / 1000), TO_TIMESTAMP(1774332183461 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'anaaliciaroemrobalverde@yahoo.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'anaaliciaroemrobalverde@yahoo.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$oysrQZ3AQs6DmQ==$nxSrOY8/SKMMPovKbVPJfVsqxtRtHYj9H+8w4JmyNXeJyrNeF7OtTjulqBh655ZeYiIEQRnMleq3C4MaXZ9dUA==', NOW(), TO_TIMESTAMP(1774473996826 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "ROqDi65BsEUC5UaL3p0MjkybpP53"}',
      FALSE, TO_TIMESTAMP(1774473996826 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'anaaliciaroemrobalverde@yahoo.com')::jsonb,
      'email', TO_TIMESTAMP(1774473996826 / 1000), TO_TIMESTAMP(1774473996826 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'comebrujas@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'comebrujas@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$nOlzGEkNjS83EA==$bpjuM1iNSvtskR1xE2BBCULwwVZh6uomi6YksDW0XnRK61PSvExgO8shQF4Pkr67ag1vDVQQ2b/Ido7r0q2Pyg==', NOW(), TO_TIMESTAMP(1772147196168 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "RQ2jzgIHmtOjvKYiuEgsj9wEhwz1"}',
      FALSE, TO_TIMESTAMP(1772147196168 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'comebrujas@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772147196168 / 1000), TO_TIMESTAMP(1772147196168 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'alfredohdezfonseca@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'alfredohdezfonseca@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$MV+5iD5ZECSP2Q==$aPMHdUo3RZhlmY3/VDLzibgfKqmp4VoMz70rEQnuWYscelOhFVRMsCXXlNy9HYy4Q7dYZfigEYB+X/JeHndFMA==', NOW(), TO_TIMESTAMP(1776121498007 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "RQNjzoEJLTOC3es96sjO8mONKPE2"}',
      FALSE, TO_TIMESTAMP(1762298549562 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'alfredohdezfonseca@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776121498007 / 1000), TO_TIMESTAMP(1762298549562 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'ernestotg2745@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'ernestotg2745@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$kLtP+hPW0d9dXw==$mqkwDKddaNDSXWFCb6T9P4BBIvZVKxucO0sek8+/Mih1C3ynH2TxmXSSKwxTA55cly11q6jYfurtTvv6Q+giHg==', NOW(), TO_TIMESTAMP(1752740588901 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "RQYyLDThbBXNCA3xjt2UqWWIE3a2"}',
      FALSE, TO_TIMESTAMP(1752740588901 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'ernestotg2745@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1752740588901 / 1000), TO_TIMESTAMP(1752740588901 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'pacotv75@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'pacotv75@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$TcRlcDTE5l3W6g==$wy6MfFt6X935SlSKJuky1vH2Fnjp/8NJtjxaDnWRF6qNp11B3yLvnoKfDiHU+8NWl5+e+fv0WzzNToJaFgIx6Q==', NOW(), TO_TIMESTAMP(1764188769319 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "RRiC2Rjx6oXmXXPOCEmXXR0Pp693"}',
      FALSE, TO_TIMESTAMP(1764188413501 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'pacotv75@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1764188769319 / 1000), TO_TIMESTAMP(1764188413501 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'erauabc95@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'erauabc95@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$bfX87FjnFkxZ9w==$GAVIndUjkfxMd4G0npnxSLzvPB/cYxGZa20T50FGlrzDTJuKegIgBiJzuztcBgg8mzz0pAuV+xDWA4uJ6e+83w==', NOW(), TO_TIMESTAMP(1776304142357 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "RUKiqYDVGldXSEwVGMGlVuwwKrj2"}',
      FALSE, TO_TIMESTAMP(1776301914339 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'erauabc95@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776304142357 / 1000), TO_TIMESTAMP(1776301914339 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'alexandraa120995@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'alexandraa120995@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$6kYSvb4xcKrxgg==$63Uunbu55u9A+1ZY90zZ/3Thrq1v0VnHzeFkGvPz+T1pNjOz2SfmX/ccKFjeR68M14RuuvJnaSLZn/0m+VnMGg==', NOW(), TO_TIMESTAMP(1753276333775 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "RYWEfv86bwbVMaonVIlr6qqzK5V2"}',
      FALSE, TO_TIMESTAMP(1753276333775 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'alexandraa120995@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1753276333775 / 1000), TO_TIMESTAMP(1753276333775 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'gabo1341547@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'gabo1341547@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$oSV8VrOruDvwCQ==$ouHjpU+wAk8n+JAOaz5T59ccUqLAbRpxSDEZhOGWCzD82y/Tos+a+1rmQ6IHdnMibFSM3JSqSRdY0NE6UBMGjg==', NOW(), TO_TIMESTAMP(1778551965950 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "RdksCXzrCuf48XUFqcHag0PUXrq2"}',
      FALSE, TO_TIMESTAMP(1778551965950 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'gabo1341547@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1778551965950 / 1000), TO_TIMESTAMP(1778551965950 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'dergio16@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'dergio16@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$08dtiM4+bFB5Ag==$KVn505y5vlQ5l1NiynlwoplRdD44n3SzDYNqupmp63K1yVz93MR9IF7yWjdBrzRLMl/2rLc7TAZGqO1JAwv+tg==', NOW(), TO_TIMESTAMP(1773828260066 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "RhEXfrIuIPZf4z4p2e6261esLrn2"}',
      FALSE, TO_TIMESTAMP(1772063084584 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'dergio16@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1773828260066 / 1000), TO_TIMESTAMP(1772063084584 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'clik_@live.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'clik_@live.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$qFvP2H1LEoOdHw==$/lifKQaEf1zlTgAIjlTUEy4SHWSdzFf1v5+yncyHZ3uKkTPM5vYe871mghIuAsvH1SKXQElFfhoVByHrZoR5EA==', NOW(), TO_TIMESTAMP(1772232894873 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "RldzPZcacibGPHnK8cLCl7REFeu1"}',
      FALSE, TO_TIMESTAMP(1772232894873 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'clik_@live.com')::jsonb,
      'email', TO_TIMESTAMP(1772232894873 / 1000), TO_TIMESTAMP(1772232894873 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'alan.diaz.bubu@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'alan.diaz.bubu@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$e+R3Qu7QxjoasA==$pB2SgRetMot1rysmRQbXe2oIGnkCLXB3PE7H4jO67JWp632/FLQJ2Y6Gw650gqcox9nfDyQ5LXGWEToIiZAK/Q==', NOW(), TO_TIMESTAMP(1772914412985 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "RlnaXsDqRxPHAEDkiI8nZUFBY3f1"}',
      FALSE, TO_TIMESTAMP(1772914412985 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'alan.diaz.bubu@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772914412985 / 1000), TO_TIMESTAMP(1772914412985 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'verenice104perez@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'verenice104perez@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$1dNdLsRGg38vLg==$slwbWaYTpeh7+G1es3quG4UKIHrrf1OOR0tbGVqm34/v6t+1uAT7sIbCJDS1jvkhYQ1pvMlGy2k4rNTPziqbuQ==', NOW(), TO_TIMESTAMP(1778475644889 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "Rr1COfvSsTetP0fJXnOnLCVh01W2"}',
      FALSE, TO_TIMESTAMP(1778475644889 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'verenice104perez@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1778475644889 / 1000), TO_TIMESTAMP(1778475644889 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'fr955530@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'fr955530@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$mBR5oVl4Yhvc0Q==$PCbOZSM+GWL4c6QKjDinDBfdqHMjgHpsbx9JmNMJF6NRWFufqSRb4iECkDpwv9zmAO5QjNL+nPzx0NikmExGTQ==', NOW(), TO_TIMESTAMP(1776224555709 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "RtEe1tQ10NUmAqmkzHtGFlPaiI93"}',
      FALSE, TO_TIMESTAMP(1776224555709 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'fr955530@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776224555709 / 1000), TO_TIMESTAMP(1776224555709 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'manvm7259@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'manvm7259@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$9tLPaVq3sR9TBQ==$8IF6MVv2n8yDuCOz7MFoFoLf7LwPpxYJC4KSX5svv3f3MI+6y9e6dGO7vQlxagc6tR75K8uj0CozI0WI+Ps4fg==', NOW(), TO_TIMESTAMP(1776752992469 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "RwEZ3PTz6bc3yQxl1SIrDsXexiX2"}',
      FALSE, TO_TIMESTAMP(1776752992469 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'manvm7259@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776752992469 / 1000), TO_TIMESTAMP(1776752992469 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'angel.maldo.hipolito@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'angel.maldo.hipolito@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$F7i8ou6o+j97+g==$+5C4eRETPtwx3Op45Gs6IpmevwP1KhVKcNjgdEEEebsdDMIoPU57/TQ/ChiSz1fWRBoLVSKArKuvkffUU9gmhA==', NOW(), TO_TIMESTAMP(1771273167630 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "RxC2GgLtGXWnYEjafkbh9QGfegP2"}',
      FALSE, TO_TIMESTAMP(1771273167630 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'angel.maldo.hipolito@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771273167630 / 1000), TO_TIMESTAMP(1771273167630 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'carlossanflor1996@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'carlossanflor1996@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$iNkQ/3WR1Fmhow==$bJC+yLT4sU0dTyvtfks4xS1EkCD1fl9cN8vqrTvbL3U1WAHww7DRxo+G+/crhPC46Txx9YetDu70zBLfuhoN9g==', NOW(), TO_TIMESTAMP(1779981676411 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "RxQrFmXMvOOCH1OlDrpzqWjKOWc2"}',
      FALSE, TO_TIMESTAMP(1776713999709 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'carlossanflor1996@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1779981676411 / 1000), TO_TIMESTAMP(1776713999709 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'mandovelasco1111@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'mandovelasco1111@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$PCEmIUXC2UvT7A==$zGFh5kRNhRVPDl1ksI1vNabTyFteJEIFKLf55g9Ygh2H5+sXRUmsnnmI9iD6uIU3pZeOem8ysIFL46mU6ERUwQ==', NOW(), TO_TIMESTAMP(1774988089404 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "Rym0ocVljiN53tOuXLXozu8kSWk1"}',
      FALSE, TO_TIMESTAMP(1774988089404 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'mandovelasco1111@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1774988089404 / 1000), TO_TIMESTAMP(1774988089404 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'martithastz@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'martithastz@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$vtSWilNqHXASRw==$MFp2LAzDrWTI6PLN7xyu31krb6hblR1Ry73Klb1wtHrmU3qxG6hOUAGQUlSuTgnlWLDmT7zFGrLiMYN3MA7Cmg==', NOW(), TO_TIMESTAMP(1776227345018 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "S3MtuJeXKJNvRWYVjYkOVtn3kmm2"}',
      FALSE, TO_TIMESTAMP(1776227345018 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'martithastz@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776227345018 / 1000), TO_TIMESTAMP(1776227345018 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'cole19sur@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'cole19sur@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$8G8qp6LFlBDO8A==$35St8NN5OyH9vdC7k//YYTxYMog9/t7XKees2aEny6LYz/v+9ZlrXPwWNoe34CNSpGZFmdjp3AXIxA3qUO5jAQ==', NOW(), TO_TIMESTAMP(1776491421809 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "S7J4PJPQiYeNnoV4scfGuxB8Mo72"}',
      FALSE, TO_TIMESTAMP(1776491421809 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'cole19sur@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776491421809 / 1000), TO_TIMESTAMP(1776491421809 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'tonyguzpe@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'tonyguzpe@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$eYdAYuBwjQ92Dw==$t3dFwcg19XrGLPr5nz7BzVG1pFjh15F7mAKX0028fVS8JsBASsgVwXj/OH8G0jh7LTaK9AHQqrz2heFrRQ8Rzw==', NOW(), TO_TIMESTAMP(1772818993954 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "SFqIAC5typQPqjs5tQR7upkcnvh2"}',
      FALSE, TO_TIMESTAMP(1772818613585 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'tonyguzpe@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772818993954 / 1000), TO_TIMESTAMP(1772818613585 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'ja7779104@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'ja7779104@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$QljAeBcP5rkxOg==$eIkgmkyuh9kUjx8S/H5P3v3Ul8U/7DP3xEb2IAR6QcfG7JMW1X87SXQLukMYQsh5l198WS2X3P7KCwyGML6+bQ==', NOW(), TO_TIMESTAMP(1771279313162 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "SJ94arYPvcP5hm2oh2TvWnenVs33"}',
      FALSE, TO_TIMESTAMP(1771277997865 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'ja7779104@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771279313162 / 1000), TO_TIMESTAMP(1771277997865 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'lupithamb4@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'lupithamb4@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$WLUZSrZt9qiR4g==$2HjM2hZcx2JFKIchRGNHJ3SD/Zp9730zbkebKX7NT0AufBTe8dEMA/QAbuOkehr5AWXnfK36fkKaxSzbe1MFOQ==', NOW(), TO_TIMESTAMP(1779052328855 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "SJjLhm3xKCRkYu4MPtVATj3FAP22"}',
      FALSE, TO_TIMESTAMP(1779052328855 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'lupithamb4@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1779052328855 / 1000), TO_TIMESTAMP(1779052328855 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'lupitamend543@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'lupitamend543@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$QbLM/CumCcMDjg==$k9F92GMO6tTsdF7Vu2imbKC2RjuLw8NdLv7qEv62p6uDt2VaBf4bxmZRowIhRzL6gPyRahFUrULTjg3HA8UvdA==', NOW(), TO_TIMESTAMP(1776264522114 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "SJtJiReJg5f8ZkLb2LI7BiO8fKw2"}',
      FALSE, TO_TIMESTAMP(1776264522114 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'lupitamend543@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776264522114 / 1000), TO_TIMESTAMP(1776264522114 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'arqloida19@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'arqloida19@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$b5VNdlPldjgYOQ==$EniKMxgY/eGciIWdvQSbRET7gxZKo/dK/TgfjUe7e77xbLBUZXyV5HmMPMyjbRxdf+TKXOX5FMynB/R69V4Zpg==', NOW(), TO_TIMESTAMP(1771531308639 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "SMoXeOpcVtVJSOWgSMl01E4FyBe2"}',
      FALSE, TO_TIMESTAMP(1771531308639 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'arqloida19@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771531308639 / 1000), TO_TIMESTAMP(1771531308639 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'arm8312@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'arm8312@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$dfTiUrErotFFlg==$BReqbS/YnH/yxtALrQygikyK22C9wdWLf+ZSIh3InUQ6miM8AMO57yxLTz84adiWKrCiwsU8Y24HHmMc3dW2vw==', NOW(), TO_TIMESTAMP(1772845108159 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "STiKOnoCAyUww1IuAvyDtqTTBay1"}',
      FALSE, TO_TIMESTAMP(1772845108159 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'arm8312@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772845108159 / 1000), TO_TIMESTAMP(1772845108159 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'juanpabloramirezpena73@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'juanpabloramirezpena73@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$Bxm0YFNMyDQScQ==$FmM9A3693258cVt1KJZmE3wxGLx7Db7v9rK6UMAcLO532mX4iFW6N8ZFeGN5FDWbWnOtr/HLp2fkwbYKOuJEWA==', NOW(), TO_TIMESTAMP(1771881422221 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "SXT52zM8bhYzlDjZXWUzgz65o9r1"}',
      FALSE, TO_TIMESTAMP(1771274936167 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'juanpabloramirezpena73@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771881422221 / 1000), TO_TIMESTAMP(1771274936167 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'cristrujillo2004rod@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'cristrujillo2004rod@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$5/4oUMlKoPosPw==$7KH8/njM3nSNgaS0np0PwGN4HLy4FGP+jXghdXiJ7m+xWVk4TwUGV/RZKniZywe0KCbt23YsqtOR0wpNXqw0sA==', NOW(), TO_TIMESTAMP(1776218082566 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "SXU96JInzmeVvpjzNTJZnlYF5GC3"}',
      FALSE, TO_TIMESTAMP(1776218082566 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'cristrujillo2004rod@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776218082566 / 1000), TO_TIMESTAMP(1776218082566 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'moreradh88@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'moreradh88@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$C45uxhxKdqIJ6A==$PoPUJXq/34MO/3mi3dDwlqLjWWDSF1LgZJUJJFUk8ks7iEpgf7xTRdl0j33aQTY7U4iBTPzFk7nq89qRphD4rQ==', NOW(), TO_TIMESTAMP(1776214979443 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "SbbHnAcEMIhziK1pdbUL9woviJ83"}',
      FALSE, TO_TIMESTAMP(1776214979443 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'moreradh88@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776214979443 / 1000), TO_TIMESTAMP(1776214979443 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'grenemagaly@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'grenemagaly@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$OONtaVCAJxSL5g==$4lnFh9AjLp166KzJI/+PbM11WRA8CUXr3TVh/FBrApRxrHsQNsMbQ9IJWRqP1dPMoSjk39dSmT9oM35wW9hTew==', NOW(), TO_TIMESTAMP(1776217296236 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "SrDmO707GHNyuLKYkQ3usfvD5Lp2"}',
      FALSE, TO_TIMESTAMP(1776217296236 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'grenemagaly@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776217296236 / 1000), TO_TIMESTAMP(1776217296236 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'cruzjjj1@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'cruzjjj1@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$V3V7S6x4zmd9Xw==$HRA5KMDP1PmXrndm3BLdARU6kPfT12E9RwN8vz6/AvYdHSjVvmkx51cpz9GZh7S5jAW93XVx2j8TjKmMmLXzeA==', NOW(), TO_TIMESTAMP(1778998222413 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "SukD5aaIzNM9dlVciaFnSLoegh03"}',
      FALSE, TO_TIMESTAMP(1764202069650 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'cruzjjj1@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1778998222413 / 1000), TO_TIMESTAMP(1764202069650 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'alexiamarquezsaenzlml@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'alexiamarquezsaenzlml@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$Wt3A+Sjt3wMewA==$YPnLfcGvo+xCaC9QMVfqA18okzqJKhzSD4gADrSjOl36t0DVYAzTimR2E1nyNAEP+hF5V0M+VXjeUAcdZg5nrQ==', NOW(), TO_TIMESTAMP(1758332166452 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "SwxIJpUT2dRZIelyBjBEVV15cmW2"}',
      FALSE, TO_TIMESTAMP(1758332166452 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'alexiamarquezsaenzlml@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1758332166452 / 1000), TO_TIMESTAMP(1758332166452 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'joranzr@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'joranzr@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$dpT34r3EwCaNiA==$5EWiDQG28Q0fGGPOdunybEqqrz4A+naNh3eDHq+X5BGE92HWgbh/UERfAjDhIRCqjyBqwZf1ZVsChdeL5Kvdpg==', NOW(), TO_TIMESTAMP(1771299728966 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "Sy0OWKyUSzeKFFlqAqrptbXNCmB2"}',
      FALSE, TO_TIMESTAMP(1771298615479 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'joranzr@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771299728966 / 1000), TO_TIMESTAMP(1771298615479 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'magdalenoreyesmario@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'magdalenoreyesmario@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$/DABrf7uk3tadA==$aMs4LC7cI0pyj/vzSdP5uZZDwH4oVyjgvDHYrUJN2AJQsz4O5QmXNvfGqauc4JqkaWTcQ0JI+8ATTwSm59/D/w==', NOW(), TO_TIMESTAMP(1776774487165 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "SyKDHCUJIQOcsU9ztFusb1Q1IHL2"}',
      FALSE, TO_TIMESTAMP(1776774487165 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'magdalenoreyesmario@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776774487165 / 1000), TO_TIMESTAMP(1776774487165 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'jaimedaynik@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'jaimedaynik@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$RwuIOV7LoKFVKA==$8pDiQE8MA+AJ+WASwPY/E62/cpcMOTAw3wIQ1LILPhjORpqrNVixPmNBp1DbKpPXv0MjWEwxNmMpOA368SNtww==', NOW(), TO_TIMESTAMP(1772331023672 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "T2wQuZjUFXTRdRjAgNhHAgJn4Kd2"}',
      FALSE, TO_TIMESTAMP(1772331023672 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'jaimedaynik@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772331023672 / 1000), TO_TIMESTAMP(1772331023672 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'oscar090693@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'oscar090693@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$HovfFL5qixLVwQ==$vpzYqfMXjOK76iOpYIRI4FoOYdHOMMqIVWf2mfHaL2M932OiO5eODq2Ks7HXqhYDfQP2MJ/L8dhUzxgPBd1Rlw==', NOW(), TO_TIMESTAMP(1774905202609 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "T5DWAYASwXYcUmVWwkdZCBB8KDq2"}',
      FALSE, TO_TIMESTAMP(1774905202609 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'oscar090693@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1774905202609 / 1000), TO_TIMESTAMP(1774905202609 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'feojulio52@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'feojulio52@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$giwjS+sGTESuQA==$RMf3dqGMUCAQmfVAXwJ3ReSGXaZW/TwegLI8Uit71SVeVvxModLtYLkbO+KdwlknXsKFRiavrtnYpCjRCyGEdg==', NOW(), TO_TIMESTAMP(1771696033768 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "T7K3NRLeMJeyHnRG9o9sVt3vKFu2"}',
      FALSE, TO_TIMESTAMP(1771696033768 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'feojulio52@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771696033768 / 1000), TO_TIMESTAMP(1771696033768 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'farrerayolanda@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'farrerayolanda@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$9mWq2I/xjW7kBw==$/raUNvjC5bbb0ulT7jhYFWpxJXozaVoRl/hfYhl7EEucBDgPXPqgFAokskxBRiMneX1iYU6GIMRk1ZTN8wrnwA==', NOW(), TO_TIMESTAMP(1772168120982 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "TB2Q9h4zqugHlKdNLRkGNMqN47c2"}',
      FALSE, TO_TIMESTAMP(1771348853346 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'farrerayolanda@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772168120982 / 1000), TO_TIMESTAMP(1771348853346 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'solorzanocartagena68@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'solorzanocartagena68@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$5B37INbKlbatcA==$FV1AOjA5mXa28vUwYq0+FXzHfmiKawmpL+V8WhLoaLZRj24moYwqZBXqC9V2ouIdoAt9XTI0sPeDyumFNnIGcg==', NOW(), TO_TIMESTAMP(1776283696447 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "TCl0HdpcIPTaa3ZxnCSMQuAbg3H3"}',
      FALSE, TO_TIMESTAMP(1776283696447 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'solorzanocartagena68@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776283696447 / 1000), TO_TIMESTAMP(1776283696447 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'juandiaztzoep18@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'juandiaztzoep18@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$+df1oQZk3/4uOw==$Jdz5q0OikCtw4glRHoVbJ6ErdIvX1r8qHijI967iQ30GEHj2l+dpUgWuejFpq/GxZaX3fpiwk3UBXLfYcWphBg==', NOW(), TO_TIMESTAMP(1774248151564 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "TDhI4YwqzQa3wZUg1sF9jg7RRUk1"}',
      FALSE, TO_TIMESTAMP(1774248151564 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'juandiaztzoep18@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1774248151564 / 1000), TO_TIMESTAMP(1774248151564 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'angelzarate1993@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'angelzarate1993@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$QMvxcherDfuPQQ==$DDgFvRSy5oVGYP64H+3VPUxbCaKREEZuDa51WpDJs0+0HLP5b2tvHt+NNn1z8Z/DGpz7uBv8qNOVBB4WFMcfjg==', NOW(), TO_TIMESTAMP(1775345134064 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "TDlR01heIZTJJBjEWtbJWceSlN93"}',
      FALSE, TO_TIMESTAMP(1775345134064 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'angelzarate1993@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1775345134064 / 1000), TO_TIMESTAMP(1775345134064 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = '19lizms@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      '19lizms@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$bIkUIWjOzs7Nrg==$IwKG88vO/2qhJGaTcQas75FY5Ygqrj/uUCLSyGVfEx3G/0T9CLZp8bbyfu6TtRtRuwsr7MOGpohZuPxLy7PYsw==', NOW(), TO_TIMESTAMP(1751921236590 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "TECTcxxisBaJncRkCS296HMByml2"}',
      FALSE, TO_TIMESTAMP(1751921236590 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, '19lizms@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1751921236590 / 1000), TO_TIMESTAMP(1751921236590 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'karencampos07@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'karencampos07@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$pDFMQMWMafMBxw==$fxLiNNP0MEGRKZVjo+oupgalU7nyA7dNfzcmCSWrXwKh7jXATh4u6ObcYlfPA2hUu79tMufcn1QT/2nXft1JNA==', NOW(), TO_TIMESTAMP(1761893517878 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "TIAo3QS0xkZd3RmwmS0JYtxidHB2"}',
      FALSE, TO_TIMESTAMP(1761893517878 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'karencampos07@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1761893517878 / 1000), TO_TIMESTAMP(1761893517878 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'davidpalacios49902@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'davidpalacios49902@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$M7Xqu7zkVpQN0w==$oty6Gokh+PTj5guwyvBbLw3gW+ZjIsnw8fvgSjOVyxlRj3b8DEPIeT15uwhDbblfb3YYkqsnnWKt9ST5Jlh8NQ==', NOW(), TO_TIMESTAMP(1751393595618 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "TIHWkKVf8IZNli5xBnGoJu1MB8f2"}',
      FALSE, TO_TIMESTAMP(1751393595618 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'davidpalacios49902@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1751393595618 / 1000), TO_TIMESTAMP(1751393595618 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'jissucamargo@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'jissucamargo@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$LmtaiE1h+XORLQ==$IbQME0jTubyvRnunPDEFZvpsfGmy09xeHvvSZk26dHgzpUGD9MZ0qXLFkR7ea+82HOayaWvkxB7TVe9QmidW1g==', NOW(), TO_TIMESTAMP(1753453969069 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "TNw6TPaXeIgivo41APQ9Zof4RSg2"}',
      FALSE, TO_TIMESTAMP(1753452085893 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'jissucamargo@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1753453969069 / 1000), TO_TIMESTAMP(1753452085893 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'minemartinezm14@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'minemartinezm14@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$eZ24WL3q1LUr8w==$cyHDmhhppBQz2hlwdnT3pPEPOaXxb1Bc4P6gBXaKt9RJ+vSr/W0hh59/ZU4uAHK5ZipU7SsMiPOOAtVFeVtNCA==', NOW(), TO_TIMESTAMP(1766353733641 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "TOTfaI6IblSB1Us6SPZyBx5sTFf1"}',
      FALSE, TO_TIMESTAMP(1766353733641 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'minemartinezm14@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1766353733641 / 1000), TO_TIMESTAMP(1766353733641 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'jorge.hdezp11@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'jorge.hdezp11@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$RTR/JVbxlsvuqA==$EacvHd0aX7sQAsBMuyffGpjfj8+XgFiFwHHqJzPqDIoAhI5P60AzHyMTP/jEavuWxKOA4DGcnfdYOKEaBD4FSQ==', NOW(), TO_TIMESTAMP(1776220375267 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "TPsmyBcUfiVs3bUqNlqDUlAe9B42"}',
      FALSE, TO_TIMESTAMP(1776220375267 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'jorge.hdezp11@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776220375267 / 1000), TO_TIMESTAMP(1776220375267 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'aevillediaz1@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'aevillediaz1@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$V+OsdT8T8PTzCg==$tJfBrH5QDp1qvgjP0TluLGMank/hv8Em0iH5t/J+tFmweJiN/eJyxXhQWmMLGkHBgvNdZFf5TIAIjSBoCaIXuw==', NOW(), TO_TIMESTAMP(1752102193602 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "TSFewwxxU3PoIoCKRQSpqcb1K0M2"}',
      FALSE, TO_TIMESTAMP(1752102193602 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'aevillediaz1@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1752102193602 / 1000), TO_TIMESTAMP(1752102193602 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'luismiguelintzinlopez1@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'luismiguelintzinlopez1@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$IQbE5o/ITryHdw==$JrJSvqsbCTlgKsyAqeCVvlhe4JYs6gNkGtsBIhkJaZQFsVpQTKjUPlt+eafwSpw8CfFxFBDTd9/PPFW1UlI4BQ==', NOW(), TO_TIMESTAMP(1779633756413 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "TYmKB0MhoDcgxlpC3r1r8lhmudi2"}',
      FALSE, TO_TIMESTAMP(1774409556198 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'luismiguelintzinlopez1@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1779633756413 / 1000), TO_TIMESTAMP(1774409556198 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'alizvalencia1@outlook.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'alizvalencia1@outlook.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$kkVXA2zgXmQfcQ==$ESiLmW9y5ebAYEBuTlw7KGXhMGs3rGRtMXUl19x0rfeipt6GX06uTEGoNZPpZ3XbWIH7PjeF7FmlnD0u4m1zQw==', NOW(), TO_TIMESTAMP(1776733685867 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "TYryu7yIcoZHCdt1NTXh9bJSNb83"}',
      FALSE, TO_TIMESTAMP(1776733685867 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'alizvalencia1@outlook.com')::jsonb,
      'email', TO_TIMESTAMP(1776733685867 / 1000), TO_TIMESTAMP(1776733685867 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'araceli050579@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'araceli050579@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$/eoaSzoBNU1aeg==$B3i8k5kXfJepGospjLAy9Y4FjF2ZZ+ZQ5apApiPeUPaf5DMlJoG/ZsaJ1GVklLWBovPubAdbMQniDiwVKSGmEg==', NOW(), TO_TIMESTAMP(1772541638988 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "Tc5aNA10UuOCwa3WSeTL36QRRUw2"}',
      FALSE, TO_TIMESTAMP(1772541638988 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'araceli050579@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772541638988 / 1000), TO_TIMESTAMP(1772541638988 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'yaz.alhemartinez@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'yaz.alhemartinez@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$DJSFR4fqJIp8qg==$yjN6z1JB/RSEtFCWf4Ddksrxb6tDAGFOvP4w4VeNPgKNKSJguIz9+BDvIdSvGq+6fd7r3W0T7syvvaes5ha3tg==', NOW(), TO_TIMESTAMP(1764282041935 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "TdX8OQN3sehtotTPvsg9CvB06Tg2"}',
      FALSE, TO_TIMESTAMP(1764282041935 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'yaz.alhemartinez@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1764282041935 / 1000), TO_TIMESTAMP(1764282041935 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'ynarciottmiranda@icloud.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'ynarciottmiranda@icloud.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$VmYOVe6O3IsDYA==$cREbULuFZktkoX6WNnBr3+CXw9l5zW0Ya+zkfmXKt/alUN9MBO2guL0I4XgVUwiU24NQiv1wcUnfxSEEY668rQ==', NOW(), TO_TIMESTAMP(1775159162786 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "TeRqIFT4aiPkKjaZCbdWaruTVA52"}',
      FALSE, TO_TIMESTAMP(1775159162786 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'ynarciottmiranda@icloud.com')::jsonb,
      'email', TO_TIMESTAMP(1775159162786 / 1000), TO_TIMESTAMP(1775159162786 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'robertolgg57@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'robertolgg57@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$WUuzG2LMb0v4dA==$xpotAH4XrVHtyFWyoHjA6j0xx/IkzSJpc68xUltAHhOTiJnNSODTJa82VZtjHJc2kVC88FoysEqvWWBw45HZKg==', NOW(), TO_TIMESTAMP(1752752589427 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "Tg8A54xBoATI9XuUZaeGHDVN8YV2"}',
      FALSE, TO_TIMESTAMP(1752752589427 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'robertolgg57@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1752752589427 / 1000), TO_TIMESTAMP(1752752589427 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'yerandimarciott4@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'yerandimarciott4@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$pyx9C211AKoYfg==$MeI/7ZgJAFpZ6wtXR31piiVBiyBpHZNZuAarz9kLpOj0UGRm3B45U8QwP6UB+MO4U8dvQ0abdB3SSEnjeZh/NQ==', NOW(), TO_TIMESTAMP(1771276515661 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "TisG9NOYwxOUQWpyuRML0PyDVDE3"}',
      FALSE, TO_TIMESTAMP(1771276515661 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'yerandimarciott4@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771276515661 / 1000), TO_TIMESTAMP(1771276515661 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'monserrathfarrera9@gmial.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'monserrathfarrera9@gmial.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$fpxOsUp0g3qvMA==$W2znGqYtQDHFuxdQ/EOv60lGjt2Aw3D1R6iBPdTEXNNRqWfXf+pD3XUBV8U79LArNHGkH7NsHL1++7HeJL82jw==', NOW(), TO_TIMESTAMP(1775600711858 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "TjkUazVqGVNbTDgs41HvBGRq1sn1"}',
      FALSE, TO_TIMESTAMP(1775600711858 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'monserrathfarrera9@gmial.com')::jsonb,
      'email', TO_TIMESTAMP(1775600711858 / 1000), TO_TIMESTAMP(1775600711858 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'tsanchezloera@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'tsanchezloera@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$FVaCJQpJ8YLDpA==$B2U5uUPu5C5c+iVU2duZoW0D3Yn+8jLGJRBPASG3fiYqEVO50ncySZ68YfZ2nkQRxomzCRwiCQjPow5a0BCktw==', NOW(), TO_TIMESTAMP(1753427266565 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "TlG2sGvUcjTNFyhe4H5f7frULTH3"}',
      FALSE, TO_TIMESTAMP(1751636489601 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'tsanchezloera@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1753427266565 / 1000), TO_TIMESTAMP(1751636489601 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'rubizea134g@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'rubizea134g@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$+jcTLWU7hkcrkQ==$lMbouD0vc9avylNOIhxbENriFuZFoCAVqfaYslGR6+VuNA8i7tC4Z+aQ2uOf7aTPSvfsqJk/Oc55jgQWflWUnw==', NOW(), TO_TIMESTAMP(1771277307422 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "TnZYpmLQlggHHtQEDFxBpwn6dHP2"}',
      FALSE, TO_TIMESTAMP(1771277307422 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'rubizea134g@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771277307422 / 1000), TO_TIMESTAMP(1771277307422 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'suso2302@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'suso2302@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$GKxM1vNF66gxTQ==$guNzARXScMnofNpxlGmw+BxmnYoTrPozq3IzN/90hPHHobk5QZ+R6PFlLZ6BD0FyytqdPFbC/hEfQwEtiCICxA==', NOW(), TO_TIMESTAMP(1771273573819 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "TnwlrXc333a4fC6ANB1JXi1E6iB2"}',
      FALSE, TO_TIMESTAMP(1771273573819 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'suso2302@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771273573819 / 1000), TO_TIMESTAMP(1771273573819 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'fg205649@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'fg205649@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$ZeOu4JqV66STsw==$DIAZodJqWlY214tPNyZ67+QL0G1rbQlpwFjs44WHmISYZx8EAv3Um9CqG9hbpV5UNQJ2p51p4Wiick5vetO8+g==', NOW(), TO_TIMESTAMP(1776220641416 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "ToQqHg4s0UO0ZNvXNjXJZcWSjmg1"}',
      FALSE, TO_TIMESTAMP(1776220641416 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'fg205649@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776220641416 / 1000), TO_TIMESTAMP(1776220641416 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'felixgarciazzz09@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'felixgarciazzz09@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$atluUuFG25N4UQ==$qPy7vG02Cl0Jy9uiuqpWHcOaNX7iTusDl2TrME0D5+aiqJ2AQbsUrCCL2/MSgrJ4Tut7jB0ybQU62IdStYcWEg==', NOW(), TO_TIMESTAMP(1775521330611 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "U1hvQhEGyzVoLL18M748HPW8anE3"}',
      FALSE, TO_TIMESTAMP(1775521330611 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'felixgarciazzz09@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1775521330611 / 1000), TO_TIMESTAMP(1775521330611 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'juanymague@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'juanymague@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$ek8Kt2HBUbW+xA==$30iRfFc0+GO+HFC2g+b13OauYiFFMXBh7KKHMO99aIk6QHUtLFngdK/Ys+jl+KTYGRaJc4ZsV2bvIfkH/7D8SQ==', NOW(), TO_TIMESTAMP(1751484441872 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "U4edmBz0OoZxG8WhjnKA6TnuSGp2"}',
      FALSE, TO_TIMESTAMP(1751466770802 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'juanymague@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1751484441872 / 1000), TO_TIMESTAMP(1751466770802 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'rayitoad.78@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'rayitoad.78@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$G4Tkf/R41FMaKQ==$thogLDBL01L5WcChI2jp+4Eu+jv7ssGc8VGz+5shhqmdg6z+OeYC9jH74kbP2VhvmXcnLw2zuFVT/I+0EvEfpw==', NOW(), TO_TIMESTAMP(1774897718140 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "UBy40xKc5cNXB0mxH5USSsEP6Bd2"}',
      FALSE, TO_TIMESTAMP(1774897718140 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'rayitoad.78@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1774897718140 / 1000), TO_TIMESTAMP(1774897718140 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'frest-10@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'frest-10@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$F0Itj/O2NAyRoA==$1Jkl6/H6UfopbXVzxfRa4SaXBtyj9oDzqIDTV4bwn6TBhz8W9UcjkS98cRfy8CW4PW8wBiRS0Uh37yEPUjYVMA==', NOW(), TO_TIMESTAMP(1772145532493 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "UFRfyHAckqRMscI0uyNbwGcNXj43"}',
      FALSE, TO_TIMESTAMP(1772145532493 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'frest-10@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772145532493 / 1000), TO_TIMESTAMP(1772145532493 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'jaquezj414@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'jaquezj414@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$/I3DDbCBUaqhrQ==$wXASfG5zLt5cpk286X0dHkSIr7FwDSQjLX7opemWzAilqcdnuOj/MED2HBWRDBixhLsBcsBKzQm6Zpw/u1Pqfg==', NOW(), TO_TIMESTAMP(1775554661334 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "UGplTXmz9ZToD28VU3Idc97G3Xp1"}',
      FALSE, TO_TIMESTAMP(1775554661334 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'jaquezj414@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1775554661334 / 1000), TO_TIMESTAMP(1775554661334 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'maricruzbreton@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'maricruzbreton@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$JfHkhYADh0RYAA==$I8LCsyUczoZiyb/kxdxKTPX/NcAeRfn0MBLe28auPG72JxX6nzmvUX7uFBAZmbRhlr0/0QQcbV7FzFuf0EB+2A==', NOW(), TO_TIMESTAMP(1775568610827 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "ULHXJyMboda4jC1ElkteHr7xq673"}',
      FALSE, TO_TIMESTAMP(1775568610827 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'maricruzbreton@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1775568610827 / 1000), TO_TIMESTAMP(1775568610827 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'felixfelix1909@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'felixfelix1909@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$rngBINbQDYh3tQ==$qzsqpCLGx9otBPnMtQg1JFFT3dMiWrlyev9G4rQE28EU9Vi6JF1wqBGAV9T6GnWusoZAxTIcpEtL0ql+/kiFUA==', NOW(), TO_TIMESTAMP(1752773400653 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "UMNLGyqCrKaa7iZgJluY9dTjpCG2"}',
      FALSE, TO_TIMESTAMP(1752773400653 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'felixfelix1909@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1752773400653 / 1000), TO_TIMESTAMP(1752773400653 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'jl-giro7@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'jl-giro7@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$wmWY1fsxlFJKug==$mXsorAV5caagYIlYifebQv/525u74WvXweZBGf/L9PVu6Wv/mUu6/iKlJkh7wJ0ss2P2eZdHFcpqQDjhLKVAQQ==', NOW(), TO_TIMESTAMP(1771276839298 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "UOWHXds1NKMnGWwz69Opede0QaJ3"}',
      FALSE, TO_TIMESTAMP(1771276839298 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'jl-giro7@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771276839298 / 1000), TO_TIMESTAMP(1771276839298 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'juangarciabmx48@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'juangarciabmx48@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$VsuccmtCjJOXYQ==$oTHkbPGup3GRInSWAg/vKRenJF/4xkpR40KM8hwCi/2B2cSnGwoXUTIJmNVPBISj6HQOuph5IVtx5MAHil97nQ==', NOW(), TO_TIMESTAMP(1771556026559 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "UQBg5BqVFSbmqXckfGIIkgMtY9N2"}',
      FALSE, TO_TIMESTAMP(1771556026559 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'juangarciabmx48@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771556026559 / 1000), TO_TIMESTAMP(1771556026559 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'lilicreamundo@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'lilicreamundo@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$DyQbc/0awjU8nA==$fThlpxHLBkv6o0LT9fdVk9MEhjOYDUX+8yd+Cmp3w3PVCxt9ye7xoO5Z6i4wGZJCVdP4vkMo2QU//Nx1HFoNfw==', NOW(), TO_TIMESTAMP(1771276253167 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "UTDBpNgUq2TC7PJkGkGt7UaZote2"}',
      FALSE, TO_TIMESTAMP(1771276253167 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'lilicreamundo@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771276253167 / 1000), TO_TIMESTAMP(1771276253167 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'diegobetanzos11@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'diegobetanzos11@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$Ciy52kYEdtsoEw==$5QZ+cNkDC4QdW9yyn6F82L4TBi4edpKPPqg7vUSVXuipdeKTC/22M3PsOry18OBtf+ktEFS3Pf2sbcl0/BZVqg==', NOW(), TO_TIMESTAMP(1772140530710 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "UYObIBsU1eeFRDXeisaDhDB1Kqy2"}',
      FALSE, TO_TIMESTAMP(1772140530710 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'diegobetanzos11@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772140530710 / 1000), TO_TIMESTAMP(1772140530710 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'aleoscar500@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'aleoscar500@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$IocMgB9Mog38Bw==$+yk7kU2f/Nb4ZQ9+gHGW2K/SJjWk6+F7QfdxbhYxtQ7FPxFs/cufhnyCEQh7fQPVQ3a8ZWAui4fOBJW3iUpplQ==', NOW(), TO_TIMESTAMP(1773106538994 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "Ua9BfxfFR6WNILB54hnCrAIY7Lz1"}',
      FALSE, TO_TIMESTAMP(1773106538994 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'aleoscar500@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1773106538994 / 1000), TO_TIMESTAMP(1773106538994 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'joardic70@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'joardic70@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$I7gpYLjl34oojA==$tpAwqui37RqjSKqUV2emh2e64lJ10/SlCVc+yex9DumO0hpIvDd4dtJ7pVflG+mMgKXzB3dSKH0jN76Q4YRpPg==', NOW(), TO_TIMESTAMP(1772792761603 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "UbihVT9PohRIjCybWuNFVkpNZ3h1"}',
      FALSE, TO_TIMESTAMP(1772792761603 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'joardic70@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772792761603 / 1000), TO_TIMESTAMP(1772792761603 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'ecm.towork2@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'ecm.towork2@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$RYu023Q1VtYgAw==$iOLSWIPHpT1mmq4b2knPMosxtvNy3sexbFalq99/8SOmTXAQBHVrGAO4/4IlfC+2/kJi20da9DAOSD5WkKrKNA==', NOW(), TO_TIMESTAMP(1771352915168 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "Uc2X3vG59aZMZydspZaV7VDGu862"}',
      FALSE, TO_TIMESTAMP(1771352915168 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'ecm.towork2@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771352915168 / 1000), TO_TIMESTAMP(1771352915168 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'luludiaz219@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'luludiaz219@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$YoYu1l8wQVDSpQ==$5Q21+MNqp+TWzurafR1r0JldV8FlSbOAR1V66mJ0FrikDr6P6ujo/wGt7gbJ7sUvu8ZzlwUtDOKhUutoNjDrOg==', NOW(), TO_TIMESTAMP(1771280686164 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "Uc3INO7MmCOJaKCjW4vA0rwODY22"}',
      FALSE, TO_TIMESTAMP(1771280686164 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'luludiaz219@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771280686164 / 1000), TO_TIMESTAMP(1771280686164 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'jjosemtzm@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'jjosemtzm@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$kI7OQMMp7TRtMw==$l4b0Gk/KlciR6zbTJ/EaxzCUltMEmHaRq8onmZs/hQL1+L2O/P9bro+3EsUwR+RCkLtL9bLQdeCrTXv/pO0dpQ==', NOW(), TO_TIMESTAMP(1778981274914 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "UdS2yXpnzgdhgVxLFdCBS8PBGrv2"}',
      FALSE, TO_TIMESTAMP(1778981274914 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'jjosemtzm@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1778981274914 / 1000), TO_TIMESTAMP(1778981274914 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'eluneyitayetzigomez@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'eluneyitayetzigomez@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$THzY18y4i41eQQ==$r82WZLS1KsBdNtrPUvRH6nv9GKk1vsq/SCguqZsWwq+23LAulS596sC+s33F4LsOHWTFBU6bGI7cz9D9NE//Ow==', NOW(), TO_TIMESTAMP(1771279992496 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "UjXGx2cR8hWAO0t0m8fsaX6S02y2"}',
      FALSE, TO_TIMESTAMP(1771279992496 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'eluneyitayetzigomez@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771279992496 / 1000), TO_TIMESTAMP(1771279992496 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'finngmoretz@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'finngmoretz@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$5wIE25wgjuY9IA==$BKvNIGtJAZQ3QbCRjeamKtS/DlNLyAMZv6uslsRr8seAYuvpLxaL9kCe/PlYKPO1Hvdk35OeA+Oboy3zrwWozA==', NOW(), TO_TIMESTAMP(1757023378868 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "UvFRY1wXPpcsmABTCER5ryYLX8M2"}',
      FALSE, TO_TIMESTAMP(1757023378868 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'finngmoretz@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1757023378868 / 1000), TO_TIMESTAMP(1757023378868 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'elycoleta@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'elycoleta@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$NHrt0HVSXn88Fg==$v/W0Di8oDWi8VK8KN6YMrYazlFg0yuGZWbSOu/7C9jGsMZ7hth3E3KUZjurJC4lflILwMSRGc+YTYbnvVy9Gkg==', NOW(), TO_TIMESTAMP(1776820625916 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "UxGcBdriKtMKh4t8gEtx6ngeX8x2"}',
      FALSE, TO_TIMESTAMP(1776820625916 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'elycoleta@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776820625916 / 1000), TO_TIMESTAMP(1776820625916 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'geraldinnescoronel@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'geraldinnescoronel@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$OR24qdQxFBuGMw==$VtCRgalFfVwilR6c0N1BsNwWQgKxUUoFuX0i2K/JgnE++zUBaLGu2tHhIwIwQyPALKphNuGSWKnItPij8+aN/w==', NOW(), TO_TIMESTAMP(1771271107723 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "UyAzX3pzsqTsJhLMVTcn6TKQPOI3"}',
      FALSE, TO_TIMESTAMP(1771271107723 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'geraldinnescoronel@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771271107723 / 1000), TO_TIMESTAMP(1771271107723 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'cinthiaanahiperezmaximo@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'cinthiaanahiperezmaximo@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$8g/ypbunt3nIFA==$cGyTjaPRkZMjOebsD+FSDnbGGTVy1vVL7Skna3Hl0Mj33BX06LrtqtzYywGYQ899FBdOYawcEBCioD8INyF2pA==', NOW(), TO_TIMESTAMP(1771690581777 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "V1SPOUN8mjNaKLsoic5MBgZwzFy2"}',
      FALSE, TO_TIMESTAMP(1771690581777 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'cinthiaanahiperezmaximo@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771690581777 / 1000), TO_TIMESTAMP(1771690581777 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'studio4.puebla@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'studio4.puebla@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$7C25r0Z4KYBHzQ==$WYtIr2JccO2Ede/ndBq651uqq5Rpw097A9wuMvZYOwl6AJjQVmRMEWqqMez1+g2FMSW84RyNauIZn+ZpmsYucg==', NOW(), TO_TIMESTAMP(1753458126898 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "V21UvRzoSGQJG3uB4Ngi2DpUWq73"}',
      FALSE, TO_TIMESTAMP(1753458126898 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'studio4.puebla@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1753458126898 / 1000), TO_TIMESTAMP(1753458126898 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'merce2481@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'merce2481@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$3c4SHY4ogHIDCg==$7e6fOVaX3SbRcTmnuk9NFujdx2p1nIwRG7msSeUdPb7j9UgzvHCmzHuZ4yX5MYi3wprgXJG2LyOHUCX1a9nCPg==', NOW(), TO_TIMESTAMP(1771272966507 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "V2Ur16fMCwXYeLC8HHBNCpKmH8K2"}',
      FALSE, TO_TIMESTAMP(1771272966507 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'merce2481@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771272966507 / 1000), TO_TIMESTAMP(1771272966507 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'rafas2288@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'rafas2288@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$ni13heBwj5gsBQ==$v5tL6GiBzbJJvOnirErjHpkPGwT31fF5w4kTXIt/Iz0qWDKhYhKM2WO+d2tXy+KmdPmrwVMOy7IYGcefbdqtwQ==', NOW(), TO_TIMESTAMP(1776276518287 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "V4VHrYZUqSQEdZtAjFJefS4bFms1"}',
      FALSE, TO_TIMESTAMP(1776276518287 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'rafas2288@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776276518287 / 1000), TO_TIMESTAMP(1776276518287 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'rashelgg12@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'rashelgg12@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$VIlov3lbupRZRA==$GJ9opYbUkaD7QcfYaWq40R2H5z6i2XCpe3YN/8Ptfe7kqpS7xwYRcBAJOf3rrbzv+nxmm6S/ixv2F1IIUGceuA==', NOW(), TO_TIMESTAMP(1769211819871 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "V7fMNQzDq7W437DiqbvlNvl6rkL2"}',
      FALSE, TO_TIMESTAMP(1769211819871 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'rashelgg12@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1769211819871 / 1000), TO_TIMESTAMP(1769211819871 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'eusebiomuniz49@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'eusebiomuniz49@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$sCRsZHHV1JJN2g==$+vnZRpIdS4pNMOU9M/7yyaIwIEwqaNKMV6kfyFDEivyyduRn1wEmmvGwZsc4Mpl/T/4dh6/Zz1QkYPbGopnS6A==', NOW(), TO_TIMESTAMP(1751469287084 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "VGCiqlDpy3TQXaFObvhEkgM02W72"}',
      FALSE, TO_TIMESTAMP(1751469287084 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'eusebiomuniz49@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1751469287084 / 1000), TO_TIMESTAMP(1751469287084 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'rye121287@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'rye121287@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$WEiGxDGJF1rh5g==$ervqgndzGsj62s5/D70D4KEoq43tqOJA+IGCnZo2SuSJi7cJHzxdxKJlK/mDUxGaprT7c+e4fDaeBFyDC76IPA==', NOW(), TO_TIMESTAMP(1769733779100 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "VGRelDoPfNO1RlgxVQ0UC5Ltiz13"}',
      FALSE, TO_TIMESTAMP(1769733779100 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'rye121287@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1769733779100 / 1000), TO_TIMESTAMP(1769733779100 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'aguilarclaudia2006@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'aguilarclaudia2006@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$n39DFDI+H41GBA==$n0Tjl6qKqAnuQ11YaPcaf1CzW3GvRQO2w+gz9A3oOWTd9osTcNjcAglUkMbh6MGJg/r6b4V8hRHgVJn1VUVEJQ==', NOW(), TO_TIMESTAMP(1776214694585 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "VKvNJzDrfzXWegOOjh3nJFNLTle2"}',
      FALSE, TO_TIMESTAMP(1776214694585 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'aguilarclaudia2006@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776214694585 / 1000), TO_TIMESTAMP(1776214694585 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'romanherrera@live.com.mx') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'romanherrera@live.com.mx', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$YDo4EPsn05ObmQ==$6yj4WtDzjA/vUEizDRzZxjZUMm1Nx7gNVHaDNPINE83NOccmI6VU+X1xoig9hN54/ARbAFdshM28fHCCtf7/ug==', NOW(), TO_TIMESTAMP(1774126248409 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "VNtF3UpKY8YNOtUJLsK8y3RMhag2"}',
      FALSE, TO_TIMESTAMP(1774126248409 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'romanherrera@live.com.mx')::jsonb,
      'email', TO_TIMESTAMP(1774126248409 / 1000), TO_TIMESTAMP(1774126248409 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'davidmorales7502@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'davidmorales7502@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$3aI9ijkZWYmvrQ==$Vcs/ekyerwFLdEcEK9dG96/yydz/dYjPnipY0jBId2j33lKqdjZAM2psELNNhUsf69HcIBTcx+q8HnBulUrZlA==', NOW(), TO_TIMESTAMP(1776496755651 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "VRsc6DOf3FbzZWsVymehVrU4GhP2"}',
      FALSE, TO_TIMESTAMP(1776496755651 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'davidmorales7502@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776496755651 / 1000), TO_TIMESTAMP(1776496755651 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'valery.navarrete@daonsaimplantes.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'valery.navarrete@daonsaimplantes.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$VlOa5wOQ3hc70g==$mAuOpUYdKYPIUVEGTemvhtvgmbt1BzSyP564Q+Zjen2V1bIUISkC1bHAdQh5M43u0IvBqA8gzpOjsTmChYBd9g==', NOW(), TO_TIMESTAMP(1776448967772 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "VTCPdMwxnhX03ovM0pvVjjL6ni33"}',
      FALSE, TO_TIMESTAMP(1776448967772 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'valery.navarrete@daonsaimplantes.com')::jsonb,
      'email', TO_TIMESTAMP(1776448967772 / 1000), TO_TIMESTAMP(1776448967772 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'hdanitora2001@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'hdanitora2001@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$zZ3l62WXaVWoXw==$HwGVRbVs5Sma4Avlc2DLvcSNl2ZFbioTmI/k+2VEDgbKH/mj/9gQe/RdJgsd3t4vgEEfouYrciAqgCnvpzE1yQ==', NOW(), TO_TIMESTAMP(1771807212829 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "VW5SOSbLg0en3rqdWc5UA9cKP013"}',
      FALSE, TO_TIMESTAMP(1771796070508 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'hdanitora2001@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771807212829 / 1000), TO_TIMESTAMP(1771796070508 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'cejojoche@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'cejojoche@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$f7C0b3NPt1gsjA==$QBPkG1tsHCdFA+9fw7KV4jUaVG5+oHEJ7+DNw9DDrRQTMjYAF4by50OnGY7FJG1tnI4Lqa+UfEIsSYkNjwCalg==', NOW(), TO_TIMESTAMP(1776229981607 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "VeBaZHlMojYQxc9P5btNeUaLkCq2"}',
      FALSE, TO_TIMESTAMP(1776229981607 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'cejojoche@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776229981607 / 1000), TO_TIMESTAMP(1776229981607 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'gr185153@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'gr185153@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$FdbquRIWK4bhpg==$rb6DySLkrChlaTnkol7T5MgoKY5tiM6h3VS/g1cw7QRSjr6hQnCE94gO8kv3jDnwixNaFsqUctDNerm8z8wsXQ==', NOW(), TO_TIMESTAMP(1751480711995 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "VgcJVBoCCzaWe9hEEh9YnCERid92"}',
      FALSE, TO_TIMESTAMP(1751480711995 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'gr185153@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1751480711995 / 1000), TO_TIMESTAMP(1751480711995 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'isaaccruzcruz456@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'isaaccruzcruz456@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$JoETVnoYV+d+Fw==$TN8q9Mxiiv45ZtWh8vU4+5RKnAqeoz7f+zoBGRHg8FR4Cjeaq05ar0aQvi3HJOpDSRtYmW2eucmmfrCJyw5Ngw==', NOW(), TO_TIMESTAMP(1779151798985 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "Vi48xKK9QjOnkMYXQBDmqEicLVi1"}',
      FALSE, TO_TIMESTAMP(1779151798985 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'isaaccruzcruz456@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1779151798985 / 1000), TO_TIMESTAMP(1779151798985 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'jares74@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'jares74@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$kixtY5aMA8TKgQ==$SKa6dS2y4Bz9cmBETeuqiqr/yHBXjYt8PI1ZF5nImJ1ZRVFT6UPPuVlP6LzxsIUaRqeJsNHNz3tgpCTQVPNdxQ==', NOW(), TO_TIMESTAMP(1764090139969 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "VmRKzqAmiZQ7FIoTlCaVruFQqz12"}',
      FALSE, TO_TIMESTAMP(1764090139969 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'jares74@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1764090139969 / 1000), TO_TIMESTAMP(1764090139969 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'moroalazan5@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'moroalazan5@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$EoQKaQSaOCxFMQ==$IfUWoOvFKvSns4X/pBU9Ce0lyCgVJJZDZ50lB28BpOK49pj2HlDTv44JK6bo7Vq+m1COGQLhVGsUAU37isJhBQ==', NOW(), TO_TIMESTAMP(1773975695457 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "VmkspL5qAyd8EWAGQ4p27FC1obm2"}',
      FALSE, TO_TIMESTAMP(1773975357315 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'moroalazan5@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1773975695457 / 1000), TO_TIMESTAMP(1773975357315 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'da6059033@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'da6059033@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$P5o3wU6UlXJoFw==$6j+8ayW9qVkLyCbbGBSVhIdmuJP8HcIllxBQlbGKvKxH8Fm9oz+yeLY8R6R8vlkY7DRBPGJ/rv2BEuw3ivsKhA==', NOW(), TO_TIMESTAMP(1771308664274 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "VmwZU2oLahNbupHtZLOhLKDAQ3y2"}',
      FALSE, TO_TIMESTAMP(1771308664274 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'da6059033@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771308664274 / 1000), TO_TIMESTAMP(1771308664274 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'rubenresyes@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'rubenresyes@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$NAAtlB32fmfGQA==$zu35lnhqYCXX4h4CEaeZ6urT9mqe3qc41tc0/bYpvwLpyMgv0IdUeCmuOKa6KQSjz6/oR++BOIs+z1+E953s6w==', NOW(), TO_TIMESTAMP(1751673545686 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "VoL4BKhyGEZzwedfz7Q3l2979qt2"}',
      FALSE, TO_TIMESTAMP(1751673545686 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'rubenresyes@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1751673545686 / 1000), TO_TIMESTAMP(1751673545686 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'jukio1003@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'jukio1003@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$nkxpSj8fGeq6nA==$4HpmvwyomctjMGFt0IBugLRYZe7CT3iAdIIxj3mspu7/pn3axymUH9X6z46ZFAFO7noAPL6rk1d12+Kn2V5iag==', NOW(), TO_TIMESTAMP(1767299120191 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "VsjlgawZE6T7kpqcIzLD64vQFzB3"}',
      FALSE, TO_TIMESTAMP(1764808278606 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'jukio1003@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1767299120191 / 1000), TO_TIMESTAMP(1764808278606 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'juandiegoramospenagos@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'juandiegoramospenagos@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$ArruDagFIARFhw==$zmen3XYagNlOJT4B+FdX1ku7kSsyGETrt0GGX8YoGTsgSbXIloBj7Xqog1H9CsoFbWZ1auiU0uBK5JFQbNy0TQ==', NOW(), TO_TIMESTAMP(1771275677783 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "Vt2PynJwctUWP3gNfSljcRGBkal1"}',
      FALSE, TO_TIMESTAMP(1771275677783 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'juandiegoramospenagos@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771275677783 / 1000), TO_TIMESTAMP(1771275677783 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'krina_612@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'krina_612@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$UGS0wK1TkFrkkQ==$xgl8/JHbjoWfoHPzvz2DHn7Wk4Dl3i6VGQ2ZxCvBsdWUDw5DgpNd+kYKyFBsRCSHMOeMwcNqdNr0x6oGG2jdeg==', NOW(), TO_TIMESTAMP(1747424273540 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "VxUpF0YKEyMaKLKmjvMh3s0o1cW2"}',
      FALSE, TO_TIMESTAMP(1747424273540 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'krina_612@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1747424273540 / 1000), TO_TIMESTAMP(1747424273540 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'aj947551@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'aj947551@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$QPzIWeZLGU22UQ==$sR2jqfSDpdZ4p1gAuowZrB0ACemM6rQFNqXJ+8VnIQ2vbSHpWqMD8S7qPk+WkyxT2MKRFW+xZtsSUtJrB80NIA==', NOW(), TO_TIMESTAMP(1762998731022 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "VxjE38QbaFekUwYByJhsnv1Ywlp1"}',
      FALSE, TO_TIMESTAMP(1762998731022 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'aj947551@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1762998731022 / 1000), TO_TIMESTAMP(1762998731022 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'carlos.duran0716@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'carlos.duran0716@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$yHysgZbhSDxIww==$nt4D7h5cVCZdbdv3MWUpsya4Uvlw07JTgYthGql0wtQFyDziKJ0k7FktxzTJX/ng3jSal3nJzFNuccC3vtmCXg==', NOW(), TO_TIMESTAMP(1771275271364 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "W2ysVLV2kPhG6hfAnkMiuoMoS5Y2"}',
      FALSE, TO_TIMESTAMP(1771275271364 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'carlos.duran0716@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771275271364 / 1000), TO_TIMESTAMP(1771275271364 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'rosylopz2718@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'rosylopz2718@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$kvOuityXK9WOlQ==$WN8RC/CTpa/3rInhFDOGe5eZmVUszZ8IpNxmBvXKmnUVn8zfLuQiRASYJCf7w8FZBZdlbJUwvChqlHojXkqbgQ==', NOW(), TO_TIMESTAMP(1776280105899 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "W3kKHeYLgxYBbwPkzxnut3ZpuFe2"}',
      FALSE, TO_TIMESTAMP(1776280105899 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'rosylopz2718@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776280105899 / 1000), TO_TIMESTAMP(1776280105899 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'hugogomx10@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'hugogomx10@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$NHru2w5cbT7RuQ==$j0X+IvWQyRvT3+bnDSZTfHGONw/k4fIo2L9iOECQgJ5FniZx+nvtUqNkls5QL4QoFIH8kn1ubMIjFwFaDqn0cQ==', NOW(), TO_TIMESTAMP(1772915991931 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "WFUtgwbXWsQvvkQ9uDQ5fCFYOR83"}',
      FALSE, TO_TIMESTAMP(1772915991931 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'hugogomx10@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772915991931 / 1000), TO_TIMESTAMP(1772915991931 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'apadillah2101@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'apadillah2101@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$OOqfdKnnc/4Gzw==$mAUq1uTD9SSltAUhhcPc1P3vIL2Yel+0wziztVOjZlqvtpuFB3qsdc1fXzH7C0E6J5Mt9IJFnrTc06aXUolPNg==', NOW(), TO_TIMESTAMP(1776218232270 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "WJ6BPTNvtGUMucmWa9IiQ89Cqo32"}',
      FALSE, TO_TIMESTAMP(1776218232270 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'apadillah2101@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776218232270 / 1000), TO_TIMESTAMP(1776218232270 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'car.ozuna0607@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'car.ozuna0607@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$wpJ5m60So3S40A==$9d9+wkPqLKxH5lsKloN2sYBLn0v6L4weZLlFTo6+NDA2BCr+QLKfEiQOGKKIcW+ZnppMYxq510Rr/dL9NTWl9w==', NOW(), TO_TIMESTAMP(1776263008705 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "WMKzwwus9JNPMzN0w6EsCPVbGz52"}',
      FALSE, TO_TIMESTAMP(1776263008705 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'car.ozuna0607@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776263008705 / 1000), TO_TIMESTAMP(1776263008705 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'bg61064@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'bg61064@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$LGJYias76HNuzQ==$wgZkRJBE4EmqC5ww3hsSgICz+eGD8d5kQfWW914970Y6cfos69OoVN6ewusHHsXBzx5Lqb4PBKfFQvAFm+e6yA==', NOW(), TO_TIMESTAMP(1771692237095 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "WQi5yGVJebWTEGYHRw1IlXx6tNs1"}',
      FALSE, TO_TIMESTAMP(1771692237095 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'bg61064@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771692237095 / 1000), TO_TIMESTAMP(1771692237095 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'sagitario8729@outlook.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'sagitario8729@outlook.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$ZxbCCwp4nXdXAQ==$/1Tgh9ZWSTwmi+mpULZSS625m2blP3CDdLaugWszL3DAV9JtQUChRa0xUPEXAZBGWEA/lD5tAW7sQhpZjasd4Q==', NOW(), TO_TIMESTAMP(1771273549498 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "WRIppEVgR4Ubtl7CoiiZSOZOgJy2"}',
      FALSE, TO_TIMESTAMP(1771273549498 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'sagitario8729@outlook.com')::jsonb,
      'email', TO_TIMESTAMP(1771273549498 / 1000), TO_TIMESTAMP(1771273549498 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'ricardo@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'ricardo@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$szsQuU9bBq4h6A==$hGgLQjveSu6Z+zQ5ISnsgqiqhsdCWBKvk9l99qRYpPazKwVcOuFBaXEXyy0pPgvect3b68h8d6HDfytviT7OxQ==', NOW(), TO_TIMESTAMP(1774736231596 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "WU2Vj5kAV5ZIifh4duwPFFBTdkv1"}',
      FALSE, TO_TIMESTAMP(1774736231596 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'ricardo@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1774736231596 / 1000), TO_TIMESTAMP(1774736231596 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'ucorzo377@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'ucorzo377@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$Q4IIRTnijI4dFQ==$bxxraWgpV1hjbObx4Wn5GMtz9TgDecUWrUa2HXhhLac079ufaQYbX0el3rsJhY4U/Wfu1J1TN0/sKvLe4/qPvA==', NOW(), TO_TIMESTAMP(1771296333872 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "WUZiafYLfbXBISxBjx6NSeDb5hE2"}',
      FALSE, TO_TIMESTAMP(1771296333872 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'ucorzo377@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771296333872 / 1000), TO_TIMESTAMP(1771296333872 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'artuvazqwar@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'artuvazqwar@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$X8RPPCfHiJOvAg==$XAlGJNMnggfi9TgXKQMmEJikewRMLeiqi/dpF426GsHHFD7sFJPH4STqYaxNBSji/pw2BIWchnG8h82P9owXgg==', NOW(), TO_TIMESTAMP(1771339658977 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "WUfZ9BasiLdDMxc9gikfK83kPlE3"}',
      FALSE, TO_TIMESTAMP(1771339658977 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'artuvazqwar@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771339658977 / 1000), TO_TIMESTAMP(1771339658977 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'lfig1982@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'lfig1982@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$poZnTmuhMSpgpA==$AHlvs52qmK+3CLZlcqcangiC997K2U8j9k80fKHjcoY4JbPi5W9yaPwIaxrvBJRG7zu9OVqfp1flCTuAP4wktA==', NOW(), TO_TIMESTAMP(1753460344840 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "Wbs7sld70qhFHSlVGKnoX5CyDGw2"}',
      FALSE, TO_TIMESTAMP(1753460344840 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'lfig1982@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1753460344840 / 1000), TO_TIMESTAMP(1753460344840 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'edupg9207@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'edupg9207@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$6MS6siwtgCcavw==$feLAQV4qDdOsK6c84GaOTdbrhImJXUTEuYEcr/tVloMQUS0KG7vMsWUsbzeSDLa+DBj7uhlft9yImS0RV85PqQ==', NOW(), TO_TIMESTAMP(1771636535685 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "Wrxam9XOhwhKvkKOb6GA7CTiPTI2"}',
      FALSE, TO_TIMESTAMP(1771616557563 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'edupg9207@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771636535685 / 1000), TO_TIMESTAMP(1771616557563 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'xaviara198@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'xaviara198@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$QuwghQjcyxSnxg==$y1efm+MsQ4pgLqJ8zPMrT3QMZxuog99K/prJF72vNqoGqVsTSh4nkZRlg/PcsQSUFgDtEr/VgnoQphcTZyizaw==', NOW(), TO_TIMESTAMP(1771274008705 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "Wun26UwQ6vNTofDyNSnH1AOhZN92"}',
      FALSE, TO_TIMESTAMP(1771274008705 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'xaviara198@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771274008705 / 1000), TO_TIMESTAMP(1771274008705 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'guerragomezluis4@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'guerragomezluis4@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$zcD3ThNlGPc+0Q==$uyndi7YRuJFxfp3W14CgqJICkc5F/aUo/6jJMi6DRrViwUwF9eH/PouiS/1qbED2jb+IiONGQOnsw4NrwP9BBw==', NOW(), TO_TIMESTAMP(1766889991598 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "WwqSDRM0vCO0dUiNi8jnsJGZWxE3"}',
      FALSE, TO_TIMESTAMP(1766889991598 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'guerragomezluis4@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1766889991598 / 1000), TO_TIMESTAMP(1766889991598 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'secsa6092@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'secsa6092@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$5S7j3ZuKEP2cZQ==$9Eb/hs9ESCPTN9GHuqyg3QgYAm1d3CwOpii5EhIbso8HDhKCFdLVHvmJqH5rPcT5fEJa8/Xl+912pFfVW4KY0g==', NOW(), TO_TIMESTAMP(1752273328914 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "WyXhY2fZUnaVUCr7RQKpBYmsD0q1"}',
      FALSE, TO_TIMESTAMP(1752273328914 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'secsa6092@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1752273328914 / 1000), TO_TIMESTAMP(1752273328914 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'alex22602008@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'alex22602008@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$LriqkV+u5Ewlhw==$rGsIlWV+CRFDTHLizIwfaS7/XIQuGz1z26EUuT85ptbLRCmvEkXOQt+ay6ekS6Bpx9KJxeYc/Bo6faDmmZIwwA==', NOW(), TO_TIMESTAMP(1775075015390 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "XBkqrsUtt3SJ2PWFE6TIu6ttam72"}',
      FALSE, TO_TIMESTAMP(1775075015390 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'alex22602008@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1775075015390 / 1000), TO_TIMESTAMP(1775075015390 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'maruu304@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'maruu304@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$yQxzstShzQgjrA==$6Ft4VMXy25VaQVeMnRxUY1W1qTpwpIezGq9OWIvXGHmci74m1bLbdInkdgfSJFXCDtCHDyhu5BSFLYQ8ALrE7w==', NOW(), TO_TIMESTAMP(1776226870372 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "XJRdX3QYNTUfmNiFbzQ4lCqa3X93"}',
      FALSE, TO_TIMESTAMP(1776226870372 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'maruu304@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776226870372 / 1000), TO_TIMESTAMP(1776226870372 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'lorsot2013@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'lorsot2013@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$U02Xu4jaze1FDg==$hEDlAJXrv1SMrb/ysDFB4tGqi8XCygSbyASxxnGKVKxJCfV1Tg+btMrUAEd+SNwLMzmwzhT/5lr+9uGKjrVbbg==', NOW(), TO_TIMESTAMP(1774222360652 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "XJb2dC9DFIhSCV3BAax6SmqGunm1"}',
      FALSE, TO_TIMESTAMP(1774222111087 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'lorsot2013@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1774222360652 / 1000), TO_TIMESTAMP(1774222111087 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'ic_cd@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'ic_cd@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$YX4Ld30Zlu50qQ==$FD+C/EVhAWgAc2hPoEADTk3IxxcaB0wIthcZU7Begrruc5EeDT1jFqr7Gbkny8JSM2gJ4mHhGuyOGI2EtU8EIw==', NOW(), TO_TIMESTAMP(1776920688350 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "XKr7gZWuC8Z1l9oZBKzxoSNvPi93"}',
      FALSE, TO_TIMESTAMP(1776920688350 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'ic_cd@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776920688350 / 1000), TO_TIMESTAMP(1776920688350 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'sandramaribelm2001@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'sandramaribelm2001@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$fofbMFJIE4cXaQ==$PHVmFA610rCKVgjRCbr7zjUnxQTdsaD6sVi13eV3sn2OoNnlQQg0HuWmScyrV0vS0yoYD9rb2szRBwVKKcPy5Q==', NOW(), TO_TIMESTAMP(1776233167328 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "XKyOhbohMWMlpsiYhRRpQt827uR2"}',
      FALSE, TO_TIMESTAMP(1776233167328 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'sandramaribelm2001@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776233167328 / 1000), TO_TIMESTAMP(1776233167328 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'arturo2002cargar@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'arturo2002cargar@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$e3CahWzVKUmgTA==$HV9xFKZ6/0DqeVSns0fLxu+uLqf11UOBFNRyU0PsP8tEN35tTtYBe7wUTWU/AUwYpTM3nssYKiOmGaJszK5tlA==', NOW(), TO_TIMESTAMP(1772164608624 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "XM2lSBhfIPRvxvlmXBAoH3T8pz83"}',
      FALSE, TO_TIMESTAMP(1772164608624 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'arturo2002cargar@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772164608624 / 1000), TO_TIMESTAMP(1772164608624 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'ric55laz@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'ric55laz@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$VnAQnU6vcCiRzg==$r73/7gcew5vg3ffpzFKW/k1R/6GKpM3JpHYKBT0LjR3i2kxLwmUGtWVk+kiUdEPiqkohZ+3McdTPlgfdXWPwfg==', NOW(), TO_TIMESTAMP(1779738156194 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "XSOAU5RBDJU5sEDgFOzQ1RhuTP13"}',
      FALSE, TO_TIMESTAMP(1752794515346 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'ric55laz@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1779738156194 / 1000), TO_TIMESTAMP(1752794515346 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'salvadorjesua@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'salvadorjesua@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$XwgddECz8XP+yw==$8N0Ni7bcopTMsDm/ntbivf4qTPvV9ylCM1VpTW9EzvuzjhlC3j/XKqyNcd5Ys9PsV0iaugTPbU6NMb7dkbrUTA==', NOW(), TO_TIMESTAMP(1753388869791 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "XSlaN1UWI0cNN08ZWDmrqqtEisG2"}',
      FALSE, TO_TIMESTAMP(1753388664220 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'salvadorjesua@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1753388869791 / 1000), TO_TIMESTAMP(1753388664220 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'salsaverde.centrohistorico@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'salsaverde.centrohistorico@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$k22UJ6xhSbiMRA==$zyRjJyTPtnHM/MgGnyLOHRVRSB/axAi9MPpqViUs2ADYOsdNgM1t/ULXLdIQMxsWPPQfSynX2pycQmAS/MOOXg==', NOW(), TO_TIMESTAMP(1771292326571 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "XVugN808raQMFgNk32mZuWUwvMh1"}',
      FALSE, TO_TIMESTAMP(1771292326571 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'salsaverde.centrohistorico@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771292326571 / 1000), TO_TIMESTAMP(1771292326571 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'alejandroalfaroruiz@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'alejandroalfaroruiz@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$G7EfpQYs0tBcsA==$hqv+KnE+kvn40A7uTC8PEyucIo47n6F3THB1vQObGgp5eeMK4KS3bAlaMbD1n0JhrALDjJaKHomnJsrF+reHmw==', NOW(), TO_TIMESTAMP(1771287415684 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "XXBpLkiH5hQnxNuQXuaBajpacvm1"}',
      FALSE, TO_TIMESTAMP(1771287415684 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'alejandroalfaroruiz@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771287415684 / 1000), TO_TIMESTAMP(1771287415684 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'feli_ic@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'feli_ic@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$oxOsnvk4q4ycjQ==$0EEVzObtf11SrTcDp6CVHQw8KiBB0c+WkeQYR5HKsCNx52I9VxitMKcy+qyCEI4NiZkLSjFVgpzvAgTS+Dlq9Q==', NOW(), TO_TIMESTAMP(1776229631645 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "XkJJLWN4lfZqKORuibOLhSVOP3i1"}',
      FALSE, TO_TIMESTAMP(1776229631645 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'feli_ic@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776229631645 / 1000), TO_TIMESTAMP(1776229631645 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'abercash@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'abercash@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$qBl1tXLOUH1wVA==$9wDhO5buPfMA3dkv2MttBSNHWpz8X8Hh/91tNY4Z7nc96BcjF3itSGusDT20MuJ4Nc6P/F2Jv341WWM0QXRBGg==', NOW(), TO_TIMESTAMP(1771458259099 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "XnMvHArwUVY3Jh5nywWn6OvwVp43"}',
      FALSE, TO_TIMESTAMP(1771458259099 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'abercash@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771458259099 / 1000), TO_TIMESTAMP(1771458259099 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'vivianaharias@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'vivianaharias@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$PoYx35aY06j8oA==$pSgd9SM77fLZIJxBQlDNCKppwWa0yowx8wTYNJy0XyF1wMJBqcjikj0/LiYSo4rcmVngtz2yGMnjZX7EVsiMRw==', NOW(), TO_TIMESTAMP(1755918822284 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "XqZKeo0t1reRFtT4YCOymykQbLI2"}',
      FALSE, TO_TIMESTAMP(1755918822284 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'vivianaharias@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1755918822284 / 1000), TO_TIMESTAMP(1755918822284 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'nicolcastellanos240@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'nicolcastellanos240@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$PhiQEsZ/B15iYA==$pZHpErUXoYZnlM8zQexG9ktMQ9ZbrlQxArRAMGSxy54g6drLe8FwWNyTXE8NbDg7FE0O66xDsgggTbzN0by3Bw==', NOW(), TO_TIMESTAMP(1762489191698 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "Xvfv2NidDrNs12kAzXE56rSBvwf1"}',
      FALSE, TO_TIMESTAMP(1762489191698 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'nicolcastellanos240@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1762489191698 / 1000), TO_TIMESTAMP(1762489191698 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'dh6910946@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'dh6910946@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$przEjG9MgX/vyQ==$0Gmxp/dvTzTo7owNsMILWcyAka+Xras8eGZgxWPI4DJKdNJ9D9u1bGHkVff4BZvR2g6AnrkCHvG0cvAyALnIoA==', NOW(), TO_TIMESTAMP(1776462366015 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "Y21lzmPl3AdCja7bZueaxj0yXrg1"}',
      FALSE, TO_TIMESTAMP(1776462366015 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'dh6910946@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776462366015 / 1000), TO_TIMESTAMP(1776462366015 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'davidarguellolugo287@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'davidarguellolugo287@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$usXPeNp/QxblFA==$OswDIo4FiOivI6RLwFdsm//sQtuNZWS7EOWZimYB8vn5ByZlBwKZ4pAqGuiufVXfdLy5wR/LhrE0j9mhLCTmmA==', NOW(), TO_TIMESTAMP(1778469385408 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "Y2yT4wI2TcUlWGxgQNbqZK0ne0M2"}',
      FALSE, TO_TIMESTAMP(1778469385408 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'davidarguellolugo287@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1778469385408 / 1000), TO_TIMESTAMP(1778469385408 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'richargartorr@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'richargartorr@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$hW7/FUWqF2qbXw==$2mw2ZB3v4rLmS8WLmwdmxSg3OMwDIaM6XHPozdn4uFjXQSnsU6Se7vHUq48Hmh+Ipl69kc+kpnde0gtyDIuGfg==', NOW(), TO_TIMESTAMP(1753820905679 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "Y3INciLPCscGZCd3HmIGAhz83uD3"}',
      FALSE, TO_TIMESTAMP(1753486510698 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'richargartorr@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1753820905679 / 1000), TO_TIMESTAMP(1753486510698 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'pelisclon49@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'pelisclon49@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$frXIK3ulJm3ltw==$FY7wSpfE0suEm3ijbo8DUTsxgveb7RW6drZGvd8XOR0zFbDqaDuIPPQao8YwBEXeBbvtSqx9bt3i5L+gPpdrsA==', NOW(), TO_TIMESTAMP(1776222813876 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "Y4hz8xkPW1PELOiRfVQ4APBtfkA3"}',
      FALSE, TO_TIMESTAMP(1776222813876 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'pelisclon49@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776222813876 / 1000), TO_TIMESTAMP(1776222813876 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'gpobroker@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'gpobroker@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$Ph4fUY0fA513xg==$WhkO/iGT66Hk1o+bdn3wYApbVcU8fPHrh4jU2o4nAkyYU4AcagUX8CdNE1uFggfii0gHnjDOuUULHr5OtnIbdQ==', NOW(), TO_TIMESTAMP(1772422515858 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "YDz3chTYzwMjQ2IvZ6shWpCXds92"}',
      FALSE, TO_TIMESTAMP(1772422515858 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'gpobroker@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772422515858 / 1000), TO_TIMESTAMP(1772422515858 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'd.penunuri@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'd.penunuri@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$Jgd6gqI94jW10w==$CISOpRdRpzJsgCyiFb37UT5NepUCQfJRJEgUopODtgx91MlxeYBsqVyRPBW9iGa3FRnUlB2qor0nDXUl9I5E2g==', NOW(), TO_TIMESTAMP(1753224083240 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "YMMAeI7sqbbAGsCa0Lm3e4tUUnC3"}',
      FALSE, TO_TIMESTAMP(1753224083240 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'd.penunuri@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1753224083240 / 1000), TO_TIMESTAMP(1753224083240 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'martinezwendy98@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'martinezwendy98@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$QnB4+0n4vrBNSA==$5nxxS8lMQy6eLr2QJZSWqAohHyA6zgc8SpYvDhMvQFuL4jlrIQ0gKDbU4FV8RAtKHVGFjpurV4mhIHUjOGo3mQ==', NOW(), TO_TIMESTAMP(1776897198705 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "YO5x2pYkzOWqpwuV3ezokDb4Zw33"}',
      FALSE, TO_TIMESTAMP(1776897198705 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'martinezwendy98@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776897198705 / 1000), TO_TIMESTAMP(1776897198705 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'arbeygomez02052000@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'arbeygomez02052000@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$a4Fu9ZB4yfMyLg==$gKx9mG9XguQ5sRe8jXQikrScAeFlcX485YYPJy32bPGiMb0EG8e2WGq9IS+mubpAIaAXR3e68Kra4RnXHEYZVw==', NOW(), TO_TIMESTAMP(1772120070319 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "YO7LtpNJe7gGNOyIisQSXuqKooh2"}',
      FALSE, TO_TIMESTAMP(1772120070319 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'arbeygomez02052000@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772120070319 / 1000), TO_TIMESTAMP(1772120070319 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'bsc.chiapas@gaml.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'bsc.chiapas@gaml.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$zL06CjZcWt7oqw==$MU3F55yOS5vtL70P1uNYLDtzw+vfG39Z7h0nXKw40y4FQDgVgSVorYZAmZv0+7jmDFt/7LFVVAmokKypD/32Yw==', NOW(), TO_TIMESTAMP(1771271309463 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "YOiOcKhLeGbTQ9yhxEEGPGrgow33"}',
      FALSE, TO_TIMESTAMP(1771271309463 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'bsc.chiapas@gaml.com')::jsonb,
      'email', TO_TIMESTAMP(1771271309463 / 1000), TO_TIMESTAMP(1771271309463 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'ricardolaz1977@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'ricardolaz1977@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$WUpy8lqZuioYyQ==$LEo8hIW1hvs96rvfmSRoPkoZ7JkIgZ92B0deurPSShMqbW6mKaXjXCZMyz8GRapkpsSJrbBud8+9MfuZlOFlRg==', NOW(), TO_TIMESTAMP(1779569388650 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "YRoug6PR1xayub8UFdH5lAeVwzv1"}',
      FALSE, TO_TIMESTAMP(1762399392113 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'ricardolaz1977@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1779569388650 / 1000), TO_TIMESTAMP(1762399392113 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'alfredoadame108@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'alfredoadame108@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$08Tj3Lsucf5IYQ==$oeOXWC33BQ1RLTurut4YXz8U34SFYrOAntEzUOekxu3znAyCEUUxXres8UGqBaS8ScVpgqBW23lXRjG/N8Z+CA==', TO_TIMESTAMP(1764115935577 / 1000), TO_TIMESTAMP(1764118884306 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "YWyHlP5tNKauQVHrSIOoyPBgEEz2"}',
      FALSE, TO_TIMESTAMP(1764115935577 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'alfredoadame108@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1764118884306 / 1000), TO_TIMESTAMP(1764115935577 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'xiomaraperezgiron@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'xiomaraperezgiron@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$YEDVJkqG2WNGTQ==$a2Tpr6xLKG9phGsgB+OQTnjVJil8+z9qqI8W9dC0AvJg71TKf+/aRysQV5PxCHXnqKjGnF+ud/e17koo8dsxbw==', NOW(), TO_TIMESTAMP(1772165128932 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "YbSNjdkifkh3bnKDdGTTeNEuCkI3"}',
      FALSE, TO_TIMESTAMP(1772165128932 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'xiomaraperezgiron@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772165128932 / 1000), TO_TIMESTAMP(1772165128932 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'd.rgz.h1@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'd.rgz.h1@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$7AIP5szIp4RrkA==$pDeIMxpq1RBsHTb9PMxrdXJ0bm17TpDSXFZZsGRybG1TECgzBfkZ9RcH4cewRc/OewnnhOuZQNxKvPVJbCY2cw==', NOW(), TO_TIMESTAMP(1774085396763 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "YcS9jXm23gclc86sE8X4QLRdrVH3"}',
      FALSE, TO_TIMESTAMP(1774085396763 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'd.rgz.h1@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1774085396763 / 1000), TO_TIMESTAMP(1774085396763 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'miriamyamilethescaleraparedes@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'miriamyamilethescaleraparedes@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$RGvm5D8K4rxXKw==$Mkf5ubop6D4hrRuqBF1mV/miR3pVy6FmGxKz4jRRbDUx9HxUsB9E8ErI8IorNNWl7C77S+RziSSxtZg+JdAvqw==', NOW(), TO_TIMESTAMP(1776613906224 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "Yf6uZXbtD5PD5mhdvtjBxquBL9p1"}',
      FALSE, TO_TIMESTAMP(1776613906224 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'miriamyamilethescaleraparedes@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776613906224 / 1000), TO_TIMESTAMP(1776613906224 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'torijagomezdeliashaytara@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'torijagomezdeliashaytara@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$A+7G7TGFKWDo4A==$Bz4Clf5m9p53Inm8hsRleAj5ofJ41ZkkpdnI6zDx6SACUcgffeoVtxT+2S/dbko7Ezid497xoE33qP/OWoxiRg==', NOW(), TO_TIMESTAMP(1776311279134 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "YhlTd8AgDJPeddGu3lbytVS0OVl2"}',
      FALSE, TO_TIMESTAMP(1776311279134 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'torijagomezdeliashaytara@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776311279134 / 1000), TO_TIMESTAMP(1776311279134 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'lopezlopezmau23@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'lopezlopezmau23@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$m9ZB5PdYWNLD9Q==$jug8mEPbJG7WnQY8CPWOXqOP/PApW3lBU1aU2LBcNqQeUu+t6TVCHQal0V/aL68C6z4jjmObV4o69XVeDEqZag==', NOW(), TO_TIMESTAMP(1771290914378 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "YkKLcRNctIgOJSZZHbHdvAIirIc2"}',
      FALSE, TO_TIMESTAMP(1771290683223 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'lopezlopezmau23@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771290914378 / 1000), TO_TIMESTAMP(1771290683223 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'ricyyy5@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'ricyyy5@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$5CZFWcxPtl/+vw==$x6hB6rYzM8nSMITyyt1MZ45s8yD9qaIykY76eYMMNw9GSUkPl6toLyfMtXMZqwLbZnqY4DzJ7xcGxb9F1Sabtg==', NOW(), TO_TIMESTAMP(1772330046191 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "YlXsqmA9xwezYb7TvgNuPDBcnEJ3"}',
      FALSE, TO_TIMESTAMP(1772330046191 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'ricyyy5@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772330046191 / 1000), TO_TIMESTAMP(1772330046191 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'ranchondo01@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'ranchondo01@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$tVphel4ffYbHWQ==$N4eVR6oXwqrDjSery7dD1O5Hd1gzdwsCngXFShThOXZ08aKEz0nzn4a7+GQeHmWyBTYTSANkb5dFOGqfCmq1hA==', NOW(), TO_TIMESTAMP(1751564441988 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "YmZ6mbx9JuZOxfHAbjDKE2fn67J2"}',
      FALSE, TO_TIMESTAMP(1751564441988 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'ranchondo01@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1751564441988 / 1000), TO_TIMESTAMP(1751564441988 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'roberto30aguilar11@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'roberto30aguilar11@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$7S++jBKawh2k4Q==$rsC7+OtlilpC7OlX93woFQpgT4WeFzQ1bIzgjZfT2OmLEo2a4SAdhn69WT6WPAmxjt6Sjj5/9vLNkIJaMI7WlQ==', NOW(), TO_TIMESTAMP(1771279024392 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "YnVnv8VOicQV6g6ihhMBkBkSELA3"}',
      FALSE, TO_TIMESTAMP(1771279024392 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'roberto30aguilar11@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771279024392 / 1000), TO_TIMESTAMP(1771279024392 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'vicoturtle@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'vicoturtle@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$+nvYaSFftMQm6Q==$KwLsunPaJIfJLnNnEYn9LVx5GZSx9qE65tD5cSfuOLjHvWb+Yy/7aBnO/Fcq1ePoSdQbNBGKuq8IhfxrMjlJ5Q==', NOW(), TO_TIMESTAMP(1778397068916 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "Yran1kobMtWoXpwEHCTwdMpPXZY2"}',
      FALSE, TO_TIMESTAMP(1778397068916 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'vicoturtle@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1778397068916 / 1000), TO_TIMESTAMP(1778397068916 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'guadalupe_cristel@outlook.es') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'guadalupe_cristel@outlook.es', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$OAkT+fV+QmxUXg==$2SMjPnHM3h5wr4atD+EfM3qs7tisEOi0f18/BqhTnjHL6+4WTU/4BHV7gQ55CAKad9KyexZXCZEX/Mrm2m8jyw==', NOW(), TO_TIMESTAMP(1776271450619 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "YrdBAQCKVqRe1urg2FkgCCYIy3r2"}',
      FALSE, TO_TIMESTAMP(1776271450619 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'guadalupe_cristel@outlook.es')::jsonb,
      'email', TO_TIMESTAMP(1776271450619 / 1000), TO_TIMESTAMP(1776271450619 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'espelunca@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'espelunca@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$rDq094pBd96/8g==$JBwswbBZmmZm1pYuNMH6h7YzJTNVAqN8Z1g4M56Byn7OoAux/h8+XsM/QDazEjwMnNdtc/lNUupwyp6KwEa0lQ==', NOW(), TO_TIMESTAMP(1776229060212 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "Yrfaj0xtn2epoD0U5S98XA043Rc2"}',
      FALSE, TO_TIMESTAMP(1776228879193 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'espelunca@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776229060212 / 1000), TO_TIMESTAMP(1776228879193 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'luisr.lopez94@outlook.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'luisr.lopez94@outlook.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$7N8LMv3MX2E3PA==$KnoCypG1EL5Mn8V7wjj579u4wZ9GYduFhY1kwB9DtVc7BR5c89KTGL9iiOUcg3JQvohSwa8h9Jm0VuRCYcfVgQ==', NOW(), TO_TIMESTAMP(1751435812482 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "Yv5ZFmVF8HP0BapSjnws1tG3P3H3"}',
      FALSE, TO_TIMESTAMP(1751435812482 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'luisr.lopez94@outlook.com')::jsonb,
      'email', TO_TIMESTAMP(1751435812482 / 1000), TO_TIMESTAMP(1751435812482 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'smoky_mask_v@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'smoky_mask_v@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$rQNVa/pNxHvi9w==$j9jCZZwQEIVx29ZyavoR2b7AFQ9MWkHM4wnURy8LcE4fAlsKA9AuYsw8/qH+wyfpQnD1lDykCKykJMZtP0U8Eg==', NOW(), TO_TIMESTAMP(1774990485130 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "Yvj312Jao1gO24FshDCu9vwfMFk1"}',
      FALSE, TO_TIMESTAMP(1774990485130 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'smoky_mask_v@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1774990485130 / 1000), TO_TIMESTAMP(1774990485130 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'clubdegafas.sc@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'clubdegafas.sc@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$JZo+khUnT/cLlg==$pi2Gh21+KZ4iW3zRQ7tgBvgiZiiFvd6j+zeOqh7nPrT2ZfRgdR2cdAQBiqPl7pzDoEZz8kP3lNzzEkkCSbecZA==', NOW(), TO_TIMESTAMP(1776466330404 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "Z2QyomYodOd9f0l3lrRrJAVrvCy1"}',
      FALSE, TO_TIMESTAMP(1776466330404 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'clubdegafas.sc@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776466330404 / 1000), TO_TIMESTAMP(1776466330404 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'fatherkaremy@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'fatherkaremy@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$DTydb6U0ol5o/w==$Y0u98guwo/s8C9iX3hK8ONCCN+j3z5A3af8hORsAuMvhWBo1oBJ6Y3KKc40d3Cj8LqxLyaQz5grJAYqEjUqHJQ==', NOW(), TO_TIMESTAMP(1776454425091 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "Z39tT3wcmBPXLiq19qne8UWn5bi2"}',
      FALSE, TO_TIMESTAMP(1776454425091 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'fatherkaremy@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776454425091 / 1000), TO_TIMESTAMP(1776454425091 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'a_mon93@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'a_mon93@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$l+lk7UTz81PMhQ==$hrBq1EN0HO+M1fgdxyD/YCteyHf5J1/jrpDx0vYSh+8M2kWGy1fagWIvZKs7BhQkOYl2gTZEnX0ZUvCsEJDReQ==', NOW(), TO_TIMESTAMP(1775382871270 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "ZCxL2vln5KM5ZUgC9CmFotm8IQ23"}',
      FALSE, TO_TIMESTAMP(1775382399021 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'a_mon93@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1775382871270 / 1000), TO_TIMESTAMP(1775382399021 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'paoladonaji433@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'paoladonaji433@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$l05pelETsUnK8g==$0/r3wbo26FX7ep0oa+tsuPATr5do50w5ygL8g/6NtOXx6AczlRxvrNG3sdvi7H2T916wQVU5WfqjTTYMVGHA6A==', NOW(), TO_TIMESTAMP(1776277935578 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "ZFGf8wkWDegxNJpLfsmRR1AJnIF2"}',
      FALSE, TO_TIMESTAMP(1776277935578 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'paoladonaji433@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776277935578 / 1000), TO_TIMESTAMP(1776277935578 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'carsemova.89@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'carsemova.89@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$gkrESdAWK6j1pg==$FgbzjlZWH2jqwkxcJiFb83+XZu82eJC6qDP8edgqIZiQt2qzBu0GPZJjHizC1Z03yAbSe86XOvEeEEb2sm5BuQ==', NOW(), TO_TIMESTAMP(1774905597101 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "ZFcOdc0bYzWLDbwPHCG0d10v1lG2"}',
      FALSE, TO_TIMESTAMP(1772760656534 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'carsemova.89@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1774905597101 / 1000), TO_TIMESTAMP(1772760656534 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'charck02@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'charck02@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$0NI5ITiS8RIOGw==$n7o82t2EBFZnM10OQes8x+pFDnP+vwUDmEUcg3xDehokDax4GUh30qQLVIcHj0FBc/6srEQ3RptzqhnfRDxGKQ==', NOW(), TO_TIMESTAMP(1776295006214 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "ZFrBl5DaiKa4L1DsnXFfEp6f3hY2"}',
      FALSE, TO_TIMESTAMP(1776295006214 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'charck02@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776295006214 / 1000), TO_TIMESTAMP(1776295006214 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'martinehernandezmayra@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'martinehernandezmayra@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$LXrCd877MaNGsQ==$a5xsCvXdKOThcNgM8op/hatoEn7fHscuT6+mAZedDxdtcLqkSCQN+IOYRWUpbV5XygrhYiRKY7SWy5iCkGUZWw==', NOW(), TO_TIMESTAMP(1771542738214 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "ZI1op5SXNXaGZzJEA6ubon993Xu2"}',
      FALSE, TO_TIMESTAMP(1771542738214 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'martinehernandezmayra@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771542738214 / 1000), TO_TIMESTAMP(1771542738214 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'gildardo79cruz@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'gildardo79cruz@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$6KgWs2uZnfi1mA==$itf7jEdn4JmchuyaXTZPzJ0d/QNUUYcVCOrjaqtJnI51C9VDEwv8Qf2njJ1GBmlv3yip223sWiXP48G7F6u0pA==', NOW(), TO_TIMESTAMP(1774054389290 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "ZKrtsV1MAITPNQFwxL0nDYXNwP93"}',
      FALSE, TO_TIMESTAMP(1774054389290 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'gildardo79cruz@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1774054389290 / 1000), TO_TIMESTAMP(1774054389290 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'benjasm89@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'benjasm89@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$98lCrpWjv4vNfg==$WeexIhqSb7Z8ye0Uhovbs0tbwhyKhuQd5sAs3DBRlkP32n8OKbwwXgOLVEAduL/r9FlmxbHSViDELpdjVh8A9g==', NOW(), TO_TIMESTAMP(1772086481458 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "ZLdyJtQQdZVAjuNA6p6g9kT4DGF2"}',
      FALSE, TO_TIMESTAMP(1772086481458 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'benjasm89@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772086481458 / 1000), TO_TIMESTAMP(1772086481458 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'yazalhemartinez@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'yazalhemartinez@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$wjp+pDtog9BRHg==$J2A9Krx4+1UzaB94FXBbij2gwa8ezQGW+e55QBRT7JwbhOCyFQuPXDwARl/KFia/d15vEv+ahaigs+kk1nQWlg==', NOW(), TO_TIMESTAMP(1770998449130 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "ZTfStWb8y7N8MiFp6WQfnvGHdfr2"}',
      FALSE, TO_TIMESTAMP(1770998449130 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'yazalhemartinez@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1770998449130 / 1000), TO_TIMESTAMP(1770998449130 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'cruztrejomartin41@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'cruztrejomartin41@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$zMkn8jgXQ5XmeA==$a5mtV2ciB16D0/ACncBWPjT60Ey851ls85qOS047SY5haPDzVkiKNKfgPckvZkY/GMdDEEPcyHAHJ/bCsaVkEg==', NOW(), TO_TIMESTAMP(1769456615990 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "ZUdJEVvM6IMKBaXo6MeXQPAmpX22"}',
      FALSE, TO_TIMESTAMP(1768321283832 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'cruztrejomartin41@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1769456615990 / 1000), TO_TIMESTAMP(1768321283832 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'omarsuarez927@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'omarsuarez927@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$uTwwcWeGFOWFrg==$dvqOAgUBhVb79sOTNCwQTik3CtLa7bexnSFDeskDTpWYEq+OEqEFxe/B5pWd1H5lK5MBLJC5czLDN3UvdwWt5A==', NOW(), TO_TIMESTAMP(1772382593977 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "ZVAKxhMputa4cUDzH96oGGgLrMn2"}',
      FALSE, TO_TIMESTAMP(1772382393373 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'omarsuarez927@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772382593977 / 1000), TO_TIMESTAMP(1772382393373 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'vag_abundo500@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'vag_abundo500@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$GMd2NuqeuNK6tg==$//orFsQ2IonxO/L/wiAjVeH/vqJoTwr4qALgPtlvsDfTYwi9nax3DBw5YZpA5r9Crsl/d/zAKSTfRd+nhZNmQQ==', NOW(), TO_TIMESTAMP(1777087605563 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "ZW0f6qbBGGWsaHjWasm3XJYLsPM2"}',
      FALSE, TO_TIMESTAMP(1764025819837 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'vag_abundo500@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1777087605563 / 1000), TO_TIMESTAMP(1764025819837 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'chairesmartinezjoseandres@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'chairesmartinezjoseandres@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$ft4OQ1DlvbRw5Q==$D4atx7Ad0ZMy9n4c7J+pfmG7rHRPPi/70kPINbzfPun+TA+6PQqEo1iAlZ5HBobx8KZ8qLfEaM7xpkZPeeMU/w==', NOW(), TO_TIMESTAMP(1753318450335 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "ZWoHdQfaOwbagQBi1XDQRQLLH0f2"}',
      FALSE, TO_TIMESTAMP(1751478732473 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'chairesmartinezjoseandres@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1753318450335 / 1000), TO_TIMESTAMP(1751478732473 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'pp1383536@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'pp1383536@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$zVUVyioJ/n+kQQ==$7lvduw15lXWm1hIXI1mptjT7dtkAc8HxiaWMSSs0Sj7I5fqzUMa5xIjbcAtNqrE8MlkLPpvQnIAcYqnEPDlpHA==', NOW(), TO_TIMESTAMP(1774107105129 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "ZepQTioOuwcbs55IM0MMTl0YzE53"}',
      FALSE, TO_TIMESTAMP(1771282286267 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'pp1383536@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1774107105129 / 1000), TO_TIMESTAMP(1771282286267 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'moralesluciae308@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'moralesluciae308@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$N4wqVk5ACzvJUQ==$5YzXobcQZ3L3vTVgB59NlMOALsByLS29X1s2bo+PPCDu20x/GmPCX+0P6kCokcfAd0rwL7NaLVgb7Dobmi8Ifg==', NOW(), TO_TIMESTAMP(1771693138351 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "ZjDfZjNuFRQIO7am6HkpQXeVHv22"}',
      FALSE, TO_TIMESTAMP(1771693138351 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'moralesluciae308@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771693138351 / 1000), TO_TIMESTAMP(1771693138351 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'cavazosale3586@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'cavazosale3586@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$jodaQhzPiR30hw==$pZnBBYPs0QlSxqWGU2mdtcn1mWv0fDF4A2S21sRQfTHNxWb8FL8P4tkS8jO00NbjA72pR1Ea8PysB3pdAVQeVg==', NOW(), TO_TIMESTAMP(1753751434891 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "ZjodlH2IEFTYq4BRsHW0z2YgkkL2"}',
      FALSE, TO_TIMESTAMP(1753696467714 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'cavazosale3586@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1753751434891 / 1000), TO_TIMESTAMP(1753696467714 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'alejandro777en@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'alejandro777en@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$ldUFz66uApZzjA==$Vq9w/Yi665f89Q0vpUx15slJ/d93DtPh2mpAigFu7oAItpLSEJq5xxAx2b2hQlOXCffZcdIYFWb9MZ0bjxR22A==', NOW(), TO_TIMESTAMP(1762627391166 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "ZqeYppqwzhNd5itvewfvoVDjl3o1"}',
      FALSE, TO_TIMESTAMP(1762627391166 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'alejandro777en@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1762627391166 / 1000), TO_TIMESTAMP(1762627391166 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'almaluzu@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'almaluzu@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$X7K2/SkwtVpUrw==$lP3kP8btbNxmOUlkXHhGK6qYlr03RP/nSbA0fZNscN4EhoXFIB3Yu611JIyitUPH+wwnl9Ptl3W3yP1gksZEYQ==', NOW(), TO_TIMESTAMP(1771331078168 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "Zqi9m6WJn6dan1K6bKxJcBY8bJh1"}',
      FALSE, TO_TIMESTAMP(1771331078168 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'almaluzu@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771331078168 / 1000), TO_TIMESTAMP(1771331078168 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'santiagoarizmendi83@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'santiagoarizmendi83@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$lYVKuV54zTn7UA==$VUAQtWZp7eOt/HAbv0Zigc1eyUYNffbOR0WkJ1WS0783gG1EENi1HNLCYDOd8qgytt1qI5Do1VJ1nCw47sjdBQ==', NOW(), TO_TIMESTAMP(1773490996040 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "ZrLzGCcCcMeztwYW6j0mOfDPP3v1"}',
      FALSE, TO_TIMESTAMP(1773490996040 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'santiagoarizmendi83@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1773490996040 / 1000), TO_TIMESTAMP(1773490996040 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'checo1237@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'checo1237@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$4Ipdy44foTu+SQ==$TxqGZbOZ/EsavZou9aV8SMeK0cWyGPNWzS4had8gqZmeHi9pzm8oin1TKgFQN6sqY4CmvNk3Mvih8LyJlf/eGg==', NOW(), TO_TIMESTAMP(1774363562003 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "Zrc6aRPgKyQxjI1DUmHqjotSbsa2"}',
      FALSE, TO_TIMESTAMP(1774363562003 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'checo1237@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1774363562003 / 1000), TO_TIMESTAMP(1774363562003 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'grecas4@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'grecas4@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$cdpWj+++cLTXKQ==$DkmF3KQhMKwGbCNb023q6Ig7B58kpJsknP7iTJ/GNuSF/DvVb7H+rx6McXHoJhwECLE3cU7f9bAh35pWuyvL/w==', NOW(), TO_TIMESTAMP(1771308487381 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "ZuBuUw8KYnM53UuzRCS1YHLVamG2"}',
      FALSE, TO_TIMESTAMP(1771308487381 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'grecas4@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771308487381 / 1000), TO_TIMESTAMP(1771308487381 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'fabian_tovilla@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'fabian_tovilla@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$3WrJ93P8S5ukig==$kswSnd4Hq+uRH2mdfnB+7OcUyx01DgaW7ve8Im95gLGV3K5nSKxk1A+BPGgjDzKVDVkAzW62Xoa2ni4yRsubaw==', NOW(), TO_TIMESTAMP(1774667870008 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "ZvqoJHXFgqOG5nRj9d6uQIcGiB03"}',
      FALSE, TO_TIMESTAMP(1762366445115 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'fabian_tovilla@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1774667870008 / 1000), TO_TIMESTAMP(1762366445115 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'erjimvz@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'erjimvz@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$OIV4vwhRXCrChA==$OWBqbhiwoVXjS/jQQgpp+4qaywTDZ45DoWx7fPdFtbeoN3N3EtYkQot17z1FEBccB1kT9AJANeuQIhYH57hLZA==', NOW(), TO_TIMESTAMP(1773803272592 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "ZwyOvfffqvZ1UqKxvOX86J74P2S2"}',
      FALSE, TO_TIMESTAMP(1773803272592 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'erjimvz@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1773803272592 / 1000), TO_TIMESTAMP(1773803272592 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'ferch_151@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'ferch_151@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$g8XfYhticVyIPA==$26S47vLfLcDHh3tOFNQnRLUjV2QnLbGnEs6OkPmxXeGrELdh0O59EFqGdhW62Otzp8sbD8sgeYrAN9VWYEPzxg==', NOW(), TO_TIMESTAMP(1774388915845 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "ZypYoqXo3YXnaJ2qujc4zuybPAD3"}',
      FALSE, TO_TIMESTAMP(1774388915845 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'ferch_151@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1774388915845 / 1000), TO_TIMESTAMP(1774388915845 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'cvelascogarfias@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'cvelascogarfias@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$trdkfarKOuHX0A==$oifwWpI4b/O0mXgiAeZG8nIobIDDO9v+/P98cGhQTGYSOxUCh3tSULf8BxKgsPVblR7n82bXbZdWAzmmAnVG5Q==', NOW(), TO_TIMESTAMP(1771369801948 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "Zzgo5zVILvQee6xbWpDWjz64W6h2"}',
      FALSE, TO_TIMESTAMP(1771369801948 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'cvelascogarfias@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771369801948 / 1000), TO_TIMESTAMP(1771369801948 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'rayoarmandopinachoruiz@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'rayoarmandopinachoruiz@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$V4BeDcYRw6zpwA==$xtFqJe4iGAKd639m1syBCdWJAUCod3cOXTAyhtrkmDOq7vUYA7gb6MENqeGFU7jxALJBCez6hxeunlLR4r8mqA==', NOW(), TO_TIMESTAMP(1774041969692 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "a0c7SzDAfoQn1TZAUcsKXu6QldK2"}',
      FALSE, TO_TIMESTAMP(1774041969692 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'rayoarmandopinachoruiz@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1774041969692 / 1000), TO_TIMESTAMP(1774041969692 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'alejandrolopezflores98@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'alejandrolopezflores98@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$G7r4lqQ/Ru5UKw==$MebRHrlwK1b5pbb+h1jByN5LBo0GGulDm0BX6ZsEUX8mxkdQ/NZlwg+5c8sFEXu06DBoF//7w2yWF1yQG2YD/g==', NOW(), TO_TIMESTAMP(1771390299636 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "a1EzZqaFPIfVuSAg02wbEUia22o1"}',
      FALSE, TO_TIMESTAMP(1771390175324 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'alejandrolopezflores98@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771390299636 / 1000), TO_TIMESTAMP(1771390175324 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'cg3676343@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'cg3676343@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$pHAL8lmtB8AgKA==$Ux1cZWsjqlWdP9QL5yul7MIiMnfuUqTBzlrlopjYs1ilPCOVOnrToCr/9OcE4+ZyGDKhuToXBak2yI3x0KY0iQ==', NOW(), TO_TIMESTAMP(1776915927169 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "a3cjuZsAb9PzL7kjWunCaXhRSZB2"}',
      FALSE, TO_TIMESTAMP(1776915927169 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'cg3676343@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776915927169 / 1000), TO_TIMESTAMP(1776915927169 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'eleacindejesusguzmanramos@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'eleacindejesusguzmanramos@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$235mTiC0BLsvkA==$XVHZ5yPymbsp/BhZoOk/f24GWvuG8u4rSFRSykThIl5ikxepQFDmMrrZzm82TvDgbBgjE+42PYRT6c5hymkSfw==', NOW(), TO_TIMESTAMP(1774060479979 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "a4JK2oA95TPDjoWXQdyAkXFR5tE3"}',
      FALSE, TO_TIMESTAMP(1771281998282 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'eleacindejesusguzmanramos@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1774060479979 / 1000), TO_TIMESTAMP(1771281998282 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'misaelalfonzo55@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'misaelalfonzo55@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$/PQQCWx1vC9Plw==$yigbSNEeS7+UlLXQCwNN7atvMAn2HT1UUOETYy6/BeG5p4770WNX0YVITucHyfX0Dj8TLeD7ppb1rSg9Bf/DFQ==', NOW(), TO_TIMESTAMP(1771277413389 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "aDAoRUdfKLXKLyMMVbsHTLblY9n2"}',
      FALSE, TO_TIMESTAMP(1771277413389 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'misaelalfonzo55@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771277413389 / 1000), TO_TIMESTAMP(1771277413389 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'nnbarragan1@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'nnbarragan1@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$0AniDULhyvTUwQ==$1utMIZ4wgqzzicUf2hgT/hrhHYNQCeTO4/O88QEOdV+Ao//FIpD0pgcWtxPAoVD6cXsFmSrdHxEQsaprCjeWwA==', NOW(), TO_TIMESTAMP(1770737707593 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "aJkFnR98oKYs6sASSe83F1YdHWo1"}',
      FALSE, TO_TIMESTAMP(1770737707593 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'nnbarragan1@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1770737707593 / 1000), TO_TIMESTAMP(1770737707593 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'wwjd512@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'wwjd512@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$iw7/D5CY3xm5aA==$wicKGdUe+f1dIxaEd57KojSr13XUtOhhVoMHODpg0eNAoODdxoA4sgiBio8KvKDGxlC/4ixczxb92pAE4b5HNw==', NOW(), TO_TIMESTAMP(1773739855692 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "aKVxwA6kjNPVlzbuHGYhgDa2Zgp1"}',
      FALSE, TO_TIMESTAMP(1773739855692 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'wwjd512@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1773739855692 / 1000), TO_TIMESTAMP(1773739855692 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'witchsweet2@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'witchsweet2@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$q5IbBvgUH9S10w==$C1uXKh72R8gdWpqN4HxtAib80nufBi2VeLsu8LmKbVGdby0umry62jHk7epW0MRHtrprlQds/6KS+VWjGrH/WQ==', NOW(), TO_TIMESTAMP(1771452514415 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "aRTJWq8XQFdmTt2XGNsFbWkttHv1"}',
      FALSE, TO_TIMESTAMP(1771452514415 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'witchsweet2@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771452514415 / 1000), TO_TIMESTAMP(1771452514415 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'castillo.cfg2003@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'castillo.cfg2003@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$jTktkk6T3nEuVQ==$QjS9AcsARcUUVO/lq+3jH64lr5eLx79aKgvgpmHRCg3u1DQ/tEn2gcw7QMV4mm8mgItXtFX+rI9d8W8Y0ZesEA==', NOW(), TO_TIMESTAMP(1776285637553 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "aSCpXWOQGCSdxdOCNvyRMwu6HkI2"}',
      FALSE, TO_TIMESTAMP(1776285637553 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'castillo.cfg2003@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776285637553 / 1000), TO_TIMESTAMP(1776285637553 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'ghhh@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'ghhh@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$VnPPzOQFVOjgDw==$SapxU/gF4zu003emfXkSXqIE6iYslE8zIRm62Om7UPd6Q/G2JiQEqRfmzwtG4nA1rDbaQZ7Pk5F/fBP+cZ58DQ==', NOW(), TO_TIMESTAMP(1775779985799 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "aWVBAvNkQSTo0PNx5c9PongROLn2"}',
      FALSE, TO_TIMESTAMP(1775779985799 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'ghhh@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1775779985799 / 1000), TO_TIMESTAMP(1775779985799 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'josesantiz4034@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'josesantiz4034@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$4SRi/gmDRpCfKw==$sbuoJuTlQrNk7UzZlBSGwFSSPkZmY+ajP1cixMCIlXQGzu5H/wRh+TUJTO8OH83FLWonTLKbh6Y7GnJEIYk5ZA==', NOW(), TO_TIMESTAMP(1776238429929 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "aWYcH5XQc9PzOK7UaBqHzO0DIt82"}',
      FALSE, TO_TIMESTAMP(1776238429929 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'josesantiz4034@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776238429929 / 1000), TO_TIMESTAMP(1776238429929 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'idania.manso.pediatra@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'idania.manso.pediatra@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$TCgFm0xz/gWTDA==$/BzS0Dv6QQOF7OrtkhMor194C1iVVJqqsNNME5M+zMnXtG3XGHJvMp0LqGVqyBZL2KV2wfoG1+dUnWFCPmb0qQ==', NOW(), TO_TIMESTAMP(1774600398049 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "aYEAwEigcyM9ubC7PkYjfOV1jp62"}',
      FALSE, TO_TIMESTAMP(1774600398049 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'idania.manso.pediatra@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1774600398049 / 1000), TO_TIMESTAMP(1774600398049 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'brandon36928@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'brandon36928@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$1wu8rdxvN2L5ZA==$iQdD/6AspSnp9pLCq5pYP8O2QOCOv0xEAbCupeLRob/ImfIudeyvftQQTgWlHTLb8OwzeetXkMzpn3wJh6YfQQ==', NOW(), TO_TIMESTAMP(1771771033675 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "adA2S1PDdcZ6ov2ITt8hyrsB4tX2"}',
      FALSE, TO_TIMESTAMP(1771771033675 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'brandon36928@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771771033675 / 1000), TO_TIMESTAMP(1771771033675 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'ktoo93@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'ktoo93@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$17vBAXNx/J4HSg==$SJ7u895AeDet6EKELYH0DOnEF21S8ISlLJSw9EvnUnoNRQraYO+GMJSMszpY736xMcZDsUb2fYeHqFKrAu2nwg==', NOW(), TO_TIMESTAMP(1771551803071 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "ahVNGB7i4feRjNryKRUoh83LX9I3"}',
      FALSE, TO_TIMESTAMP(1771551803071 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'ktoo93@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771551803071 / 1000), TO_TIMESTAMP(1771551803071 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'eneidaelizabeth@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'eneidaelizabeth@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$1OvmWmekTOQiBQ==$kYMMLOTXanG5qY4Xns2oPM+OEghhtUJrN86OqCwlNEYy+qYXaCu4ojelqvDo381RGTKPEpx+Lqi4Cfy2EfQcrg==', NOW(), TO_TIMESTAMP(1771365610366 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "ap1i7Wzse0cJtrPtgRbfj1eFydw1"}',
      FALSE, TO_TIMESTAMP(1771365610366 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'eneidaelizabeth@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771365610366 / 1000), TO_TIMESTAMP(1771365610366 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'bodegaaunrera@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'bodegaaunrera@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$/xi4SJXl+yCO7Q==$8T2ZMq0QnF5+5TRic/fuInTK8K9yZ8VPw3ky9NgvJ0UCE/mjS3cQVqei2YoKrkhx/5zz0rED2uLqv6DAEpivdA==', NOW(), TO_TIMESTAMP(1764392932369 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "apTvOODH03ay5GmgfWnyXdbrm5J2"}',
      FALSE, TO_TIMESTAMP(1764392932369 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'bodegaaunrera@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1764392932369 / 1000), TO_TIMESTAMP(1764392932369 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'fnarvaez506@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'fnarvaez506@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$inLYDj5WljxPXg==$bzDqSAfKEZW2f7yFB72mCKThmLxYM4nEYUs+5dXKHpIS7yMftq7r5fKR1r+ll7AHNfX8iynMji/yIKpyULzzig==', NOW(), TO_TIMESTAMP(1772394848451 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "apoiLKwdIhRLUYUR6Ffxc7joAZA3"}',
      FALSE, TO_TIMESTAMP(1772394848451 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'fnarvaez506@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772394848451 / 1000), TO_TIMESTAMP(1772394848451 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'gp1879598@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'gp1879598@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$1f4UmjEgBr/+Yw==$NjKXksEKf2PHcCWUVqU7JK60QfLcnJL35ZteIp+vQNLYpClfdPKpOsuLAOkg8zosba7Cw4MXsUVf8euBP6729w==', NOW(), TO_TIMESTAMP(1751478789386 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "arCfO4GlnefExsnhHZsMlAu4GWr1"}',
      FALSE, TO_TIMESTAMP(1751425574309 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'gp1879598@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1751478789386 / 1000), TO_TIMESTAMP(1751425574309 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'rikardo.tek80@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'rikardo.tek80@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$M57jnaaxduxSPQ==$DVBvFbbTTboQ/F/BsZ1NHemf3oCvhb9khvPi+kxDdjCRueNuo1rpeYoc01ZWfucEcgP1LusbwqQ8UqB/MHSGCg==', NOW(), TO_TIMESTAMP(1776224046573 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "at6qsw7NXdNHvWg9xyJ2lg9cQb22"}',
      FALSE, TO_TIMESTAMP(1776224046573 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'rikardo.tek80@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776224046573 / 1000), TO_TIMESTAMP(1776224046573 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'estrellalozano0903@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'estrellalozano0903@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$htRsuMV270R7jg==$CALZdFpTKoqDryHUCZvwns+/XEDHhwKUQM0zB6RJ76sT1SyfbZ4HBdPtcpuBTg2TzDQoXfTC6DvN1+QRtCn4gA==', NOW(), TO_TIMESTAMP(1777713084928 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "au9sYiNmYQZiVLYBRn3q2WhGiYy2"}',
      FALSE, TO_TIMESTAMP(1777713084928 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'estrellalozano0903@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1777713084928 / 1000), TO_TIMESTAMP(1777713084928 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'dan.vipper@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'dan.vipper@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$N8wZEGvGxLShvQ==$2vY8LbRnR0icC0XDuL4Vzs6b7NJNjcyYeCbTbYoc+h65dacE/8BB1dtXQtWS7rmS+NxVddopkurAqlQW1P3H6A==', NOW(), TO_TIMESTAMP(1771284790733 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "awfSYfolSmXJ8574BZamVXl87yI3"}',
      FALSE, TO_TIMESTAMP(1771284790733 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'dan.vipper@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771284790733 / 1000), TO_TIMESTAMP(1771284790733 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'maldonadojared29@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'maldonadojared29@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$1hWosc9T8hZJag==$Y+9XPXyzz5/Qm4UXPCtyueVEYrzCI49d9XO+jlimeH3fi+rwVSgv9+dc/B7jpHnJMUuBmmXf/WoBM9OkLwuhIg==', NOW(), TO_TIMESTAMP(1761311636211 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "b3u24om3ZYaFF89wTHlcVOMQRFu1"}',
      FALSE, TO_TIMESTAMP(1761311208811 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'maldonadojared29@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1761311636211 / 1000), TO_TIMESTAMP(1761311208811 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'asbelgtz2354@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'asbelgtz2354@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$YJe0/BEAeW2VgQ==$AzUPpo0F21GkG02TMPBOcGygYJxfqeEMyuhfm+cE53pVu6CyVDeiwd65wZFGm1Hg6yy5pEYTwgjsWShNgQtCOQ==', NOW(), TO_TIMESTAMP(1776230255266 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "b40M9C27QSZBvW3mcXdIbZr8TY42"}',
      FALSE, TO_TIMESTAMP(1776230255266 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'asbelgtz2354@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776230255266 / 1000), TO_TIMESTAMP(1776230255266 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'silviaoseguera25@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'silviaoseguera25@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$+6RXBnFqSm6QYQ==$0iT57KJM8KoK7wu8WKzorsEPVWlIoyAqLATyjmLJbZK1Df7GDXD3QaBI0kHce4Bp91CMJP2VDoNyP6Ja6+MY2g==', NOW(), TO_TIMESTAMP(1778789671342 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "b8Jr6BG3STZ1VSUco79rsFU6MBi2"}',
      FALSE, TO_TIMESTAMP(1778783350647 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'silviaoseguera25@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1778789671342 / 1000), TO_TIMESTAMP(1778783350647 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'gomezkimy54@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'gomezkimy54@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$fRYJKf1ym6EV/g==$+eFck7eq0mEhwpvKwMhjy+R723XhxDgwjg/EDjRntjdxRQrnr3h8trdcqum/ks9rlRl9NmV5tlxxy2PUB4yzLQ==', NOW(), TO_TIMESTAMP(1775836639064 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "b96qNa2G3ubNnaUSjbpdXd4vPly1"}',
      FALSE, TO_TIMESTAMP(1775836639064 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'gomezkimy54@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1775836639064 / 1000), TO_TIMESTAMP(1775836639064 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'alviga793@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'alviga793@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$fnd76X26IfN0KQ==$nUyhDkjy6M2IFPCu0MMgg1PJNIf919oXVBk87wl47j7IT6TnTqdZDiLX4ji8aRp0Ns0ycjJPi0L/Mca+zcpysA==', NOW(), TO_TIMESTAMP(1776256356688 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "bCqwpYd2oNZ9e55WMXvZnmqUKVk1"}',
      FALSE, TO_TIMESTAMP(1776256356688 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'alviga793@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776256356688 / 1000), TO_TIMESTAMP(1776256356688 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'armand_8mx@yahoo.com.mx') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'armand_8mx@yahoo.com.mx', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$Mg4+f8BxSZ9LSA==$5ag7ml02GkgOuDSb406Ljf7Y64P/DEM8U5zL+mPP//HOIiThuIsDNirdznmufgvfV4yNuGlQ4alamjoIsfd13w==', NOW(), TO_TIMESTAMP(1775171338265 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "bIfZskYrefXpqaVBAHwSgvRjmIk1"}',
      FALSE, TO_TIMESTAMP(1775171338265 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'armand_8mx@yahoo.com.mx')::jsonb,
      'email', TO_TIMESTAMP(1775171338265 / 1000), TO_TIMESTAMP(1775171338265 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'alvaradobarriosjosealberto5d@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'alvaradobarriosjosealberto5d@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$hC/aJrrAVH6Mpg==$RBcwGjXUU2Lc2c7SEnDmi5jkyQLBVWtkQgjO4CWgMPISzusIzF/OuIJTHU2w+xt+vkdzSsXvoDTC1AYbOf7e5w==', NOW(), TO_TIMESTAMP(1771287465935 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "bNomXp0zdUSPfOqQN0ElBQ11wx33"}',
      FALSE, TO_TIMESTAMP(1771287465935 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'alvaradobarriosjosealberto5d@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771287465935 / 1000), TO_TIMESTAMP(1771287465935 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'olgui1484@gmai.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'olgui1484@gmai.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$6YIvylwpba5IaQ==$i0q7UieYAsWk7azaLe6nktxp9Fz//5Pr4bq+aDGFqzeQqx74WGwF5pB9ZKgS6WlBQT6NM+LMbLbUiC/hRneEnA==', NOW(), TO_TIMESTAMP(1771397787029 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "bOMob1fHryS1Tf75v0XAXW98ORO2"}',
      FALSE, TO_TIMESTAMP(1771397787029 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'olgui1484@gmai.com')::jsonb,
      'email', TO_TIMESTAMP(1771397787029 / 1000), TO_TIMESTAMP(1771397787029 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'jesusbr786@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'jesusbr786@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$MlQkv868ZNAICA==$0poShPv8awFvPO3Up7lunOCcgcbBobzL670XbPzQBq5LdaBCNWsfGsmcXftBRCR2kQGNzfu91opvbfye+4SY4Q==', NOW(), TO_TIMESTAMP(1751468312334 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "bS9n1TnQXLRWsjisGejpCOKQX3l1"}',
      FALSE, TO_TIMESTAMP(1751468312334 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'jesusbr786@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1751468312334 / 1000), TO_TIMESTAMP(1751468312334 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'carlosaguilarcordero@outlook.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'carlosaguilarcordero@outlook.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$1oENoLpqZKDoLQ==$CBA64hF7CfitFKnZbQHh9bNtufli0BIMVAYW07ctVuJ6s+owhZGQ0UGXGGeuJSNu40M0Yorp1B/togpooMAUhA==', NOW(), TO_TIMESTAMP(1771282539010 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "bSpYkOfaYhMpxVRPikrDcTLe85A3"}',
      FALSE, TO_TIMESTAMP(1771282539010 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'carlosaguilarcordero@outlook.com')::jsonb,
      'email', TO_TIMESTAMP(1771282539010 / 1000), TO_TIMESTAMP(1771282539010 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'solucionymantenimiento339@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'solucionymantenimiento339@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$nBw+RbDAlbsuhA==$l+0HCNWr9aGXxbIQhCaGjuXwxOts4t3NWZz8ZAJPr69mVw+SZdyyOeNqbZveCK1O7GxkcPzCd0VMc4tnKozDHw==', NOW(), TO_TIMESTAMP(1776401727641 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "bYKbe8VadvP8BU5tyaBAZHpOozq2"}',
      FALSE, TO_TIMESTAMP(1776401727641 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'solucionymantenimiento339@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776401727641 / 1000), TO_TIMESTAMP(1776401727641 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'sva88@outlook.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'sva88@outlook.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$h4Hp7SceP6040w==$Kkv5xSTY0JUCTxO8Q/zzoxrHCh2iHQUeJ87jGwlgUyLBjIDbNjqFAXhxkLIhU4xGqqOX9GppQnwh5YrD1CSugg==', NOW(), TO_TIMESTAMP(1751492419950 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "bYRijsdDFsUhGgi6lHJIJ8WLfuu2"}',
      FALSE, TO_TIMESTAMP(1751492419950 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'sva88@outlook.com')::jsonb,
      'email', TO_TIMESTAMP(1751492419950 / 1000), TO_TIMESTAMP(1751492419950 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'hevazguz_sol@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'hevazguz_sol@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$eLTPADPD10HBww==$L/9GLSeXLdb+CsRVvMFZBw2Z+cbjhHMe19hzPLu23cZ8h/15yuOKtTQin46bnUguWJsbQ0uV7lz0OekErY04Ig==', NOW(), TO_TIMESTAMP(1763232034012 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "bYqkuEJ73vYo5qVtAB4E04SZRrD2"}',
      FALSE, TO_TIMESTAMP(1763232034012 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'hevazguz_sol@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1763232034012 / 1000), TO_TIMESTAMP(1763232034012 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'gelyrodriguezcastillo@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'gelyrodriguezcastillo@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$ENgf0H99Eq7Qzw==$Gp8rKju9zJgF1sRJOjjHuNrTafLUrptte96WlGzYELTH6FI/WnwfbBHsLp6b0b86hpAsSdXDf0Teno+ThifhKg==', NOW(), TO_TIMESTAMP(1774979038872 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "baEzTHtQtGPATH2zZutghuTU4Z03"}',
      FALSE, TO_TIMESTAMP(1774979038872 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'gelyrodriguezcastillo@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1774979038872 / 1000), TO_TIMESTAMP(1774979038872 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'merry_rouss7@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'merry_rouss7@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$187+6f2xlJ99uA==$B8unSfBOSnafINOO9qHZ571WAJb625eT+AXhsqNEepAHDeeb0qA1p+KV0BGIZvUK3yBs0vHV9iC3IUMIuyUV9Q==', NOW(), TO_TIMESTAMP(1771685452678 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "bdaPaV7P3QSvGWLH40t8SIc1Ny82"}',
      FALSE, TO_TIMESTAMP(1771685452678 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'merry_rouss7@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771685452678 / 1000), TO_TIMESTAMP(1771685452678 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'mirgos1985@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'mirgos1985@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$Jdeq2P0FglkCeA==$S4lLmJHSY0IahA2FFpt+HD+JzZsGaBEhYjE4VHyMotxSt8ZHHzN+jAMQIkHky1NAJXN9VhTSd7+ogdx6fdKwZw==', NOW(), TO_TIMESTAMP(1771286599473 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "besi4VJzV0e80grQoakTsUkYeUh1"}',
      FALSE, TO_TIMESTAMP(1771286599473 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'mirgos1985@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771286599473 / 1000), TO_TIMESTAMP(1771286599473 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'prueba-u1@prueba.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'prueba-u1@prueba.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$w2LKlPylL658nA==$SPpljLmFptRYGWgGQCdsAlMocuSeMoHGIZ/V/A882hbBHCda30u7krDDEbR/NhX7sbYYE517kfPtvxOjqbzNhQ==', NOW(), TO_TIMESTAMP(1747737260964 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "bogFDjuBDzf7ad9ghrtbweJjVvx1"}',
      FALSE, TO_TIMESTAMP(1743394993886 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'prueba-u1@prueba.com')::jsonb,
      'email', TO_TIMESTAMP(1747737260964 / 1000), TO_TIMESTAMP(1743394993886 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'djpacocastro@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'djpacocastro@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$ilOsa1/BhWMNog==$yiFT0pkPyJ5w9lTOg92pepzehV+u6ccwU2toyEzqEC9cwgBvUFY0L62tmeD+iYRKZpoikv8kHIu/xHfJtiISaQ==', NOW(), TO_TIMESTAMP(1771692661885 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "bqUfP7Pf0kWPI3KPjps8yd44ei02"}',
      FALSE, TO_TIMESTAMP(1771692661885 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'djpacocastro@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771692661885 / 1000), TO_TIMESTAMP(1771692661885 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'jordanelsucrak@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'jordanelsucrak@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$h0jljJIUzw8yAA==$0r0f2OINo4ePOvlNirvNPK9P5yH5we3KA0WZEhelDf6Eg2ImRswgJDC7P21LMql37pAW5fSBEbsBWOYI2Mu2Ng==', NOW(), TO_TIMESTAMP(1775580992711 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "btgwh2o2QVSPPJhfu9ExY2W9xh72"}',
      FALSE, TO_TIMESTAMP(1775580992711 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'jordanelsucrak@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1775580992711 / 1000), TO_TIMESTAMP(1775580992711 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'wencesviky@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'wencesviky@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$HOBFba29z6HLaQ==$J3UQ9kwozMy+A3BtTdka5vAZI1I5TOPPtWBBTl14ki2AbN71xQJf4uwXstmFaFJpIzCDeIT5BB9eK+r+VzkD3Q==', NOW(), TO_TIMESTAMP(1771285918326 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "bwUjjoWsdyMaLwiuXfnGpSKPIXC2"}',
      FALSE, TO_TIMESTAMP(1771285918326 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'wencesviky@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771285918326 / 1000), TO_TIMESTAMP(1771285918326 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'uvitasalvaje92@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'uvitasalvaje92@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$38Agmprh2jVVcw==$+EJALJJty20mt3V+K8/w6QGEa9dO7b8MYgbMzl1QOcGvLO0ouxihAaOJxX6KOTDIkqoroeXsN1BZnGPO+DYpWg==', NOW(), TO_TIMESTAMP(1773726445609 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "byGjBKYxS5YAnOQCHC6PHXKY1yJ3"}',
      FALSE, TO_TIMESTAMP(1773726445609 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'uvitasalvaje92@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1773726445609 / 1000), TO_TIMESTAMP(1773726445609 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'coleto71@live.ar.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'coleto71@live.ar.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$bxOfqMiQVYNCgw==$4YWJXEHE+gDy9TjqYu5DFxzR0WUPPgAt3LDAkIGoHO8oNUBZ1TOWpL2UIQZHorbP7hwCHiO82E0LgUcXpbXCdA==', NOW(), TO_TIMESTAMP(1776217264727 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "c41b6eZfKBUCZDrckS9LeIXfNIh1"}',
      FALSE, TO_TIMESTAMP(1776217264727 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'coleto71@live.ar.com')::jsonb,
      'email', TO_TIMESTAMP(1776217264727 / 1000), TO_TIMESTAMP(1776217264727 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'franciscoasantoa65@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'franciscoasantoa65@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$n1/uJEhFFLQq5A==$Yn1jYnlnEHIfxShvT+r18ABcCHzKYJLNi1xNl2oQJdSmcU9Ewnf95orXsvtHrt7LXc7oN51Cceb+JTfsKtRXzw==', NOW(), TO_TIMESTAMP(1776219206658 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "c6DUVZn2jLSRChvqynRuhT3q3ej1"}',
      FALSE, TO_TIMESTAMP(1776219206658 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'franciscoasantoa65@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776219206658 / 1000), TO_TIMESTAMP(1776219206658 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'spoock._1234@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'spoock._1234@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$j9MgBQydm3eE9w==$iTuv/EG2k05As3gZRzFmjtm4m9rQpwZUhLp3I0YVPeV/606oCLx5fjWIVyP8LAlDi6OMbw6v9c/5ZfUoH/4nJw==', NOW(), TO_TIMESTAMP(1776224708485 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "cAx1GIeh05RniZ4pBXkTPdk8OmO2"}',
      FALSE, TO_TIMESTAMP(1776224708485 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'spoock._1234@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776224708485 / 1000), TO_TIMESTAMP(1776224708485 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'tania8059@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'tania8059@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$vIVWu7yRUZZ6zA==$lqLT/Q1VknfbT5qjYli4D0vDCdNnrqMz7UvOdzX+U7ciVCWsaYSnbTK7AwC1Kg/7gKCp/sdW0nw0ridH3z2Xdg==', NOW(), TO_TIMESTAMP(1771283742715 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "cGqoHwq6k2UkeLwjgDo8xU6VCOr1"}',
      FALSE, TO_TIMESTAMP(1771283742715 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'tania8059@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771283742715 / 1000), TO_TIMESTAMP(1771283742715 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'julietauxiliar@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'julietauxiliar@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$PrYVVfPRzU379w==$vUnWltHkG1iLXbOynuY0thwC2f5aNoUnGPkiPneV5I9LP70k/hDytVTRBAJikWQWH0UIOw41nmb0+NGqH8miXg==', NOW(), TO_TIMESTAMP(1766371143720 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "cKlHkHeOHGPhyyg5iegzuguFiBu2"}',
      FALSE, TO_TIMESTAMP(1766371143720 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'julietauxiliar@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1766371143720 / 1000), TO_TIMESTAMP(1766371143720 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'yomix2010@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'yomix2010@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$1NU8+NZ25OIksA==$WjfXpjp2IAJc4L/KnGF9zvJanFbbMmLYMFIa+Jiaso3i2YbUATJA0t/KVBWbtN652Lv+DTsbu/YsHWnHRpIp6w==', NOW(), TO_TIMESTAMP(1771277931251 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "cRmELlTLyYbk76eTyQMp9QLO3Rj1"}',
      FALSE, TO_TIMESTAMP(1771277931251 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'yomix2010@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771277931251 / 1000), TO_TIMESTAMP(1771277931251 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'miriamtrujillo188@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'miriamtrujillo188@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$rIzAeftS5qq8mQ==$szJ/t+ScRAmNyhsV+kC4UItggw/HYnX8SQ8OFR5KGAtTf5TnulgyfG4yLiKdyQKS8t5iDFBvRSp4bGjRHkGAEQ==', NOW(), TO_TIMESTAMP(1776322992067 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "cUvoQi2ZUrZtPv1pOLK8xqmhDIE3"}',
      FALSE, TO_TIMESTAMP(1776322605901 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'miriamtrujillo188@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776322992067 / 1000), TO_TIMESTAMP(1776322605901 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'gomezsantiz515@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'gomezsantiz515@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$m5z1Mng1c1pkVw==$U8bqohdn3hZjxUdHOSuMhQ9Gz9/UDM9PGDBNVIkAsJ+3zoninYhjC1oJtY8kL6TmTyCyHWT4RnjrptMjcewBOA==', NOW(), TO_TIMESTAMP(1776227472756 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "cZhlDP7rBmMbv6hAWfZOpNrO8Gc2"}',
      FALSE, TO_TIMESTAMP(1776227472756 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'gomezsantiz515@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776227472756 / 1000), TO_TIMESTAMP(1776227472756 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'thiagotatis6@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'thiagotatis6@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$G3ISX92MdTAdag==$R/HB1IzNABgdtQG5PXWUoKhi5onmKy01aeZSkX+lirVDAmXNnYdeFzAjT9498iVEfpcnhzOIr3fq8FnkXNz8GA==', NOW(), TO_TIMESTAMP(1772611964089 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "cZotup9Aa0ebZsS55GjEyPRNQIy2"}',
      FALSE, TO_TIMESTAMP(1772611964089 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'thiagotatis6@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772611964089 / 1000), TO_TIMESTAMP(1772611964089 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'lopezlopezmau23@gmail.coml') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'lopezlopezmau23@gmail.coml', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$285oVcTyg0W8Yg==$o5DB+v/xdLJ+4b7SzalC4poVzSjC0Rh+Pe2m6JND2FlJUJwWieRexCt6aBxUhhMV+A/tANkfkLftyBmzio+m0g==', NOW(), TO_TIMESTAMP(1771290987850 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "cdK5ZoHSxue1sOjrevDMnuEtNmi2"}',
      FALSE, TO_TIMESTAMP(1771290987850 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'lopezlopezmau23@gmail.coml')::jsonb,
      'email', TO_TIMESTAMP(1771290987850 / 1000), TO_TIMESTAMP(1771290987850 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'vicsantiz420@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'vicsantiz420@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$Ldg4d/Auc8piug==$EIc6Hm/9j2fhxvIykFvRhIHVEZlQ8ffPnd/Z/gmvdTJse4MFdKyTN9fN/ZlUBgnwQ9ssbqz11CsMzimWPBm1kw==', NOW(), TO_TIMESTAMP(1776596008287 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "cdPWYUID5sMs78Zbt5JEirR78xF3"}',
      FALSE, TO_TIMESTAMP(1776596008287 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'vicsantiz420@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776596008287 / 1000), TO_TIMESTAMP(1776596008287 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'yosoyeredy@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'yosoyeredy@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$ChyliK5Cvftguw==$FrDZ0Onz8+ObMzK6VJiMcVBqar/wgbyYvG9lw1d2JiWddZibAmwgqcecSxvrzn31TsNVxBJ477LhGxPvxRSOPQ==', NOW(), TO_TIMESTAMP(1774586202656 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "cj1wbLb8xrSHHxUvJHHo9ktzxqJ2"}',
      FALSE, TO_TIMESTAMP(1774586202656 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'yosoyeredy@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1774586202656 / 1000), TO_TIMESTAMP(1774586202656 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'josefonte1964@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'josefonte1964@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$aaBFKqErOF+VUA==$JfnnjHChG2iY15tFcb301P+oEQvllSutDWeaa9etjNcZ0CIuveC00ln3Bu4QdHGAb0a6JXg74wzc4I3q+9uI1g==', NOW(), TO_TIMESTAMP(1771279318297 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "cjBZJrWaOtb8kg0NlY4yW6DcxyH3"}',
      FALSE, TO_TIMESTAMP(1771279318297 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'josefonte1964@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771279318297 / 1000), TO_TIMESTAMP(1771279318297 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'amorsauloctavio@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'amorsauloctavio@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$dVhnSt2wWqXVlw==$jNg5TokIsWPJzc2qB7Ess6ZGtbOIpu1RVR/0tZCF280RrwWdwbL69RaUXkcXacdrYLVMXd1hCTeFbTOpo5yFgg==', NOW(), TO_TIMESTAMP(1771639682650 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "cjCWGgNLrvRoJ9JF5vOsW6p3Poh1"}',
      FALSE, TO_TIMESTAMP(1771639402068 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'amorsauloctavio@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771639682650 / 1000), TO_TIMESTAMP(1771639402068 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'yennhyguadalupe@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'yennhyguadalupe@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$0h1ox4sUVd5JQQ==$lmXcAWVLjCV11ljt2F8bAyH6YhwPeJZsxrLaIhWtlpND5eyHAB0zty3HWkIqrf3KwWStYHAEtF/EEcd6NyrfPQ==', NOW(), TO_TIMESTAMP(1775014051654 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "comiFEeGcJfSBAH1dY7Zmicns442"}',
      FALSE, TO_TIMESTAMP(1775013587894 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'yennhyguadalupe@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1775014051654 / 1000), TO_TIMESTAMP(1775013587894 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'oficcecoorporativa@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'oficcecoorporativa@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$SArmhiaLsnT9ew==$JyQu5pM8TkUcfd3ooIvoDG+mSye7OdjRVz/DPUuTMfzYHtElAkGKHTDHaTOYPYi++x8+VPupx046QwxbuVImlQ==', NOW(), TO_TIMESTAMP(1752176230606 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "cptgNAs0pUfXJojM3mBw3xZsnHL2"}',
      FALSE, TO_TIMESTAMP(1752006843644 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'oficcecoorporativa@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1752176230606 / 1000), TO_TIMESTAMP(1752006843644 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'edreymoralesv@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'edreymoralesv@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$KNLe2Vkruh5npg==$wcs9I6E9Ty4lR4EXzX6xs8dqOv/q6oU9SgJnx4HL9h4wt3iL892dbKFsYssg7pnzVSA6bZdF2pohgktmtlfaug==', NOW(), TO_TIMESTAMP(1780286736565 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "csqQfFrxs7fBAbQxZoOKj2BZW3m2"}',
      FALSE, TO_TIMESTAMP(1780286528661 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'edreymoralesv@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1780286736565 / 1000), TO_TIMESTAMP(1780286528661 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'chepincito1@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'chepincito1@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$Y1b286fk/9c4cA==$3enQIXC9ZIMAgQLwoaYeulJjDfZoX7lY9IDA8BiCa0+t7fO3QrGL+WAYzsUsJHk+quOXR2X1rIYy7ed0S+OpXw==', NOW(), TO_TIMESTAMP(1775499374946 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "cu5Dr8vTayRPqw31zfIAlqphfAu2"}',
      FALSE, TO_TIMESTAMP(1775499374946 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'chepincito1@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1775499374946 / 1000), TO_TIMESTAMP(1775499374946 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'sabrosadeamor@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'sabrosadeamor@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$t7ePvE3CarHGyQ==$Gn/bjFY62LionCKoLHKkiJnaP6zgTvqh4zby6k6uAWDnwrkz5Tb65ahHg/IXWYkGT/69K2N8v4ebFKKBfeKyOQ==', NOW(), TO_TIMESTAMP(1753810095744 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "cuEgzFSm9XSPfTX9QDszT1Hd6w03"}',
      FALSE, TO_TIMESTAMP(1753468204068 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'sabrosadeamor@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1753810095744 / 1000), TO_TIMESTAMP(1753468204068 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'roxanamagalig@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'roxanamagalig@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$XDvNzIGkzjjdEA==$ZjUfCHIyAxkkmhkvEfqNp55ntvhadH2CkYfuK1LOLkNzcWLl9TW9kG8nxMmU1aEHOJ15mPDH+pfNFhIfHdM63A==', NOW(), TO_TIMESTAMP(1775536708599 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "cwCD9nwmBrVjGbqqc420Qnjzvp13"}',
      FALSE, TO_TIMESTAMP(1775536708599 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'roxanamagalig@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1775536708599 / 1000), TO_TIMESTAMP(1775536708599 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'isaaacaraujocalderon@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'isaaacaraujocalderon@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$cn47g3f/LMsojw==$F6Mc7ofSt4+tF3S5LHbetOjZPEy59DDJqO46SuGXMbpPDT0UekYS3V15Es6jjvpXZfe8qYs8n3eLvnOauKQfkQ==', NOW(), TO_TIMESTAMP(1771304858862 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "cxmDyceRFIYPpxbdhdprLCNsEAZ2"}',
      FALSE, TO_TIMESTAMP(1771304858862 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'isaaacaraujocalderon@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771304858862 / 1000), TO_TIMESTAMP(1771304858862 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'xabumo_2412@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'xabumo_2412@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$yi2bhsInZtFm5w==$iB+cxau8n/z0saj+eLKAS7AQKCtUaE6sutr69OwXXyymukqb9vScOmFQlrQb+c+cwxPvm4cEXhzto7zQxNR/Sw==', NOW(), TO_TIMESTAMP(1771277938802 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "d0G78Ez1pTgyR3YFtijvRvSVX0G3"}',
      FALSE, TO_TIMESTAMP(1771277938802 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'xabumo_2412@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771277938802 / 1000), TO_TIMESTAMP(1771277938802 / 1000), NOW()
    );
  END IF;
END $$;
COMMIT;
