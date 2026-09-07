const fs = require('fs');
const path = require('path');

// Parámetros Scrypt (se pueden reemplazar si los tienes)
const BASE64_SIGNER_KEY = 'REEMPLAZAR_CON_TU_SIGNER_KEY';
const BASE64_SALT_SEPARATOR = 'Bw==';
const ROUNDS = '8';
const MEM_COST = '14';

const jsonPath = path.join(__dirname, 'usuarios_firebase.json');
if (!fs.existsSync(jsonPath)) {
  console.error(`Error: No se encontró usuarios_firebase.json`);
  process.exit(1);
}

const fileData = fs.readFileSync(jsonPath, 'utf8');
const parsed = JSON.parse(fileData);
const users = parsed.users || [];

const BATCH_SIZE = 400; // Dividir en lotes de 400 usuarios por archivo (~800KB cada uno)
const totalBatches = Math.ceil(users.length / BATCH_SIZE);

console.log(`Dividiendo ${users.length} usuarios en ${totalBatches} archivos SQL pequeños...`);

for (let batchIndex = 0; batchIndex < totalBatches; batchIndex++) {
  const batchUsers = users.slice(batchIndex * BATCH_SIZE, (batchIndex + 1) * BATCH_SIZE);
  const sqlFileName = `importar_lote_${batchIndex + 1}.sql`;
  const sqlFilePath = path.join(__dirname, sqlFileName);

  let sqlContent = `-- Lote ${batchIndex + 1} de ${totalBatches} (${batchUsers.length} usuarios)
CREATE EXTENSION IF NOT EXISTS "pgcrypto";
BEGIN;

`;

  batchUsers.forEach((u, i) => {
    const email = (u.email || '').replace(/'/g, "''");
    if (!email) return;

    let encryptedPassword = '';
    if (u.passwordHash && u.salt) {
      encryptedPassword = `$firebase$scrypt$v=1,p=${BASE64_SIGNER_KEY},s=${BASE64_SALT_SEPARATOR},r=${ROUNDS},m=${MEM_COST}$${u.salt}$${u.passwordHash}`;
    }

    const createdAt = u.createdAt ? `TO_TIMESTAMP(${parseInt(u.createdAt, 10)} / 1000)` : 'NOW()';
    const lastSignedInAt = u.lastSignedInAt ? `TO_TIMESTAMP(${parseInt(u.lastSignedInAt, 10)} / 1000)` : 'NOW()';
    const emailConfirmedAt = u.emailVerified ? createdAt : 'NOW()';

    sqlContent += `DO $$
DECLARE
  new_user_id UUID := gen_random_uuid();
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = '${email}') THEN
    INSERT INTO auth.users (
      instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
      last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at
    ) VALUES (
      '00000000-0000-0000-0000-000000000000', new_user_id, 'authenticated', 'authenticated',
      '${email}', '${encryptedPassword}', ${emailConfirmedAt}, ${lastSignedInAt},
      '{"provider": "email", "providers": ["email"]}', '{"firebase_uid": "${u.localId}"}',
      FALSE, ${createdAt}, NOW()
    );

    INSERT INTO auth.identities (
      id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at
    ) VALUES (
      gen_random_uuid(), new_user_id, new_user_id::text, format('{"sub":"%s","email":"%s"}', new_user_id, '${email}')::jsonb,
      'email', ${lastSignedInAt}, ${createdAt}, NOW()
    );
  END IF;
END $$;
`;
  });

  sqlContent += `COMMIT;\n`;
  fs.writeFileSync(sqlFilePath, sqlContent, 'utf8');
  console.log(`✅ Creado: ${sqlFileName} (${batchUsers.length} usuarios)`);
}

console.log('\n¡Listo! Archivos corregidos.');
