import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/trip.dart';
import '../services/rating_service.dart';

class TripCompletedSheet extends StatefulWidget {
  final Trip trip;
  final VoidCallback onDismiss;

  const TripCompletedSheet({
    super.key,
    required this.trip,
    required this.onDismiss,
  });

  @override
  State<TripCompletedSheet> createState() => _TripCompletedSheetState();
}

class _TripCompletedSheetState extends State<TripCompletedSheet> {
  int _rating = 0;

  @override
  Widget build(BuildContext context) {
    final fare = widget.trip.fare ?? 0.0;
    final paymentMethod = widget.trip.paymentMethod ?? 'efectivo';
    final isCash = paymentMethod.toLowerCase() == 'efectivo';

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
            const Text(
              'Por favor, realiza el pago a tu conductor.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 24),
            
            // Monto a pagar
            Text(
              '\$${fare.toStringAsFixed(2)}',
              style: const TextStyle(
                fontFamily: 'Google Sans',
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            
            // Método de pago
            Container(
              margin: const EdgeInsets.only(top: 8, bottom: 24),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: isCash ? Colors.green[50] : Colors.blue[50],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    isCash ? Icons.money : Icons.credit_card,
                    color: isCash ? Colors.green[700] : Colors.blue[700],
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    isCash ? 'Pago en Efectivo' : 'Pago con Tarjeta',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: isCash ? Colors.green[700] : Colors.blue[700],
                    ),
                  ),
                ],
              ),
            ),
            
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
            
            // Estrellas
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return IconButton(
                  icon: Icon(
                    index < _rating ? Icons.star : Icons.star_border,
                    color: const Color(0xFFFFD700),
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
            
            const SizedBox(height: 32),
            
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () async {
                  if (_rating > 0 && widget.trip.id != null) {
                    final currentUserId = Supabase.instance.client.auth.currentUser?.id;
                    final driverId = widget.trip.driverId;
                    if (currentUserId != null && driverId != null && driverId.isNotEmpty) {
                      try {
                        final ratingService = RatingService();
                        await ratingService.submitRating(
                          tripId: widget.trip.id!,
                          reviewerId: currentUserId,
                          targetId: driverId,
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
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Finalizar',
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
