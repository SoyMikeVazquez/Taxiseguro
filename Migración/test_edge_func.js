async function testEdgeFunction() {
  const url = 'https://viqmzyevsvdzddmukfev.supabase.co/functions/v1/migrate_firebase_user';
  const anonKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZpcW16eWV2c3ZkemRkbXVrZmV2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODIzMTIxNjgsImV4cCI6MjA5Nzg4ODE2OH0.H40ahS2NmlgD1yCjCVf-i8TXTGHE6oBKvHBwl8OqbCA';

  console.log('Probando Edge Function migrate_firebase_user con fetch nativo...');
  try {
    const res = await fetch(url, {
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

    const status = res.status;
    const text = await res.text();
    console.log('Status:', status);
    console.log('Response:', text);
  } catch (e) {
    console.error('Fetch error:', e);
  }
}

testEdgeFunction();
