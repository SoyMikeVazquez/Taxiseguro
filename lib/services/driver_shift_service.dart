import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ShiftSession {
  final String id;
  final String conductorId;
  final String fecha;
  final DateTime horaConexion;
  final DateTime? horaDesconexion;
  final int minutosActivo;
  final bool isOngoing;

  ShiftSession({
    required this.id,
    required this.conductorId,
    required this.fecha,
    required this.horaConexion,
    this.horaDesconexion,
    required this.minutosActivo,
    required this.isOngoing,
  });

  factory ShiftSession.fromJson(Map<String, dynamic> json) {
    final horaCon = json['hora_conexion'] != null
        ? DateTime.parse(json['hora_conexion'].toString()).toLocal()
        : DateTime.now();
    final horaDes = json['hora_desconexion'] != null
        ? DateTime.parse(json['hora_desconexion'].toString()).toLocal()
        : null;

    final isOngoing = horaDes == null;
    int minutes = (json['minutos_activo'] as num?)?.toInt() ?? 0;
    if (isOngoing) {
      final elapsed = DateTime.now().difference(horaCon).inMinutes;
      minutes = elapsed > 0 ? elapsed : 0;
    }

    return ShiftSession(
      id: json['id']?.toString() ?? '',
      conductorId: json['conductor_id']?.toString() ?? '',
      fecha: json['fecha']?.toString() ?? '',
      horaConexion: horaCon,
      horaDesconexion: horaDes,
      minutosActivo: minutes,
      isOngoing: isOngoing,
    );
  }
}

class DailyShiftSummary {
  final String fecha; // YYYY-MM-DD
  final int totalMinutos;
  final int sesionesCount;
  final List<ShiftSession> sesiones;

  DailyShiftSummary({
    required this.fecha,
    required this.totalMinutos,
    required this.sesionesCount,
    required this.sesiones,
  });

  String get formattedTime {
    final hours = totalMinutos ~/ 60;
    final mins = totalMinutos % 60;
    if (hours > 0) {
      return '${hours}h ${mins}m';
    }
    return '${mins}m';
  }
}

class DriverShiftStats {
  final int todayMinutes;
  final bool isCurrentlyOnline;
  final DateTime? currentSessionStart;
  final List<ShiftSession> sessionsToday;
  final List<DailyShiftSummary> daysHistory;

  DriverShiftStats({
    required this.todayMinutes,
    required this.isCurrentlyOnline,
    this.currentSessionStart,
    required this.sessionsToday,
    required this.daysHistory,
  });

  String get formattedTodayTime {
    final hours = todayMinutes ~/ 60;
    final mins = todayMinutes % 60;
    if (hours > 0) {
      return '${hours}h ${mins}m';
    }
    return '${mins}m';
  }

  factory DriverShiftStats.empty() {
    return DriverShiftStats(
      todayMinutes: 0,
      isCurrentlyOnline: false,
      sessionsToday: [],
      daysHistory: [],
    );
  }
}

class DriverShiftService {
  final SupabaseClient _supabase = Supabase.instance.client;

  /// Registra el inicio de turno cuando el conductor pasa a ACTIVO
  Future<void> recordConnection(String driverId) async {
    if (driverId.isEmpty) return;
    try {
      final nowUtc = DateTime.now().toUtc();
      final todayStr = DateTime.now().toIso8601String().substring(0, 10);

      // 1. Cerrar cualquier sesión previa que haya quedado abierta por cierre inesperado de app
      await _closeAnyOpenSession(driverId, closeTime: nowUtc);

      // 2. Insertar nueva sesión activa
      await _supabase.from('horarios_conductores').insert({
        'conductor_id': driverId,
        'fecha': todayStr,
        'hora_conexion': nowUtc.toIso8601String(),
        'hora_desconexion': null,
        'minutos_activo': 0,
      });

      debugPrint('DriverShiftService: Conexión registrada para conductor $driverId');
    } catch (e) {
      debugPrint('DriverShiftService: Error al registrar conexión: $e');
    }
  }

  /// Registra el fin de turno cuando el conductor pasa a INACTIVO
  Future<void> recordDisconnection(String driverId) async {
    if (driverId.isEmpty) return;
    try {
      final nowUtc = DateTime.now().toUtc();
      await _closeAnyOpenSession(driverId, closeTime: nowUtc);
      debugPrint('DriverShiftService: Desconexión registrada para conductor $driverId');
    } catch (e) {
      debugPrint('DriverShiftService: Error al registrar desconexión: $e');
    }
  }

  Future<void> _closeAnyOpenSession(String driverId, {required DateTime closeTime}) async {
    try {
      final openSessions = await _supabase
          .from('horarios_conductores')
          .select()
          .eq('conductor_id', driverId)
          .filter('hora_desconexion', 'is', null);

      final list = openSessions as List<dynamic>?;
      if (list != null && list.isNotEmpty) {
        for (var session in list) {
          final id = session['id'];
          final startStr = session['hora_conexion'];
          if (startStr != null) {
            final start = DateTime.parse(startStr.toString()).toUtc();
            final minutes = closeTime.difference(start).inMinutes;
            await _supabase.from('horarios_conductores').update({
              'hora_desconexion': closeTime.toIso8601String(),
              'minutos_activo': minutes > 0 ? minutes : 1,
            }).eq('id', id);
          }
        }
      }
    } catch (e) {
      debugPrint('DriverShiftService: Error cerrando sesiones abiertas: $e');
    }
  }

  /// Obtiene las estadísticas de jornadas y horarios agrupados por día para un conductor
  Future<DriverShiftStats> getDriverShiftStats(String driverId) async {
    if (driverId.isEmpty) return DriverShiftStats.empty();

    try {
      final res = await _supabase
          .from('horarios_conductores')
          .select()
          .eq('conductor_id', driverId)
          .order('hora_conexion', ascending: false);

      final List<dynamic> rows = (res as List<dynamic>?) ?? [];
      final List<ShiftSession> allSessions = rows.map((r) => ShiftSession.fromJson(r)).toList();

      final todayStr = DateTime.now().toIso8601String().substring(0, 10);
      int todayMinutes = 0;
      bool isCurrentlyOnline = false;
      DateTime? currentSessionStart;
      final List<ShiftSession> sessionsToday = [];

      final Map<String, List<ShiftSession>> groupedByDate = {};

      for (var s in allSessions) {
        if (s.fecha == todayStr) {
          todayMinutes += s.minutosActivo;
          sessionsToday.add(s);
          if (s.isOngoing) {
            isCurrentlyOnline = true;
            currentSessionStart = s.horaConexion;
          }
        }

        groupedByDate.putIfAbsent(s.fecha, () => []).add(s);
      }

      final List<DailyShiftSummary> daysHistory = [];
      groupedByDate.forEach((dateStr, sessions) {
        final totalMin = sessions.fold<int>(0, (sum, item) => sum + item.minutosActivo);
        daysHistory.add(DailyShiftSummary(
          fecha: dateStr,
          totalMinutos: totalMin,
          sesionesCount: sessions.length,
          sesiones: sessions,
        ));
      });

      // Ordenar días del más reciente al más antiguo
      daysHistory.sort((a, b) => b.fecha.compareTo(a.fecha));

      return DriverShiftStats(
        todayMinutes: todayMinutes,
        isCurrentlyOnline: isCurrentlyOnline,
        currentSessionStart: currentSessionStart,
        sessionsToday: sessionsToday,
        daysHistory: daysHistory,
      );
    } catch (e) {
      debugPrint('DriverShiftService: Error al consultar horarios_conductores: $e');
      return DriverShiftStats.empty();
    }
  }
}
