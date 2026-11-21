import 'dart:io';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'env/env.dart';
import 'screens/auth_screen.dart';
import 'screens/splash_router_screen.dart';
import 'screens/update_password_screen.dart';
import 'theme/app_theme.dart';
import 'services/background_service.dart';
import 'services/onesignal_service.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  if (Platform.isAndroid || Platform.isIOS) {
    try {
      await initializeBackgroundService();
    } catch (e) {
      debugPrint('Error initializing background service: $e');
    }
  }
  
  // Initialize date formatting for Spanish locales
  try {
    await initializeDateFormatting('es_MX', null);
  } catch (e) {
    debugPrint('Error initializing date formatting: $e');
  }
  
  try {
    // Initialize Supabase using database credentials
    await Supabase.initialize(
      url: Env.supabaseUrl,
      publishableKey: Env.supabaseAnonKey,
    );
  } catch (e) {
    debugPrint('Error initializing Supabase: $e');
  }

  // Initialize OneSignal Push Notifications
  try {
    OneSignalService().initialize();
  } catch (e) {
    debugPrint('Error initializing OneSignal: $e');
  }

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
      themeMode: ThemeMode.light,
      builder: (context, child) => OneSignalObserverWrapper(child: child ?? const SizedBox.shrink()),
      home: StreamBuilder<AuthState>(
        stream: Supabase.instance.client.auth.onAuthStateChange,
        initialData: AuthState(AuthChangeEvent.initialSession, Supabase.instance.client.auth.currentSession),
        builder: (context, snapshot) {
          if (!snapshot.hasData && snapshot.connectionState == ConnectionState.waiting) {
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
            // Vincular usuario autenticado con OneSignal
            OneSignalService().login(session.user.id);
            return const SplashRouterScreen();
          } else {
            OneSignalService().logout();
            return const AuthScreen();
          }
        },
      ),
    );
  }
}

class OneSignalObserverWrapper extends StatefulWidget {
  final Widget child;
  const OneSignalObserverWrapper({super.key, required this.child});

  @override
  State<OneSignalObserverWrapper> createState() => _OneSignalObserverWrapperState();
}

class _OneSignalObserverWrapperState extends State<OneSignalObserverWrapper> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setupPushSubscriptionObserver(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
