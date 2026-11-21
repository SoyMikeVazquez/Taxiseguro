import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:supabase_flutter/supabase_flutter.dart';
import '../env/env.dart';

class WhatsAppService {
  static const String _defaultToken = Env.whatsappToken;
  static const String _defaultPhoneNumberId = Env.whatsappPhoneNumberId;
  static const String _apiVersion = 'v21.0';

  /// Limpia y formatea números de teléfono para la API de WhatsApp (Meta Cloud API).
  /// - Elimina cualquier caracter no numérico (espacios, guiones, paréntesis, símbolos).
  /// - Remueve prefijos antiguos de marcación en México (044, 045, 01).
  /// - Si tiene 10 dígitos (el estándar en México: 967 XXX XXXX), le antepone '521' (código país + móvil).
  /// - Si tiene 12 dígitos e inicia con '52', le inserta el '1' móvil -> '521XXXXXXXXXX'.
  /// - Si ya viene con '521', lo mantiene intacto.
  /// - Si es un número internacional válido, conserva sus dígitos limpios con código de país.
  static String formatPhone(String phone) {
    String cleaned = phone.replaceAll(RegExp(r'\D'), '');

    // Eliminar prefijos antiguos de telefonía mexicana si existen
    if (cleaned.length == 13 && (cleaned.startsWith('044') || cleaned.startsWith('045'))) {
      cleaned = cleaned.substring(3);
    } else if (cleaned.length == 12 && cleaned.startsWith('01')) {
      cleaned = cleaned.substring(2);
    }

    // 1. Número local de México a 10 dígitos (ej. 967 123 4567, 55 1234 5678)
    if (cleaned.length == 10) {
      return '521$cleaned';
    }

    // 2. Número con lada México pero sin prefijo móvil (12 dígitos: 52 967 123 4567)
    if (cleaned.length == 12 && cleaned.startsWith('52')) {
      return '521${cleaned.substring(2)}';
    }

    // 3. Número ya formateado con 521 (13 dígitos: 521 967 123 4567)
    if (cleaned.length == 13 && cleaned.startsWith('521')) {
      return cleaned;
    }

    // 4. Internacional o formato directo
    return cleaned;
  }

  /// Obtiene las credenciales de WhatsApp (Token y Phone ID).
  /// Primero consulta la tabla Secrets de Supabase por si se actualizaron dinámicamente,
  /// y si no están configuradas, utiliza las credenciales fijadas en Env.
  static Future<Map<String, String>> getWhatsAppSecrets() async {
    final Map<String, String> secrets = {
      'whatsapp_token': _defaultToken,
      'whatsapp_phone_number_id': _defaultPhoneNumberId,
    };

    try {
      final response = await Supabase.instance.client
          .from('Secrets')
          .select('key, value')
          .inFilter('key', ['whatsapp_token', 'whatsapp_phone_number_id', 'whatsapp_use_default'])
          .timeout(const Duration(seconds: 3));

      String? token;
      String? phoneId;
      bool useDefault = true;

      for (var row in response) {
        final key = row['key'] as String;
        final val = row['value'] as String? ?? '';
        if (key == 'whatsapp_use_default') {
          useDefault = val == 'true';
        } else if (key == 'whatsapp_token') {
          token = val;
        } else if (key == 'whatsapp_phone_number_id') {
          phoneId = val;
        }
      }

      if (!useDefault && token != null && token.trim().isNotEmpty && phoneId != null && phoneId.trim().isNotEmpty) {
        secrets['whatsapp_token'] = token.trim();
        secrets['whatsapp_phone_number_id'] = phoneId.trim();
      }
    } catch (e) {
      debugPrint('WhatsAppService: Usando credenciales locales de Env: $e');
    }

    return secrets;
  }

