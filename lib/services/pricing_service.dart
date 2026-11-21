import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:latlong2/latlong.dart';
import 'dart:math' as math;
import '../models/dynamic_pricing_zone.dart';

class KmTarifaItem {
  final int km;
  final double tarifa;

  KmTarifaItem({required this.km, required this.tarifa});

  Map<String, dynamic> toJson() => {
    'km': km,
    'tarifa': tarifa,
  };

  factory KmTarifaItem.fromJson(Map<String, dynamic> json) {
    return KmTarifaItem(
      km: (json['km'] as num?)?.toInt() ?? 1,
      tarifa: (json['tarifa'] as num?)?.toDouble() ?? 25.0,
    );
  }

  KmTarifaItem copyWith({int? km, double? tarifa}) {
    return KmTarifaItem(
      km: km ?? this.km,
      tarifa: tarifa ?? this.tarifa,
    );
  }
}

class PricingService {
  // ==========================================
  // VALORES POR DEFECTO OFICIALES (CHIAPAS)
  // ==========================================
  static const double defaultBanderazo = 25.00;
  static const double defaultKmBaseIncluidos = 2.0;
  static const double defaultPrecioKmExtra = 7.50;
  static const double defaultCostoKm = 5.50;
  static const double defaultCostoMinuto = 0.00;

  static const List<Map<String, dynamic>> defaultTabuladorOficial = [
    {'km': 1, 'tarifa': 25.0},
    {'km': 2, 'tarifa': 25.0},
    {'km': 3, 'tarifa': 35.0},
    {'km': 4, 'tarifa': 45.0},
    {'km': 5, 'tarifa': 55.0},
    {'km': 6, 'tarifa': 62.0},
    {'km': 7, 'tarifa': 70.0},
    {'km': 8, 'tarifa': 77.0},
    {'km': 9, 'tarifa': 85.0},
    {'km': 10, 'tarifa': 92.0},
    {'km': 11, 'tarifa': 100.0},
    {'km': 12, 'tarifa': 107.0},
    {'km': 13, 'tarifa': 115.0},
    {'km': 14, 'tarifa': 122.0},
    {'km': 15, 'tarifa': 130.0},
    {'km': 16, 'tarifa': 137.0},
    {'km': 17, 'tarifa': 145.0},
    {'km': 18, 'tarifa': 152.0},
    {'km': 19, 'tarifa': 160.0},
    {'km': 20, 'tarifa': 167.0},
    {'km': 21, 'tarifa': 175.0},
    {'km': 22, 'tarifa': 182.0},
    {'km': 23, 'tarifa': 190.0},
    {'km': 24, 'tarifa': 197.0},
    {'km': 25, 'tarifa': 205.0},
  ];

  // ==========================================
  // ESTADO ACTIVO EN MEMORIA (NON-NULL GARANTIZADO)
  // ==========================================
  // El tabulador siempre está activo como base fija
  static bool usarTarifaManual = true;

  // 1. Mapa de calor por demanda / solicitudes en tiempo real
  static bool activarMapaCalorDemanda = false;

  // 2. Círculos manuales creados por el administrador
  static bool activarZonasManuales = false;

  static double banderazo = defaultBanderazo;
  static double precioKmAdicional = defaultPrecioKmExtra;
  static double costoPorKm = defaultCostoKm;
  static double costoPorMinuto = defaultCostoMinuto;
  static double tarifaMinima = defaultBanderazo;

  static List<KmTarifaItem> tabuladorKm = defaultTabuladorOficial
      .map((e) => KmTarifaItem.fromJson(e))
      .toList();

  static List<DynamicPricingZone> _activeZones = [];
  static bool _zonesLoaded = false;
  static bool _configLoaded = false;

