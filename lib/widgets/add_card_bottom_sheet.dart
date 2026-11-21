import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/saved_card.dart';
import '../services/mercado_pago_service.dart';

class AddCardBottomSheet extends StatefulWidget {
  final Function(SavedCard card) onCardAdded;

  const AddCardBottomSheet({
    super.key,
    required this.onCardAdded,
  });

  static Future<SavedCard?> show(BuildContext context, {required Function(SavedCard card) onCardAdded}) {
    return showModalBottomSheet<SavedCard>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => AddCardBottomSheet(onCardAdded: onCardAdded),
    );
  }

  @override
  State<AddCardBottomSheet> createState() => _AddCardBottomSheetState();
}

class _AddCardBottomSheetState extends State<AddCardBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  final _numberController = TextEditingController();
  final _nameController = TextEditingController();
  final _expiryController = TextEditingController();
  final _cvvController = TextEditingController();

  bool _isLoading = false;
  String? _errorMessage;
  String _detectedBrand = 'tarjeta';

  @override
  void initState() {
    super.initState();
    _numberController.addListener(_onNumberChanged);
  }

  @override
  void dispose() {
    _numberController.removeListener(_onNumberChanged);
    _numberController.dispose();
    _nameController.dispose();
    _expiryController.dispose();
    _cvvController.dispose();
    super.dispose();
  }

  void _onNumberChanged() {
    final brand = MercadoPagoService.detectCardBrand(_numberController.text);
    if (brand != _detectedBrand) {
      setState(() => _detectedBrand = brand);
    }
  }

  String get _displayBrandName {
    switch (_detectedBrand) {
      case 'visa':
        return 'VISA';
      case 'master':
        return 'MASTERCARD';
      case 'amex':
        return 'AMEX';
      case 'carnet':
        return 'CARNET';
      default:
        return 'TARJETA';
    }
  }

  Future<void> _submitCard() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    final rawNumber = _numberController.text.replaceAll(' ', '');
    final rawName = _nameController.text.trim();
    final rawExpiry = _expiryController.text.trim();
    final rawCvv = _cvvController.text.trim();

    final expiryParts = rawExpiry.split('/');
    if (expiryParts.length != 2) {
      setState(() {
        _isLoading = false;
        _errorMessage = 'Formato de fecha inválido (use MM/AA).';
      });
      return;
    }

    final month = int.tryParse(expiryParts[0]) ?? 0;
    int year = int.tryParse(expiryParts[1]) ?? 0;
    if (year < 100) year += 2000;

    final result = await MercadoPagoService().tokenizeCard(
      cardNumber: rawNumber,
      cardholderName: rawName,
      expirationMonth: month,
      expirationYear: year,
      securityCode: rawCvv,
    );

    if (!mounted) return;

    if (result.success && result.token != null) {
      final savedCard = SavedCard(
        token: result.token!,
        lastFourDigits: result.lastFourDigits ?? rawNumber.substring(rawNumber.length - 4),
        firstSixDigits: result.firstSixDigits ?? rawNumber.substring(0, 6),
        brand: result.brand ?? _detectedBrand,
        cardholderName: rawName,
        expirationMonth: month,
        expirationYear: year,
        createdAt: DateTime.now(),
      );

      widget.onCardAdded(savedCard);
      Navigator.pop(context, savedCard);
    } else {
      setState(() {
        _isLoading = false;
        _errorMessage = result.errorMessage ?? 'No fue posible validar la tarjeta.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      padding: EdgeInsets.only(
        left: 24,
        right: 24,
        top: 20,
        bottom: bottomInset > 0 ? bottomInset + 16 : 32,
      ),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Handle
              Center(
                child: Container(
                  width: 44,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              // Title
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Datos de tu Tarjeta',
                    style: TextStyle(
                      fontFamily: 'Google Sans',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.black54),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              const Text(
                'El cobro se realizará de forma automática al finalizar tu viaje.',
                style: TextStyle(fontSize: 13, color: Colors.black54),
              ),
              const SizedBox(height: 20),

              // Visual Card Representation
              _buildVisualCardPreview(),
              const SizedBox(height: 20),

              if (_errorMessage != null) ...[
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.red.shade50,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.red.shade200),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.error_outline, color: Colors.red, size: 20),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          _errorMessage!,
                          style: const TextStyle(color: Colors.red, fontSize: 13),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
              ],

              // Card Number Input
              TextFormField(
                controller: _numberController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(19),
                  _CardNumberFormatter(),
                ],
                decoration: InputDecoration(
                  labelText: 'Número de Tarjeta',
                  hintText: '4242 4242 4242 4242',
                  prefixIcon: const Icon(Icons.credit_card, color: Colors.black87),
                  suffixIcon: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    child: Text(
                      _displayBrandName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  filled: true,
                  fillColor: const Color(0xFFF7F7F7),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                ),
                validator: (val) {
                  final clean = (val ?? '').replaceAll(' ', '');
                  if (clean.length < 15) return 'Ingresa un número de tarjeta válido';
                  return null;
                },
              ),
              const SizedBox(height: 14),

              // Cardholder Name Input
              TextFormField(
                controller: _nameController,
                textCapitalization: TextCapitalization.characters,
                decoration: InputDecoration(
                  labelText: 'Nombre del Titular',
                  hintText: 'COMO APARECE EN LA TARJETA',
                  prefixIcon: const Icon(Icons.person_outline, color: Colors.black87),
                  filled: true,
                  fillColor: const Color(0xFFF7F7F7),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                ),
                validator: (val) {
                  if (val == null || val.trim().isEmpty) return 'Ingresa el nombre del titular';
                  return null;
                },
              ),
              const SizedBox(height: 14),

              // Row Expiry and CVV
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _expiryController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(4),
                        _CardExpiryFormatter(),
                      ],
                      decoration: InputDecoration(
                        labelText: 'Vencimiento',
                        hintText: 'MM/AA',
                        prefixIcon: const Icon(Icons.calendar_today_outlined, color: Colors.black87),
                        filled: true,
                        fillColor: const Color(0xFFF7F7F7),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      validator: (val) {
                        if (val == null || val.length < 5) return 'Inválido';
                        final parts = val.split('/');
                        final m = int.tryParse(parts[0]) ?? 0;
                        if (m < 1 || m > 12) return 'Mes 01-12';
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: TextFormField(
                      controller: _cvvController,
                      keyboardType: TextInputType.number,
                      obscureText: true,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(4),
                      ],
                      decoration: InputDecoration(
                        labelText: 'CVV',
                        hintText: '123',
                        prefixIcon: const Icon(Icons.lock_outline, color: Colors.black87),
                        filled: true,
                        fillColor: const Color(0xFFF7F7F7),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      validator: (val) {
                        if (val == null || val.length < 3) return '3 o 4 dígitos';
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Submit Button
              SizedBox(
                height: 54,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _submitCard,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: const Color(0xFFC7FF2E),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: _isLoading
                      ? const SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                            color: Color(0xFFC7FF2E),
                            strokeWidth: 2.5,
                          ),
                        )
                      : const Text(
                          'Guardar y Usar para el Viaje',
                          style: TextStyle(
                            fontFamily: 'Google Sans',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ),
              const SizedBox(height: 12),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shield_outlined, size: 14, color: Colors.black45),
                  SizedBox(width: 6),
                  Text(
                    'Transacción cifrada y protegida por Mercado Pago',
                    style: TextStyle(fontSize: 11, color: Colors.black45),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVisualCardPreview() {
    final rawNumber = _numberController.text.trim();
    final displayNumber = rawNumber.isNotEmpty ? rawNumber : '•••• •••• •••• ••••';
    final rawName = _nameController.text.trim();
    final displayName = rawName.isNotEmpty ? rawName.toUpperCase() : 'NOMBRE DEL TITULAR';
    final rawExpiry = _expiryController.text.trim();
    final displayExpiry = rawExpiry.isNotEmpty ? rawExpiry : 'MM/AA';

    return Container(
      height: 170,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF262626), Color(0xFF141414)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color(0x33000000),
            blurRadius: 15,
            offset: Offset(0, 8),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  Icon(Icons.local_taxi, color: Color(0xFFC7FF2E), size: 18),
                  SizedBox(width: 8),
                  Text(
                    'TAXISEGURO',
                    style: TextStyle(
                      fontFamily: 'Google Sans',
                      fontSize: 12,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
              Text(
                _displayBrandName,
                style: const TextStyle(
                  fontFamily: 'Google Sans',
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white70,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
          Text(
            displayNumber,
            style: const TextStyle(
              fontFamily: 'Google Sans',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 2,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('TITULAR', style: TextStyle(fontSize: 9, color: Colors.white38)),
                    Text(
                      displayName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text('VENCE', style: TextStyle(fontSize: 9, color: Colors.white38)),
                  Text(
                    displayExpiry,
                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final text = newValue.text.replaceAll(' ', '');
    final buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      if ((i + 1) % 4 == 0 && i + 1 != text.length) {
        buffer.write(' ');
      }
    }
    final string = buffer.toString();
    return newValue.copyWith(
      text: string,
      selection: TextSelection.collapsed(offset: string.length),
    );
  }
}

class _CardExpiryFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final text = newValue.text.replaceAll('/', '');
    final buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      if (i == 1 && text.length > 2) {
        buffer.write('/');
      }
    }
    final string = buffer.toString();
    return newValue.copyWith(
      text: string,
      selection: TextSelection.collapsed(offset: string.length),
    );
  }
}
