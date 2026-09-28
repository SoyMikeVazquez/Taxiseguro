import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:latlong2/latlong.dart';
import 'dart:math' as math;
import '../models/dynamic_pricing_zone.dart';

class PricingService {
  static const double banderazo = 50.00;
  static const double costoPorKm = 5.50;
  static const double costoPorMinuto = 1.80;
  static const double tarifaMinima = 50.00;

  static List<DynamicPricingZone> _activeZones = [];
  static bool _zonesLoaded = false;

  /// Carga las zonas de demanda desde Supabase y las mantiene en caché
  static Future<void> loadDynamicZones() async {
    try {
      final supabase = Supabase.instance.client;
      final response = await supabase
          .from('zonas_tarifa_dinamica')
          .select()
          .eq('is_active', true);
          
      _activeZones = (response as List<dynamic>)
          .map((e) => DynamicPricingZone.fromJson(e as Map<String, dynamic>))
          .toList();
      _zonesLoaded = true;
      print('Zonas dinámicas cargadas: ${_activeZones.length}');
    } catch (e) {
      print('Error al cargar zonas dinámicas: $e');
    }
  }

  /// Calcula la distancia entre dos coordenadas en km usando Haversine
  static double _calculateDistanceKm(LatLng p1, LatLng p2) {
    var p = 0.017453292519943295;
    var c = math.cos;
    var a = 0.5 -
        c((p2.latitude - p1.latitude) * p) / 2 +
        c(p1.latitude * p) * c(p2.latitude * p) * (1 - c((p2.longitude - p1.longitude) * p)) / 2;
    return 12742 * math.asin(math.sqrt(a));
  }

  static double calculateDynamicPrice(double distanceMeters, double durationSeconds, {LatLng? origin}) {
    if (distanceMeters <= 0 && durationSeconds <= 0) return tarifaMinima;

    final double distanceKm = distanceMeters / 1000.0;
    final double durationMin = durationSeconds / 60.0;

    double tarifaBase = banderazo + (distanceKm * costoPorKm) + (durationMin * costoPorMinuto);

    if (tarifaBase < tarifaMinima) {
      tarifaBase = tarifaMinima;
    }

    final double multiplicadorHorario = _getHorarioMultiplier();
    double multiplicadorZona = 1.0;

    if (origin != null && _zonesLoaded) {
      for (var zone in _activeZones) {
        final zoneCenter = LatLng(zone.lat, zone.lng);
        final dist = _calculateDistanceKm(origin, zoneCenter);
        if (dist <= zone.radiusKm) {
          final factor = 1.0 + (zone.percentageIncrease / 100.0);
          if (factor > multiplicadorZona) {
            multiplicadorZona = factor;
          }
        }
      }
    }

    final double tarifaFinal = tarifaBase * multiplicadorHorario * multiplicadorZona;
    return double.parse(tarifaFinal.toStringAsFixed(2));
  }

  static double _getHorarioMultiplier() {
    final DateTime now = DateTime.now();
    final int hour = now.hour;

    if (hour >= 0 && hour <= 5) return 1.30;
    if (hour >= 7 && hour <= 9) return 1.20;
    if (hour >= 18 && hour <= 20) return 1.20;

    return 1.0;
  }
}
