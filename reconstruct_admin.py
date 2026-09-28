import json
import os

with open('lib/services/admin_service.dart', 'r') as f:
    content = f.read()

# Models
models = """
import 'package:fl_chart/fl_chart.dart';
import 'dart:convert';
import 'driver_shift_service.dart';

class DashboardFinancialData {
  final double totalRevenue;
  final double platformCommission;
  final int totalTrips;
  final double cashTotal;
  final int cashTrips;
  final double cardTotal;
  final int cardTrips;
  final List<FlSpot> chartSpots;
  final double maxY;
  final double maxX;
  final bool isSingleDay;
  final List<String> xLabels;

  DashboardFinancialData({
    required this.totalRevenue,
    required this.platformCommission,
    required this.totalTrips,
    required this.cashTotal,
    required this.cashTrips,
    required this.cardTotal,
    required this.cardTrips,
    required this.chartSpots,
    required this.maxY,
    required this.maxX,
    required this.isSingleDay,
    required this.xLabels,
  });

  factory DashboardFinancialData.empty() {
    return DashboardFinancialData(
      totalRevenue: 0,
      platformCommission: 0,
      totalTrips: 0,
      cashTotal: 0,
      cashTrips: 0,
      cardTotal: 0,
      cardTrips: 0,
      chartSpots: [const FlSpot(0, 0)],
      maxY: 100,
      maxX: 7,
      isSingleDay: true,
      xLabels: [],
    );
  }
}

class DriverFullDetailData {
  final Map<String, dynamic> driverData;
  final List<Map<String, dynamic>> trips;
  final double averageRating;
  final int totalReviews;

  DriverFullDetailData({
    required this.driverData,
    required this.trips,
    required this.averageRating,
    required this.totalReviews,
  });
}
"""