  /// Envía un mensaje de texto formateado por WhatsApp a través de la API oficial de Meta Graph
  static Future<bool> sendMessage({
    required String toPhone,
    required String message,
  }) async {
    try {
      if (toPhone.trim().isEmpty) {
        debugPrint('WhatsAppService: Número de teléfono vacío, omitiendo envío.');
        return false;
      }

      final secrets = await getWhatsAppSecrets();
      final token = secrets['whatsapp_token'];
      final phoneId = secrets['whatsapp_phone_number_id'];

      if (token == null || token.isEmpty || phoneId == null || phoneId.isEmpty) {
        debugPrint('WhatsAppService: Credenciales de WhatsApp no disponibles.');
        return false;
      }

      final formattedPhone = formatPhone(toPhone);
      final uri = Uri.parse('https://graph.facebook.com/$_apiVersion/$phoneId/messages');

      final body = {
        "messaging_product": "whatsapp",
        "recipient_type": "individual",
        "to": formattedPhone,
        "type": "text",
        "text": {
          "preview_url": false,
          "body": message,
        }
      };

      final response = await http.post(
        uri,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(body),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        debugPrint('WhatsAppService: Mensaje enviado exitosamente a $formattedPhone');
        return true;
      } else {
        debugPrint('WhatsAppService: Error al enviar WhatsApp (${response.statusCode}): ${response.body}');
        return false;
      }
    } catch (e) {
      debugPrint('WhatsAppService: Excepción al enviar mensaje de WhatsApp: $e');
      return false;
    }
  }

  /// Envía una plantilla oficial de WhatsApp aprobada por Meta (Requerida para mensajes salientes sin ventana previa)
  static Future<bool> sendTemplateMessage({
    required String toPhone,
    required String templateName,
    String languageCode = 'es_MX',
    List<String> bodyParameters = const [],
  }) async {
    try {
      if (toPhone.trim().isEmpty) {
        return false;
      }

      final secrets = await getWhatsAppSecrets();
      final token = secrets['whatsapp_token'];
      final phoneId = secrets['whatsapp_phone_number_id'];

      if (token == null || token.isEmpty || phoneId == null || phoneId.isEmpty) {
        return false;
      }

      final formattedPhone = formatPhone(toPhone);
      final uri = Uri.parse('https://graph.facebook.com/$_apiVersion/$phoneId/messages');

      final Map<String, dynamic> templatePayload = {
        'name': templateName,
        'language': {'code': languageCode},
      };

      if (bodyParameters.isNotEmpty) {
        templatePayload['components'] = [
          {
            'type': 'body',
            'parameters': bodyParameters.map((p) => {'type': 'text', 'text': p}).toList(),
          }
        ];
      }

      final body = {
        'messaging_product': 'whatsapp',
        'recipient_type': 'individual',
        'to': formattedPhone,
        'type': 'template',
        'template': templatePayload,
      };

      final response = await http.post(
        uri,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(body),
      );

      return response.statusCode == 200 || response.statusCode == 201;
    } catch (e) {
      debugPrint('WhatsAppService: Excepción al enviar plantilla de WhatsApp: $e');
      return false;
    }
  }

  /// Limpia y adapta el texto de parámetros para plantillas de Meta
  /// Meta prohíbe saltos de línea (\n), tabuladores (\t) o más de 4 espacios consecutivos en parámetros de plantilla.
  static String _cleanTemplateText(String text) {
    return text
        .replaceAll('\r\n', '. ')
        .replaceAll('\n', '. ')
        .replaceAll('\r', '. ')
        .replaceAll('\t', ' ')
        .replaceAll(RegExp(r'\s*\.\s*\.'), '.')
        .replaceAll(RegExp(r'\s{2,}'), ' ')
        .trim();
  }

