-- Lote 4 de 4 (57 usuarios)
CREATE EXTENSION IF NOT EXISTS "pgcrypto";
BEGIN;

DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'fenixhalo2@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'fenixhalo2@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$GLMw7QlS6Be+QA==$kHp4RewittzvDsdjHD6lY+n8yKRf3sOasasrryNDiPJmNdZmTI2mpoiFUIiWBCpQCoQ9YKgKMdCANWjFkUlAzA==', NOW(), TO_TIMESTAMP(1776218589067 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "x8IwcnjoUkWHmnEEluAqQiIdseP2"}',
      FALSE, TO_TIMESTAMP(1776218589067 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'fenixhalo2@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776218589067 / 1000), TO_TIMESTAMP(1776218589067 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'jorgeflorescorzo@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'jorgeflorescorzo@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$teYzBUgk5rg8ww==$niZAOU7htNhlZKw07f9GxNC2D0/MtZ7eZxzpIw2eZtY9406Z8fih5ZvoNJ+pcLrpwCQP/gS3Gv5hKAV9IZhMjQ==', NOW(), TO_TIMESTAMP(1771463668954 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "x9cPbkdpxlSVMijigAggoaJUDkx1"}',
      FALSE, TO_TIMESTAMP(1771463668954 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'jorgeflorescorzo@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771463668954 / 1000), TO_TIMESTAMP(1771463668954 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'mexbeatrizdelcarmen@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'mexbeatrizdelcarmen@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$U+4JxFiOz/RiLQ==$S177XVkoCZNTNO31biBHlZclZ7Vq5+GSRjG34FR0iComO+WFcYASXEHpdG/7rD9I13x2hEkoZndaZjZnqtLJNg==', NOW(), TO_TIMESTAMP(1776820647397 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "xC8T2rcPykY0CyLJlZdwrzbufn62"}',
      FALSE, TO_TIMESTAMP(1776820647397 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'mexbeatrizdelcarmen@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776820647397 / 1000), TO_TIMESTAMP(1776820647397 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'taxiseguro4020@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'taxiseguro4020@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$Zplyi7AFlII35g==$JH5Q3rIt6ucT8stSLEiIakSmWP/2u+8RBELN4mBTS87ohjhfVEZhNXlPTRjOqT7U0uRfOAXFMqv8pIpf78jQLA==', NOW(), TO_TIMESTAMP(1773923990557 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "xH5VHoWyjtbybcjiDq6Pjx8spKF3"}',
      FALSE, TO_TIMESTAMP(1773923990557 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'taxiseguro4020@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1773923990557 / 1000), TO_TIMESTAMP(1773923990557 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'malenacruzrdgz@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'malenacruzrdgz@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$D2YMw32mwTDkqg==$c6PxBZ/RFSiQUpoDmflc64WIAM1nqjq7/zD+i+pJXdlAW5uQ80FUmz+FHWobCOTZFIZ8ezNjviGuHGiKuRlNWw==', NOW(), TO_TIMESTAMP(1764469042866 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "xLU6N8QbrzgGC6FwKYQxogE4Ipp2"}',
      FALSE, TO_TIMESTAMP(1764469042866 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'malenacruzrdgz@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1764469042866 / 1000), TO_TIMESTAMP(1764469042866 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'salvador690426@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'salvador690426@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$VGwg8jpUwIJAqw==$bPtyUjlpHxODGoPYSYU/MhxEkljtAfMNKmffXehTIboNbnp1EMEc7CK318Qj/yGY/y+D7m4rKVD+Af2KCvR1+A==', NOW(), TO_TIMESTAMP(1761600109405 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "xM4NhGPRKxdblci0kqCUZnvynQg1"}',
      FALSE, TO_TIMESTAMP(1761590717123 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'salvador690426@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1761600109405 / 1000), TO_TIMESTAMP(1761590717123 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'sanchez_olan@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'sanchez_olan@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$tsYTodHhSqsHbg==$3YP/7uwxOd6sETJGBTFt/sDcTlQRxLjxAoK8/6wMvRFYxxLDDE5a9sBpY2SSZg9zWSd2YWFJrbkoZiwz40/P+Q==', NOW(), TO_TIMESTAMP(1776443423521 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "xN7tST47mTf1MzGVYE8koMolv6I2"}',
      FALSE, TO_TIMESTAMP(1776443423521 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'sanchez_olan@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776443423521 / 1000), TO_TIMESTAMP(1776443423521 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'maldonadomiguelluis@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'maldonadomiguelluis@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$L/So4MCWhB3NJw==$OgEPFO8k3KG3Mwm3EhoZwG8IwiCjJ9ncpNgypxP/KRdBrBSJAhpHyMJfQ2UXIcptvIxoZenLsiExOH9CYWMfIA==', NOW(), TO_TIMESTAMP(1753041694091 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "xNfCr5AnIbXRnArcdOK8iYmBpPo1"}',
      FALSE, TO_TIMESTAMP(1753041694091 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'maldonadomiguelluis@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1753041694091 / 1000), TO_TIMESTAMP(1753041694091 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'saulhdez767@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'saulhdez767@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$mwaQw6IgGm4HIw==$H5zKCv8QVSW2BqAymJblXXPAF+9KxEhms615Bdp088TB/f1xFleN20W7Uzv7mR5XOwtsIuuXIw/5uAaq06DyEw==', NOW(), TO_TIMESTAMP(1753463296167 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "xYW2J4RVDYPp37A7qiZR4kSC6Fm1"}',
      FALSE, TO_TIMESTAMP(1753463296167 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'saulhdez767@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1753463296167 / 1000), TO_TIMESTAMP(1753463296167 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'aguila7693@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'aguila7693@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$7zGhM0ypLNptyw==$6f3pKlRqZB/VPQuPUuUoYbFTAsIpzudOws9yy52GSGcJdCScAjOu6qkRpc8pUFthDD747iu81CbvudQ/NGESZw==', NOW(), TO_TIMESTAMP(1751481207506 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "xZ2p2y8KdUVUENXnf8m2OWV1pRG2"}',
      FALSE, TO_TIMESTAMP(1751480853979 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'aguila7693@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1751481207506 / 1000), TO_TIMESTAMP(1751480853979 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'barbaranavamx@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'barbaranavamx@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$uXzGwKI4Ig92vg==$O9r1wLjkgleBrZ3897IRaXTTeSL2yO7DRBpi4uTZI5NXT8M2LUQc6Z4Vwxven/Hy+OXU2pfvNySTWettCRKX8Q==', NOW(), TO_TIMESTAMP(1772138797752 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "xbl1G8szRtZDLkWkP4XfQ1MFSQL2"}',
      FALSE, TO_TIMESTAMP(1772138797752 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'barbaranavamx@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772138797752 / 1000), TO_TIMESTAMP(1772138797752 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'ivanvivasc@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'ivanvivasc@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$jrIqK+Zn8H2dJg==$8i0I8kvtKEAgAwW/UbZzpmcphg8D5oyKI3NKp0JB32370QyvUaX3wpO65Ngg8flI4zandzCiMlRcA2oRQ+0qfg==', NOW(), TO_TIMESTAMP(1763141109542 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "xdZROY1x8yRcIAukJaMRlXeEKdx1"}',
      FALSE, TO_TIMESTAMP(1763141109542 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'ivanvivasc@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1763141109542 / 1000), TO_TIMESTAMP(1763141109542 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'arianakalinic@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'arianakalinic@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$nD34lOdyUMTc4Q==$zZB5XIflJwbgxO/LlGbEyUrIvY4YYfsdNyt1bfzfNfkyVFbX8Ls0j20Dtr/AIsuEBbfEhnk19UF9e1VWUaRg0w==', NOW(), TO_TIMESTAMP(1771710279784 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "xk3qefRccVT6QKEuAemzASRS4ny1"}',
      FALSE, TO_TIMESTAMP(1771710279784 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'arianakalinic@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771710279784 / 1000), TO_TIMESTAMP(1771710279784 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'alex_mog@ooutlok.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'alex_mog@ooutlok.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$uOL8fn/SMi64Cg==$LXI0mFVeB1Q9y7qv9llydrYPQD5b5W2Kb8TU7yB+nAAJt7lcZI8IRJHp4Y06KB+NX958FbOYzEzFsmmKu7/jFA==', NOW(), TO_TIMESTAMP(1773340237931 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "xlsxKciNNXO9CQAKiNBWN7T6n6q1"}',
      FALSE, TO_TIMESTAMP(1773340237931 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'alex_mog@ooutlok.com')::jsonb,
      'email', TO_TIMESTAMP(1773340237931 / 1000), TO_TIMESTAMP(1773340237931 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'saivgon@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'saivgon@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$SvPUw1C4CFJngQ==$kgA8JjbFKRUC4GoDzb9f0tg3QRp5AGK50+Rqnea6/QIxZTobEA6LTF7oF2T3YzKKdDRAu033orQ+zRzoZ/FVQg==', NOW(), TO_TIMESTAMP(1771333687529 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "xmT1oHa3usNkjkqpUtDN10WEyXd2"}',
      FALSE, TO_TIMESTAMP(1771333687529 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'saivgon@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771333687529 / 1000), TO_TIMESTAMP(1771333687529 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'herrerarodrigo881@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'herrerarodrigo881@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$eta3NU0VB2bIrQ==$jX+RG9q7Ns09WO/OGTZI/vN2Z/TZlqTnYLUiRCpAzdhXHtgWmZ3rxPFcuC4Lb/TrEd/dvmDDg2nR2vZ97qeLUw==', NOW(), TO_TIMESTAMP(1770737879210 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "xsDbZ7erwYWUGXt8vjMqIUhIWZ12"}',
      FALSE, TO_TIMESTAMP(1770737879210 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'herrerarodrigo881@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1770737879210 / 1000), TO_TIMESTAMP(1770737879210 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'pepelepew0194@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'pepelepew0194@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$VhuifaWpLGyJtg==$RkvKsjpT8Oyz1nepcDak6iK60hHiIJOULdGv7100UaK0l7NmJvEtYGB986coMknI3SoI3sg5PkaBtOXhk5uyeQ==', TO_TIMESTAMP(1771507808571 / 1000), TO_TIMESTAMP(1777236559810 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "xxK2L3twMTe5kB5X9aJ2nsLmqGU2"}',
      FALSE, TO_TIMESTAMP(1771507808571 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'pepelepew0194@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1777236559810 / 1000), TO_TIMESTAMP(1771507808571 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'hose.jesg@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'hose.jesg@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$aPkhJ5Nllhp/hQ==$Fh+ve1ZCA0NAVbVauWd1V6QGl8N8esUo4eSihd45hF334Hy442pCRCNdm3MVrL5grKsULviHrLpisnYcWxqtIg==', NOW(), TO_TIMESTAMP(1771277882489 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "xzsRA8hhhAbApeRCrmRNPw2FQob2"}',
      FALSE, TO_TIMESTAMP(1771277882489 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'hose.jesg@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771277882489 / 1000), TO_TIMESTAMP(1771277882489 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'ernestocorim@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'ernestocorim@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$hcTJqNxO+CnWlw==$CnQyYQuqlBmKqQdpdDXIP0ZYKgVrQl6d1dWIdKSG89bLyiwRGATrz5TuncAg6PVEDCt8YiowWE9YfI5/5bkP1A==', NOW(), TO_TIMESTAMP(1760772884217 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "y0bOD4bI8gZyrV7DJxBqYCVSOZ02"}',
      FALSE, TO_TIMESTAMP(1760772884217 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'ernestocorim@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1760772884217 / 1000), TO_TIMESTAMP(1760772884217 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'leandrohdz06@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'leandrohdz06@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$lFr0XJlpPb6TWg==$0UVm8hmx+pDS/c0A0i68tPmTMbA8oYHtNZQpcmnv6LcIlcGCjqZD6L0976YJ8xBwPb8rfkdIvpa/1loITLjtIA==', NOW(), TO_TIMESTAMP(1776237081585 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "y3n1ZlNWTqSpI2AA7AI4ewSVXVN2"}',
      FALSE, TO_TIMESTAMP(1776237081585 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'leandrohdz06@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776237081585 / 1000), TO_TIMESTAMP(1776237081585 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'oscarpablogomezsanchez@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'oscarpablogomezsanchez@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$qNjWhPUWE4+qPQ==$U9ALN/NS+SJT/+ha06/rGEi3LGDciylSqe94/jwAUg41HJ0AVvdJI5h9eaFK5l2UF/WoD/tC0Crp5EA5WUmTVg==', NOW(), TO_TIMESTAMP(1776220138392 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "y9s8avObLOYWCa9B7VqRnPWSrqK2"}',
      FALSE, TO_TIMESTAMP(1776220138392 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'oscarpablogomezsanchez@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776220138392 / 1000), TO_TIMESTAMP(1776220138392 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'camilztrj@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'camilztrj@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$qfvf43z2FNX0PQ==$0KWDv5fvX90FM0z2Rh+oTgtAZp2azFaKVD22Nybv/NilIOt4M1hhTEYIWLT7ugyRsoqgeWBtPeEhi+ZdahPT0Q==', NOW(), TO_TIMESTAMP(1766008950855 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "yCBMmFElIjesl8Ejf5LGK3ImpYw2"}',
      FALSE, TO_TIMESTAMP(1766007082920 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'camilztrj@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1766008950855 / 1000), TO_TIMESTAMP(1766007082920 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'alzapata25@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'alzapata25@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$umVRVdtwLdyjUg==$QzuvqhkDp4A7HNLe/yxnVkAyhz69hOTN8undD73zk4Xt5xhsitY2/DDU1+jz+rffH1AqMS9HF6qWARzjfzauyw==', NOW(), TO_TIMESTAMP(1771693272194 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "yHEUcisthQRu9W0K0S7phLWnp6z2"}',
      FALSE, TO_TIMESTAMP(1771693272194 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'alzapata25@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771693272194 / 1000), TO_TIMESTAMP(1771693272194 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = '24roxxio@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      '24roxxio@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$GPQghR3SZliV5w==$xT0S8hlZZdgiZNZPASjjq7hLebysrvunMpHpbTNmUOUiKjWXhqBsKz0U5rjMeDHKjKkvEE0RJUf7aHoQC3k5Jg==', NOW(), TO_TIMESTAMP(1771283285782 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "yJKSi7SfvBUNVqrfzhSQijJIzY53"}',
      FALSE, TO_TIMESTAMP(1771283285782 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, '24roxxio@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771283285782 / 1000), TO_TIMESTAMP(1771283285782 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'candefloreslara981@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'candefloreslara981@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$4/cMBDexnMCqDg==$0cpLb+ZeMJUwzGf3s8oC9OZAoo1gwuDBID3QDnhhB/DiUxN70YOwqvk5zS0M1Ae8tq2SkGz+izhS30pqIbmLDA==', NOW(), TO_TIMESTAMP(1776226952029 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "yJO17td0WFXcHJPdtBBvMxyGOl93"}',
      FALSE, TO_TIMESTAMP(1776226952029 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'candefloreslara981@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776226952029 / 1000), TO_TIMESTAMP(1776226952029 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'danielaporras018@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'danielaporras018@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$tmnOfTmuPAFx5Q==$bUGYgWnvSoFn1BZuIAatWRMqQzEUhhWIqVurjU6OBNKH+4d6m/AIL0UQG9KqBJBvghlOHavftTreeDm4NDmLEw==', NOW(), TO_TIMESTAMP(1772132035469 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "yM3DGukUzweNtfZMhfxtdpF9Ovp1"}',
      FALSE, TO_TIMESTAMP(1772132035469 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'danielaporras018@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772132035469 / 1000), TO_TIMESTAMP(1772132035469 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'mercordero27@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'mercordero27@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$nyqbQDHhCqndCQ==$MbFV6+ijg29Djm3MNv0mHM2Fruw/uTuK1Lx6Lj0/C2IX8m5NtXOK1ssVZGWha1BangKaW3qjX34T18h2Z4xORA==', NOW(), TO_TIMESTAMP(1771384407765 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "yNYanhTwOafrfQ3fkJ3RzCBxrvh2"}',
      FALSE, TO_TIMESTAMP(1771384407765 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'mercordero27@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771384407765 / 1000), TO_TIMESTAMP(1771384407765 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'chusgomez171225@icloud.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'chusgomez171225@icloud.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$tpsny/exlMm23A==$j4ynJIE09YEAR1/twLxtOj3fPIEs8VH7KES1YoU1WuKbxEg6+vm4zi0we7dWyS44XNLWU6JsplG46OD++IzSxw==', NOW(), TO_TIMESTAMP(1779273112521 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "yOz3PUoudoQjdpIN9OlVbSMbo883"}',
      FALSE, TO_TIMESTAMP(1779273112521 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'chusgomez171225@icloud.com')::jsonb,
      'email', TO_TIMESTAMP(1779273112521 / 1000), TO_TIMESTAMP(1779273112521 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'barrientosluisivan@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'barrientosluisivan@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$0aKpCO7RzR6g2A==$EzxzvZNNoYK1uIYk3849GzmJ1nXuCA9MUs1u+UM4dTWLfcGv/kw5NWXjcGe3ybr8JoL7qCY0EcKpK7ZrDbDaFQ==', NOW(), TO_TIMESTAMP(1771392736296 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "yRxmKKkBc9MpmRSTJYSeegWn42Q2"}',
      FALSE, TO_TIMESTAMP(1771392736296 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'barrientosluisivan@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771392736296 / 1000), TO_TIMESTAMP(1771392736296 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'alexis_santiz0119@outlook.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'alexis_santiz0119@outlook.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$ZfkJwPb8VSovkQ==$l0GjMEIIY92SlePmRRrZ2ZjzbohmyA22IfWDJX8DOcQGlp+ry9mRtybh5eIF+dJikKTqhqkJH03/YU9NcfdOUA==', NOW(), TO_TIMESTAMP(1775685835558 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "ySKzMuhIVUWSwfvAXC0PSxOw08D2"}',
      FALSE, TO_TIMESTAMP(1775685835558 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'alexis_santiz0119@outlook.com')::jsonb,
      'email', TO_TIMESTAMP(1775685835558 / 1000), TO_TIMESTAMP(1775685835558 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'gustavoferndez7890@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'gustavoferndez7890@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$ffXWSn/eTSfZZQ==$lqgSXFszvdKVB8Ea9j1FDtYK5W2YM+B5OyBZI5ZPH/sL3cHJH7dXyX1SqYMlkbavSswKVgC49spMPn2CYbv5+g==', NOW(), TO_TIMESTAMP(1774647897423 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "yTENZ3eueLSb7BqZgF5gSKlQWry1"}',
      FALSE, TO_TIMESTAMP(1774647897423 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'gustavoferndez7890@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1774647897423 / 1000), TO_TIMESTAMP(1774647897423 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'crisrodriguez358@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'crisrodriguez358@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$O2+R2ZDo4VJ5qQ==$gNYNo03ti83j1Ev6Sbgq54du9p0XBhLgK1k4o1n8wKGaYEnpn2aLZcFJ4Ix0+iroJkGcTlMByTTT+3BY88M5Wg==', NOW(), TO_TIMESTAMP(1776217837850 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "yVuRPQlJbahB6bDzkZuD39V98722"}',
      FALSE, TO_TIMESTAMP(1776217837850 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'crisrodriguez358@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776217837850 / 1000), TO_TIMESTAMP(1776217837850 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'aarontoledoa@yahoo.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'aarontoledoa@yahoo.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$EI3yjPA3SPVbhg==$SW/RvYuDMNR0sJk0rJQwP84CeUHbtfvW08oxxbs+L67CcBhvcKwbPKlQtNUyPswUZbpHSZjyFjaqGWcaNle06w==', NOW(), TO_TIMESTAMP(1771885237625 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "yXkM4m6Io1cpDYcXu51fngw0tP32"}',
      FALSE, TO_TIMESTAMP(1771885237625 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'aarontoledoa@yahoo.com')::jsonb,
      'email', TO_TIMESTAMP(1771885237625 / 1000), TO_TIMESTAMP(1771885237625 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'valdezmiguel556@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'valdezmiguel556@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$zP0rYcfwATKzNg==$vAkgw+xma3h7nkRDvOtceZh9cGHGSZpHD2PQE7vVsxouRoZmq54vvWphqtzYY8LHcGTnd8R7G871GBfi88cXAw==', NOW(), TO_TIMESTAMP(1752907434486 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "yZot8CjPUhRyAQKUqlfTFRVqFlF3"}',
      FALSE, TO_TIMESTAMP(1751502575031 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'valdezmiguel556@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1752907434486 / 1000), TO_TIMESTAMP(1751502575031 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'corzo9797@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'corzo9797@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$cyUFE2QjumNFmA==$pEsfla7W8ysdlKL6R8yvb90DCybgzFy3N82RAcpK38u5hJ3/wc09OSCB1hBq1eSDk2l076eMwrDxp9cXQUj4vg==', NOW(), TO_TIMESTAMP(1762891496809 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "ymQh8pVfgLPKekmcm8rnEnaNmU83"}',
      FALSE, TO_TIMESTAMP(1762891496809 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'corzo9797@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1762891496809 / 1000), TO_TIMESTAMP(1762891496809 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'gamez15211518@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'gamez15211518@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$oWA52MsGj9+p8Q==$73N5PK1yf7z51P31Wu31HzpnBqBuubS0wjEnTKBpAu/GTYqbxfj30383+vt35ztw73jaxKI20wtaKgcPvgwZAQ==', NOW(), TO_TIMESTAMP(1771702913785 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "ynrgQCHSqqcmiCx5uryJadFkCsj2"}',
      FALSE, TO_TIMESTAMP(1771702913785 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'gamez15211518@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771702913785 / 1000), TO_TIMESTAMP(1771702913785 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'valdito2828@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'valdito2828@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$XZz5jJYPilxT3A==$eRBlMG++P4NAMDzE4j3XjfPuaCUILC66kKNQiKXVVrgbftO0rVfzwbxJ8O/7564J15FW8mEsN1Hsx8ejEte+EA==', NOW(), TO_TIMESTAMP(1753498963076 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "yo6hIPY09FXTvVyK8pDW90O5Vky2"}',
      FALSE, TO_TIMESTAMP(1753498623879 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'valdito2828@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1753498963076 / 1000), TO_TIMESTAMP(1753498623879 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'judithcasandrafloresdezuniga@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'judithcasandrafloresdezuniga@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$jvjpyFK9frafyQ==$HEtzon5cgRpGQ3a+HoRmV8O0u4ZrgjuJ0RByILWUZdFp9b/aNtNNq5TT9U85rQrvpU2VTdE5ltLDtdpZu/SoKQ==', NOW(), TO_TIMESTAMP(1752871365576 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "yp7ZgHAMvvMYiYNd5Zal5UtvwYi1"}',
      FALSE, TO_TIMESTAMP(1752871365576 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'judithcasandrafloresdezuniga@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1752871365576 / 1000), TO_TIMESTAMP(1752871365576 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'docecuartos212@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'docecuartos212@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$fTxKlthXWGLDQQ==$iEMW1Crl+avV3pDo3cop6cRhrsHzrf/W2aQN+7HgKoAARAqKfO8XcIgPI9nc6khoGDNcnWGaBzDNgzvysiVtig==', NOW(), TO_TIMESTAMP(1778600238016 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "yu50NKbyRuf61NVukhrlc3G8q8n1"}',
      FALSE, TO_TIMESTAMP(1778600238016 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'docecuartos212@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1778600238016 / 1000), TO_TIMESTAMP(1778600238016 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'camila.calleja.2203391@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'camila.calleja.2203391@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$FoaKgEk4t6TgFA==$ifoCwcWQ7DELQ6ooV0P3pUTSf08kdwmHGOH9fJ7VM2n2OGAy2T/3DbL1cssV1UVgUJcSDemeMD//yyy+2+EuPw==', NOW(), TO_TIMESTAMP(1774982370020 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "yxbWtdJdZ0UT1TvqrgyR8AExHjE2"}',
      FALSE, TO_TIMESTAMP(1774982370020 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'camila.calleja.2203391@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1774982370020 / 1000), TO_TIMESTAMP(1774982370020 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'leyver29@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'leyver29@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$VydhSngpgnrOWg==$+TSaQN3/4S+xNQGG8QhxC3T7m43bR8lLHCNE3JVzW1FzDDlQ7MsqgKTClBGLP4cPP4XkdXXHVZWzU8ZR5pBObQ==', NOW(), TO_TIMESTAMP(1772844092457 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "z0fA5z3nGrhjF4oE5BB77GIL5gK2"}',
      FALSE, TO_TIMESTAMP(1772844092457 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'leyver29@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772844092457 / 1000), TO_TIMESTAMP(1772844092457 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'carloschetos02@icloud.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'carloschetos02@icloud.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$HuCU/kWpcF+K0w==$RssPxMywHwoEdyQ3QgjwZfDbKtwO7sqxchRoa0t5+J4UpYtDVjCip/cp8Q1m6tJ/Tl82CREYZVQMkoVNXYGJfw==', NOW(), TO_TIMESTAMP(1772126435130 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "z4HV51mQYLRnb32cNBNjBvEgXJk1"}',
      FALSE, TO_TIMESTAMP(1772126435130 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'carloschetos02@icloud.com')::jsonb,
      'email', TO_TIMESTAMP(1772126435130 / 1000), TO_TIMESTAMP(1772126435130 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'erickyoan420@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'erickyoan420@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$Q8/T7gJ3V94YAQ==$/+oO1m3CWJg6rScTVoi3Df1INY/H3QMS3w2YY/SOw/Qv3t+PBanI22eeiUPl4pOpqZqJVWB7TMRKV0S3mje1rA==', NOW(), TO_TIMESTAMP(1751429208932 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "z84J69SR7PV5HUGoCjFpQRPBvHs1"}',
      FALSE, TO_TIMESTAMP(1751429208932 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'erickyoan420@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1751429208932 / 1000), TO_TIMESTAMP(1751429208932 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'delangelurbina528@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'delangelurbina528@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$cEFIzxxYvetk+A==$By6QN6flkOo/gxabi3tZi6aUP496xEwkjGRnLDqPb/Sfu/QDSc8npsIkQD1w+Go6i9TFAI08ZFfGzEJYzFDOgg==', NOW(), TO_TIMESTAMP(1771276070501 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "z980UmbOyLV0gIdbLyR3d3293S63"}',
      FALSE, TO_TIMESTAMP(1771276070501 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'delangelurbina528@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771276070501 / 1000), TO_TIMESTAMP(1771276070501 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'cristalramirez1928@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'cristalramirez1928@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$CrUzUOhXrpN2FQ==$6sxCTx05N6loYMgeqEYSyskQ4t6HSHaswkOZHA+ZKoT6LUOGjXizgjtitBC5TWWiL1Q+oIpQoMCHEcolWOgmzA==', NOW(), TO_TIMESTAMP(1752768073105 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "zB3EYpzugsQCLboXc4499uILUn42"}',
      FALSE, TO_TIMESTAMP(1752768073105 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'cristalramirez1928@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1752768073105 / 1000), TO_TIMESTAMP(1752768073105 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'ric55laz1977@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'ric55laz1977@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$olfQpwo27ybyUA==$C0ll6iCBElyLwPp7BcUzy9cho3uM1f+HcUALLDElx78jfwVqj0uJmvYGAMBLkd4QOFWDfSFZpYCEJ7eqIvIX2w==', NOW(), TO_TIMESTAMP(1774723751159 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "zBRYnw8or3UgG5GhT0iJXOJZpT52"}',
      FALSE, TO_TIMESTAMP(1774723751159 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'ric55laz1977@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1774723751159 / 1000), TO_TIMESTAMP(1774723751159 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'pacodario@icloud.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'pacodario@icloud.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$q35e25cv2Jytew==$2ZYXfBjtyAtl1z6CvTMq/XEKLSoPeKBs06zAvsfM2DIaPEs4ry6KO0d1o2OhyOCVefWqJx8rQQiXEAxlnCwRUA==', NOW(), TO_TIMESTAMP(1775541286256 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "zDyNgqXOzJVLUg4fWXn7PHo5TOS2"}',
      FALSE, TO_TIMESTAMP(1775541286256 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'pacodario@icloud.com')::jsonb,
      'email', TO_TIMESTAMP(1775541286256 / 1000), TO_TIMESTAMP(1775541286256 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'rigoberto9217@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'rigoberto9217@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$Jk6NUQShUcND5Q==$lcKFLQQXdl42LV/yAPzmBmLb4iISGXn1zu5dl7VWVQfwlms3xC6EHCE6ebsCs+AY/QS49I8br+v7rANDSwUCeg==', NOW(), TO_TIMESTAMP(1752827393511 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "zHgwlf9SudcONLM2HjIHodT6YtL2"}',
      FALSE, TO_TIMESTAMP(1752827393511 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'rigoberto9217@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1752827393511 / 1000), TO_TIMESTAMP(1752827393511 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'bamyorchano@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'bamyorchano@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$KpHXNG8j+C+CcQ==$9utFL2EYJFAyTWTHrEozgi1cleOEwNVZiDDHu1rbOfD+LDVxFTTOnZksMKKN3A83x7815BikAIhbl6kjCPtZQw==', NOW(), TO_TIMESTAMP(1771380633144 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "zHvhmxTgNRObTX5LMtnXyc23hkv1"}',
      FALSE, TO_TIMESTAMP(1771380633144 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'bamyorchano@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771380633144 / 1000), TO_TIMESTAMP(1771380633144 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'pame_a@outlook.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'pame_a@outlook.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$zBb5GlWCe0sgaA==$i4E8ziSLR6cD1RmrZDtAabk41mwIJDYGTAgn6GqqezG67GQrcvAkvlSODu4CBroZ74II7ANBD1y9xRT7NHnUEA==', NOW(), TO_TIMESTAMP(1776232149773 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "zIrlZU0Yd6UZ0WJA1AjHJwRYMqU2"}',
      FALSE, TO_TIMESTAMP(1776232149773 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'pame_a@outlook.com')::jsonb,
      'email', TO_TIMESTAMP(1776232149773 / 1000), TO_TIMESTAMP(1776232149773 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'eagle_dos@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'eagle_dos@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$qbqe1uz51H8lug==$zvAIpf+GKCGzzxlAzoh/TYCVGb3xPTV7qfALwn7APrHU0HC8peEwvla33wTLo7W6kgfzDUQX6OSCQXoP5WXLmw==', NOW(), TO_TIMESTAMP(1776226096136 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "zLFGzj3SlfNjUumyD2t68ICd3yX2"}',
      FALSE, TO_TIMESTAMP(1776226096136 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'eagle_dos@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776226096136 / 1000), TO_TIMESTAMP(1776226096136 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'lupitazara108@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'lupitazara108@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$A5iUN6SFiPRr2Q==$3Yq1FPchF6oNJhyxZHhT6sslOqWAzfPrOyZpRTdlY5v1oo41iYqtQOC2xijKI8kFUrxwo/Bgun27qgxdAIrBuw==', NOW(), TO_TIMESTAMP(1776454600719 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "zSJKjIWlqDPhs6cm0jwstH9td942"}',
      FALSE, TO_TIMESTAMP(1776454600719 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'lupitazara108@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1776454600719 / 1000), TO_TIMESTAMP(1776454600719 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'sp2610782@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'sp2610782@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$uB8u5BIEtjlE0A==$iR/qKySg4MfxHt5NUQ3CDoQmMOVvd09bVzpBmh35RhAdVztDsckV5ZC/yNmisnWpp83kHFizPTpzDvamzgJ68Q==', NOW(), TO_TIMESTAMP(1771882904105 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "zX3qqhEc1bZQXXKFbDEGjBJzfzi2"}',
      FALSE, TO_TIMESTAMP(1771882904105 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'sp2610782@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1771882904105 / 1000), TO_TIMESTAMP(1771882904105 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'lopezgomeznicolas175@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'lopezgomeznicolas175@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$HqG/Sgzcas8I2Q==$4JhmblnqeMc5MIfRLMnU1+YCp27DXZxZy+Cxj4Jx+10+eP4ecUbcgA/7eBTi43CRR6CDpKpukV8dytAw7pxsyQ==', NOW(), TO_TIMESTAMP(1770246497266 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "zqnep8r7e7ZyHG5QRHYyxF7DpGq1"}',
      FALSE, TO_TIMESTAMP(1764112309038 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'lopezgomeznicolas175@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1770246497266 / 1000), TO_TIMESTAMP(1764112309038 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'mekatec777@gmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'mekatec777@gmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$I1bTzzCgn2ub3A==$RpVJT7hOCeuHnnbnBxlnQ0GBJbHALq7RJEsEdKDlPL049NXb+lh+q17w9x/C51ns//9tiBV+YlXSEVn79VPhVg==', NOW(), TO_TIMESTAMP(1780157981403 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "ztVEJKigUhNlRPWdC8vO2Ex9ysc2"}',
      FALSE, TO_TIMESTAMP(1780157981403 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'mekatec777@gmail.com')::jsonb,
      'email', TO_TIMESTAMP(1780157981403 / 1000), TO_TIMESTAMP(1780157981403 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'draco711@outlook.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'draco711@outlook.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$B51Vc+dl1DY1AA==$4w0Xlg2Wtnof2s+oCKVp/qpS8i5xxy9NUO3agVXvoephZXhytT5dT+NhnpDTPJ++vS/iqe05mzcIh2E9DtsxfQ==', NOW(), TO_TIMESTAMP(1774937987378 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "ztY98Kb9sYdX8sjwTc80Qe0LXfu1"}',
      FALSE, TO_TIMESTAMP(1774937987378 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'draco711@outlook.com')::jsonb,
      'email', TO_TIMESTAMP(1774937987378 / 1000), TO_TIMESTAMP(1774937987378 / 1000), NOW()
    );
  END IF;
END $$;
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'cesar_pili@hotmail.com') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      'cesar_pili@hotmail.com', '$firebase$scrypt$v=1,p=REEMPLAZAR_CON_TU_SIGNER_KEY,s=Bw==,r=8,m=14$EW7pc5QShurj/A==$staBtr+3qoVagWct8gRadS9K/7mHGhpaNcIRmohlDDyDsHgmV3qwnHRtJJ+Zb3UaNNYNcdiSu61rp+lTpYUThQ==', NOW(), TO_TIMESTAMP(1772806147949 / 1000),
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "zzYHiAmlrrSN4gW2EpVkEoJG6Wp1"}',
      FALSE, TO_TIMESTAMP(1772806147949 / 1000), NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, 'cesar_pili@hotmail.com')::jsonb,
      'email', TO_TIMESTAMP(1772806147949 / 1000), TO_TIMESTAMP(1772806147949 / 1000), NOW()
    );
  END IF;
END $$;
COMMIT;