  /// Carga la configuración de tarifas y las zonas dinámicas desde Supabase
  static Future<void> loadPricingConfig() async {
    try {
      final supabase = Supabase.instance.client;
      final response = await supabase
          .from('configuracion_tarifas')
          .select()
          .eq('id', 'principal')
          .maybeSingle();

      if (response != null) {
        usarTarifaManual = true; // El tabulador siempre está vigente como base
        activarMapaCalorDemanda = response['activar_mapa_calor_demanda'] as bool? ?? false;
        activarZonasManuales = response['activar_zonas_manuales'] as bool? ?? false;

        banderazo = (response['banderazo_base'] as num?)?.toDouble() ?? defaultBanderazo;
        tarifaMinima = banderazo;
        precioKmAdicional = (response['precio_km_adicional'] as num?)?.toDouble() ?? defaultPrecioKmExtra;
        costoPorMinuto = (response['costo_por_minuto'] as num?)?.toDouble() ?? defaultCostoMinuto;

        final rawList = response['tabulador_json'] as List<dynamic>?;
        if (rawList != null && rawList.isNotEmpty) {
          tabuladorKm = rawList
              .map((e) => KmTarifaItem.fromJson(e as Map<String, dynamic>))
              .toList();
          tabuladorKm.sort((a, b) => a.km.compareTo(b.km));
        }
      }
      _configLoaded = true;
    } catch (e) {
      // Si la tabla aún no existe o hay problemas de red, se mantienen los valores por defecto seguros
      _configLoaded = true;
    }

    await loadDynamicZones();
  }

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
    } catch (_) {
      // Ignorar silenciosamente si no hay conexión
    }
  }

  /// Guarda la configuración completa de tarifas en Supabase
  static Future<void> savePricingConfig({
    required bool mapaCalorDemanda,
    required bool zonasManuales,
    required double banderazoBase,
    required double extraKm,
    required double minCost,
    required List<KmTarifaItem> tabulador,
  }) async {
    final supabase = Supabase.instance.client;

    final sortedTabulador = List<KmTarifaItem>.from(tabulador)
      ..sort((a, b) => a.km.compareTo(b.km));

    final jsonPayload = sortedTabulador.map((e) => e.toJson()).toList();

    await supabase.from('configuracion_tarifas').upsert({
      'id': 'principal',
      'usar_tarifa_manual': true,
      'activar_mapa_calor_demanda': mapaCalorDemanda,
      'activar_zonas_manuales': zonasManuales,
      'banderazo_base': banderazoBase,
      'precio_km_adicional': extraKm,
      'costo_por_minuto': minCost,
      'tabulador_json': jsonPayload,
      'updated_at': DateTime.now().toIso8601String(),
    });

    // Actualizar estado en memoria
    usarTarifaManual = true;
    activarMapaCalorDemanda = mapaCalorDemanda;
    activarZonasManuales = zonasManuales;
    banderazo = banderazoBase;
    tarifaMinima = banderazoBase;
    precioKmAdicional = extraKm;
    costoPorMinuto = minCost;
    tabuladorKm = sortedTabulador;
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

  /// Calcula la tarifa manual escalonada según el tabulador por KM (Siempre activo)
  static double _calculateManualTabuladorFare(double distanceKm) {
    if (tabuladorKm.isEmpty) return banderazo;

    // Si es igual o menor al primer km configurado (ej. 1 km o 2 km)
    if (distanceKm <= tabuladorKm.first.km) {
      return tabuladorKm.first.tarifa;
    }

    // Si la distancia excede el km máximo configurado en la tabla
    final lastItem = tabuladorKm.last;
    if (distanceKm >= lastItem.km) {
      final double extraDistance = distanceKm - lastItem.km;
      final double extraCost = extraDistance * precioKmAdicional;
      return (lastItem.tarifa + extraCost).roundToDouble();
    }

    // Interpolación proporcional entre los dos escalones más cercanos
    for (int i = 0; i < tabuladorKm.length - 1; i++) {
      final current = tabuladorKm[i];
      final next = tabuladorKm[i + 1];

      if (distanceKm >= current.km && distanceKm <= next.km) {
        final double rangeDist = (next.km - current.km).toDouble();
        if (rangeDist <= 0) return current.tarifa;
        final double fraction = (distanceKm - current.km) / rangeDist;
        final double interpolated = current.tarifa + fraction * (next.tarifa - current.tarifa);
        return interpolated.roundToDouble();
      }
    }

    return lastItem.tarifa;
  }

  /// Cálculo general de la tarifa:
  /// - Base: Tabulador oficial por KM (siempre vigente)
  /// - Multiplicador 1: Mapa de calor / demanda (si está activo)
  /// - Multiplicador 2: Círculos manuales del admin (si están activos)
  /// - Descuento: Descuento del 20% en viajes para pasajeros con referido
  /// - Ajuste por método de pago: +$4.00 dinámico exclusivo para pagos con tarjeta
  static double calculateDynamicPrice(
    double distanceMeters,
    double durationSeconds, {
    LatLng? origin,
    String? paymentMethod,
    double discountPercent = 0.0,
  }) {
    if (distanceMeters <= 0 && durationSeconds <= 0) {
      double baseMin = tarifaMinima;
      if (discountPercent > 0.0) {
        baseMin -= (baseMin * (discountPercent / 100.0));
      }
      final double baseMinima = (paymentMethod == 'tarjeta' || paymentMethod == 'mercadopago')
          ? (baseMin + 4.0)
          : baseMin;
      return double.parse(baseMinima.toStringAsFixed(2));
    }

    final double distanceKm = distanceMeters / 1000.0;
    final double durationMin = durationSeconds / 60.0;

    // Base del tabulador (siempre vigente)
    double tarifaBase = _calculateManualTabuladorFare(distanceKm);

    // Si se configuró costo por minuto de tráfico
    if (costoPorMinuto > 0) {
      tarifaBase += (durationMin * costoPorMinuto);
    }

    if (tarifaBase < tarifaMinima) {
      tarifaBase = tarifaMinima;
    }

    // Multiplicador 1: Mapa de calor por demanda (horas pico / densidad)
    double multiplicadorDemanda = 1.0;
    if (activarMapaCalorDemanda) {
      multiplicadorDemanda = _getHorarioMultiplier();
    }

    // Multiplicador 2: Círculos manuales establecidos por el administrador en el mapa
    double multiplicadorZonasManuales = 1.0;
    if (activarZonasManuales && origin != null && _zonesLoaded) {
      for (var zone in _activeZones) {
        final zoneCenter = LatLng(zone.lat, zone.lng);
        final dist = _calculateDistanceKm(origin, zoneCenter);
        if (dist <= zone.radiusKm) {
          final factor = 1.0 + (zone.percentageIncrease / 100.0);
          if (factor > multiplicadorZonasManuales) {
            multiplicadorZonasManuales = factor;
          }
        }
      }
    }

    double tarifaFinal = tarifaBase * multiplicadorDemanda * multiplicadorZonasManuales;

    // Descuento por sistema de referidos para pasajeros (ej. 20%)
    if (discountPercent > 0.0) {
      final double discountAmount = tarifaFinal * (discountPercent / 100.0);
      tarifaFinal -= discountAmount;
      if (tarifaFinal < 0) tarifaFinal = 0.0;
    }

    // Ajuste dinámico de tarifa para pagos con tarjeta (+4.00 MXN)
    if (paymentMethod == 'tarjeta' || paymentMethod == 'mercadopago') {
      tarifaFinal += 4.00;
    }

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
