const fetch = require('node-fetch');

async function runTest() {
  const url = 'https://viqmzyevsvdzddmukfev.supabase.co/auth/v1/token?grant_type=password';
  const anonKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZpcW16eWV2c3ZkemRkbXVrZmV2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODIzMTIxNjgsImV4cCI6MjA5Nzg4ODE2OH0.H40ahS2NmlgD1yCjCVf-i8TXTGHE6oBKvHBwl8OqbCA';

  console.log('Probando login...');
  const response = await fetch(url, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      'apikey': anonKey,
      'Authorization': `Bearer ${anonKey}`
    },
    body: JSON.stringify({
      email: 'ric55laz@hotmail.com',
      password: 'Camila12'
    })
  });

  const data = await response.json();
  console.log('Status:', response.status);
  console.log('Body:', JSON.stringify(data, null, 2));
}

runTest();
