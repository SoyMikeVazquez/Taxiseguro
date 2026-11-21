import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../env/env.dart';

class MercadoPagoPreference {
  final String id;
  final String initPoint;
  final String? sandboxInitPoint;

  MercadoPagoPreference({
    required this.id,
    required this.initPoint,
    this.sandboxInitPoint,
  });

  factory MercadoPagoPreference.fromJson(Map<String, dynamic> json) {
    return MercadoPagoPreference(
      id: json['id']?.toString() ?? '',
      initPoint: json['init_point']?.toString() ?? '',
      sandboxInitPoint: json['sandbox_init_point']?.toString(),
    );
  }
}

class MercadoPagoPaymentResult {
  final bool isApproved;
  final String? paymentId;
  final String? status;
  final String? message;

  const MercadoPagoPaymentResult({
    required this.isApproved,
    this.paymentId,
    this.status,
    this.message,
  });
}

class CardTokenResult {
  final bool success;
  final String? token;
  final String? lastFourDigits;
  final String? firstSixDigits;
  final String? brand;
  final String? cardholderName;
  final int? expirationMonth;
  final int? expirationYear;
  final String? errorMessage;

  const CardTokenResult({
    required this.success,
    this.token,
    this.lastFourDigits,
    this.firstSixDigits,
    this.brand,
    this.cardholderName,
    this.expirationMonth,
    this.expirationYear,
    this.errorMessage,
  });
}

class PaymentExecutionResult {
  final bool isApproved;
  final String? paymentId;
  final String? status;
  final String? statusDetail;
  final String? message;
  final double? amount;
  final String? cardLastFour;

  const PaymentExecutionResult({
    required this.isApproved,
    this.paymentId,
    this.status,
    this.statusDetail,
    this.message,
    this.amount,
    this.cardLastFour,
  });
}

class MercadoPagoService {
  static const String _baseUrl = 'https://api.mercadopago.com';

  static final MercadoPagoService _instance = MercadoPagoService._internal();
  factory MercadoPagoService() => _instance;
  MercadoPagoService._internal();

  /// Detecta la marca de tarjeta según el número (Visa, Mastercard, Amex, Carnet)
  static String detectCardBrand(String number) {
    final clean = number.replaceAll(RegExp(r'\D'), '');
    if (clean.startsWith('4')) return 'visa';
    if (RegExp(r'^(5[1-5]|2[2-7])').hasMatch(clean)) return 'master';
    if (RegExp(r'^(34|37)').hasMatch(clean)) return 'amex';
    if (RegExp(r'^(50|58|59|60|63|67)').hasMatch(clean)) return 'carnet';
    return 'visa';
  }

