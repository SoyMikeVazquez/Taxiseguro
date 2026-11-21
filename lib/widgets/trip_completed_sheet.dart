import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/trip.dart';
import '../models/saved_card.dart';
import '../services/rating_service.dart';
import '../services/mercado_pago_service.dart';

class TripCompletedSheet extends StatefulWidget {
  final Trip trip;
  final VoidCallback onDismiss;
  final PaymentExecutionResult? paymentResult;
  final SavedCard? savedCard;

  const TripCompletedSheet({
    super.key,
    required this.trip,
    required this.onDismiss,
    this.paymentResult,
    this.savedCard,
  });

  @override
  State<TripCompletedSheet> createState() => _TripCompletedSheetState();
}

class _TripCompletedSheetState extends State<TripCompletedSheet> {
  int _rating = 0;

  @override
  Widget build(BuildContext context) {
    final fare = widget.trip.fare ?? 0.0;
    final paymentMethod = (widget.trip.paymentMethod ?? 'efectivo').toLowerCase();
    final isCash = paymentMethod == 'efectivo';
    final isCard = paymentMethod == 'tarjeta' || paymentMethod == 'mercadopago';
    final card = widget.savedCard;
    final paymentRes = widget.paymentResult;
    final isApproved = paymentRes?.isApproved ?? isCard;

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
        boxShadow: [
          BoxShadow(
            color: Color(0x1F000000),
            blurRadius: 15,
            offset: Offset(0, -4),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Handle Bar
            Container(
              margin: const EdgeInsets.only(bottom: 24),
              width: 44,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            
            const Text(
              '¡Viaje Finalizado!',
              style: TextStyle(
                fontFamily: 'Google Sans',
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              isCash
                  ? 'Por favor, entrega el pago en efectivo a tu conductor.'
                  : (isApproved
                      ? 'Cobro automático procesado con tu tarjeta ${card?.brandDisplayName ?? 'bancaria'} terminada en ${card?.lastFourDigits ?? paymentRes?.cardLastFour ?? '••••'}.'
                      : 'No se pudo cobrar a tu tarjeta: ${paymentRes?.message ?? 'Error'}. Por favor paga en efectivo al conductor.'),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: isCard && !isApproved ? Colors.orange.shade800 : Colors.black54,
                height: 1.3,
              ),
            ),
            const SizedBox(height: 20),
            
            // Monto a pagar
            Text(
              '\$${fare.toStringAsFixed(2)} MXN',
              style: const TextStyle(
                fontFamily: 'Google Sans',
                fontSize: 44,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            
            // Metodo de pago badge
            Container(
              margin: const EdgeInsets.only(top: 8, bottom: 8),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: isCash
                    ? Colors.green.shade50
                    : (isApproved ? const Color(0xFF009EE3).withValues(alpha: 0.12) : Colors.orange.shade50),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    isCash ? Icons.money : Icons.credit_card,
                    color: isCash
                        ? Colors.green.shade700
                        : (isApproved ? const Color(0xFF009EE3) : Colors.orange.shade800),
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    isCash
                        ? 'Pago en Efectivo'
                        : (isApproved
                            ? 'Pago con Tarjeta Aprobado'
                            : 'Cobro no completado'),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: isCash
                          ? Colors.green.shade700
                          : (isApproved ? const Color(0xFF009EE3) : Colors.orange.shade800),
                    ),
                  ),
                ],
              ),
            ),

            if (isCard && paymentRes?.paymentId != null) ...[
              Text(
                'Folio Mercado Pago: #${paymentRes!.paymentId}',
                style: const TextStyle(fontSize: 11, color: Colors.black45),
              ),
              const SizedBox(height: 12),
            ],
            
            const Divider(),
            const SizedBox(height: 16),
            
            const Text(
              '¿Cómo calificarías a tu conductor?',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            
            // 5 Estrellas
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return IconButton(
                  icon: Icon(
                    index < _rating ? Icons.star : Icons.star_border,
                    color: const Color(0xFFC7FF2E), // Lime Green
                    size: 40,
                  ),
                  onPressed: () {
                    setState(() {
                      _rating = index + 1;
                    });
                  },
                );
              }),
            ),
            const SizedBox(height: 24),
            
            // Boton Listo
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () async {
                  if (_rating > 0 && widget.trip.id != null && widget.trip.driverId != null) {
                    final currentUserId = Supabase.instance.client.auth.currentUser?.id;
                    if (currentUserId != null) {
                      try {
                        final ratingService = RatingService();
                        await ratingService.submitRating(
                          tripId: widget.trip.id!,
                          reviewerId: currentUserId,
                          targetId: widget.trip.driverId!,
                          role: 'driver',
                          rating: _rating.toDouble(),
                        );
                      } catch (e) {
                        debugPrint('Error guardando calificacion en TripCompletedSheet: $e');
                      }
                    }
                  }
                  widget.onDismiss();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFC7FF2E), // Electric Green
                  foregroundColor: Colors.black,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Listo',
                  style: TextStyle(
                    fontFamily: 'Google Sans',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