methods = """
  Future<void> syncTripsToFacturacion() async {
    try {
      final tripsRes = await _supabase.from('trips').select();
      final trips = (tripsRes as List<dynamic>?) ?? [];
      List<dynamic> existingFacts = [];
      try {
        final factRes = await _supabase.from('facturacion').select();
        existingFacts = (factRes as List<dynamic>?) ?? [];
      } catch (_) {}

      final Set<String> registeredTripIds = {};
      for (var f in existingFacts) {
        final datos = f['datos_adicionales'];
        if (datos != null) {
          try {
            final map = datos is Map ? datos : jsonDecode(datos.toString());
            if (map['trip_id'] != null) {
              registeredTripIds.add(map['trip_id'].toString());
            }
          } catch (_) {}
        }
      }

      for (var t in trips) {
        final tripId = (t['id'] ?? '').toString();
        final fare = (t['fare'] as num?)?.toDouble() ?? 0.0;
        final status = (t['status'] ?? '').toString().toLowerCase().trim();
        final isCompleted = status == 'completed' || status == 'completado' || status == 'finalizado';

        if ((isCompleted || fare > 0) && status != 'cancelled' && tripId.isNotEmpty && !registeredTripIds.contains(tripId)) {
          final gananciaConductor = (t['total_final'] as num?)?.toDouble() ?? (fare * 0.85);
          final comisionApp = fare * 0.15;
          final metodoPago = (t['metodo_pago'] ?? t['payment_method'] ?? 'efectivo').toString();
          final fecha = t['completed_at'] ?? t['created_at'] ?? DateTime.now().toIso8601String();
          final userId = t['user_id'] as String?;
          final driverId = t['driver_id'] as String?;

          try {
            await _supabase.from('facturacion').insert({
              'cantidad': fare,
              'metodo_pago': metodoPago,
              'fecha_servicio': fecha,
              'status': 'completado',
              'datos_adicionales': jsonEncode({
                'trip_id': tripId,
                'driver_id': driverId,
                'user_id': userId,
                'fare': fare,
                'total_final': gananciaConductor,
                'comision_app': comisionApp,
              }),
            });
            registeredTripIds.add(tripId);
          } catch (_) {}
        }
      }
    } catch (_) {}
  }

  Future<DashboardFinancialData> getDashboardFinances({
    required DateTime startDate,
    required DateTime endDate,
    String? driverId,
  }) async {
    try {
      final startFilter = DateTime(startDate.year, startDate.month, startDate.day, 0, 0, 0);
      final endFilter = DateTime(endDate.year, endDate.month, endDate.day, 23, 59, 59);

      await syncTripsToFacturacion();

      List<dynamic> factRows = [];
      try {
        final factRes = await _supabase.from('facturacion').select();
        factRows = (factRes as List<dynamic>?) ?? [];
      } catch (_) {}

      List<dynamic> allTrips = [];
      try {
        final tripsRes = await _supabase.from('trips').select();
        allTrips = (tripsRes as List<dynamic>?) ?? [];
      } catch (_) {}

      final List<Map<String, dynamic>> financialRecords = [];
      final Set<String> processedTripIds = {};

      for (var f in factRows) {
        String? tripId;
        String? rowDriverId;
        final datos = f['datos_adicionales'];
        if (datos != null) {
          try {
            final map = datos is Map ? datos : jsonDecode(datos.toString());
            tripId = map['trip_id']?.toString();
            rowDriverId = map['driver_id']?.toString();
          } catch (_) {}
        }
        
        if (driverId != null && rowDriverId != driverId) continue;
        
        if (tripId != null && tripId.isNotEmpty) {
          processedTripIds.add(tripId);
        }

        final rawCantidad = f['cantidad'];
        final double fare = (rawCantidad is num)
            ? rawCantidad.toDouble()
            : double.tryParse(rawCantidad?.toString() ?? '0') ?? 0.0;

        financialRecords.add({
          'id': f['id'],
          'trip_id': tripId,
          'fare': fare,
          'metodo_pago': f['metodo_pago'] ?? 'efectivo',
          'date': f['fecha_servicio'] ?? f['created_at'],
          'status': f['status'] ?? 'completado',
        });
      }

      for (var t in allTrips) {
        final tDriverId = (t['driver_id'] ?? '').toString();
        if (driverId != null && tDriverId != driverId) continue;

        final tripId = (t['id'] ?? '').toString();
        if (processedTripIds.contains(tripId)) continue;

        final status = (t['status'] ?? '').toString().toLowerCase().trim();
        final isCompleted = status == 'completed' || status == 'completado' || status == 'finalizado';
        final fare = (t['fare'] as num?)?.toDouble() ?? 0.0;

        if ((isCompleted || fare > 0) && status != 'cancelled') {
          financialRecords.add({
            'id': tripId,
            'trip_id': tripId,
            'fare': fare,
            'metodo_pago': t['metodo_pago'] ?? t['payment_method'] ?? 'efectivo',
            'date': t['completed_at'] ?? t['created_at'],
            'status': status,
          });
        }
      }

      double totalRevenue = 0.0;
      double cashTotal = 0.0;
      int cashTrips = 0;
      double cardTotal = 0.0;
      int cardTrips = 0;
      int countTrips = 0;

      final diffDays = endDate.difference(startDate).inDays;
      final bool isSingleDay = diffDays <= 0 ||
          (startDate.year == endDate.year &&
              startDate.month == endDate.month &&
              startDate.day == endDate.day);

      List<double> hourlyFares = List.filled(8, 0.0);
      Map<int, double> dailyFares = {};
      final numDays = isSingleDay ? 1 : (diffDays + 1);

      if (!isSingleDay) {
        for (int i = 0; i < numDays; i++) {
          dailyFares[i] = 0.0;
        }
      }

      for (var record in financialRecords) {
        final dateStr = record['date'];
        DateTime? tripDate;
        if (dateStr != null) {
          tripDate = DateTime.tryParse(dateStr.toString())?.toLocal();
        }

        if (tripDate != null) {
          if (tripDate.isBefore(startFilter) || tripDate.isAfter(endFilter)) {
            continue;
          }
        }

        final fare = (record['fare'] as num?)?.toDouble() ?? 0.0;
        final rawMethod = (record['metodo_pago'] ?? 'efectivo')
            .toString()
            .toLowerCase()
            .trim();

        totalRevenue += fare;
        countTrips++;

        if (rawMethod.contains('efectivo') || rawMethod.contains('cash')) {
          cashTotal += fare;
          cashTrips++;
        } else {
          cardTotal += fare;
          cardTrips++;
        }

        if (tripDate != null) {
          if (isSingleDay) {
            int block = tripDate.hour ~/ 3;
            if (block >= 0 && block < 8) {
              hourlyFares[block] += fare;
            }
          } else {
            int dayIndex = tripDate.difference(startFilter).inDays;
            if (dayIndex >= 0 && dayIndex <= diffDays) {
              dailyFares[dayIndex] = (dailyFares[dayIndex] ?? 0.0) + fare;
            }
          }
        }
      }

      final double platformCommission = totalRevenue * 0.20;

      final List<FlSpot> chartSpots = [];
      double maxY = 0;
      double maxX = isSingleDay ? 7.0 : diffDays.toDouble();
      List<String> xLabels = [];

      if (isSingleDay) {
        xLabels = ['12a', '3a', '6a', '9a', '12p', '3p', '6p', '9p'];
        for (int i = 0; i < 8; i++) {
          chartSpots.add(FlSpot(i.toDouble(), hourlyFares[i]));
          if (hourlyFares[i] > maxY) maxY = hourlyFares[i];
        }
      } else {
        for (int i = 0; i <= diffDays; i++) {
          final d = startFilter.add(Duration(days: i));
          xLabels.add('${d.day}/${d.month}');
          final val = dailyFares[i] ?? 0.0;
          chartSpots.add(FlSpot(i.toDouble(), val));
          if (val > maxY) maxY = val;
        }
      }

      maxY = maxY > 0 ? maxY * 1.2 : 100.0;

      return DashboardFinancialData(
        totalRevenue: totalRevenue,
        platformCommission: platformCommission,
        totalTrips: countTrips,
        cashTotal: cashTotal,
        cashTrips: cashTrips,
        cardTotal: cardTotal,
        cardTrips: cardTrips,
        chartSpots: chartSpots.isEmpty ? [const FlSpot(0, 0)] : chartSpots,
        maxY: maxY,
        maxX: maxX,
        isSingleDay: isSingleDay,
        xLabels: xLabels,
      );
    } catch (e) {
      print('Error en getDashboardFinances: $e');
      return DashboardFinancialData.empty();
    }
  }

  Future<DriverFullDetailData?> getDriverFullDetails(String driverId) async {
    try {
      final dRes = await _supabase.from('conductores').select().eq('user_id', driverId).maybeSingle();
      if (dRes == null) return null;

      final tRes = await _supabase.from('trips').select().eq('driver_id', driverId).order('created_at', ascending: false);
      final List<dynamic> tList = (tRes as List<dynamic>?) ?? [];

      final rRes = await _supabase.from('driver_ratings').select().eq('driver_id', driverId);
      final List<dynamic> rList = (rRes as List<dynamic>?) ?? [];

      double totalRating = 0;
      int count = 0;
      for (var r in rList) {
        final rate = (r['rating'] as num?)?.toDouble();
        if (rate != null) {
          totalRating += rate;
          count++;
        }
      }
      final double avgRating = count > 0 ? (totalRating / count) : 0.0;

      return DriverFullDetailData(
        driverData: dRes,
        trips: tList.map((e) => e as Map<String, dynamic>).toList(),
        averageRating: avgRating,
        totalReviews: count,
      );
    } catch (e) {
      print('Error en getDriverFullDetails: $e');
      return null;
    }
  }

  // --- ZONAS DE TARIFA DINÁMICA ---
  Future<List<Map<String, dynamic>>> getDynamicPricingZones() async {
    try {
      final response = await _supabase.from('zonas_tarifa_dinamica').select().order('created_at', ascending: false);
      return (response as List<dynamic>).map((e) => e as Map<String, dynamic>).toList();
    } catch (e) {
      print('Error en getDynamicPricingZones: $e');
      return [];
    }
  }

  Future<bool> addDynamicPricingZone({
    required String name,
    required double lat,
    required double lng,
    required double radiusKm,
    required double percentageIncrease,
  }) async {
    try {
      await _supabase.from('zonas_tarifa_dinamica').insert({
        'name': name,
        'lat': lat,
        'lng': lng,
        'radius_km': radiusKm,
        'percentage_increase': percentageIncrease,
        'is_active': true,
      });
      return true;
    } catch (e) {
      print('Error en addDynamicPricingZone: $e');
      return false;
    }
  }

  Future<bool> toggleDynamicPricingZone(String id, bool isActive) async {
    try {
      await _supabase.from('zonas_tarifa_dinamica').update({'is_active': isActive}).eq('id', id);
      return true;
    } catch (e) {
      print('Error en toggleDynamicPricingZone: $e');
      return false;
    }
  }

  Future<bool> deleteDynamicPricingZone(String id) async {
    try {
      await _supabase.from('zonas_tarifa_dinamica').delete().eq('id', id);
      return true;
    } catch (e) {
      print('Error en deleteDynamicPricingZone: $e');
      return false;
    }
  }
}
"""

content = content.replace("import 'package:supabase_flutter/supabase_flutter.dart';", models + "\\nimport 'package:supabase_flutter/supabase_flutter.dart';")
content = content.replace("}\\n", "}\\n" + methods)

# Ensure only one closing brace at the very end
content = content.strip()
if not content.endswith("}"):
    content += "\\n}"

with open('lib/services/admin_service.dart', 'w') as f:
    f.write(content)

