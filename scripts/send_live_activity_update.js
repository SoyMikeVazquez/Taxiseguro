const http2 = require('http2');
const crypto = require('crypto');
const fs = require('fs');
const path = require('path');

// Configuracion APNs TaxiSeguro
const TEAM_ID = 'THPRQP472Z';
const KEY_ID = '9C8SL897GV';
const BUNDLE_ID = 'com.pideloseguro.usuario';
const TOPIC = `${BUNDLE_ID}.push-type.liveactivity`;
const KEY_PATH = path.resolve(__dirname, '../AuthKey_9C8SL897GV.p8');

function generateJwt() {
  const privateKey = fs.readFileSync(KEY_PATH, 'utf8');
  const header = Buffer.from(JSON.stringify({ alg: 'ES256', kid: KEY_ID })).toString('base64url');
  const claims = Buffer.from(JSON.stringify({ iss: TEAM_ID, iat: Math.floor(Date.now() / 1000) })).toString('base64url');
  const data = `${header}.${claims}`;

  const signer = crypto.createSign('SHA256');
  signer.update(data);
  const signature = signer.sign({ key: privateKey, dsaEncoding: 'ieee-p1363' });

  return `${data}.${signature.toString('base64url')}`;
}

/**
 * Envia una actualizacion o finalizacion de Live Activity via APNs
 * @param {string} pushToken Token generado por iOS para la Live Activity
 * @param {object} options Opciones de la notificacion
 * @param {string} options.event 'update' o 'end'
 * @param {string} options.status Estado legible (ej: 'Conductor en camino', 'Ha llegado', 'Viaje en curso')
 * @param {string} [options.destination] Direccion de destino
 * @param {string} [options.fare] Tarifa estimada
 * @param {boolean} [options.isProduction=false] true si se envia al entorno de produccion, false para sandbox (desarrollo)
 */
function sendLiveActivityUpdate(pushToken, options = {}) {
  const {
    event = 'update',
    status = 'Conductor en camino',
    destination = '',
    fare = '',
    isProduction = false
  } = options;

  if (!pushToken) {
    console.error('Error: Debes proporcionar el pushToken de la Live Activity.');
    console.log('Uso: node scripts/send_live_activity_update.js <PUSH_TOKEN> [ESTADO] [EVENTO]');
    process.exit(1);
  }

  const host = isProduction ? 'https://api.push.apple.com' : 'https://api.sandbox.push.apple.com';
  const jwt = generateJwt();

  const payload = {
    aps: {
      timestamp: Math.floor(Date.now() / 1000),
      event: event,
      'content-state': {
        status: status,
        destination: destination,
        fare: fare
      }
    }
  };

  if (event === 'end') {
    payload.aps['dismissal-date'] = Math.floor(Date.now() / 1000) + 60; // Descartar despues de 60 segundos
  }

  const body = JSON.stringify(payload);

  const client = http2.connect(host);

  client.on('error', (err) => {
    console.error('Error de conexion APNs:', err);
  });

  const req = client.request({
    ':method': 'POST',
    ':path': `/3/device/${pushToken}`,
    'authorization': `bearer ${jwt}`,
    'apns-topic': TOPIC,
    'apns-push-type': 'liveactivity',
    'apns-priority': '10',
    'content-type': 'application/json',
    'content-length': Buffer.byteLength(body)
  });

  req.setEncoding('utf8');

  let responseData = '';
  let statusCode = 0;

  req.on('response', (headers) => {
    statusCode = headers[':status'];
  });

  req.on('data', (chunk) => {
    responseData += chunk;
  });

  req.on('end', () => {
    client.close();
    if (statusCode === 200) {
      console.log(`Live Activity enviada con exito (HTTP ${statusCode}). Evento: ${event}`);
    } else {
      console.error(`APNs respondio con error HTTP ${statusCode}:`, responseData);
    }
  });

  req.write(body);
  req.end();
}

// Ejecucion por linea de comandos:
// node scripts/send_live_activity_update.js <TOKEN> <ESTADO> <EVENTO>
const args = process.argv.slice(2);
const tokenArg = args[0];
const statusArg = args[1] || 'Conductor ha llegado al punto de encuentro';
const eventArg = args[2] || 'update';

if (tokenArg) {
  sendLiveActivityUpdate(tokenArg, {
    status: statusArg,
    event: eventArg,
    destination: 'Av. Lazaro Cardenas',
    fare: '$85.00 MXN',
    isProduction: false
  });
} else {
  console.log('Script listo para pruebas APNs de Live Activity TaxiSeguro.');
  console.log('Uso: node scripts/send_live_activity_update.js <LIVE_ACTIVITY_PUSH_TOKEN> [ESTADO] [update|end]');
}
