const fs = require('fs');
const path = require('path');

// Parámetros Scrypt proporcionados
const BASE64_SIGNER_KEY = 'C34xz4ekGPX5iZlzLDe+LmWIFePZi+7ncRYs4sgmucsiXKhqvPN5tnHXbChn5B8+uz2637b2yxyTxqFRZg96zw==';
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

const BATCH_SIZE = 400; // Dividir en lotes de 400 usuarios
const totalBatches = Math.ceil(users.length / BATCH_SIZE);

console.log(`Generando scripts de actualización para ${users.length} usuarios en ${totalBatches} lotes...`);

for (let batchIndex = 0; batchIndex < totalBatches; batchIndex++) {
  const batchUsers = users.slice(batchIndex * BATCH_SIZE, (batchIndex + 1) * BATCH_SIZE);
  const sqlFileName = `actualizar_lote_${batchIndex + 1}.sql`;
  const sqlFilePath = path.join(__dirname, sqlFileName);

  let sqlContent = `-- Lote de actualización ${batchIndex + 1} de ${totalBatches} (${batchUsers.length} usuarios)
BEGIN;

`;

  batchUsers.forEach((u, i) => {
    const email = (u.email || '').replace(/'/g, "''");
    if (!email) return;

    let encryptedPassword = '';
    if (u.passwordHash && u.salt) {
      encryptedPassword = `$firebase$scrypt$v=1,p=${BASE64_SIGNER_KEY},s=${BASE64_SALT_SEPARATOR},r=${ROUNDS},m=${MEM_COST}$${u.salt}$${u.passwordHash}`;
    }

    if (encryptedPassword !== '') {
      sqlContent += `UPDATE auth.users SET encrypted_password = '${encryptedPassword}' WHERE email = '${email}';\n`;
    }
  });

  sqlContent += `\nCOMMIT;\n`;
  fs.writeFileSync(sqlFilePath, sqlContent, 'utf8');
  console.log(`✅ Creado: ${sqlFileName} (${batchUsers.length} usuarios)`);
}

console.log('\n¡Listo! Archivos de actualización generados. Por favor corre estos scripts en tu panel de Supabase SQL Editor.');
