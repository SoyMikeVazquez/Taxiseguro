const keyBase64 = 'C34xz4ekGPX5iZlzLDe+LmWIFePZi+7ncRYs4sgmucsiXKhqvPN5tnHXbChn5B8+uz2637b2yxyTxqFRZg96zw==';
const decoded = Buffer.from(keyBase64, 'base64');
console.log('Decoded length:', decoded.length);

const truncated32 = decoded.slice(0, 32);
const newKeyBase64 = truncated32.toString('base64');
console.log('Truncated 32 byte key (Base64):', newKeyBase64);

const fs = require('fs');
const path = require('path');
const jsonPath = path.join(__dirname, 'usuarios_firebase.json');
const users = JSON.parse(fs.readFileSync(jsonPath, 'utf8')).users || [];

const BASE64_SALT_SEPARATOR = 'Bw==';
const ROUNDS = '8';
const MEM_COST = '14';

let sqlContent = `BEGIN;\n\n`;

const batchUsers = users.slice(0, 10);
batchUsers.forEach(u => {
    const email = (u.email || '').replace(/'/g, "''");
    if (!email) return;

    if (u.passwordHash && u.salt) {
      let encryptedPassword = `$firebase$scrypt$v=1,p=${newKeyBase64},s=${BASE64_SALT_SEPARATOR},r=${ROUNDS},m=${MEM_COST}$${u.salt}$${u.passwordHash}`;
      sqlContent += `UPDATE auth.users SET encrypted_password = '${encryptedPassword}' WHERE email = '${email}';\n`;
    }
});

sqlContent += `\nCOMMIT;\n`;
fs.writeFileSync(path.join(__dirname, 'test_truncated_key.sql'), sqlContent);