  /// Envía la plantilla universal generalista configurada en Meta
  /// con las variables {{nombre}} y {{contenido_id}}
  static Future<bool> sendUniversalTemplateNotification({
    required String toPhone,
    required String templateName,
    required String recipientName,
    required String notificationContent,
    String languageCode = 'es_MX',
  }) async {
    try {
      if (toPhone.trim().isEmpty) return false;

      final secrets = await getWhatsAppSecrets();
      final token = secrets['whatsapp_token'];
      final phoneId = secrets['whatsapp_phone_number_id'];

      if (token == null || token.isEmpty || phoneId == null || phoneId.isEmpty) {
        return false;
      }

      final formattedPhone = formatPhone(toPhone);
      final uri = Uri.parse('https://graph.facebook.com/$_apiVersion/$phoneId/messages');

      final cleanName = _cleanTemplateText(recipientName);
      final cleanContent = _cleanTemplateText(notificationContent);

      // Envío usando parámetros posicionales {{1}} y {{2}} configurados en la plantilla
      final body = {
        'messaging_product': 'whatsapp',
        'recipient_type': 'individual',
        'to': formattedPhone,
        'type': 'template',
        'template': {
          'name': templateName,
          'language': {'code': languageCode},
          'components': [
            {
              'type': 'body',
              'parameters': [
                {'type': 'text', 'text': cleanName},
                {'type': 'text', 'text': cleanContent},
              ],
            }
          ],
        },
      };

      final response = await http.post(
        uri,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(body),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        debugPrint('WhatsAppService: Plantilla universal enviada exitosamente a $formattedPhone');
        return true;
      } else {
        debugPrint('WhatsAppService: Error al enviar plantilla universal (${response.statusCode}): ${response.body}');
        return false;
      }
    } catch (e) {
      debugPrint('WhatsAppService: Excepción al enviar plantilla universal: $e');
      return false;
    }
  }

  /// Envía notificaciones de forma inteligente:
  /// 1. Intenta enviar mediante la plantilla oficial 'notificacion_servicio' (aprobada por Meta).
  /// 2. Si la plantilla aún está en revisión o falla, recurre al envío de texto directo.
  static Future<bool> sendSmartNotification({
    required String toPhone,
    required String recipientName,
    required String message,
  }) async {
    // 1. Intento con la plantilla generalista
    final templateOk = await sendUniversalTemplateNotification(
      toPhone: toPhone,
      templateName: 'notificacion_servicio',
      recipientName: recipientName,
      notificationContent: message,
      languageCode: 'es_MX',
    );
    if (templateOk) return true;

    // 2. Si no, envío directo
    return await sendMessage(toPhone: toPhone, message: message);
  }

  /// 0. Notificacion por WhatsApp a Conductores Cercanos (radio de 5 km) cuando un pasajero solicita un viaje
  static Future<bool> sendNewTripAlertToDriverWhatsApp({
    required String driverPhone,
    required String driverName,
    required String tripId,
    required String origin,
    required String destination,
    double? fare,
    double? distanceFromDriverKm,
  }) async {
    final fareStr = fare != null ? '\$${fare.toStringAsFixed(2)} MXN' : 'Por calcular';
    final distStr = distanceFromDriverKm != null
        ? ' (a ${distanceFromDriverKm.toStringAsFixed(1)} km de tu ubicacion)'
        : ' (a menos de 5 km de tu ubicacion)';

    final message = '''
*NUEVO VIAJE SOLICITADO CERCA DE TI*
*TaxiSeguro Oficial*

Hola *$driverName*, hay un pasajero solicitando un servicio$distStr:

- *Punto de recogida:* $origin
- *Destino:* $destination
- *Tarifa estimada:* $fareStr

_Abre la aplicacion de TaxiSeguro ahora mismo para ver el mapa y aceptar el viaje._
''';

    return await sendSmartNotification(
      toPhone: driverPhone,
      recipientName: driverName,
      message: message.trim(),
    );
  }

