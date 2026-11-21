import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ReferralService {
  final SupabaseClient _client = Supabase.instance.client;

  /// Registra un nuevo referido tanto en la tabla relacional 'referidos' como en los perfiles
  Future<void> recordNewReferral({
    required String referrerPhone,
    required String newUserId,
    required String newUserName,
    required String newUserPhone,
    required bool isNewUserConductor,
  }) async {
    try {
      final cleanRefPhone = referrerPhone.replaceAll(RegExp(r'\D'), '');
      if (cleanRefPhone.isEmpty) return;

      final newRecord = {
        'user_id': newUserId,
        'nombre': newUserName,
        'telefono': newUserPhone,
        'fecha': DateTime.now().toUtc().toIso8601String(),
        'activo': false,
        'tipo': isNewUserConductor ? 'conductor' : 'usuario',
      };

      String? referrerId;
      String tipoReferente = 'conductor';

      // 1. Buscar si el referente se encuentra en 'conductores'
      final condRes = await _client
          .from('conductores')
          .select('id, user_id, telefono, total_usuarios_referidos, total_conductores_referidos, usuarios_referidos, conductores_referidos')
          .eq('telefono', cleanRefPhone)
          .maybeSingle();

      if (condRes != null) {
        referrerId = (condRes['user_id'] ?? condRes['id']).toString();
        tipoReferente = 'conductor';

        final String colJson = isNewUserConductor ? 'conductores_referidos' : 'usuarios_referidos';
        final String colTotal = isNewUserConductor ? 'total_conductores_referidos' : 'total_usuarios_referidos';

        List<dynamic> currentList = _parseJsonList(condRes[colJson]);
        currentList.removeWhere((item) => item is Map && item['user_id'] == newUserId);
        currentList.insert(0, newRecord);

        await _client.from('conductores').update({
          colJson: currentList,
          colTotal: currentList.length,
        }).eq('id', condRes['id']);

        debugPrint('ReferralService: Conductor ${condRes['user_id']} actualizado con nuevo referido');
      } else {
        // 2. Buscar si el referente se encuentra en 'users' (Pasajeros)
        final userRes = await _client
            .from('users')
            .select('id, user_id, telefono, total_usuarios_referidos, total_conductores_referidos, usuarios_referidos, conductores_referidos')
            .eq('telefono', cleanRefPhone)
            .maybeSingle();

        if (userRes != null) {
          referrerId = (userRes['user_id'] ?? userRes['id']).toString();
          tipoReferente = 'pasajero';

          final String colJson = isNewUserConductor ? 'conductores_referidos' : 'usuarios_referidos';
          final String colTotal = isNewUserConductor ? 'total_conductores_referidos' : 'total_usuarios_referidos';

          List<dynamic> currentList = _parseJsonList(userRes[colJson]);
          currentList.removeWhere((item) => item is Map && item['user_id'] == newUserId);
          currentList.insert(0, newRecord);

          await _client.from('users').update({
            colJson: currentList,
            colTotal: currentList.length,
          }).eq('id', userRes['id']);

          debugPrint('ReferralService: Usuario ${userRes['user_id']} actualizado con nuevo referido');
        }
      }

      // 3. Inserción protegida en la tabla relacional 'public.referidos'
      if (referrerId != null) {
        try {
          await _client.from('referidos').upsert({
            'referente_id': referrerId,
            'tipo_referente': tipoReferente,
            'telefono_referente': cleanRefPhone,
            'referido_id': newUserId,
            'tipo_referido': isNewUserConductor ? 'conductor' : 'pasajero',
            'estado': 'pendiente',
            'descuento_porcentaje': 20.0,
            'created_at': DateTime.now().toUtc().toIso8601String(),
          }, onConflict: 'referido_id');
          debugPrint('ReferralService: Guardado exitoso en tabla referidos para $newUserId');
        } catch (tableErr) {
          debugPrint('ReferralService: Aviso al guardar en tabla referidos (puede no existir aún): $tableErr');
        }
      }
    } catch (e) {
      debugPrint('ReferralService: Error al registrar nuevo referido: $e');
    }
  }

  /// Marca un referido como activo (al completar su primer viaje) y actualiza comisiones
  Future<void> markReferralActivated({
    required String referrerPhone,
    required String referredUserId,
    double? commission,
    String? tripId,
  }) async {
    try {
      final cleanRefPhone = referrerPhone.replaceAll(RegExp(r'\D'), '');

      // 1. Actualizar en tabla relacional 'referidos'
      try {
        final updatePayload = <String, dynamic>{
          'estado': 'activo',
          'activado_at': DateTime.now().toUtc().toIso8601String(),
        };
        if (commission != null) updatePayload['comision_monto'] = commission;
        if (tripId != null) updatePayload['primer_viaje_id'] = tripId;

        await _client.from('referidos').update(updatePayload).eq('referido_id', referredUserId);
        debugPrint('ReferralService: Referido $referredUserId marcado como activo en tabla referidos');
      } catch (tableErr) {
        debugPrint('ReferralService: Aviso al actualizar tabla referidos: $tableErr');
      }

      if (cleanRefPhone.isEmpty) return;

      // 2. Actualizar en conductores si el referente es conductor
      final condRes = await _client
          .from('conductores')
          .select('id, usuarios_referidos, total_usuarios_referidos')
          .eq('telefono', cleanRefPhone)
          .maybeSingle();

      if (condRes != null) {
        List<dynamic> list = _parseJsonList(condRes['usuarios_referidos']);
        bool changed = false;
        for (var item in list) {
          if (item is Map && item['user_id'] == referredUserId) {
            item['activo'] = true;
            if (commission != null) item['comision'] = commission;
            changed = true;
          }
        }
        if (changed) {
          await _client.from('conductores').update({
            'usuarios_referidos': list,
            'total_usuarios_referidos': list.length,
          }).eq('id', condRes['id']);
        }
        return;
      }

      // 3. Actualizar en users si el referente es pasajero
      final userRes = await _client
          .from('users')
          .select('id, usuarios_referidos, total_usuarios_referidos')
          .eq('telefono', cleanRefPhone)
          .maybeSingle();

      if (userRes != null) {
        List<dynamic> list = _parseJsonList(userRes['usuarios_referidos']);
        bool changed = false;
        for (var item in list) {
          if (item is Map && item['user_id'] == referredUserId) {
            item['activo'] = true;
            changed = true;
          }
        }
        if (changed) {
          await _client.from('users').update({
            'usuarios_referidos': list,
            'total_usuarios_referidos': list.length,
          }).eq('id', userRes['id']);
        }
      }
    } catch (e) {
      debugPrint('ReferralService: Error al activar referido: $e');
    }
  }

  /// Helper para decodificar listas dinámicas desde Supabase (PostgreSQL JSONB o String)
  static List<dynamic> _parseJsonList(dynamic raw) {
    if (raw == null) return [];
    if (raw is List) return List<dynamic>.from(raw);
    if (raw is String) {
      try {
        final decoded = jsonDecode(raw);
        if (decoded is List) return List<dynamic>.from(decoded);
      } catch (_) {}
    }
    return [];
  }
}
