import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../models/trip.dart';
import '../services/mapbox_service.dart';
import '../env/env.dart';
class TripDetailScreen extends StatefulWidget {
  final Trip trip;

  const TripDetailScreen({
    super.key,
    required this.trip,
  });

  @override
  State<TripDetailScreen> createState() => _TripDetailScreenState();
}

class _TripDetailScreenState extends State<TripDetailScreen> {
  double _userRating = 5.0;
  final TextEditingController _commentController = TextEditingController();
  bool _hasRated = false;

  late final LatLng _originCoord;
  late final LatLng _destCoord;
  List<LatLng> _routePoints = [];
  final MapboxService _mapboxService = MapboxService();

  @override
  void initState() {
    super.initState();
    _originCoord = LatLng(widget.trip.originLat ?? 19.4326, widget.trip.originLng ?? -99.1332);
    _destCoord = LatLng(widget.trip.destinationLat ?? 19.42, widget.trip.destinationLng ?? -99.14);
    _fetchRoute();
  }

  Future<void> _fetchRoute() async {
    final routeResult = await _mapboxService.getDrivingRoute(_originCoord, _destCoord);
    if (mounted && routeResult != null && routeResult.polylinePoints.isNotEmpty) {
      setState(() {
        _routePoints = routeResult.polylinePoints;
      });
    } else if (mounted) {
      setState(() {
        _routePoints = [_originCoord, _destCoord];
      });
    }
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  String _formatDate(DateTime? dateTime) {
    if (dateTime == null) return 'Fecha no disponible';
    final local = dateTime.toLocal();
    final day = local.day.toString().padLeft(2, '0');
    final month = _getMonthName(local.month);
    final hour = local.hour > 12 ? local.hour - 12 : (local.hour == 0 ? 12 : local.hour);
    final minute = local.minute.toString().padLeft(2, '0');
    final period = local.hour >= 12 ? 'PM' : 'AM';
    return '$day de $month • $hour:$minute $period';
  }

  String _getMonthName(int month) {
    const months = [
      'Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun',
      'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'
    ];
    return months[month - 1];
  }

  void _submitRating() {
    setState(() {
      _hasRated = true;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('¡Gracias por calificar a tu conductor!'),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final totalFare = widget.trip.fare ?? 120.0;
    final baseFare = totalFare * 0.85;
    final taxes = totalFare * 0.15;
    final pm = widget.trip.paymentMethod ?? 'efectivo';
    final paymentMethodDisplay = pm.isNotEmpty ? '${pm[0].toUpperCase()}${pm.substring(1)}' : 'Efectivo';

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Detalle del Viaje',
          style: TextStyle(fontFamily: 'Google Sans', color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1. Static Mini Map Preview
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(32),
                bottomRight: Radius.circular(32),
              ),
              child: SizedBox(
                height: 220,
                child: FlutterMap(
                  options: MapOptions(
                    initialCameraFit: CameraFit.bounds(
                      bounds: LatLngBounds.fromPoints([_originCoord, _destCoord]),
                      padding: const EdgeInsets.all(40.0),
                    ),
                    interactionOptions: const InteractionOptions(flags: InteractiveFlag.none),
                  ),
                  children: [
                    TileLayer(
                      urlTemplate: 'https://api.mapbox.com/styles/v1/mapbox/dark-v11/tiles/256/{z}/{x}/{y}@2x?access_token=${Env.mapboxApiKey}',
                      userAgentPackageName: 'com.taxiseguro.app',
                    ),
                    PolylineLayer(
                      polylines: [
                        Polyline(
                          points: _routePoints.isNotEmpty ? _routePoints : [_originCoord, _destCoord],
                          strokeWidth: 4.0,
                          color: const Color(0xFFFFD700), // Amarillo brillante
                        ),
                      ],
                    ),
                    MarkerLayer(
                      markers: [
                        Marker(
                          point: _originCoord,
                          width: 24,
                          height: 24,
                          child: const Icon(Icons.circle, color: Colors.white, size: 14),
                        ),
                        Marker(
                          point: _destCoord,
                          width: 24,
                          height: 24,
                          child: const Icon(Icons.location_on, color: Color(0xFFC7FF2E), size: 22),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // 2. Conductor Card & Rating Breakdown
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: const [
                        BoxShadow(color: Color(0x0A000000), blurRadius: 15, offset: Offset(0, 5)),
                      ],
                    ),
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 28,
                              backgroundColor: Colors.grey[200],
                              backgroundImage: widget.trip.photoDriver != null && widget.trip.photoDriver!.isNotEmpty
                                  ? NetworkImage(widget.trip.photoDriver!)
                                  : null,
                              child: widget.trip.photoDriver == null || widget.trip.photoDriver!.isEmpty
                                  ? const Icon(Icons.person, size: 36, color: Colors.black54)
                                  : null,
                            ),
                            const SizedBox(width: 14),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.trip.nameDriver?.isNotEmpty == true
                                        ? widget.trip.nameDriver!
                                        : 'Conductor',
                                    style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'Nissan Versa • Blanco (XYZ-8921)',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // 3. Dirección y Horarios Card
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: const [
                        BoxShadow(color: Color(0x0A000000), blurRadius: 15, offset: Offset(0, 5)),
                      ],
                    ),
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _formatDate(widget.trip.createdAt),
                          style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.grey[600]),
                        ),
                        const SizedBox(height: 14),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                const Icon(Icons.circle, size: 12, color: Colors.blueAccent),
                                Container(width: 2, height: 28, color: Colors.grey[300]),
                                const Icon(Icons.location_on, size: 16, color: Colors.redAccent),
                              ],
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.trip.originAddress,
                                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    widget.trip.destinationAddress,
                                    style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // 4. Calificar al Conductor Card
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: const [
                        BoxShadow(color: Color(0x0A000000), blurRadius: 15, offset: Offset(0, 5)),
                      ],
                    ),
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Califica a tu conductor',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(5, (index) {
                            final starValue = index + 1.0;
                            return IconButton(
                              icon: Icon(
                                starValue <= _userRating ? Icons.star : Icons.star_border,
                                color: Colors.amber,
                                size: 36,
                              ),
                              onPressed: _hasRated
                                  ? null
                                  : () {
                                      setState(() {
                                        _userRating = starValue;
                                      });
                                    },
                            );
                          }),
                        ),
                        const SizedBox(height: 8),
                        if (!_hasRated) ...[
                          TextField(
                            controller: _commentController,
                            decoration: InputDecoration(
                              hintText: 'Escribe un comentario (opcional)...',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                              contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                            ),
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            width: double.infinity,
                            height: 56,
                            child: ElevatedButton(
                              onPressed: _submitRating,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFC7FF2E), // Electric Green
                                foregroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                elevation: 0,
                              ),
                              child: const Text('Enviar Calificación', style: TextStyle(fontFamily: 'Google Sans', fontSize: 18, fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ] else
                          const Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(
                                '✓ Calificación enviada',
                                style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // 5. Desglose de Pago / Recibo
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: const [
                        BoxShadow(color: Color(0x0A000000), blurRadius: 15, offset: Offset(0, 5)),
                      ],
                    ),
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Detalles del Pago',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Tarifa base Taxiseguro', style: TextStyle(color: Colors.black87)),
                            Text('\$${baseFare.toStringAsFixed(2)}', style: const TextStyle(fontWeight: FontWeight.w500)),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Impuestos y cuotas de servicio', style: TextStyle(color: Colors.black87)),
                            Text('\$${taxes.toStringAsFixed(2)}', style: const TextStyle(fontWeight: FontWeight.w500)),
                          ],
                        ),
                        const Divider(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Total Cobrado ($paymentMethodDisplay)', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                            Text('\$${totalFare.toStringAsFixed(2)}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
