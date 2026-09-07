import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../services/admin_service.dart';
import '../../env/env.dart';
class AdminHeatmapScreen extends StatefulWidget {
  const AdminHeatmapScreen({super.key});

  @override
  State<AdminHeatmapScreen> createState() => _AdminHeatmapScreenState();
}

class _AdminHeatmapScreenState extends State<AdminHeatmapScreen> {
  final AdminService _adminService = AdminService();
  final MapController _mapController = MapController();

  bool _isLoading = true;
  List<LatLng> _heatPoints = [];

  static const String _mapboxToken = Env.mapboxApiKey;

  @override
  void initState() {
    super.initState();
    _loadHeatmap();
  }

  Future<void> _loadHeatmap() async {
    setState(() => _isLoading = true);
    final points = await _adminService.getHeatmapPoints();
    if (mounted) {
      setState(() {
        _heatPoints = points;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          'Mapas de Calor (Demanda)',
          style: TextStyle(fontFamily: 'Google Sans', fontWeight: FontWeight.bold, color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.white),
            onPressed: _loadHeatmap,
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator(color: Color(0xFFC7FF2E)))
          : Stack(
              children: [
                // Mapa Mapbox Oscuro
                FlutterMap(
                  mapController: _mapController,
                  options: MapOptions(
                    initialCenter: _heatPoints.isNotEmpty ? _heatPoints.first : const LatLng(19.4326, -99.1332),
                    initialZoom: 12.5,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate: 'https://api.mapbox.com/styles/v1/mapbox/dark-v11/tiles/256/{z}/{x}/{y}@2x?access_token=$_mapboxToken',
                      userAgentPackageName: 'com.taxiseguro.app',
                    ),
                    // Capas de círculos de calor (Heatmap Clusters)
                    CircleLayer(
                      circles: _heatPoints.map((point) {
                        return CircleMarker(
                          point: point,
                          radius: 45,
                          useRadiusInMeter: false,
                          color: Colors.redAccent.withValues(alpha: 0.35),
                          borderColor: Colors.amber.withValues(alpha: 0.6),
                          borderStrokeWidth: 2,
                        );
                      }).toList(),
                    ),
                    CircleLayer(
                      circles: _heatPoints.map((point) {
                        return CircleMarker(
                          point: point,
                          radius: 22,
                          useRadiusInMeter: false,
                          color: const Color(0xFFFFD700).withValues(alpha: 0.65),
                          borderColor: const Color(0xFFC7FF2E),
                          borderStrokeWidth: 1.5,
                        );
                      }).toList(),
                    ),
                    MarkerLayer(
                      markers: _heatPoints.map((point) {
                        return Marker(
                          point: point,
                          width: 14,
                          height: 14,
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Color(0xFFC7FF2E),
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(color: Colors.white, blurRadius: 4),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),

                // Leyenda de Demanda
                Positioned(
                  bottom: 30,
                  left: 20,
                  right: 20,
                  child: Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.85),
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: Colors.white12),
                      boxShadow: const [BoxShadow(color: Colors.black54, blurRadius: 15, offset: Offset(0, 4))],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Densidad de Solicitudes en Tiempo Real',
                          style: TextStyle(color: Colors.white, fontFamily: 'Google Sans', fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            _buildLegendItem('Muy Alta', Colors.redAccent),
                            const SizedBox(width: 12),
                            _buildLegendItem('Moderada', const Color(0xFFFFD700)),
                            const SizedBox(width: 12),
                            _buildLegendItem('Normal', const Color(0xFFC7FF2E)),
                          ],
                        ),
                      ],
                    ),
                  ).animate().fade(duration: 400.ms).slideY(begin: 0.2, end: 0),
                ),
              ],
            ),
    );
  }

  Widget _buildLegendItem(String label, Color color) {
    return Expanded(
      child: Row(
        children: [
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(color: Colors.white70, fontSize: 11, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
