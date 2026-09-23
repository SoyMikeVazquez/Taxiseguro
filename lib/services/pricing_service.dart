class PricingService {
  // Tarifas aproximadas basadas en el modelo base de UberX (CDMX)
  static const double banderazo = 20.00; // Tarifa base + Cuota de solicitud/seguridad
  static const double costoPorKm = 5.50;
  static const double costoPorMinuto = 1.80;
  static const double tarifaMinima = 45.00;

  /// Calcula la tarifa final tomando en cuenta la distancia, tiempo y modificadores dinámicos.
  /// [distanceMeters] Distancia total en metros.
  /// [durationSeconds] Tiempo estimado en segundos (considerando el tráfico provisto por Mapbox).
  static double calculateDynamicPrice(double distanceMeters, double durationSeconds) {
    if (distanceMeters <= 0 && durationSeconds <= 0) return tarifaMinima;

    // Convertir a unidades base (Kilómetros y Minutos)
    final double distanceKm = distanceMeters / 1000.0;
    final double durationMin = durationSeconds / 60.0;

    // Fórmula Base
    double tarifaBase = banderazo + (distanceKm * costoPorKm) + (durationMin * costoPorMinuto);

    // Aplicar tarifa mínima de seguridad
    if (tarifaBase < tarifaMinima) {
      tarifaBase = tarifaMinima;
    }

    // Factores Dinámicos
    final double multiplicadorHorario = _getHorarioMultiplier();
    
    // (Opcional a futuro) Podrías agregar un multiplicador de clima aquí si consultas una API.
    // final double multiplicadorClima = _getClimaMultiplier();

    final double tarifaFinal = tarifaBase * multiplicadorHorario;

    // Redondear a 2 decimales para evitar centavos fraccionados irreales
    return double.parse(tarifaFinal.toStringAsFixed(2));
  }

  /// Retorna un multiplicador dependiendo de la hora del sistema del dispositivo.
  static double _getHorarioMultiplier() {
    final DateTime now = DateTime.now();
    final int hour = now.hour;

    // Madrugada: 00:00 (12 AM) a 05:59 AM -> 30% extra
    if (hour >= 0 && hour <= 5) {
      return 1.30;
    }
    
    // Hora Pico Mañana: 07:00 a 09:59 AM -> 20% extra
    if (hour >= 7 && hour <= 9) {
      return 1.20;
    }

    // Hora Pico Tarde: 18:00 (6 PM) a 20:59 (8 PM) -> 20% extra
    if (hour >= 18 && hour <= 20) {
      return 1.20;
    }

    // Horario Normal -> 1.0 (Sin incremento)
    return 1.0;
  }
}
