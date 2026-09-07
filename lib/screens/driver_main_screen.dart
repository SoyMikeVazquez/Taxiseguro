import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'driver_map_screen.dart';
import 'driver_finances_screen.dart';
import 'driver_profile_screen.dart';
import '../theme/app_theme.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'auth_screen.dart';

class DriverMainScreen extends StatefulWidget {
  const DriverMainScreen({super.key});

  @override
  State<DriverMainScreen> createState() => _DriverMainScreenState();
}

class _DriverMainScreenState extends State<DriverMainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    DriverMapScreen(),
    DriverFinancesScreen(),
    DriverProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, // Permite que el mapa/contenido fluya debajo del menú flotante
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          height: 65,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.85),
            borderRadius: BorderRadius.circular(35),
            border: Border.all(color: Colors.white.withOpacity(0.9), width: 1.5),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 20,
                offset: Offset(0, 8),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(35),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 12.0, sigmaY: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildNavItem(icon: Icons.directions_car_filled, index: 0),
                  _buildNavItem(icon: Icons.account_balance_wallet, index: 1),
                  _buildNavItem(icon: Icons.settings, index: 2),
                  _buildNavItem(icon: Icons.logout, index: 3, isLogout: true, onTap: () async {
                    await Supabase.instance.client.auth.signOut();
                    if (mounted) {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (_) => const AuthScreen()),
                        (route) => false,
                      );
                    }
                  }),
                ],
              ),
            ),
          ),
        ).animate().fade(duration: 600.ms, delay: 200.ms).slideY(begin: 0.5, end: 0, duration: 600.ms, delay: 200.ms, curve: Curves.easeOutBack),
      ),
    );
  }

  Widget _buildNavItem({required IconData icon, required int index, VoidCallback? onTap, bool isLogout = false}) {
    final isSelected = _currentIndex == index && !isLogout;
    
    return GestureDetector(
      onTap: () {
        if (!isLogout) {
          setState(() => _currentIndex = index);
        }
        if (onTap != null) onTap();
      },
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.electricGreen : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: isLogout
              ? Colors.redAccent
              : (isSelected ? Colors.black : AppColors.midGray),
          size: 24,
        ),
      ),
    );
  }
}
