import 'package:flutter/material.dart';

class ActionButtonGrid extends StatelessWidget {
  const ActionButtonGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildActionCard(
          context,
          icon: Icons.directions_car,
          label: 'Viaje',
          color: const Color(0x33448AFF),
          iconColor: Colors.blueAccent[700]!,
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Servicio de Viaje Seleccionado')),
            );
          },
        ),
        _buildActionCard(
          context,
          icon: Icons.inventory_2_outlined,
          label: 'Envío',
          color: const Color(0x33FFAB40),
          iconColor: Colors.orangeAccent[700]!,
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Servicio de Envío Seleccionado')),
            );
          },
        ),
        _buildActionCard(
          context,
          icon: Icons.calendar_month_outlined,
          label: 'Reservar',
          color: const Color(0x3369F0AE),
          iconColor: Colors.greenAccent[700]!,
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Reservar Viaje Seleccionado')),
            );
          },
        ),
        _buildActionCard(
          context,
          icon: Icons.shield_outlined,
          label: 'Seguro',
          color: Colors.black12,
          iconColor: Colors.black,
          isPremium: true,
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Taxiseguro Activado: Tu viaje con máxima seguridad')),
            );
          },
        ),
      ],
    );
  }

  Widget _buildActionCard(
    BuildContext context, {
    required IconData icon,
    required String label,
    required Color color,
    required Color iconColor,
    required VoidCallback onTap,
    bool isPremium = false,
  }) {
    // Dynamically calculate width based on screen size, reserving some spacing
    final double cardWidth = (MediaQuery.of(context).size.width - 32 - 24) / 4;

    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: cardWidth,
            height: cardWidth,
            decoration: BoxDecoration(
              color: isPremium ? Colors.black : Colors.grey[100],
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: isPremium ? Colors.black : Colors.grey[200]!,
                width: 1.0,
              ),
            ),
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: isPremium ? Colors.black : color,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  color: isPremium ? Colors.greenAccent : iconColor,
                  size: 26,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: isPremium ? FontWeight.bold : FontWeight.w600,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
