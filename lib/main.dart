import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'screens/home_screen.dart';
import 'screens/auth_screen.dart';
import 'screens/splash_router_screen.dart';
import 'screens/update_password_screen.dart';
import 'theme/app_theme.dart';
import 'services/background_service.dart';

import 'dart:io';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  if (Platform.isAndroid || Platform.isIOS) {
    await initializeBackgroundService();
  }
  
  // Initialize Supabase using database credentials
  await Supabase.initialize(
    url: 'https://viqmzyevsvdzddmukfev.supabase.co',
    publishableKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZpcW16eWV2c3ZkemRkbXVrZmV2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODIzMTIxNjgsImV4cCI6MjA5Nzg4ODE2OH0.H40ahS2NmlgD1yCjCVf-i8TXTGHE6oBKvHBwl8OqbCA',
  );

  runApp(const TaxiSeguroApp());
}

class TaxiSeguroApp extends StatelessWidget {
  const TaxiSeguroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Taxiseguro',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light, // Puedes cambiar a ThemeMode.system si deseas
      home: StreamBuilder<AuthState>(
        stream: Supabase.instance.client.auth.onAuthStateChange,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(color: Colors.black),
              ),
            );
          }

          final session = snapshot.data?.session ?? Supabase.instance.client.auth.currentSession;
          final event = snapshot.data?.event;

          if (event == AuthChangeEvent.passwordRecovery) {
            return const UpdatePasswordScreen();
          }

          if (session != null) {
            return const SplashRouterScreen();
          } else {
            return const AuthScreen();
          }
        },
      ),
    );
  }
}
