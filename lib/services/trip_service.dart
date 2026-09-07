import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/trip.dart';

class TripService {
  final SupabaseClient _client = Supabase.instance.client;

  /// Crear un nuevo viaje (Intento 1: estado pending)
  Future<Trip?> createTrip(Trip trip) async {
    // 1. Validar que el usuario no tenga ya un viaje activo
    final activeTrip = await getActiveTripForPassenger(trip.userId);
    if (activeTrip != null) {
      print('El usuario ya tiene un viaje activo. No se puede crear otro.');
      return activeTrip; // Retornamos el viaje activo existente para que la UI lo retome
    }

    final payload = trip.toJson();
    payload.remove('id'); // Supabase genera el UUID
    payload.remove('created_at');
    payload.removeWhere((key, value) => value == null);

    // Intento 1: Inserción completa
    try {
      final response = await _client
          .from('trips')
          .insert(payload)
          .select()
          .single();
          
      return Trip.fromJson(response);
    } catch (e) {
      print('Error creando viaje (Intento 1): $e');
    }

    // Intento 2: Si 'pending' falla por restricción CHECK antigua (in_progress, completed, cancelled)
    try {
      final fallbackPayload = Map<String, dynamic>.from(payload);
      fallbackPayload['status'] = 'in_progress';
      final response = await _client
          .from('trips')
          .insert(fallbackPayload)
          .select()
          .single();
          
      return Trip.fromJson(response);
    } catch (e2) {
      print('Error creando viaje (Intento 2 - in_progress): $e2');
    }

    // Intento 3: Columnas esenciales mínimas (user_id, origin_address, destination_address)
    try {
      final response = await _client
          .from('trips')
          .insert({
            'user_id': trip.userId,
            'origin_address': trip.originAddress,
            'destination_address': trip.destinationAddress,
            'fare': trip.fare ?? 0.0,
            'distance_km': trip.distanceKm ?? 0.0,
          })
          .select()
          .single();

      return Trip.fromJson(response);
    } catch (e3) {
      print('Error creando viaje (Intento 3 - mínimo): $e3');
      return null;
    }
  }

  /// Obtiene el historial de viajes de un usuario (pasajero)
  Future<List<Trip>> getUserTrips(String userId) async {
    try {
      final response = await _client
          .from('trips')
          .select()
          .eq('user_id', userId)
          .order('created_at', ascending: false);

      return (response as List).map((json) => Trip.fromJson(json)).toList();
    } catch (e) {
      print('Error obteniendo viajes del usuario: $e');
      return [];
    }
  }

  /// Stream en tiempo real de viajes disponibles (en espera)
  Stream<List<Trip>> streamPendingTrips() {
    return _client
        .from('trips')
        .stream(primaryKey: ['id'])
        .eq('status', 'pending')
        .order('created_at', ascending: false)
        .map((data) => data.map((json) => Trip.fromJson(json)).toList());
  }

  /// Conductor acepta un viaje
  Future<bool> acceptTrip(String tripId, String driverId) async {
    try {
      final response = await _client.from('trips').update({
        'driver_id': driverId,
        'status': 'accepted',
      })
      .eq('id', tripId)
      .eq('status', 'pending')
      .select()
      .maybeSingle();

      if (response == null) {
        print('El viaje ya no está pendiente o fue tomado por otro conductor.');
        return false;
      }
      return true;
    } catch (e) {
      print('Error aceptando viaje: $e');
      return false;
    }
  }

  /// Obtener el viaje activo del conductor, si existe
  Future<Trip?> getActiveTrip(String driverId) async {
    try {
      final response = await _client
          .from('trips')
          .select()
          .eq('driver_id', driverId)
          .inFilter('status', const ['accepted', 'arrived', 'in_progress'])
          .order('created_at', ascending: false)
          .limit(1)
          .maybeSingle();
      
      if (response != null) {
        return Trip.fromJson(response);
      }
      return null;
    } catch (e) {
      print('Error obteniendo viaje activo: $e');
      return null;
    }
  }

  /// Stream de un viaje específico por ID para actualizaciones en tiempo real
  Stream<Trip?> streamTrip(String tripId) {
    return _client
        .from('trips')
        .stream(primaryKey: ['id'])
        .eq('id', tripId)
        .map((data) => data.isEmpty ? null : Trip.fromJson(data.first));
  }

  /// Obtener el viaje activo o pendiente del pasajero, si existe
  Future<Trip?> getActiveTripForPassenger(String userId) async {
    try {
      final response = await _client
          .from('trips')
          .select()
          .eq('user_id', userId)
          .inFilter('status', const ['pending', 'accepted', 'arrived', 'in_progress'])
          .order('created_at', ascending: false)
          .limit(1)
          .maybeSingle();
      
      if (response != null) {
        return Trip.fromJson(response);
      }
      return null;
    } catch (e) {
      print('Error obteniendo viaje activo del pasajero: $e');
      return null;
    }
  }

  /// Actualizar el estado del viaje (ej: arrived, in_progress)
  Future<bool> updateTripStatus(String tripId, String newStatus) async {
    try {
      await _client.from('trips').update({
        'status': newStatus,
      }).eq('id', tripId);
      return true;
    } catch (e) {
      print('Error actualizando estado del viaje: $e');
      return false;
    }
  }

  /// Conductor completa un viaje y se registra el cobro
  Future<bool> completeTrip(String tripId, double fare) async {
    try {
      await _client.from('trips').update({
        'status': 'completed',
        'fare': fare,
        'completed_at': DateTime.now().toIso8601String(),
      }).eq('id', tripId);
      return true;
    } catch (e) {
      print('Error completando viaje: $e');
      return false;
    }
  }

  /// Cancelar un viaje
  Future<bool> cancelTrip(String tripId) async {
    try {
      await _client.from('trips').update({
        'status': 'cancelled',
      }).eq('id', tripId);
      return true;
    } catch (e) {
      print('Error cancelando viaje: $e');
      return false;
    }
  }

  /// Obtiene las ganancias del día actual para un conductor
  Future<double> getDriverEarningsToday(String driverId) async {
    try {
      final now = DateTime.now();
      final startOfDay = DateTime(now.year, now.month, now.day).toIso8601String();

      final response = await _client
          .from('trips')
          .select('fare')
          .eq('driver_id', driverId)
          .eq('status', 'completed')
          .gte('completed_at', startOfDay);

      double total = 0.0;
      for (final row in response as List) {
        if (row['fare'] != null) {
          total += (row['fare'] as num).toDouble();
        }
      }
      return total;
    } catch (e) {
      print('Error calculando ganancias de hoy: $e');
      return 0.0;
    }
  }

  /// Obtiene los últimos viajes completados por el conductor
  Future<List<Trip>> getDriverCompletedTrips(String driverId) async {
    try {
      final response = await _client
          .from('trips')
          .select()
          .eq('driver_id', driverId)
          .eq('status', 'completed')
          .order('completed_at', ascending: false)
          .limit(10);

      return (response as List).map((json) => Trip.fromJson(json)).toList();
    } catch (e) {
      print('Error obteniendo viajes completados: $e');
      return [];
    }
  }

  /// Obtiene todos los viajes completados por el conductor para historial financiero
  Future<List<Trip>> getAllDriverCompletedTrips(String driverId) async {
    try {
      final response = await _client
          .from('trips')
          .select()
          .eq('driver_id', driverId)
          .eq('status', 'completed')
          .order('completed_at', ascending: false);

      return (response as List).map((json) => Trip.fromJson(json)).toList();
    } catch (e) {
      print('Error obteniendo todos los viajes completados: $e');
      return [];
    }
  }
}
