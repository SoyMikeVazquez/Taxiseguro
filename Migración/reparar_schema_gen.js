const fs = require('fs');
const path = require('path');

const jsonPath = path.join(__dirname, 'usuarios_firebase.json');
const fileData = fs.readFileSync(jsonPath, 'utf8');
const parsed = JSON.parse(fileData);
const users = parsed.users || [];

let sqlContent = `BEGIN;\n\n`;

// Update provider_id for all email identities
sqlContent += `
-- Update provider_id in auth.identities where provider is 'email'
UPDATE auth.identities 
SET provider_id = (identity_data->>'sub')
WHERE provider = 'email' AND (provider_id IS NULL OR provider_id = '');

-- Update missing columns in auth.users just in case
UPDATE auth.users SET confirmation_token = '' WHERE confirmation_token IS NULL;
UPDATE auth.users SET recovery_token = '' WHERE recovery_token IS NULL;
UPDATE auth.users SET email_change_token_new = '' WHERE email_change_token_new IS NULL;
UPDATE auth.users SET email_change = '' WHERE email_change IS NULL;
UPDATE auth.users SET phone_change = '' WHERE phone_change IS NULL;
UPDATE auth.users SET phone_change_token = '' WHERE phone_change_token IS NULL;
UPDATE auth.users SET email_change_token_current = '' WHERE email_change_token_current IS NULL;
UPDATE auth.users SET reauthentication_token = '' WHERE reauthentication_token IS NULL;

-- Make sure phone is an empty string if expected (though NULL is usually fine)
-- Make sure is_anonymous is false if it exists (Supabase will handle default)
`;

sqlContent += `\nCOMMIT;\n`;

const sqlFilePath = path.join(__dirname, 'reparar_esquema.sql');
fs.writeFileSync(sqlFilePath, sqlContent, 'utf8');
console.log('Archivo reparar_esquema.sql generado.');
