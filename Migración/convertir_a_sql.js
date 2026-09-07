const fs = require('fs');
const path = require('path');

// ==============================================================================
// CONFIGURACIÓN DE PARÁMETROS SCRYPT DE FIREBASE
// Reemplaza estos 4 valores con los obtenidos de tu consola de Firebase:
// Firebase Console -> Authentication -> Users -> (⋮) Password hash parameters
// ==============================================================================
const BASE64_SIGNER_KEY = 'REEMPLAZAR_CON_TU_SIGNER_KEY';
const BASE64_SALT_SEPARATOR = 'Bw=='; // Valor por defecto de Firebase si no cambió
const ROUNDS = '8';                     // Valor por defecto de Firebase
const MEM_COST = '14';                  // Valor por defecto de Firebase
// ==============================================================================

const jsonPath = path.join(__dirname, 'usuarios_firebase.json');
const sqlOutputPath = path.join(__dirname, 'importar_usuarios.sql');

if (!fs.existsSync(jsonPath)) {
  console.error(`Error: No se encontró el archivo usuarios_firebase.json en: ${jsonPath}`);
  process.exit(1);
}

console.log('Leyendo usuarios_firebase.json...');
const fileData = fs.readFileSync(jsonPath, 'utf8');
const parsed = JSON.parse(fileData);
const users = parsed.users || [];

console.log(`Se encontraron ${users.length} usuarios para migrar.`);

let sqlContent = `-- Archivo de migración masiva de usuarios de Firebase a Supabase Auth
-- Generado automáticamente

CREATE EXTENSION IF NOT EXISTS "pgcrypto";

BEGIN;

`;

users.forEach((u, index) => {
  const email = (u.email || '').replace(/'/g, "''");
  if (!email) return; // Ignorar usuarios sin correo

  // Generar UUID basado en localId o un nuevo UUID
  const id = u.localId && u.localId.length === 28 ? null : null; // Dejamos que PG use gen_random_uuid() o asignemos UUID
  
  // Construcción del hash de contraseña para GoTrue / Supabase
  let encryptedPassword = '';
  if (u.passwordHash && u.salt) {
    encryptedPassword = `$firebase$scrypt$v=1,p=${BASE64_SIGNER_KEY},s=${BASE64_SALT_SEPARATOR},r=${ROUNDS},m=${MEM_COST}$${u.salt}$${u.passwordHash}`;
  } else {
    encryptedPassword = ''; // Usuario sin contraseña (ej. OAuth)
  }

  const createdAt = u.createdAt ? `TO_TIMESTAMP(${parseInt(u.createdAt, 10)} / 1000)` : 'NOW()';
  const lastSignedInAt = u.lastSignedInAt ? `TO_TIMESTAMP(${parseInt(u.lastSignedInAt, 10)} / 1000)` : 'NOW()';
  const emailConfirmedAt = u.emailVerified ? createdAt : 'NOW()'; // Confirmados para que puedan iniciar sesión directamente

  sqlContent += `-- Usuario ${index + 1}: ${email}
DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = '${email}') THEN
    INSERT INTO auth.users (
      instance_id,
      id,
      aud,
      role,
      email,
      encrypted_password,
      email_confirmed_at,
      invited_at,
      confirmation_token,
      confirmation_sent_at,
      recovery_token,
      recovery_sent_at,
      email_change_token_new,
      email_change,
      email_change_sent_at,
      last_sign_in_at,
      raw_app_meta_data,
      raw_user_meta_data,
      is_super_admin,
      created_at,
      updated_at,
      phone,
      phone_confirmed_at,
      phone_change,
      phone_change_token,
      phone_change_sent_at,
      email_change_token_current,
      email_change_confirm_status,
      banned_until,
      reauthentication_token,
      reauthentication_sent_at,
      is_sso_user,
      deleted_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000',
      new_user_id,
      'authenticated',
      'authenticated',
      '${email}',
      '${encryptedPassword}',
      ${emailConfirmedAt},
      NULL, '', NULL, '', NULL, '', '', NULL,
      ${lastSignedInAt},
      '{"provider": "email", "providers": ["email"]}',
      '{"firebase_uid": "${u.localId}"}',
      FALSE,
      ${createdAt},
      NOW(),
      NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, FALSE, NULL
    );

    INSERT INTO auth.identities (
      id,
      user_id,
      identity_data,
      provider,
      last_sign_in_at,
      created_at,
      updated_at
    ) VALUES (
      gen_random_uuid(),
      new_user_id,
      format('{"sub":"%s","email":"%s"}', new_user_id, '${email}')::jsonb,
      'email',
      ${lastSignedInAt},
      ${createdAt},
      NOW()
    );
  END IF;
END $$;

`;
});

sqlContent += `COMMIT;
`;

fs.writeFileSync(sqlOutputPath, sqlContent, 'utf8');
console.log(`\n✅ ¡Proceso completado con éxito!`);
console.log(`Archivo SQL generado en: ${sqlOutputPath}`);
