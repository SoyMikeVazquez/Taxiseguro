import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RatingService {
  final SupabaseClient _supabase = Supabase.instance.client;

  /// Registra una nueva calificación en la tabla 'ratings'
  /// [role]: Rol del evaluado ('driver' si se califica al conductor, 'passenger' si se califica al pasajero)
  Future<bool> submitRating({
    required String tripId,
    required String reviewerId,
    required String targetId,
    required String role,
    required double rating,
    String? comment,
  }) async {
    try {
      final double clampedRating = rating.clamp(1.0, 5.0);

      // Verificar si ya existe una calificación para este viaje y revisor
      final existing = await _supabase
          .from('ratings')
          .select('id')
          .eq('trip_id', tripId)
          .eq('reviewer_id', reviewerId)
          .maybeSingle();

      if (existing != null) {
        // Actualizar calificación existente
        await _supabase.from('ratings').update({
          'rating': clampedRating,
          'comment': comment?.trim(),
          'created_at': DateTime.now().toUtc().toIso8601String(),
        }).eq('id', existing['id']);
      } else {
        // Insertar nueva calificación
        await _supabase.from('ratings').insert({
          'trip_id': tripId,
          'reviewer_id': reviewerId,
          'target_id': targetId,
          'role': role,
          'rating': clampedRating,
          'comment': comment?.trim().isNotEmpty == true ? comment!.trim() : null,
        });
      }

      // Si se calificó a un conductor, actualizar su promedio en 'conductores'
      if (role == 'driver') {
        await _updateDriverAverageRating(targetId);
      }

      return true;
    } catch (e) {
      debugPrint('Error al guardar calificación en Supabase: $e');
      return false;
    }
  }

  /// Obtiene la calificación que dio un revisor a un viaje específico
  Future<Map<String, dynamic>?> getTripRating({
    required String tripId,
    required String reviewerId,
  }) async {
    try {
      final response = await _supabase
          .from('ratings')
          .select('id, rating, comment, created_at')
          .eq('trip_id', tripId)
          .eq('reviewer_id', reviewerId)
          .maybeSingle();
      return response;
    } catch (e) {
      debugPrint('Error al consultar calificación de viaje: $e');
      return null;
    }
  }

  /// Obtiene el promedio de calificación y conteo para un usuario (pasajero o conductor)
  Future<Map<String, dynamic>> getUserRatingStats(String userId, {String? role}) async {
    try {
      var query = _supabase.from('ratings').select('rating').eq('target_id', userId);
      if (role != null) {
        query = query.eq('role', role);
      }
      final response = await query;

      final list = response as List<dynamic>;
      if (list.isEmpty) {
        return {'average': 5.0, 'total': 0};
      }

      double sum = 0;
      int count = 0;
      for (final r in list) {
        final raw = r['rating'];
        double? val;
        if (raw is num) {
          val = raw.toDouble();
        } else if (raw != null) {
          val = double.tryParse(raw.toString());
        }
        if (val != null) {
          sum += val;
          count++;
        }
      }

      if (count == 0) {
        return {'average': 5.0, 'total': 0};
      }

      return {
        'average': sum / count,
        'total': count,
      };
    } catch (e) {
      debugPrint('Error al obtener estadísticas de rating: $e');
      return {'average': 5.0, 'total': 0};
    }
  }

  /// Recalcula y actualiza la calificación promedio del conductor en la tabla 'conductores'
  Future<void> _updateDriverAverageRating(String driverId) async {
    try {
      final stats = await getUserRatingStats(driverId);
      final double avg = stats['average'] as double;

      // Intentar actualizar calificacion_promedio
      try {
        await _supabase
            .from('conductores')
            .update({'calificacion_promedio': avg})
            .eq('user_id', driverId);
      } catch (_) {
        // Fallback por si la columna se llama 'calificacion'
        try {
          await _supabase
              .from('conductores')
              .update({'calificacion': avg})
              .eq('user_id', driverId);
        } catch (_) {}
      }
    } catch (e) {
      debugPrint('Error actualizando calificacion promedio del conductor: $e');
    }
  }
}
