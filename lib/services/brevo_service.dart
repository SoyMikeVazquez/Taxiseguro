import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:supabase_flutter/supabase_flutter.dart';
import '../env/env.dart';

class BrevoRecipient {
  final String email;
  final String name;

  const BrevoRecipient({required this.email, required this.name});

  Map<String, String> toJson() => {'email': email, 'name': name};
}

class BrevoSendResult {
  final bool success;
  final int sentCount;
  final int failedCount;
  final String? errorMessage;
  final List<String> failedEmails;

  const BrevoSendResult({
    required this.success,
    required this.sentCount,
    required this.failedCount,
    this.errorMessage,
    this.failedEmails = const [],
  });
}

class BrevoService {
  static const String _baseUrl = 'https://api.brevo.com/v3';
  static const String senderEmail = 'admin@taxiseguro.net';
  static const String senderName = 'TaxiSeguro';

  static String get _apiKey => Env.sendinbluApiKey;

  static Map<String, String> get _headers => {
        'api-key': _apiKey,
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

  /// Obtiene los datos de la cuenta de Brevo (créditos disponibles, plan, etc.)
  static Future<Map<String, dynamic>?> getAccountInfo() async {
    try {
      final res = await http.get(
        Uri.parse('$_baseUrl/account'),
        headers: _headers,
      );
      if (res.statusCode == 200) {
        return jsonDecode(res.body) as Map<String, dynamic>;
      }
      return null;
    } catch (e) {
      print('Error al consultar cuenta de Brevo: $e');
      return null;
    }
  }

  /// Construye una plantilla HTML moderna con diseño oficial de TaxiSeguro
  static String buildHtmlTemplate({
    required String title,
    required String message,
    String? recipientName,
    String? ctaText,
    String? ctaUrl,
  }) {
    final cleanMsg = message.replaceAll('\n', '<br>');
    final greeting = (recipientName != null && recipientName.trim().isNotEmpty)
        ? 'Hola <strong>$recipientName</strong>,'
        : 'Hola,';

    final ctaButtonHtml = (ctaText != null && ctaText.trim().isNotEmpty && ctaUrl != null && ctaUrl.trim().isNotEmpty)
        ? '''
        <div style="margin: 32px 0; text-align: center;">
          <a href="$ctaUrl" style="background-color: #C7FF2E; color: #000000; font-family: 'Helvetica Neue', Arial, sans-serif; font-size: 15px; font-weight: bold; text-decoration: none; padding: 14px 32px; border-radius: 30px; display: inline-block; box-shadow: 0 4px 12px rgba(199, 255, 46, 0.35);">
            $ctaText
          </a>
        </div>
        '''
        : '';

    return '''
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>$title</title>
</head>
<body style="margin: 0; padding: 0; background-color: #F3F4F6; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif;">
  <table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="background-color: #F3F4F6; padding: 30px 10px;">
    <tr>
      <td align="center">
        <!-- Contenedor Principal -->
        <table role="presentation" width="100%" style="max-width: 580px; background-color: #FFFFFF; border-radius: 24px; overflow: hidden; box-shadow: 0 10px 30px rgba(0,0,0,0.06);">
          
          <!-- Encabezado Oscuro con Logo TaxiSeguro -->
          <tr>
            <td style="background-color: #121212; padding: 36px 30px; text-align: center;">
              <div style="display: inline-block; background-color: #C7FF2E; color: #000000; font-weight: 900; font-size: 22px; padding: 8px 18px; border-radius: 12px; letter-spacing: -0.5px;">
                TAXISEGURO
              </div>
              <div style="color: #9CA3AF; font-size: 13px; margin-top: 8px; font-weight: 500;">
                Tu viaje confiable y seguro
              </div>
            </td>
          </tr>

          <!-- Título y Saludo -->
          <tr>
            <td style="padding: 36px 36px 20px 36px;">
              <h1 style="margin: 0 0 16px 0; font-size: 22px; font-weight: 800; color: #111827; line-height: 1.3;">
                $title
              </h1>
              <p style="margin: 0 0 20px 0; font-size: 15px; color: #4B5563; line-height: 1.6;">
                $greeting
              </p>
              
              <!-- Cuerpo del mensaje -->
              <div style="font-size: 15px; color: #374151; line-height: 1.7;">
                $cleanMsg
              </div>

              <!-- Botón CTA opcional -->
              $ctaButtonHtml
            </td>
          </tr>

          <!-- Divisor -->
          <tr>
            <td style="padding: 0 36px;">
              <hr style="border: none; border-top: 1px solid #E5E7EB; margin: 20px 0;">
            </td>
          </tr>

          <!-- Pie de página -->
          <tr>
            <td style="padding: 0 36px 36px 36px; text-align: center;">
              <p style="margin: 0; font-size: 12px; color: #9CA3AF; line-height: 1.5;">
                Has recibido este comunicado oficial porque formas parte de la comunidad de TaxiSeguro.<br>
                © ${DateTime.now().year} TaxiSeguro Inc. Todos los derechos reservados.
              </p>
            </td>
          </tr>

        </table>
      </td>
    </tr>
  </table>
</body>
</html>
''';
  }

  /// Envía un correo individual a través de la API v3 de Brevo
  static Future<bool> sendSingleEmail({
    required String toEmail,
    required String toName,
    required String subject,
    required String htmlContent,
  }) async {
    try {
      final body = {
        'sender': {'name': senderName, 'email': senderEmail},
        'to': [
          {'email': toEmail, 'name': toName}
        ],
        'subject': subject,
        'htmlContent': htmlContent,
      };

      final res = await http.post(
        Uri.parse('$_baseUrl/smtp/email'),
        headers: _headers,
        body: jsonEncode(body),
      );

      return res.statusCode == 200 || res.statusCode == 201;
    } catch (e) {
      print('Excepción enviando correo a $toEmail: $e');
      return false;
    }
  }

  /// Envía correos masivos a una lista de destinatarios
  /// Llama a la API individualmente o en paquetes pequeños para proteger la privacidad
  /// y reporta el progreso mediante un callback
  static Future<BrevoSendResult> sendMassEmail({
    required List<BrevoRecipient> recipients,
    required String subject,
    required String htmlContent,
    void Function(int current, int total)? onProgress,
  }) async {
    if (recipients.isEmpty) {
      return const BrevoSendResult(
        success: false,
        sentCount: 0,
        failedCount: 0,
        errorMessage: 'La lista de destinatarios está vacía.',
      );
    }

    int sent = 0;
    int failed = 0;
    final List<String> failedEmails = [];

    // Enviamos en bloques controlados para no saturar la red ni la tasa de la API
    for (int i = 0; i < recipients.length; i++) {
      final r = recipients[i];
      final ok = await sendSingleEmail(
        toEmail: r.email,
        toName: r.name,
        subject: subject,
        htmlContent: htmlContent,
      );

      if (ok) {
        sent++;
      } else {
        failed++;
        failedEmails.add(r.email);
      }

      onProgress?.call(i + 1, recipients.length);

      // Pequeña pausa de 60ms para no saturar rate limits
      if (i < recipients.length - 1) {
        await Future.delayed(const Duration(milliseconds: 60));
      }
    }

    return BrevoSendResult(
      success: sent > 0,
      sentCount: sent,
      failedCount: failed,
      failedEmails: failedEmails,
    );
  }

  // ===========================================================================
  // NOTIFICACIONES AUTOMÁTICAS DE CANCELACIÓN
  // ===========================================================================

  /// Envía notificación de cancelación urgente al conductor con letras grandes
  static Future<bool> sendCancellationAlertToDriver({
    required String driverEmail,
    required String driverName,
    required String tripId,
    required String passengerName,
    required String origin,
    required String destination,
    required String cancelReason,
    double? fare,
  }) async {
    final shortTripId = tripId.length > 8 ? tripId.substring(0, 8) : tripId;
    final subject = 'URGENTE: VIAJE CANCELADO POR EL PASAJERO - Folio #$shortTripId';

    final html = '''
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Viaje Cancelado</title>
</head>
<body style="margin: 0; padding: 16px; background-color: #F3F4F6; font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;">
  <div style="max-width: 600px; margin: 0 auto; background-color: #FFFFFF; border-radius: 16px; overflow: hidden; border: 3px solid #DC2626; box-shadow: 0 10px 25px rgba(0,0,0,0.15);">
    
    <!-- Encabezado de Urgencia -->
    <div style="background-color: #DC2626; padding: 26px 20px; text-align: center;">
      <h1 style="color: #FFFFFF; font-size: 32px; font-weight: 900; margin: 0; letter-spacing: 1px; text-transform: uppercase;">
        VIAJE CANCELADO
      </h1>
      <p style="color: #FEE2E2; font-size: 20px; font-weight: bold; margin: 8px 0 0 0;">
        NO ACUDAS AL PUNTO DE RECOGIDA
      </p>
    </div>

    <!-- Cuerpo principal con letras grandes -->
    <div style="padding: 28px 24px;">
      
      <p style="font-size: 22px; color: #111827; font-weight: bold; margin: 0 0 14px 0;">
        Hola $driverName,
      </p>

      <div style="background-color: #FEF2F2; border-left: 6px solid #DC2626; padding: 18px 20px; margin-bottom: 24px; border-radius: 8px;">
        <p style="font-size: 20px; color: #991B1B; font-weight: 800; margin: 0; line-height: 1.4;">
          El pasajero <span style="text-decoration: underline;">$passengerName</span> ha cancelado el servicio que habias aceptado.
        </p>
      </div>

      <div style="background-color: #F9FAFB; border: 2px solid #E5E7EB; border-radius: 12px; padding: 20px; margin-bottom: 24px;">
        <h3 style="font-size: 19px; color: #111827; margin: 0 0 14px 0; border-bottom: 2px solid #E5E7EB; padding-bottom: 8px;">
          DETALLES DEL VIAJE CANCELADO:
        </h3>
        <p style="font-size: 18px; color: #374151; margin: 10px 0;">
          <strong>- Pasajero:</strong> <span style="color: #111827;">$passengerName</span>
        </p>
        <p style="font-size: 18px; color: #374151; margin: 10px 0;">
          <strong>- Motivo:</strong> <span style="color: #DC2626; font-weight: bold;">$cancelReason</span>
        </p>
        <p style="font-size: 18px; color: #374151; margin: 10px 0;">
          <strong>- Origen:</strong> $origin
        </p>
        <p style="font-size: 18px; color: #374151; margin: 10px 0;">
          <strong>- Destino:</strong> $destination
        </p>
        <p style="font-size: 18px; color: #374151; margin: 10px 0;">
          <strong>- Folio:</strong> #$shortTripId
        </p>
      </div>

      <!-- Banner de Liberacion Verde -->
      <div style="background-color: #ECFDF5; border: 2px solid #10B981; border-radius: 12px; padding: 18px 20px; text-align: center;">
        <p style="font-size: 20px; color: #065F46; font-weight: 900; margin: 0; line-height: 1.4;">
          TU VEHICULO HA SIDO LIBERADO EN LA APP PARA TOMAR NUEVOS VIAJES.
        </p>
      </div>

      <p style="font-size: 15px; color: #6B7280; text-align: center; margin: 24px 0 0 0;">
        TaxiSeguro Oficial - Soporte y Operaciones
      </p>

    </div>
  </div>
</body>
</html>
''';

    return await sendSingleEmail(
      toEmail: driverEmail,
      toName: driverName,
      subject: subject,
      htmlContent: html,
    );
  }

  /// Envia un reporte completo de cancelacion a todos los Super Administradores
  static Future<void> sendCancellationAlertToAdmins({
    required String tripId,
    required String cancelledByRole, // 'Pasajero' o 'Conductor' o 'Sistema'
    required String cancelReason,
    required String previousStatus,
    String? passengerName,
    String? passengerPhone,
    String? passengerEmail,
    String? driverName,
    String? driverPhone,
    String? driverEmail,
    String? driverPlates,
    String? driverVehicle,
    String? origin,
    String? destination,
    double? fare,
    String? driverCancellationAddress,
    String? staticMapUrl,
    dynamic driverLocation, // LatLng
  }) async {
    try {
      // 1. Lista de correos de Super Administradores
      final Set<String> adminEmails = {
        'vidalcavazos@gmail.com',
        'ric55laz@hotmail.com',
        'admin@taxiseguro.net',
      };

      try {
        final supabase = Supabase.instance.client;
        final res = await supabase
            .from('users')
            .select('correo')
            .eq('isAdmin', true);

        for (var row in (res as List<dynamic>)) {
          final email = (row['correo'] as String?)?.trim();
          if (email != null && email.contains('@')) {
            adminEmails.add(email);
          }
        }
      } catch (e) {
        print('Error consultando admins en Supabase: $e');
      }

      final shortTripId = tripId.length > 8 ? tripId.substring(0, 8) : tripId;
      final subject = '[ALERTA CANCELACION] Viaje #$shortTripId cancelado por $cancelledByRole';
      final nowStr = DateTime.now().toLocal().toString().split('.').first;

      final html = '''
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Alerta de Cancelacion</title>
</head>
<body style="margin: 0; padding: 16px; background-color: #F8F9FA; font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;">
  <div style="max-width: 620px; margin: 0 auto; background-color: #FFFFFF; border-radius: 16px; overflow: hidden; border: 1px solid #E5E7EB; box-shadow: 0 4px 12px rgba(0,0,0,0.06);">
    
    <!-- Header -->
    <div style="background-color: #000000; padding: 22px 24px; text-align: center;">
      <h2 style="color: #FFFFFF; font-size: 20px; font-weight: 800; margin: 0; letter-spacing: 1.5px;">
        TAXISEGURO - MONITOR DE CANCELACIONES
      </h2>
      <p style="color: #EF4444; font-size: 15px; font-weight: bold; margin: 6px 0 0 0;">
        Notificacion para Super Administradores
      </p>
    </div>

    <div style="padding: 24px;">

      <!-- Banner de situacion -->
      <div style="background-color: #FEF2F2; border: 1px solid #FCA5A5; border-radius: 12px; padding: 16px; margin-bottom: 20px;">
        <h3 style="color: #991B1B; font-size: 17px; margin: 0 0 8px 0; font-weight: bold;">
          Situacion: Viaje cancelado por $cancelledByRole
        </h3>
        <p style="color: #374151; font-size: 14px; margin: 4px 0;">
          <strong>- Motivo:</strong> <span style="color: #B91C1C; font-weight: 600;">$cancelReason</span>
        </p>
        <p style="color: #374151; font-size: 14px; margin: 4px 0;">
          <strong>- Estado anterior del viaje:</strong> $previousStatus
        </p>
        <p style="color: #374151; font-size: 14px; margin: 4px 0;">
          <strong>- Fecha y hora:</strong> $nowStr
        </p>
        <p style="color: #374151; font-size: 14px; margin: 4px 0;">
          <strong>- Folio del viaje:</strong> #$tripId
        </p>
      </div>

      <!-- Datos del Pasajero -->
      <div style="background-color: #F9FAFB; border: 1px solid #E5E7EB; border-radius: 12px; padding: 16px; margin-bottom: 16px;">
        <h4 style="color: #111827; font-size: 15px; margin: 0 0 10px 0; border-bottom: 1px solid #E5E7EB; padding-bottom: 6px;">
          DATOS DEL PASAJERO
        </h4>
        <p style="font-size: 14px; color: #374151; margin: 4px 0;"><strong>Nombre:</strong> ${passengerName ?? 'No disponible'}</p>
        <p style="font-size: 14px; color: #374151; margin: 4px 0;"><strong>Telefono:</strong> ${passengerPhone ?? 'No disponible'}</p>
        <p style="font-size: 14px; color: #374151; margin: 4px 0;"><strong>Correo:</strong> ${passengerEmail ?? 'No disponible'}</p>
      </div>

      <!-- Datos del Conductor -->
      <div style="background-color: #F9FAFB; border: 1px solid #E5E7EB; border-radius: 12px; padding: 16px; margin-bottom: 16px;">
        <h4 style="color: #111827; font-size: 15px; margin: 0 0 10px 0; border-bottom: 1px solid #E5E7EB; padding-bottom: 6px;">
          DATOS DEL CONDUCTOR
        </h4>
        <p style="font-size: 14px; color: #374151; margin: 4px 0;"><strong>Nombre:</strong> ${driverName ?? 'Sin conductor asignado aun'}</p>
        <p style="font-size: 14px; color: #374151; margin: 4px 0;"><strong>Telefono:</strong> ${driverPhone ?? 'N/A'}</p>
        <p style="font-size: 14px; color: #374151; margin: 4px 0;"><strong>Correo:</strong> ${driverEmail ?? 'N/A'}</p>
        <p style="font-size: 14px; color: #374151; margin: 4px 0;"><strong>Vehiculo / Placas:</strong> ${driverVehicle ?? ''} ${driverPlates != null ? '($driverPlates)' : ''}</p>
      </div>

      ${(cancelledByRole == 'Conductor' && (driverCancellationAddress != null || driverLocation != null)) ? '''
      <!-- Lugar exacto donde cancelo el conductor -->
      <div style="background-color: #FEF2F2; border: 2px solid #EF4444; border-radius: 12px; padding: 16px; margin-bottom: 16px;">
        <h4 style="color: #991B1B; font-size: 15px; margin: 0 0 8px 0; font-weight: 800; text-transform: uppercase;">
          LUGAR EXACTO DONDE CANCELO EL CONDUCTOR
        </h4>
        <p style="font-size: 15px; color: #111827; font-weight: bold; margin: 0 0 4px 0;">
          ${driverCancellationAddress ?? 'Ubicacion GPS registrada'}
        </p>
        ${driverLocation != null ? '<p style="font-size: 12px; color: #6B7280; margin: 0;">Coordenadas GPS: ${driverLocation.latitude.toStringAsFixed(5)}, ${driverLocation.longitude.toStringAsFixed(5)}</p>' : ''}
      </div>
      ''' : ''}

      ${(staticMapUrl != null && staticMapUrl.isNotEmpty) ? '''
      <!-- Captura del Mapa del Trayecto y Cancelacion -->
      <div style="background-color: #FFFFFF; border: 1px solid #E5E7EB; border-radius: 12px; padding: 16px; margin-bottom: 16px; text-align: center;">
        <h4 style="color: #111827; font-size: 15px; margin: 0 0 12px 0; text-align: left; font-weight: bold;">
          CAPTURA DEL MAPA: TRAYECTO DE INICIO A FIN
        </h4>
        <img src="$staticMapUrl" alt="Mapa del Trayecto de Inicio a Fin" style="width: 100%; max-width: 580px; height: auto; border-radius: 10px; border: 1px solid #D1D5DB; display: block; margin: 0 auto;" />
        <div style="margin-top: 10px; font-size: 12px; color: #4B5563; text-align: center;">
          <strong>Pin A:</strong> Punto de Inicio &nbsp;&nbsp;|&nbsp;&nbsp;
          ${driverLocation != null ? '<strong>Auto:</strong> Donde cancelo el conductor &nbsp;&nbsp;|&nbsp;&nbsp;' : ''}
          <strong>Pin B:</strong> Destino Final
        </div>
      </div>
      ''' : ''}

      <!-- Ruta y Tarifa -->
      <div style="background-color: #F9FAFB; border: 1px solid #E5E7EB; border-radius: 12px; padding: 16px; margin-bottom: 16px;">
        <h4 style="color: #111827; font-size: 15px; margin: 0 0 10px 0; border-bottom: 1px solid #E5E7EB; padding-bottom: 6px;">
          TRAYECTO Y TARIFA
        </h4>
        <p style="font-size: 14px; color: #374151; margin: 4px 0;"><strong>Origen:</strong> ${origin ?? 'N/A'}</p>
        <p style="font-size: 14px; color: #374151; margin: 4px 0;"><strong>Destino:</strong> ${destination ?? 'N/A'}</p>
        <p style="font-size: 14px; color: #374151; margin: 4px 0;"><strong>Tarifa estimada:</strong> \$${fare?.toStringAsFixed(2) ?? '0.00'} MXN</p>
      </div>

      <p style="font-size: 12px; color: #9CA3AF; text-align: center; margin-top: 20px;">
        Este es un reporte automático generado por la plataforma TaxiSeguro al detectarse una cancelación de viaje.
      </p>

    </div>
  </div>
</body>
</html>
''';

      for (final adminEmail in adminEmails) {
        await sendSingleEmail(
          toEmail: adminEmail,
          toName: 'Super Administrador',
          subject: subject,
          htmlContent: html,
        );
      }
    } catch (e) {
      print('Error enviando alerta de cancelación a super admins: $e');
    }
  }

  // ===========================================================================
  // NOTIFICACIONES DE NUEVO VIAJE CERCANO (CONDUCTORES Y PASAJERO)
  // ===========================================================================

  /// Envia correo de alerta a cada conductor activo dentro del radio de 5 km
  static Future<bool> sendNewTripAlertToDriverEmail({
    required String driverEmail,
    required String driverName,
    required String tripId,
    required String origin,
    required String destination,
    String? passengerName,
    double? fare,
    double? distanceFromDriverKm,
  }) async {
    final cleanEmail = driverEmail.trim();
    if (cleanEmail.isEmpty || !cleanEmail.contains('@')) return false;

    final shortId = tripId.length > 8 ? tripId.substring(0, 8) : tripId;
    final distText = distanceFromDriverKm != null
        ? 'a ${distanceFromDriverKm.toStringAsFixed(1)} km de tu ubicacion'
        : 'cerca de tu ubicacion';
    final fareText = fare != null ? '\$${fare.toStringAsFixed(2)} MXN' : 'Por calcular';
    final pName = (passengerName != null && passengerName.trim().isNotEmpty)
        ? passengerName.trim()
        : 'Pasajero TaxiSeguro';

    final subject = 'Nuevo Viaje Cercano ($distText) - Folio #$shortId';
    final message = '''
Tienes una nueva solicitud de viaje disponible <strong>$distText</strong>.<br><br>
<div style="background-color: #F9FAFB; border: 1px solid #E5E7EB; border-left: 5px solid #C7FF2E; border-radius: 12px; padding: 16px; margin: 12px 0;">
  <p style="margin: 6px 0; font-size: 15px; color: #111827;"><strong>Pasajero:</strong> $pName</p>
  <p style="margin: 6px 0; font-size: 15px; color: #111827;"><strong>Punto de recogida:</strong> $origin</p>
  <p style="margin: 6px 0; font-size: 15px; color: #111827;"><strong>Destino:</strong> $destination</p>
  <p style="margin: 6px 0; font-size: 16px; color: #111827;"><strong>Tarifa estimada:</strong> <span style="background-color: #121212; color: #C7FF2E; padding: 2px 8px; border-radius: 6px; font-weight: bold;">$fareText</span></p>
  <p style="margin: 6px 0; font-size: 13px; color: #6B7280;"><strong>Folio:</strong> #$shortId</p>
</div>
Abre la aplicacion de <strong>TaxiSeguro</strong> ahora mismo para ver el viaje en tu mapa y aceptarlo.
''';

    final html = buildHtmlTemplate(
      title: 'Nuevo Viaje Cercano Solicitado',
      recipientName: driverName,
      message: message,
    );

    return await sendSingleEmail(
      toEmail: cleanEmail,
      toName: driverName,
      subject: subject,
      htmlContent: html,
    );
  }

  /// Envia correo de confirmacion al pasajero cuando solicita un viaje y se alerta a conductores cercanos
  static Future<bool> sendNewTripConfirmationToPassengerEmail({
    required String passengerEmail,
    required String passengerName,
    required String tripId,
    required String origin,
    required String destination,
    double? fare,
    int nearbyDriversCount = 0,
  }) async {
    final cleanEmail = passengerEmail.trim();
    if (cleanEmail.isEmpty || !cleanEmail.contains('@')) return false;

    final shortId = tripId.length > 8 ? tripId.substring(0, 8) : tripId;
    final fareText = fare != null ? '\$${fare.toStringAsFixed(2)} MXN' : 'Por calcular';
    final driversNote = nearbyDriversCount > 0
        ? 'Hemos notificado a <strong>$nearbyDriversCount conductor(es) cercano(s)</strong> en un radio de 5 km de tu punto de partida.'
        : 'Estamos notificando a las unidades activas cercanas a tu punto de partida.';

    final subject = 'Solicitud de Viaje Recibida - Buscando Conductor (#$shortId)';
    final message = '''
Tu solicitud de viaje ha sido registrada con exito. $driversNote<br><br>
<div style="background-color: #F9FAFB; border: 1px solid #E5E7EB; border-left: 5px solid #121212; border-radius: 12px; padding: 16px; margin: 12px 0;">
  <p style="margin: 6px 0; font-size: 15px; color: #111827;"><strong>Punto de recogida:</strong> $origin</p>
  <p style="margin: 6px 0; font-size: 15px; color: #111827;"><strong>Destino:</strong> $destination</p>
  <p style="margin: 6px 0; font-size: 16px; color: #111827;"><strong>Tarifa estimada:</strong> <strong>$fareText</strong></p>
  <p style="margin: 6px 0; font-size: 13px; color: #6B7280;"><strong>Folio de viaje:</strong> #$shortId</p>
</div>
En cuanto un conductor acepte tu solicitud, recibiras una notificacion con su nombre, vehiculo y tu codigo PIN de seguridad.
''';

    final html = buildHtmlTemplate(
      title: 'Buscando tu Conductor Cercano',
      recipientName: passengerName,
      message: message,
    );

    return await sendSingleEmail(
      toEmail: cleanEmail,
      toName: passengerName,
      subject: subject,
      htmlContent: html,
    );
  }
}

