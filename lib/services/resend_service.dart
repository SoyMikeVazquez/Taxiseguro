import 'dart:convert';
import 'package:http/http.dart' as http;
import '../env/env.dart';

class ResendService {
  static const String _baseUrl = 'https://api.resend.com/emails';
  
  /// Enviar un correo electrónico usando la API de Resend.
  /// Retorna true si fue exitoso, false si hubo un error.
  static Future<bool> sendEmail({
    required String to,
    required String subject,
    required String htmlContent,
    String from = 'Taxiseguro <admin@taxiseguro.net>', // Asegúrate de usar un dominio verificado en Resend
  }) async {
    try {
      final response = await http.post(
        Uri.parse(_baseUrl),
        headers: {
          'Authorization': 'Bearer ${Env.resendApiKey}',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'from': from,
          'to': [to],
          'subject': subject,
          'html': htmlContent,
        }),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      } else {
        print('Error enviando email con Resend: ${response.body}');
        return false;
      }
    } catch (e) {
      print('Excepción enviando email: $e');
      return false;
    }
  }

  /// Plantilla predefinida para notificar al pasajero de un cambio de estatus
  static Future<bool> notifyPassengerTripStatus({
    required String passengerEmail,
    required String passengerName,
    required String driverName,
    required String status,
  }) async {
    String subject = 'Actualización de tu viaje en Taxiseguro';
    String message = '';

    if (status == 'aceptado') {
      subject = '¡Tu viaje ha sido aceptado!';
      message = 'El conductor <b>$driverName</b> está en camino a tu ubicación.';
    } else if (status == 'en camino') {
      subject = 'Tu conductor ha llegado';
      message = 'El conductor <b>$driverName</b> ha llegado y te está esperando.';
    } else if (status == 'iniciado') {
      subject = 'Viaje iniciado';
      message = 'Tu viaje con <b>$driverName</b> ha comenzado. ¡Que tengas un viaje seguro!';
    } else if (status == 'finalizado' || status == 'completed') {
      subject = 'Viaje finalizado';
      message = 'Has llegado a tu destino. Gracias por viajar con Taxiseguro.';
    } else {
      message = 'El estatus de tu viaje es ahora: $status.';
    }

    final htmlTemplate = '''
      <div style="font-family: Arial, sans-serif; max-width: 600px; margin: 0 auto; border: 1px solid #eee; border-radius: 10px; overflow: hidden;">
        <div style="background-color: #000; padding: 20px; text-align: center;">
          <h2 style="color: #C7FF2E; margin: 0;">Taxiseguro</h2>
        </div>
        <div style="padding: 20px; color: #333;">
          <p>Hola <b>$passengerName</b>,</p>
          <p>$message</p>
          <br/>
          <p style="font-size: 12px; color: #999;">Si tienes alguna duda, contacta con soporte desde la app.</p>
        </div>
      </div>
    ''';

    return await sendEmail(
      to: passengerEmail,
      subject: subject,
      htmlContent: htmlTemplate,
    );
  }

  /// Plantilla predefinida para notificar al conductor de un cambio de estatus
  static Future<bool> notifyDriverTripStatus({
    required String driverEmail,
    required String driverName,
    required String passengerName,
    required String status,
  }) async {
    String subject = 'Actualización de viaje';
    String message = '';

    if (status == 'aceptado') {
      subject = 'Nuevo viaje aceptado';
      message = 'Has aceptado el viaje de <b>$passengerName</b>. Por favor, dirígete a su ubicación.';
    } else if (status == 'cancelado' || status == 'cancelled') {
      subject = 'Viaje cancelado';
      message = 'El viaje con <b>$passengerName</b> ha sido cancelado.';
    } else {
      message = 'El estatus del viaje es ahora: $status.';
    }

    final htmlTemplate = '''
      <div style="font-family: Arial, sans-serif; max-width: 600px; margin: 0 auto; border: 1px solid #eee; border-radius: 10px; overflow: hidden;">
        <div style="background-color: #000; padding: 20px; text-align: center;">
          <h2 style="color: #C7FF2E; margin: 0;">Taxiseguro Conductor</h2>
        </div>
        <div style="padding: 20px; color: #333;">
          <p>Hola <b>$driverName</b>,</p>
          <p>$message</p>
          <br/>
        </div>
      </div>
    ''';

    return await sendEmail(
      to: driverEmail,
      subject: subject,
      htmlContent: htmlTemplate,
    );
  }
}
