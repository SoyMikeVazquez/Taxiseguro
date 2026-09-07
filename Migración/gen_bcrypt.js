const bcrypt = require('bcrypt');

const password = 'Camila12';
const saltRounds = 10;

bcrypt.hash(password, saltRounds, function(err, hash) {
  if (err) throw err;
  console.log(`UPDATE auth.users SET encrypted_password = '${hash}' WHERE email = 'ric55laz@hotmail.com';`);
});
