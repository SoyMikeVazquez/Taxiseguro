import 'package:flutter/material.dart';
import '../models/trip.dart';

class ActiveTripSheet extends StatelessWidget {
  final String driverName;
  final String vehicleInfo;
  final String plateNumber;
  final String rating;
  final String etaText;
  final String origin;
  final String destination;
  final Trip? trip;
  final VoidCallback onFinishTrip;

  const ActiveTripSheet({
    super.key,
    this.driverName = 'Roberto Hernández',
    this.vehicleInfo = 'Nissan Versa • Blanco',
    this.plateNumber = 'XYZ-8921',
    this.rating = '4.9',
    this.etaText = 'Llega en ~3 min',
    required this.origin,
    required this.destination,
    this.trip,
    required this.onFinishTrip,
  });

  String _getStatusText() {
    if (trip == null) return 'Conductor asignado';
    switch (trip!.status) {
      case 'accepted':
        return 'Conductor en camino';
      case 'arrived':
        return '¡El conductor ha llegado!';
      case 'in_progress':
        return 'Viaje en curso';
      default:
        return 'Conductor asignado';
    }
  }

  Color _getStatusColor() {
    if (trip == null) return Colors.black;
    switch (trip!.status) {
      case 'accepted':
        return Colors.black; // Normal
      case 'arrived':
        return Colors.orange[800]!; // Llamativo, llegó
      case 'in_progress':
        return Colors.blue[700]!; // Viaje activo
      default:
        return Colors.black;
    }
  }

  void _showSecurityModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Row(
                children: [
                  Icon(Icons.shield, color: Colors.green, size: 24),
                  SizedBox(width: 10),
                  Text(
                    'Centro de Seguridad',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Opcion 1: Compartir viaje
              ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.share, color: Colors.blueAccent),
                ),
                title: const Text('Compartir mi viaje', style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: const Text('Envía un enlace de seguimiento en vivo por WhatsApp o mensaje'),
                onTap: () {
                  Navigator.pop(context);
                  _showSharePreviewDialog(context);
                },
              ),

              const Divider(),

              // Opcion 2: Llamada de emergencia 911
              ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.red[50],
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.local_police, color: Colors.redAccent),
                ),
                title: const Text('Asistencia 911', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.redAccent)),
                subtitle: const Text('Llama a los servicios de emergencia locales'),
                onTap: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Conectando con emergencia 911...'),
                      backgroundColor: Colors.red,
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showSharePreviewDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: const Row(
            children: [
              Icon(Icons.mark_chat_read, color: Colors.green),
              SizedBox(width: 8),
              Text('Vista Previa del Enlace'),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Este es el mensaje de seguimiento que recibirán tus familiares:',
                style: TextStyle(fontSize: 13, color: Colors.grey),
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey[300]!),
                ),
                child: Text(
                  '🚗 Sigue mi viaje en vivo en Taxiseguro con $driverName ($vehicleInfo, Placas $plateNumber).\n\n📍 Destino: $destination\n🔗 https://taxiseguro.app/track/trip_demo_123',
                  style: const TextStyle(fontSize: 13, height: 1.4),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cerrar'),
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('¡Enlace de seguimiento compartido!'),
                    backgroundColor: Colors.green,
                  ),
                );
              },
              icon: const Icon(Icons.send, size: 16),
              label: const Text('Compartir'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
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
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Drag handle pill
            Center(
              child: Container(
                margin: const EdgeInsets.only(bottom: 12),
                width: 44,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            // Top Status & ETA Banner
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _getStatusText(),
                      style: TextStyle(
                        fontFamily: 'Google Sans',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: _getStatusColor(),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      etaText,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    plateNumber,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),
            const Divider(height: 1),
            const SizedBox(height: 16),

            // Driver & Vehicle Card
            Row(
              children: [
                // Driver Avatar
                CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.grey[200],
                  child: const Icon(Icons.person, size: 36, color: Colors.black54),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            driverName,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 6),
                          const Icon(Icons.star, size: 16, color: Colors.amber),
                          const SizedBox(width: 2),
                          Text(
                            rating,
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        vehicleInfo,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Quick Actions (Call, Message, Share)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildActionButton(
                  icon: Icons.phone,
                  label: 'Llamar',
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Llamando al conductor...')),
                    );
                  },
                ),
                _buildActionButton(
                  icon: Icons.chat_bubble_outline,
                  label: 'Mensaje',
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Abriendo chat...')),
                    );
                  },
                ),
                _buildActionButton(
                  icon: Icons.shield_outlined,
                  label: 'Seguridad',
                  onTap: () => _showSecurityModal(context),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Finish / Complete Trip simulation button
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: onFinishTrip,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFC7FF2E), // Electric Green
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Finalizar viaje (Simulación)',
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

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          children: [
            Icon(icon, size: 22, color: Colors.black87),
            const SizedBox(height: 4),
            Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
