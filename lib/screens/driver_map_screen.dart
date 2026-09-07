import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../models/trip.dart';
import '../services/trip_service.dart';
import '../services/location_service.dart';
import 'active_trip_screen.dart';
import '../env/env.dart';

class DriverMapScreen extends StatefulWidget {
  const DriverMapScreen({super.key});

  @override
  State<DriverMapScreen> createState() => _DriverMapScreenState();
}

class _DriverMapScreenState extends State<DriverMapScreen> {
  final TripService _tripService = TripService();
  final LocationService _locationService = LocationService();
  final MapController _mapController = MapController();
  
  String? _driverId;
  bool _isDriverActive = true;
  Trip? _activeTrip;
  
  // Ubicación inicial por defecto (se actualizará con el GPS)
  LatLng _currentLocation = const LatLng(19.4326, -99.1332);
  bool _isLoadingLocation = true;
  bool _locationPermissionGranted = false;
  
  StreamSubscription<LatLng>? _locationSubscription;

  @override
  void dispose() {
    _locationSubscription?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _driverId = Supabase.instance.client.auth.currentUser?.id;
    _initializeLocationAndState();
  }

  Future<void> _initializeLocationAndState() async {
    // 1. Obtener ubicación real
    final loc = await _locationService.getCurrentLocation();
    
    if (!mounted) return;
    
    if (loc == null) {
      // Permiso denegado o GPS apagado
      setState(() {
        _isLoadingLocation = false;
        _locationPermissionGranted = false;
      });
      return;
    }

    // Permiso otorgado y ubicación obtenida
    setState(() {
      _currentLocation = loc;
      _isLoadingLocation = false;
      _locationPermissionGranted = true;
    });

    // Iniciar el seguimiento en tiempo real
    _locationSubscription = _locationService.getLocationStream().listen((newLoc) {
      if (mounted) {
        setState(() {
          _currentLocation = newLoc;
        });
        // El mapa seguirá la ubicación en tiempo real del conductor
        try {
          _mapController.move(newLoc, _mapController.camera.zoom);
        } catch (_) {}
      }
    });

    // 2. Cargar estado del conductor
    _loadDriverState(isInitialLoad: true);
  }