  /// 1. Notificacion al Pasajero: Conductor Asignado y en camino
  static Future<bool> sendTripAssignedWhatsApp({
    required String passengerPhone,
    required String passengerName,
    required String driverName,
    required String vehicleInfo,
    required String plateNumber,
    required String origin,
    required String destination,
    required double fare,
    int? pinCode,
  }) async {
    final pinStr = pinCode != null ? '\n*Tu PIN de Viaje:* `${pinCode.toString().padLeft(5, '0')}`' : '';
    final message = '''
*TU CONDUCTOR VA EN CAMINO*
*TaxiSeguro Oficial*

Hola *$passengerName*, un conductor ha aceptado tu viaje:

*Conductor:* $driverName
*Vehiculo:* $vehicleInfo
*Placas:* $plateNumber$pinStr

*Punto de recogida:* $origin
*Destino:* $destination
*Tarifa estimada:* \$${fare.toStringAsFixed(2)} MXN

_Tu taxi ya va en ruta a tu ubicacion. Por favor mantente atento en el punto de encuentro._
''';

    return await sendSmartNotification(
      toPhone: passengerPhone,
      recipientName: passengerName,
      message: message.trim(),
    );
  }

  /// 2. Notificacion al Pasajero: El Conductor ha llegado al punto de recogida
  static Future<bool> sendDriverArrivedWhatsApp({
    required String passengerPhone,
    required String passengerName,
    required String driverName,
    required String vehicleInfo,
    required String plateNumber,
    required String origin,
    int? pinCode,
  }) async {
    final pinText = pinCode != null
        ? '\n*PIN DE ABORDAJE SEGURO:* `${pinCode.toString().padLeft(5, '0')}`\n_(Mencionaselo a tu conductor para iniciar el viaje)_'
        : '';

    final message = '''
*TU TAXI HA LLEGADO*
*TaxiSeguro Oficial*

Hola *$passengerName*, tu taxi ya te esta esperando afuera:

*Vehiculo:* $vehicleInfo
*Placas:* $plateNumber
*Conductor:* $driverName$pinText
*Lugar:* $origin

_Cuentas con 7 minutos de cortesia para abordar la unidad. Buen viaje._
''';

    return await sendSmartNotification(
      toPhone: passengerPhone,
      recipientName: passengerName,
      message: message.trim(),
    );
  }

  /// 3. Comprobante Oficial de Viaje (Recibo Digital de TaxiSeguro)
  static Future<bool> sendTripReceiptWhatsApp({
    required String passengerPhone,
    required String passengerName,
    required String tripId,
    required String driverName,
    required String origin,
    required String destination,
    required double fare,
    double? distanceKm,
    String paymentMethod = 'Efectivo',
  }) async {
    final shortTripId = tripId.length > 8 ? tripId.substring(0, 8) : tripId;
    final dateStr = DateTime.now().toLocal().toString().substring(0, 16);
    final distStr = distanceKm != null ? '- *Distancia recorrida:* ${distanceKm.toStringAsFixed(1)} KM\n' : '';

    final message = '''
*COMPROBANTE DE VIAJE - TAXISEGURO*

Gracias por viajar con nosotros, *$passengerName*.

*Detalles del Servicio:*
- *Folio:* #$shortTripId
- *Fecha:* $dateStr
- *Conductor:* $driverName
- *Origen:* $origin
- *Destino:* $destination
$distStr- *Metodo de pago:* ${paymentMethod.toUpperCase()}
-----------------------------------
*Total Pagado:* *\$${fare.toStringAsFixed(2)} MXN*

_TaxiSeguro. Tu seguridad y comodidad en cada trayecto._
''';

    return await sendSmartNotification(
      toPhone: passengerPhone,
      recipientName: passengerName,
      message: message.trim(),
    );
  }

  /// 4. Alerta de Cancelacion de Viaje por WhatsApp
  static Future<bool> sendTripCancelledWhatsApp({
    required String toPhone,
    required String recipientName,
    required String tripId,
    required String cancelledByRole,
    required String cancelReason,
    required String origin,
    required String destination,
  }) async {
    final shortTripId = tripId.length > 8 ? tripId.substring(0, 8) : tripId;

    final message = '''
*AVISO DE CANCELACION - TAXISEGURO*

Hola *$recipientName*, te informamos que el viaje #$shortTripId ha sido cancelado por $cancelledByRole.

- *Motivo:* $cancelReason
- *Origen:* $origin
- *Destino:* $destination

_Tu cuenta ya se encuentra disponible para solicitar un nuevo servicio en la app._
''';

    return await sendSmartNotification(
      toPhone: toPhone,
      recipientName: recipientName,
      message: message.trim(),
    );
  }

