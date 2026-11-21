import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class LocationService {
  /// Caché estática en memoria de la última ubicación GPS real obtenida
  static LatLng? lastKnownLocation;

  /// Indica si ya se obtuvo al menos una lectura de GPS real del dispositivo
  static bool get hasRealGpsFix => lastKnownLocation != null;

  /// Obtiene la ubicación GPS real actual del dispositivo de forma dinámica
  Future<LatLng?> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    try {
      // Verificar si los servicios de ubicación están activos
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        print('Los servicios de geolocalización están desactivados.');
        return lastKnownLocation;
      }

      // Verificar y solicitar permisos de ubicación
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          print('Permisos de geolocalización denegados.');
          return lastKnownLocation;
        }
      }
      
      if (permission == LocationPermission.deniedForever) {
        print('Permisos denegados permanentemente.');
        return lastKnownLocation;
      }
    } catch (e) {
      print('Error comprobando permisos de geolocalización: $e');
    }

    // 1. Intentar primero lectura inmediata de última posición conocida del sistema
    try {
      final lastPos = await Geolocator.getLastKnownPosition();
      if (lastPos != null) {
        lastKnownLocation = LatLng(lastPos.latitude, lastPos.longitude);
      }
    } catch (_) {}

    // 2. Obtener posición GPS de alta precisión en tiempo real
    try {
      Position position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          timeLimit: Duration(seconds: 10),
        ),
      );
      final resolved = LatLng(position.latitude, position.longitude);
      lastKnownLocation = resolved;
      return resolved;
    } catch (e) {
      print('Aviso al obtener posición GPS en tiempo real: $e');
      // Devolver la última posición real conocida si existe; nunca forzar una ciudad fija
      return lastKnownLocation;
    }
  }

  /// Escucha los cambios de posición del dispositivo en tiempo real
  Stream<LatLng> getLocationStream() {
    const locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 10,
    );

    return Geolocator.getPositionStream(locationSettings: locationSettings).map(
      (position) {
        final loc = LatLng(position.latitude, position.longitude);
        lastKnownLocation = loc;
        return loc;
      },
    );
  }
}