  Future<void> _loadDriverState({bool isInitialLoad = false}) async {
    if (_driverId == null) return;
    try {
      final userResp = await Supabase.instance.client
          .from('conductores')
          .select('estatus')
          .eq('user_id', _driverId!)
          .maybeSingle();
      
      final activeTrip = await _tripService.getActiveTrip(_driverId!);

      if (mounted) {
        setState(() {
          if (userResp != null && userResp['estatus'] != null) {
            _isDriverActive = userResp['estatus'] == 'activo';
          }
          _activeTrip = activeTrip;
        });

        // Si el conductor acaba de abrir la app y tiene un viaje activo, mandarlo directo a esa pantalla
        if (isInitialLoad && activeTrip != null) {
          // Usamos un pequeño delay para asegurar que el build inicial se completó
          Future.delayed(const Duration(milliseconds: 300), () {
            if (mounted) {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => ActiveTripScreen(trip: activeTrip)),
              ).then((_) => _loadDriverState());
            }
          });
        }
      }
    } catch (e) {
      print('Error al cargar estado del conductor: $e');
    }
  }

  Future<void> _toggleDriverStatus(bool value) async {
    final previousStatus = _isDriverActive;
    setState(() => _isDriverActive = value);
    try {
      await Supabase.instance.client
          .from('conductores')
          .update({'estatus': value ? 'activo' : 'inactivo'})
          .eq('user_id', _driverId!);
    } catch (e) {
      if (mounted) {
        setState(() => _isDriverActive = previousStatus);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Error al cambiar el estado.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _acceptTrip(Trip trip) async {
    if (_driverId == null || trip.id == null) return;

    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text('¿Aceptar este trabajo?'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.my_location, color: Colors.blueAccent, size: 20),
                const SizedBox(width: 8),
                Expanded(child: Text(trip.originAddress, style: const TextStyle(fontWeight: FontWeight.bold))),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const Icon(Icons.location_on, color: Colors.redAccent, size: 20),
                const SizedBox(width: 8),
                Expanded(child: Text(trip.destinationAddress, style: const TextStyle(fontWeight: FontWeight.bold))),
              ],
            ),
            if (trip.fare != null && trip.fare! > 0) ...[
              const SizedBox(height: 16),
              Text(
                'Tarifa estimada: \$${trip.fare!.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green),
              ),
            ],
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: const Text('Cancelar', style: TextStyle(color: Colors.grey)),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            child: const Text('Aceptar Viaje'),
          ),
        ],
      ),
    );

    if (confirm == true) {
      final success = await _tripService.acceptTrip(trip.id!, _driverId!);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              success 
                  ? '¡Viaje aceptado! Dirígete al punto de recogida.' 
                  : 'Este viaje ya no está disponible o fue tomado por otro conductor.',
            ),
            backgroundColor: success ? Colors.amber[700] : Colors.red,
          ),
        );
        if (success) {
          final acceptedTrip = Trip(
            id: trip.id,
            userId: trip.userId,
            driverId: _driverId,
            originAddress: trip.originAddress,
            destinationAddress: trip.destinationAddress,
            originLat: trip.originLat,
            originLng: trip.originLng,
            destinationLat: trip.destinationLat,
            destinationLng: trip.destinationLng,
            postalCode: trip.postalCode,
            delegation: trip.delegation,
            status: 'accepted',
            fare: trip.fare,
            distanceKm: trip.distanceKm,
            createdAt: trip.createdAt,
            paymentMethod: trip.paymentMethod,
          );
          
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => ActiveTripScreen(trip: acceptedTrip),
            ),
          ).then((_) => _loadDriverState());
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoadingLocation) {
      return const Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(color: Colors.black),
              SizedBox(height: 16),
              Text('Obteniendo tu ubicación actual...'),
            ],
          ),
        ),
      );
    }

    if (!_locationPermissionGranted) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(Icons.location_off, size: 80, color: Colors.redAccent),
              const SizedBox(height: 24),
              const Text(
                'Ubicación Necesaria',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              const Text(
                'Para poder recibir y realizar viajes, es obligatorio otorgar permisos de ubicación y mantener el GPS encendido. Esta aplicación no puede funcionar sin este permiso.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              const SizedBox(height: 48),
              ElevatedButton(
                onPressed: _initializeLocationAndState,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('Reintentar Permiso', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          // 1. Mapa de Fondo
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialCenter: _currentLocation,
              initialZoom: 14.0,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://api.mapbox.com/styles/v1/mapbox/dark-v11/tiles/256/{z}/{x}/{y}@2x?access_token=${Env.mapboxApiKey}',
                userAgentPackageName: 'com.taxiseguro.app',
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    point: _currentLocation,
                    width: 60,
                    height: 60,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFD700).withValues(alpha: 0.3),
                            shape: BoxShape.circle,
                          ),
                        ),
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFD700), // Amarillo
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black, width: 3),
                            boxShadow: const [
                              BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(0, 2)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),

          // 1.5 ALERTA TOP: VIAJE ACTIVO
          if (_activeTrip != null)
            Positioned(
              top: MediaQuery.of(context).padding.top + 16,
              left: 16,
              right: 16,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => ActiveTripScreen(trip: _activeTrip!)),
                  ).then((_) => _loadDriverState());
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(0, 4))],
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.warning_amber_rounded, color: Colors.white),
                      SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          '¡Tienes un viaje activo! Toca aquí para regresar a la navegación.',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),
              ).animate().fade(duration: 400.ms).slideY(begin: -0.5, end: 0, curve: Curves.easeOutQuad),
            ),

          // 2. Control de Estado Superior (Activo / Inactivo)
          Positioned(
            top: MediaQuery.of(context).padding.top + 16,
            left: 16,
            right: 16,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(30),
                boxShadow: const [
                  BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 4)),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: _isDriverActive ? Colors.green[100] : Colors.grey[200],
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          _isDriverActive ? Icons.wifi_tethering : Icons.portable_wifi_off,
                          color: _isDriverActive ? Colors.green[700] : Colors.grey[600],
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        _isDriverActive ? 'En línea' : 'Desconectado',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: _isDriverActive ? Colors.green[800] : Colors.grey[800],
                        ),
                      ),
                    ],
                  ),
                  Switch(
                    value: _isDriverActive,
                    activeColor: Colors.green,
                    onChanged: _toggleDriverStatus,
                  ),
                ],
              ),
            ).animate().fade(duration: 500.ms).slideY(begin: -0.5, end: 0, duration: 500.ms, curve: Curves.easeOutQuad),
          ),

          // 3. Botón flotante para simular viaje (solo para pruebas)
          Positioned(
            top: MediaQuery.of(context).padding.top + 90,
            right: 16,
            child: Column(
              children: [
                FloatingActionButton.small(
                  heroTag: 'simulate_trip',
                  backgroundColor: Colors.black,
                  onPressed: () {
                    final trip = Trip(
                      id: 'simulated_trip_123',
                      userId: _driverId ?? 'simulated_user',
                      driverId: _driverId ?? 'simulated_driver',
                      originAddress: 'Av. Revolución 1234, MTY',
                      destinationAddress: 'Parque Fundidora, MTY',
                      fare: 150.00,
                      status: 'accepted',
                      paymentMethod: 'efectivo',
                    );
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => ActiveTripScreen(trip: trip)),
                    ).then((_) => _loadDriverState());
                  },
                  child: const Icon(Icons.add_location_alt, color: Colors.white),
                ),
                const SizedBox(height: 12),
                FloatingActionButton.small(
                  heroTag: 'reload_stream',
                  backgroundColor: Colors.white,
                  onPressed: () {
                    // Trigger a rebuild of the stream builder
                    setState(() {});
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Buscando viajes recientes...'), duration: Duration(seconds: 1)),
                    );
                  },
                  child: const Icon(Icons.refresh, color: Colors.black),
                ),
              ],
            ),
          ),

          // 4. Panel Inferior de Viajes (DraggableBottomSheet o Stacked container)
          if (_activeTrip != null)
            Positioned(
              bottom: 120, // Por encima del menú liquid glass
              left: 16,
              right: 16,
              child: _buildActiveTripCard().animate().fade(duration: 600.ms, delay: 200.ms).slideY(begin: 0.5, end: 0, duration: 600.ms, delay: 200.ms, curve: Curves.easeOutQuad),
            )
          else if (_isDriverActive)
            Positioned(
              bottom: 120, // Por encima del menú liquid glass
              left: 0,
              right: 0,
              child: _buildPendingTripsList().animate().fade(duration: 600.ms, delay: 200.ms).slideY(begin: 0.5, end: 0, duration: 600.ms, delay: 200.ms, curve: Curves.easeOutQuad),
            )
          else
            Positioned(
              bottom: 120,
              left: 16,
              right: 16,
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.95),
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: const [
                    BoxShadow(color: Colors.black12, blurRadius: 20, offset: Offset(0, 10)),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.bedtime, size: 48, color: Colors.indigo[300]),
                    const SizedBox(height: 16),
                    const Text('Estás desconectado', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    const Text(
                      'Ponte en línea para recibir solicitudes de viaje cercanas.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ).animate().fade(duration: 600.ms, delay: 200.ms).slideY(begin: 0.5, end: 0, duration: 600.ms, delay: 200.ms, curve: Curves.easeOutQuad),
            ),
        ],
      ),
    );
  }

  Widget _buildActiveTripCard() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => ActiveTripScreen(trip: _activeTrip!)),
        ).then((_) => _loadDriverState());
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF1E3C72), Color(0xFF2A5298)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(24),
          boxShadow: const [
            BoxShadow(color: Color(0x4D1E3C72), blurRadius: 16, offset: Offset(0, 8)),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), shape: BoxShape.circle),
                  child: const Icon(Icons.navigation, color: Colors.white, size: 24),
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Text(
                    'Viaje en progreso',
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Toca aquí para reanudar la navegación al destino.',
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPendingTripsList() {
    return StreamBuilder<List<Trip>>(
      stream: _tripService.streamPendingTrips(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            height: 180,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.95),
              borderRadius: BorderRadius.circular(24),
            ),
            child: const Center(child: CircularProgressIndicator(color: Colors.black)),
          );
        }

        final allTrips = snapshot.data ?? [];
        
        // Filtrar por radio de 5km (5000 metros)
        final trips = allTrips.where((trip) {
          if (trip.createdAt != null) {
            try {
              final createdTime = trip.createdAt!;
              if (DateTime.now().difference(createdTime).inMinutes > 35) {
                return false; // Ignorar viajes con más de 35 minutos de antigüedad
              }
            } catch (e) {
              print('Error parseando fecha: $e');
            }
          }

          if (trip.originLat == null || trip.originLng == null) return true; // Mostrar si no hay coordenadas por seguridad
          final distanceInMeters = Geolocator.distanceBetween(
            _currentLocation.latitude,
            _currentLocation.longitude,
            trip.originLat!,
            trip.originLng!,
          );
          return distanceInMeters <= 5000000; // Temporal: 5000 km para pruebas en simulador
        }).toList();

        if (trips.isEmpty) {
          return Container(
            height: 180,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.95),
              borderRadius: BorderRadius.circular(24),
              boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 20, offset: Offset(0, 10))],
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.radar, size: 48, color: Colors.black26),
                  const SizedBox(height: 12),
                  Text('Buscando viajes cercanos...', style: const TextStyle(color: Colors.black87, fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  if (allTrips.isNotEmpty)
                    Text('Debug: Hay ${allTrips.length} viajes pendientes, pero a más de 5km', style: const TextStyle(color: Colors.red, fontSize: 12))
                  else
                    const Text('No hay viajes en la base de datos (Realtime vacío)', style: TextStyle(color: Colors.black54, fontSize: 13)),
                ],
              ),
            ),
          );
        }

        return SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: trips.length,
            itemBuilder: (context, index) {
              final trip = trips[index];
              return Container(
                width: MediaQuery.of(context).size.width * 0.85,
                margin: const EdgeInsets.only(right: 16, bottom: 8),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 15, offset: Offset(0, 8))],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                          decoration: BoxDecoration(color: Colors.amber[100], borderRadius: BorderRadius.circular(12)),
                          child: const Text('Nuevo Viaje', style: TextStyle(color: Colors.deepOrange, fontSize: 12, fontWeight: FontWeight.bold)),
                        ),
                        if (trip.fare != null)
                          Text('\$${trip.fare!.toStringAsFixed(2)}', style: TextStyle(color: Colors.green[700], fontSize: 18, fontWeight: FontWeight.bold))
                        else
                          const Text('Por cotizar', style: TextStyle(color: Colors.grey, fontSize: 14)),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        const Icon(Icons.location_on, size: 20, color: Colors.redAccent),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            trip.destinationAddress,
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: () => _acceptTrip(trip),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFC7FF2E), // Electric Green
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                          elevation: 0,
                        ),
                        child: const Text('Aceptar Viaje', style: TextStyle(fontFamily: 'Google Sans', fontSize: 18, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