  /// 5. Alerta URGENTE de Cancelacion para el CONDUCTOR (con letras grandes / no acudir)
  static Future<bool> sendCancellationAlertToDriverWhatsApp({
    required String driverPhone,
    required String driverName,
    required String tripId,
    required String passengerName,
    required String origin,
    required String destination,
    required String cancelReason,
  }) async {
    final shortTripId = tripId.length > 8 ? tripId.substring(0, 8) : tripId;

    final message = '''
*URGENTE: VIAJE CANCELADO POR EL PASAJERO*
*NO ACUDAS AL PUNTO DE RECOGIDA*

Hola *$driverName*, el pasajero *$passengerName* ha cancelado el servicio que habias aceptado:

- *Folio:* #$shortTripId
- *Motivo de cancelacion:* $cancelReason
- *Origen:* $origin
- *Destino:* $destination

*TU UNIDAD HA SIDO LIBERADA:* Ya estas activo y disponible en la app para tomar nuevos viajes.
''';

    return await sendSmartNotification(
      toPhone: driverPhone,
      recipientName: driverName,
      message: message.trim(),
    );
  }

  /// 6. Alerta de Cancelacion para Super Administradores
  static Future<void> sendCancellationAlertToAdminsWhatsApp({
    required String tripId,
    required String cancelledByRole,
    required String cancelReason,
    required String previousStatus,
    String? passengerName,
    String? passengerPhone,
    String? driverName,
    String? driverPhone,
    String? origin,
    String? destination,
    double? fare,
    String? driverCancellationAddress,
  }) async {
    try {
      final shortTripId = tripId.length > 8 ? tripId.substring(0, 8) : tripId;
      final nowStr = DateTime.now().toLocal().toString().substring(0, 16);

      String addressExtra = '';
      if (cancelledByRole.toLowerCase().contains('conductor') && driverCancellationAddress != null) {
        addressExtra = '\n*Lugar donde cancelo conductor:* $driverCancellationAddress';
      }

      final message = '''
*[MONITOR ADMIN] VIAJE CANCELADO*
*Folio:* #$shortTripId | $nowStr

*Cancelado por:* $cancelledByRole
- *Motivo:* $cancelReason
- *Estado previo:* $previousStatus$addressExtra

*Pasajero:* ${passengerName ?? 'N/A'} (${passengerPhone ?? 'Sin tel'})
*Conductor:* ${driverName ?? 'Sin asignar'} (${driverPhone ?? 'Sin tel'})
*Ruta:* ${origin ?? 'N/A'} -> ${destination ?? 'N/A'}
*Tarifa:* \$${fare?.toStringAsFixed(2) ?? '0.00'} MXN
''';

      // Administradores destinatarios
      final Set<String> adminPhones = {
        '5519553555', // Admin Mike / Test
        '8123456789', // Vidal Cavazos
        '9671511860', // Ricardo Lazos
      };

      try {
        final res = await Supabase.instance.client
            .from('users')
            .select('telefono')
            .or('isAdmin.eq.true,isadmin.eq.true');
        for (var row in (res as List<dynamic>)) {
          final phone = (row['telefono'] as String?)?.trim();
          if (phone != null && phone.isNotEmpty) {
            adminPhones.add(phone);
          }
        }
      } catch (_) {}

      for (final phone in adminPhones) {
        await sendSmartNotification(
          toPhone: phone,
          recipientName: 'Administrador',
          message: message.trim(),
        );
      }
    } catch (e) {
      debugPrint('WhatsAppService: Error enviando alerta admin: $e');
    }
  }
}
