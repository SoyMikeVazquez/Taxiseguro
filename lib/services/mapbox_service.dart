import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';
import '../env/env.dart';
class MapboxPlace {
  final String id;
  final String text;
  final String placeName;
  final double longitude;
  final double latitude;

  MapboxPlace({
    required this.id,
    required this.text,
    required this.placeName,
    required this.longitude,
    required this.latitude,
  });

  factory MapboxPlace.fromJson(Map<String, dynamic> json) {
    final center = json['center'] as List<dynamic>?;
    return MapboxPlace(
      id: json['id'] ?? '',
      text: json['text_es'] ?? json['text'] ?? json['place_name_es'] ?? json['place_name'] ?? 'Ubicación seleccionada',
      placeName: json['place_name_es'] ?? json['place_name'] ?? json['text_es'] ?? json['text'] ?? 'Ubicación seleccionada',
      longitude: center != null && center.length >= 2 ? (center[0] as num).toDouble() : 0.0,
      latitude: center != null && center.length >= 2 ? (center[1] as num).toDouble() : 0.0,
    );
  }
}

class MapboxRouteResult {
  final List<LatLng> polylinePoints;
  final double distanceMeters;
  final double durationSeconds;

  MapboxRouteResult({
    required this.polylinePoints,
    required this.distanceMeters,
    required this.durationSeconds,
  });
}

class MapboxService {
  static const String _mapboxToken = Env.mapboxApiKey;

  /// Busca lugares mediante la API de Geocoding de Mapbox (priorizando la proximidad local)
  Future<List<MapboxPlace>> searchPlaces(String query, {double? proximityLng, double? proximityLat}) async {
    if (query.trim().isEmpty) return [];

    final encodedQuery = Uri.encodeComponent(query);
    final proximityStr = (proximityLng != null && proximityLat != null)
        ? '&proximity=$proximityLng,$proximityLat'
        : '';

    final url = Uri.parse(
      'https://api.mapbox.com/geocoding/v5/mapbox.places/$encodedQuery.json?access_token=$_mapboxToken&country=mx&language=es&autocomplete=true&limit=5$proximityStr',
    );

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final features = data['features'] as List<dynamic>?;
        if (features != null) {
          return features.map((feature) => MapboxPlace.fromJson(feature)).toList();
        }
      }
    } catch (e) {
      print('Error buscando lugares en Mapbox: $e');
    }
    return [];
  }

  /// Geocodificación inversa: Convierte Coordenadas (Lat, Lng) en una dirección en texto
  Future<String?> reverseGeocode(LatLng location) async {
    final url = Uri.parse(
      'https://api.mapbox.com/geocoding/v5/mapbox.places/${location.longitude},${location.latitude}.json?access_token=$_mapboxToken&language=es&limit=1',
    );

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final features = data['features'] as List<dynamic>?;
        if (features != null && features.isNotEmpty) {
          return features[0]['place_name_es'] ?? features[0]['place_name'] ?? features[0]['text_es'] ?? features[0]['text'] ?? 'Ubicación en el mapa';
        }
      }
    } catch (e) {
      print('Error en geocodificación inversa: $e');
    }
    return null;
  }

  /// Obtiene la ruta optima por calles (Driving API) entre origen y destino
  Future<MapboxRouteResult?> getDrivingRoute(LatLng origin, LatLng destination) async {
    final url = Uri.parse(
      'https://api.mapbox.com/directions/v5/mapbox/driving/${origin.longitude},${origin.latitude};${destination.longitude},${destination.latitude}?geometries=geojson&overview=full&access_token=$_mapboxToken',
    );

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final routes = data['routes'] as List<dynamic>?;
        if (routes != null && routes.isNotEmpty) {
          final firstRoute = routes[0];
          final geometry = firstRoute['geometry'];
          final coordinates = geometry['coordinates'] as List<dynamic>;

          final List<LatLng> points = coordinates.map((coord) {
            final lng = (coord[0] as num).toDouble();
            final lat = (coord[1] as num).toDouble();
            return LatLng(lat, lng);
          }).toList();

          return MapboxRouteResult(
            polylinePoints: points,
            distanceMeters: (firstRoute['distance'] as num).toDouble(),
            durationSeconds: (firstRoute['duration'] as num).toDouble(),
          );
        }
      }
    } catch (e) {
      print('Error obteniendo la ruta de Mapbox: $e');
    }
    return null;
  }
}
