import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import '../models/saved_card.dart';
import '../services/pricing_service.dart';

class RideOptionsSheet extends StatelessWidget {
  final String origin;
  final LatLng? originLatLng;
  final String destination;
  final double? distanceMeters;
  final double? durationSeconds;
  final VoidCallback onCancel;
  final VoidCallback onConfirm;
  final VoidCallback? onEditOrigin;
  final VoidCallback? onEditDestination;
  final String selectedPaymentMethod;
  final ValueChanged<String>? onPaymentMethodChanged;
  final SavedCard? savedCard;
  final VoidCallback? onAddCard;
  final double discountPercent;

  const RideOptionsSheet({
    super.key,
    required this.origin,
    this.originLatLng,
    required this.destination,
    this.distanceMeters,
    this.durationSeconds,
    required this.onCancel,
    required this.onConfirm,
    this.onEditOrigin,
    this.onEditDestination,
    this.selectedPaymentMethod = 'efectivo',
    this.onPaymentMethodChanged,
    this.savedCard,
    this.onAddCard,
    this.discountPercent = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    // Calcular tarifa en tiempo real (o fallback a $120.00 si Mapbox aún no responde)
    String displayedPrice = '\$120.00';
    String? originalPriceStr;
    if (distanceMeters != null && durationSeconds != null) {
      final double price = PricingService.calculateDynamicPrice(
        distanceMeters!,
        durationSeconds!,
        origin: originLatLng,
        paymentMethod: selectedPaymentMethod,
        discountPercent: discountPercent,
      );
      displayedPrice = '\$${price.toStringAsFixed(2)}';

      if (discountPercent > 0.0) {
        final double rawPrice = PricingService.calculateDynamicPrice(
          distanceMeters!,
          durationSeconds!,
          origin: originLatLng,
          paymentMethod: selectedPaymentMethod,
          discountPercent: 0.0,
        );
        originalPriceStr = '\$${rawPrice.toStringAsFixed(2)}';
      }
    }
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
        boxShadow: [
          BoxShadow(
            color: Color(0x1F000000),
            blurRadius: 20,
            offset: Offset(0, -6),
          ),
        ],
      ),
      padding: const EdgeInsets.only(top: 12),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Drag handle
            Center(
              child: Container(
                margin: const EdgeInsets.only(bottom: 16),
                width: 44,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            // 1. Origin & Destination Text Fields Box
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  // Origin Box
                  GestureDetector(
                    onTap: onEditOrigin ?? onEditDestination ?? onCancel,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.grey[300]!, width: 1.0),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                      child: Row(
                        children: [
                          const Icon(Icons.my_location, color: Colors.black, size: 18),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              origin,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.edit, size: 18, color: Colors.black87),
                            onPressed: onEditOrigin ?? onEditDestination ?? onCancel,
                            constraints: const BoxConstraints(),
                            padding: EdgeInsets.zero,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Destination Box
                  GestureDetector(
                    onTap: onEditDestination ?? onCancel,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.black, width: 1.5),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                      child: Row(
                        children: [
                          const Icon(Icons.location_on, color: Colors.redAccent, size: 20),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              destination,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.edit, size: 18, color: Colors.black87),
                            onPressed: onEditDestination ?? onCancel,
                            constraints: const BoxConstraints(),
                            padding: EdgeInsets.zero,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Ride Options (Solo Taxiseguro Estándar)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: _buildRideOption(
                context,
                title: 'Taxiseguro Estándar',
                subtitle: durationSeconds != null 
                    ? 'Viaje en ~${(durationSeconds! / 60).ceil()} min' 
                    : 'Calculando tiempo...',
                price: displayedPrice,
                originalPrice: originalPriceStr,
                icon: Icons.local_taxi,
                isSelected: true,
              ),
            ),

            const SizedBox(height: 8),

            // Payment method and Confirm Button
            Container(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 16),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(color: Colors.grey[200]!),
                ),
              ),
              child: Column(
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () => _showPaymentMethodPicker(context),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Row(
                        children: [
                          Icon(
                            (selectedPaymentMethod == 'tarjeta' || selectedPaymentMethod == 'mercadopago')
                                ? Icons.credit_card_rounded
                                : Icons.payments_outlined,
                            size: 22,
                            color: (selectedPaymentMethod == 'tarjeta' || selectedPaymentMethod == 'mercadopago')
                                ? const Color(0xFF009EE3)
                                : Colors.green[700],
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  (selectedPaymentMethod == 'tarjeta' || selectedPaymentMethod == 'mercadopago')
                                      ? (savedCard != null
                                          ? 'Tarjeta ${savedCard!.brandDisplayName} •••• ${savedCard!.lastFourDigits}'
                                          : 'Tarjeta de Crédito / Débito')
                                      : 'Efectivo',
                                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                                ),
                                Text(
                                  (selectedPaymentMethod == 'tarjeta' || selectedPaymentMethod == 'mercadopago')
                                      ? (savedCard != null
                                          ? 'Cobro automático al finalizar el viaje'
                                          : 'Toca para ingresar los datos de tu tarjeta')
                                      : 'Pagar directo al conductor al finalizar',
                                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.grey[300]!),
                            ),
                            child: Text(
                              'Cambiar',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[800],
                              ),
                            ),
                          ),
                          const SizedBox(width: 4),
                          Icon(Icons.arrow_forward_ios, size: 12, color: Colors.grey[400]),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      // Back/Cancel button
                      Material(
                        color: Colors.grey[200],
                        shape: const CircleBorder(),
                        clipBehavior: Clip.antiAlias,
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back),
                          onPressed: onCancel,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(width: 16),
                      // Confirm button (30px radius)
                      Expanded(
                        child: SizedBox(
                          height: 56,
                          child: ElevatedButton(
                            onPressed: onConfirm,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFC7FF2E), // Electric Green
                              foregroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              elevation: 0,
                            ),
                            child: const Text(
                              'Confirmar Taxiseguro',
                              style: TextStyle(
                                fontFamily: 'Google Sans',
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showPaymentMethodPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (ctx) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: SafeArea(
            top: false,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    margin: const EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const Text(
                  'Metodo de pago',
                  style: TextStyle(
                    fontFamily: 'Google Sans',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Elige como deseas pagar tu viaje en TaxiSeguro',
                  style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                ),
                const SizedBox(height: 20),
                _buildPaymentTile(
                  context,
                  title: 'Efectivo',
                  subtitle: 'Paga al conductor en efectivo al finalizar el viaje',
                  icon: Icons.payments_outlined,
                  iconColor: Colors.green[700]!,
                  isSelected: selectedPaymentMethod == 'efectivo',
                  onTap: () {
                    onPaymentMethodChanged?.call('efectivo');
                    Navigator.pop(ctx);
                  },
                ),
                const SizedBox(height: 12),
                _buildPaymentTile(
                  context,
                  title: 'Tarjeta de Crédito / Débito',
                  subtitle: savedCard != null
                      ? '${savedCard!.brandDisplayName} •••• ${savedCard!.lastFourDigits} (Cobro automático al final)'
                      : 'Ingresa tu tarjeta para cobro automático al final',
                  icon: Icons.credit_card_rounded,
                  iconColor: const Color(0xFF009EE3),
                  isSelected: selectedPaymentMethod == 'tarjeta' || selectedPaymentMethod == 'mercadopago',
                  badgeText: savedCard != null ? savedCard!.brandDisplayName : 'Automático',
                  onTap: () {
                    onPaymentMethodChanged?.call('tarjeta');
                    Navigator.pop(ctx);
                    if (savedCard == null) {
                      onAddCard?.call();
                    }
                  },
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildPaymentTile(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required Color iconColor,
    required bool isSelected,
    required VoidCallback onTap,
    String? badgeText,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFF7FDF9) : Colors.grey[50],
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? Colors.black : Colors.grey[300]!,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: iconColor.withValues(alpha: 0.12),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: iconColor, size: 24),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontFamily: 'Google Sans',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      if (badgeText != null) ...[
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: const Color(0xFF009EE3).withValues(alpha: 0.12),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            badgeText,
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF009EE3),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            if (isSelected)
              const Icon(Icons.check_circle, color: Colors.black, size: 22)
            else
              Icon(Icons.radio_button_unchecked, color: Colors.grey[400], size: 22),
          ],
        ),
      ),
    );
  }

  Widget _buildRideOption(
    BuildContext context, {
    required String title,
    required String subtitle,
    required String price,
    String? originalPrice,
    required IconData icon,
    required bool isSelected,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFFF3F3F3) : Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: isSelected ? Colors.black : Colors.transparent,
          width: isSelected ? 2 : 1,
        ),
      ),
      child: Row(
        children: [
          Icon(icon, size: 40, color: Colors.black87),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'Google Sans',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (originalPrice != null && originalPrice.isNotEmpty) ...[
                Text(
                  originalPrice,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 2, bottom: 2),
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: const Color(0xFF10B981).withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    '-${discountPercent.toInt()}% referido',
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF059669),
                    ),
                  ),
                ),
              ],
              Text(
                price,
                style: const TextStyle(
                  fontFamily: 'Google Sans',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