  /// Tokeniza los datos de una tarjeta de crédito o débito con Mercado Pago
  Future<CardTokenResult> tokenizeCard({
    required String cardNumber,
    required String cardholderName,
    required int expirationMonth,
    required int expirationYear,
    required String securityCode,
  }) async {
    final cleanNumber = cardNumber.replaceAll(RegExp(r'\D'), '');
    final cleanCvv = securityCode.replaceAll(RegExp(r'\D'), '');
    final cleanHolder = cardholderName.trim().toUpperCase();

    if (cleanNumber.length < 15 || cleanNumber.length > 19) {
      return const CardTokenResult(
        success: false,
        errorMessage: 'El número de tarjeta debe tener entre 15 y 19 dígitos.',
      );
    }

    try {
      final url = Uri.parse('$_baseUrl/v1/card_tokens');
      final headers = {
        'Authorization': 'Bearer ${Env.mercadoPagoAccessToken}',
        'Content-Type': 'application/json',
      };

      final body = jsonEncode({
        'card_number': cleanNumber,
        'expiration_month': expirationMonth,
        'expiration_year': expirationYear,
        'security_code': cleanCvv,
        'cardholder': {
          'name': cleanHolder,
        },
      });

      final response = await http.post(url, headers: headers, body: body);
      final data = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final token = data['id']?.toString();
        final lastFour = data['last_four_digits']?.toString() ??
            (cleanNumber.length >= 4 ? cleanNumber.substring(cleanNumber.length - 4) : '');
        final firstSix = data['first_six_digits']?.toString() ??
            (cleanNumber.length >= 6 ? cleanNumber.substring(0, 6) : '');
        final brand = detectCardBrand(cleanNumber);

        return CardTokenResult(
          success: true,
          token: token,
          lastFourDigits: lastFour,
          firstSixDigits: firstSix,
          brand: brand,
          cardholderName: cleanHolder,
          expirationMonth: expirationMonth,
          expirationYear: expirationYear,
        );
      } else {
        final errorMsg = data['message']?.toString() ??
            data['cause']?[0]?['description']?.toString() ??
            'No se pudo validar la tarjeta.';
        return CardTokenResult(success: false, errorMessage: errorMsg);
      }
    } catch (e) {
      return CardTokenResult(
        success: false,
        errorMessage: 'Excepción al conectar con Mercado Pago: $e',
      );
    }
  }

  /// Ejecuta el cobro automático al finalizar el viaje usando el token de tarjeta
  Future<PaymentExecutionResult> processCardPayment({
    required double amount,
    required String token,
    required String tripId,
    required String description,
    String? payerEmail,
    String? paymentMethodId,
    String? cardLastFour,
  }) async {
    try {
      final url = Uri.parse('$_baseUrl/v1/payments');
      final headers = {
        'Authorization': 'Bearer ${Env.mercadoPagoAccessToken}',
        'Content-Type': 'application/json',
        'X-Idempotency-Key': 'TRIP_PAY_${tripId}_${DateTime.now().millisecondsSinceEpoch}',
      };

      final cleanEmail = (payerEmail != null && payerEmail.contains('@'))
          ? payerEmail.trim()
          : 'pasajero@taxiseguro.mx';

      final body = jsonEncode({
        'transaction_amount': amount,
        'token': token,
        'description': description.isNotEmpty ? description : 'Viaje TaxiSeguro',
        'installments': 1,
        'payment_method_id': paymentMethodId ?? 'visa',
        'payer': {
          'email': cleanEmail,
        },
        'external_reference': tripId,
        'statement_descriptor': 'TAXI SEGURO',
      });

      final response = await http.post(url, headers: headers, body: body);
      final data = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final status = data['status']?.toString();
        final statusDetail = data['status_detail']?.toString();
        final paymentId = data['id']?.toString();

        final isApproved = status == 'approved';
        final message = isApproved
            ? 'Pago automático aprobado exitosamente.'
            : _translateStatusDetail(statusDetail);

        return PaymentExecutionResult(
          isApproved: isApproved,
          paymentId: paymentId,
          status: status,
          statusDetail: statusDetail,
          message: message,
          amount: amount,
          cardLastFour: cardLastFour,
        );
      } else {
        final errorMsg = data['message']?.toString() ??
            data['cause']?[0]?['description']?.toString() ??
            'Error al procesar el pago.';
        return PaymentExecutionResult(
          isApproved: false,
          status: 'error',
          statusDetail: 'server_error',
          message: errorMsg,
          amount: amount,
          cardLastFour: cardLastFour,
        );
      }
    } catch (e) {
      return PaymentExecutionResult(
        isApproved: false,
        status: 'exception',
        message: 'Excepción de red al procesar el cobro: $e',
        amount: amount,
        cardLastFour: cardLastFour,
      );
    }
  }

  static String _translateStatusDetail(String? detail) {
    switch (detail) {
      case 'cc_rejected_insufficient_amount':
        return 'Fondos insuficientes en la tarjeta.';
      case 'cc_rejected_bad_filled_security_code':
        return 'Código de seguridad (CVV) incorrecto.';
      case 'cc_rejected_bad_filled_date':
        return 'Fecha de vencimiento incorrecta.';
      case 'cc_rejected_call_for_authorize':
        return 'Requiere autorización de tu banco.';
      case 'cc_rejected_card_disabled':
        return 'La tarjeta no está habilitada para compras en línea.';
      default:
        return 'Pago no aprobado por el emisor de la tarjeta.';
    }
  }

  /// Crea una preferencia de pago en Mercado Pago Checkout Pro (Legacy)
  Future<MercadoPagoPreference?> createPreference({
    required double amount,
    required String tripTitle,
    String? payerEmail,
    String? payerName,
    String? externalReference,
  }) async {
    try {
      final url = Uri.parse('$_baseUrl/checkout/preferences');
      final headers = {
        'Authorization': 'Bearer ${Env.mercadoPagoAccessToken}',
        'Content-Type': 'application/json',
      };

      final cleanEmail = (payerEmail != null && payerEmail.contains('@'))
          ? payerEmail.trim()
          : 'pasajero@taxiseguro.mx';

      final cleanName = (payerName != null && payerName.trim().isNotEmpty)
          ? payerName.trim()
          : 'Pasajero TaxiSeguro';

      final body = jsonEncode({
        'items': [
          {
            'title': tripTitle.isNotEmpty ? tripTitle : 'Viaje TaxiSeguro',
            'description': 'Servicio de transporte privado TaxiSeguro',
            'quantity': 1,
            'currency_id': 'MXN',
            'unit_price': amount,
          }
        ],
        'payer': {
          'email': cleanEmail,
          'name': cleanName,
        },
        'back_urls': {
          'success': 'https://taxiseguro.mx/payment/success',
          'failure': 'https://taxiseguro.mx/payment/failure',
          'pending': 'https://taxiseguro.mx/payment/pending',
        },
        'auto_return': 'approved',
        'statement_descriptor': 'TAXI SEGURO',
        'external_reference': externalReference ?? 'TRIP_${DateTime.now().millisecondsSinceEpoch}',
      });

      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body);
        return MercadoPagoPreference.fromJson(data);
      } else {
        debugPrint('Error creando preferencia Mercado Pago: ${response.statusCode} - ${response.body}');
        return null;
      }
    } catch (e) {
      debugPrint('Excepcion al crear preferencia de Mercado Pago: $e');
      return null;
    }
  }

  /// Consulta el estatus de un pago directamente en la API de Mercado Pago
  Future<Map<String, dynamic>?> getPaymentDetails(String paymentId) async {
    try {
      final url = Uri.parse('$_baseUrl/v1/payments/$paymentId');
      final headers = {
        'Authorization': 'Bearer ${Env.mercadoPagoAccessToken}',
      };

      final response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        return jsonDecode(response.body) as Map<String, dynamic>;
      }
    } catch (e) {
      debugPrint('Error consultando pago en Mercado Pago: $e');
    }
    return null;
  }

  /// Verifica si el pago fue aprobado de manera exitosa
  Future<bool> verifyPaymentApproved(String paymentId) async {
    final details = await getPaymentDetails(paymentId);
    if (details != null) {
      return details['status'] == 'approved';
    }
    return false;
  }
}
