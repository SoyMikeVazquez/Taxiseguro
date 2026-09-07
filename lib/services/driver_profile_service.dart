import 'package:supabase_flutter/supabase_flutter.dart';

class DriverProfileService {
  final SupabaseClient _supabase = Supabase.instance.client;

  /// Obtener perfil completo del conductor
  Future<Map<String, dynamic>?> getDriverProfile(String driverId) async {
    try {
      final response = await _supabase
          .from('conductores')
          .select()
          .eq('user_id', driverId)
          .maybeSingle();
      return response;
    } catch (e) {
      print('Error obteniendo perfil del conductor: $e');
      return null;
    }
  }

  /// Actualizar el perfil del conductor
  Future<bool> updateDriverProfile(String driverId, Map<String, dynamic> updates) async {
    try {
      await _supabase
          .from('conductores')
          .update(updates)
          .eq('user_id', driverId);
      return true;
    } catch (e) {
      print('Error actualizando perfil del conductor: $e');
      return false;
    }
  }
}
