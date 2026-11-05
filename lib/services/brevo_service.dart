import 'dart:convert';
import 'package:http/http.dart' as http;
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
}

