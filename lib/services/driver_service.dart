import 'package:supabase_flutter/supabase_flutter.dart';

class DriverService {
  final SupabaseClient _supabase = Supabase.instance.client;

  /// Registra un nuevo conductor en Supabase Auth, public.users y public.drivers
  Future<AuthResponse> registerDriver({
    required String email,
    required String password,
    required String fullName,
    required String phone,
    required String vehicleModel,
    required String vehicleColor,
    required String plateNumber,
    required String licenseNumber,
  }) async {
    try {
      // 1. Crear usuario en Supabase Auth
      final AuthResponse response = await _supabase.auth.signUp(
        email: email.trim(),
        password: password.trim(),
        data: {
          'full_name': fullName.trim(),
          'phone': phone.trim(),
          'role': 'driver',
        },
      );

      final user = response.user;
      if (user == null) {
        throw const AuthException('No se pudo crear la cuenta de usuario.');
      }

      // 2. Insertar/Sincronizar en public.users
      await _supabase.from('users').upsert({
        'user_id': user.id,
        'email': email.trim(),
        'full_name': fullName.trim(),
        'phone': phone.trim(),
      });

      // 3. Insertar información de vehículo y perfil en public.drivers
      await _supabase.from('drivers').insert({
        'id': user.id,
        'full_name': fullName.trim(),
        'email': email.trim(),
        'phone': phone.trim(),
        'vehicle_model': vehicleModel.trim(),
        'vehicle_color': vehicleColor.trim(),
        'plate_number': plateNumber.trim().toUpperCase(),
        'license_number': licenseNumber.trim(),
        'status': 'active',
        'rating_avg': 5.0,
        'total_trips': 0,
      });

      return response;
    } catch (e) {
      print('Error al registrar conductor en Supabase: $e');
      rethrow;
    }
  }
}
