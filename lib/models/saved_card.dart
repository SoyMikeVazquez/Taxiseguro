import 'dart:convert';

class SavedCard {
  final String token;
  final String lastFourDigits;
  final String firstSixDigits;
  final String brand; // visa, master, amex, etc.
  final String cardholderName;
  final int expirationMonth;
  final int expirationYear;
  final DateTime createdAt;

  const SavedCard({
    required this.token,
    required this.lastFourDigits,
    required this.firstSixDigits,
    required this.brand,
    required this.cardholderName,
    required this.expirationMonth,
    required this.expirationYear,
    required this.createdAt,
  });

  String get maskedNumber => '•••• •••• •••• $lastFourDigits';

  String get expirationFormatted =>
      '${expirationMonth.toString().padLeft(2, '0')}/${(expirationYear % 100).toString().padLeft(2, '0')}';

  String get brandDisplayName {
    switch (brand.toLowerCase()) {
      case 'visa':
        return 'Visa';
      case 'master':
      case 'mastercard':
        return 'Mastercard';
      case 'amex':
      case 'american_express':
        return 'American Express';
      case 'carnet':
        return 'Carnet';
      default:
        return 'Tarjeta';
    }
  }

  Map<String, dynamic> toJson() => {
        'token': token,
        'lastFourDigits': lastFourDigits,
        'firstSixDigits': firstSixDigits,
        'brand': brand,
        'cardholderName': cardholderName,
        'expirationMonth': expirationMonth,
        'expirationYear': expirationYear,
        'createdAt': createdAt.toIso8601String(),
      };

  factory SavedCard.fromJson(Map<String, dynamic> json) {
    return SavedCard(
      token: json['token']?.toString() ?? '',
      lastFourDigits: json['lastFourDigits']?.toString() ?? '••••',
      firstSixDigits: json['firstSixDigits']?.toString() ?? '',
      brand: json['brand']?.toString() ?? 'tarjeta',
      cardholderName: json['cardholderName']?.toString() ?? 'Titular',
      expirationMonth: (json['expirationMonth'] as num?)?.toInt() ?? 12,
      expirationYear: (json['expirationYear'] as num?)?.toInt() ?? 2028,
      createdAt: json['createdAt'] != null
          ? DateTime.tryParse(json['createdAt'].toString()) ?? DateTime.now()
          : DateTime.now(),
    );
  }

  String toJsonString() => jsonEncode(toJson());

  factory SavedCard.fromJsonString(String str) =>
      SavedCard.fromJson(jsonDecode(str) as Map<String, dynamic>);
}
