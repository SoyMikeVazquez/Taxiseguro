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
import '../services/background_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'active_trip_screen.dart';
import '../services/driver_shift_service.dart';
import '../services/onesignal_service.dart';
import '../env/env.dart';

class DriverMapScreen extends StatefulWidget {
  const DriverMapScreen({super.key});

  @override
  State<DriverMapScreen> createState() => _DriverMapScreenState();
}

class _DriverMapScreenState extends State<DriverMapScreen> with WidgetsBindingObserver {
  final TripService _tripService = TripService();
  final LocationService _locationService = LocationService();
  final MapController _mapController = MapController();
  
  String? _driverId;
  bool _isDriverActive = false; // Por default está como false
  Trip? _activeTrip;
  
  // Ubicación inicial por defecto (se actualizará con el GPS)
  LatLng _currentLocation = const LatLng(16.7569, -93.1292); // Tuxtla Gutiérrez, Chiapas
  bool _isLoadingLocation = true;
  bool _locationPermissionGranted = false;
  
  StreamSubscription<LatLng>? _locationSubscription;
  StreamSubscription<List<Trip>>? _pendingTripsSubscription;
  Timer? _pendingTripsRetryTimer;
  Timer? _locationRetryTimer;
  List<Trip> _pendingTrips = [];
  bool _isLoadingPendingTrips = false;
  final Set<String> _notifiedTripIds = {};
  Timer? _disconnectionTimer;
  DateTime? _lastGpsSyncTime;
  LatLng? _lastGpsSyncLocation;
  DateTime? _lastUiLocationUpdateTime;

  void _syncDriverGpsToSupabase(LatLng loc, {bool force = false}) {
    if (!_isDriverActive || _driverId == null || _driverId!.isEmpty) return;

    final now = DateTime.now();
    // Limitar sincronización a mínimo 15 segundos o desplazamiento > 50 metros (salvo que sea forzada)
    if (!force && _lastGpsSyncTime != null && now.difference(_lastGpsSyncTime!).inSeconds < 15) {
      if (_lastGpsSyncLocation != null) {
        final distanceMoved = Geolocator.distanceBetween(
          _lastGpsSyncLocation!.latitude,
          _lastGpsSyncLocation!.longitude,
          loc.latitude,
          loc.longitude,
        );
        if (distanceMoved < 50) return;
      } else {
        return;
      }
    }

    _lastGpsSyncTime = now;
    _lastGpsSyncLocation = loc;

    Supabase.instance.client
        .from('conductores')
        .update({
          'current_lat': loc.latitude,
          'current_lng': loc.longitude,
          'last_location_at': now.toUtc().toIso8601String(),
        })
        .eq('user_id', _driverId!)
        .then((_) {})
        .catchError((err) {
          debugPrint('Aviso sincronizando coordenadas de conductor: $err');
        });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _disconnectionTimer?.cancel();
    _pendingTripsRetryTimer?.cancel();
    _locationRetryTimer?.cancel();
    // No desconectar en dispose para permitir navegación interna y recepción en segundo plano
    _locationSubscription?.cancel();
    _pendingTripsSubscription?.cancel();
    _mapController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _driverId = Supabase.instance.client.auth.currentUser?.id;
    if (_driverId != null && _driverId!.isNotEmpty) {
      OneSignalService().login(_driverId!);
      OneSignalService().setTag('role', 'conductor');
    }
    OneSignalService().requestPermission();
    BackgroundServiceHelper.requestNotificationPermission();
    _initializeLocationAndState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.hidden ||
        state == AppLifecycleState.detached) {
      // IMPORTANTE: NO desactivar al conductor al salir al Home, bloquear la pantalla
      // o cerrar la actividad en Android/iOS. El conductor debe permanecer en isActivo = true
      // hasta que apague manualmente su interruptor o cierre sesión, para poder recibir
      // notificaciones Push de OneSignal fuera de la app y con pantalla bloqueada.
      _disconnectionTimer?.cancel();
      if (_isDriverActive) {
        _syncDriverGpsToSupabase(_currentLocation, force: true);
      }
    } else if (state == AppLifecycleState.resumed) {
      _disconnectionTimer?.cancel();
      _disconnectionTimer = null;
      _loadDriverState();
    }
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

    // Iniciar el seguimiento en tiempo real con manejo de errores y reconexion
    _startLocationStream();

    // 2. Cargar estado del conductor
    _loadDriverState(isInitialLoad: true);
  }

  void _startLocationStream() {
    _locationSubscription?.cancel();
    _locationRetryTimer?.cancel();
    _locationSubscription = _locationService.getLocationStream().listen(
      (newLoc) {
        if (!mounted) return;

        final now = DateTime.now();
        final shouldUpdateUi = _lastUiLocationUpdateTime == null ||
            now.difference(_lastUiLocationUpdateTime!).inSeconds >= 2 ||
            Geolocator.distanceBetween(
                  _currentLocation.latitude,
                  _currentLocation.longitude,
                  newLoc.latitude,
                  newLoc.longitude,
                ) >=
                8;

        if (shouldUpdateUi) {
          _lastUiLocationUpdateTime = now;
          setState(() {
            _currentLocation = newLoc;
          });
          try {
            _mapController.move(newLoc, _mapController.camera.zoom);
          } catch (_) {}
        } else {
          _currentLocation = newLoc;
        }

        if (_isDriverActive) {
          _syncDriverGpsToSupabase(newLoc);
        }
      },
      onError: (err) {
        debugPrint('Aviso en stream GPS de conductor (reconectando en 5s): $err');
        _locationRetryTimer?.cancel();
        _locationRetryTimer = Timer(const Duration(seconds: 5), () {
          if (mounted) _startLocationStream();
        });
      },
    );
  }

  void _startListeningToPendingTrips() {
    _pendingTripsSubscription?.cancel();
    _pendingTripsRetryTimer?.cancel();
    if (_pendingTrips.isEmpty) {
      _isLoadingPendingTrips = true;
    }

    _pendingTripsSubscription = _tripService.streamPendingTrips().listen(
      (allTrips) {
        if (!mounted) return;

        if (_isDriverActive) {
          if (_notifiedTripIds.length > 250) {
            _notifiedTripIds.clear();
          }

          for (final trip in allTrips) {
            if (trip.id == null || _notifiedTripIds.contains(trip.id)) continue;

            // Validar antigüedad (últimos 30 minutos)
            if (trip.createdAt != null) {
              final diff = DateTime.now().difference(trip.createdAt!).inMinutes;
              if (diff > 30) continue;
            }

            // Validar radio de cobertura (5 km)
            if (trip.originLat != null && trip.originLng != null) {
              final distanceInMeters = Geolocator.distanceBetween(
                _currentLocation.latitude,
                _currentLocation.longitude,
                trip.originLat!,
                trip.originLng!,
              );
              if (distanceInMeters > 5000) continue;
            }

            // Marcar como notificado
            _notifiedTripIds.add(trip.id!);

            // Emitir notificación con sonido y banner de alta prioridad
            final fareStr = trip.fare != null ? '\$${trip.fare!.toStringAsFixed(2)} MXN' : '';
            final originStr = trip.originAddress.isNotEmpty ? trip.originAddress : 'Cerca de tu ubicacion';
            BackgroundServiceHelper.showAlertNotification(
              'Nuevo Viaje Solicitado',
              fareStr.isNotEmpty ? '$fareStr • $originStr. Toca para ver y aceptar.' : '$originStr. Toca para ver y aceptar.',
            );
          }
        }

        setState(() {
          _pendingTrips = allTrips;
          _isLoadingPendingTrips = false;
        });
      },
      onError: (err) {
        debugPrint('Aviso en stream de viajes pendientes (reconectando en 5s): $err');
        if (mounted) {
          setState(() => _isLoadingPendingTrips = false);
        }
        _pendingTripsRetryTimer?.cancel();
        _pendingTripsRetryTimer = Timer(const Duration(seconds: 5), () {
          if (mounted && _isDriverActive) {
            _startListeningToPendingTrips();
          }
        });
      },
    );
  }

  void _stopListeningToPendingTrips() {
    _pendingTripsRetryTimer?.cancel();
    _pendingTripsSubscription?.cancel();
    _pendingTripsSubscription = null;
    _pendingTrips = [];
    _isLoadingPendingTrips = false;
  }

  Future<void> _loadDriverState({bool isInitialLoad = false}) async {
    if (_driverId == null) return;
    try {
      final userResp = await Supabase.instance.client
          .from('conductores')
          .select('isActivo, estatus')
          .eq('user_id', _driverId!)
          .maybeSingle();
      
      final activeTrip = await _tripService.getActiveTrip(_driverId!);

      if (mounted) {
        setState(() {
          if (userResp != null) {
            // Por default false si es null o false
            final bool isActivo = userResp['isActivo'] == true;
            _isDriverActive = isActivo;
            if (_isDriverActive) {
              if (_driverId != null && _driverId!.isNotEmpty) {
                OneSignalService().login(_driverId!);
                OneSignalService().setTag('role', 'conductor');
              }
              BackgroundServiceHelper.startService();
              _startListeningToPendingTrips();
              _syncDriverGpsToSupabase(_currentLocation, force: true);
            } else {
              _stopListeningToPendingTrips();
            }
          } else {
            _isDriverActive = false;
            _stopListeningToPendingTrips();
          }
          _activeTrip = activeTrip;
        });

        // Si el conductor no tiene ningun viaje activo en curso, cerrar cualquier Live Activity
        // o notificacion de viaje permanente que haya quedado abierta
        if (activeTrip == null) {
          BackgroundServiceHelper.stopDriverTrip();
        }

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
    if (_driverId == null) return;

    if (value) {
      try {
        final status = await Permission.notification.request();
        if (!status.isGranted) {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Nota: Sin permisos de notificación no recibirás alertas en segundo plano.'),
                backgroundColor: Colors.orange,
                duration: Duration(seconds: 3),
              ),
            );
          }
        }
      } catch (e) {
        debugPrint('Ignorando error de permisos (probablemente en macOS): $e');
      }
    }

    final previousStatus = _isDriverActive;
    setState(() => _isDriverActive = value);
    try {
      // Actualizar isActivo y estatus en la tabla de conductores, guardando la ubicación GPS de inmediato
      final updateData = <String, dynamic>{
        'isActivo': value,
        'estatus': value ? 'activo' : 'inactivo',
      };
      if (value) {
        updateData['current_lat'] = _currentLocation.latitude;
        updateData['current_lng'] = _currentLocation.longitude;
        updateData['last_location_at'] = DateTime.now().toUtc().toIso8601String();
      }

      await Supabase.instance.client
          .from('conductores')
          .update(updateData)
          .eq('user_id', _driverId!);
          
      if (value) {
        BackgroundServiceHelper.startService();
        _startListeningToPendingTrips();
        // Tomar su registro del día de forma inicial en horarios_conductores
        await DriverShiftService().recordConnection(_driverId!);
        _syncDriverGpsToSupabase(_currentLocation, force: true);
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Modo Activo: Listo para recibir viajes.'),
              backgroundColor: Colors.black87,
              duration: Duration(seconds: 2),
            ),
          );
        }
      } else {
        BackgroundServiceHelper.stopService();
        _stopListeningToPendingTrips();
        _lastGpsSyncTime = null;
        _lastGpsSyncLocation = null;
        await DriverShiftService().recordDisconnection(_driverId!);
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Modo Desconectado. No recibirás nuevos viajes.'),
              backgroundColor: Colors.black87,
              duration: Duration(seconds: 2),
            ),
          );
        }
      }
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
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: trip.paymentMethod == 'mercadopago'
                      ? const Color(0xFF009EE3).withOpacity(0.12)
                      : Colors.green.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      trip.paymentMethod == 'mercadopago'
                          ? Icons.credit_card
                          : Icons.payments_outlined,
                      size: 16,
                      color: trip.paymentMethod == 'mercadopago'
                          ? const Color(0xFF009EE3)
                          : Colors.green[800],
                    ),
                    const SizedBox(width: 6),
                    Text(
                      trip.paymentMethod == 'mercadopago'
                          ? 'Pago en Linea (Mercado Pago)'
                          : 'Pago en Efectivo (Cobrar al fin)',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: trip.paymentMethod == 'mercadopago'
                            ? const Color(0xFF009EE3)
                            : Colors.green[800],
                      ),
                    ),
                  ],
                ),
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
          final acceptedTrip = trip.copyWith(
            driverId: _driverId,
            status: 'accepted',
          );
          
          final fareStr = trip.fare != null ? '\$${trip.fare!.toStringAsFixed(2)} MXN' : null;
          BackgroundServiceHelper.startDriverTrip(
            'Nuevo Viaje Aceptado',
            'Dirigete al punto de recogida',
            origin: trip.originAddress,
            destination: trip.destinationAddress,
            fare: fareStr,
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
                          color: _isDriverActive ? const Color(0xFFC7FF2E).withValues(alpha: 0.25) : Colors.grey[200],
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          _isDriverActive ? Icons.wifi_tethering : Icons.portable_wifi_off,
                          color: _isDriverActive ? Colors.black87 : Colors.grey[600],
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        _isDriverActive ? 'Activo' : 'Desconectado',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: _isDriverActive ? Colors.black : Colors.grey[800],
                        ),
                      ),
                    ],
                  ),
                  Switch(
                    value: _isDriverActive,
                    activeColor: const Color(0xFFC7FF2E),
                    activeTrackColor: Colors.black,
                    inactiveThumbColor: Colors.grey[400],
                    inactiveTrackColor: Colors.grey[200],
                    onChanged: _toggleDriverStatus,
                  ),
                ],
              ),
            ).animate().fade(duration: 500.ms).slideY(begin: -0.5, end: 0, duration: 500.ms, curve: Curves.easeOutQuad),
          ),

          // 3. Botón flotante para refrescar estado
          Positioned(
            top: MediaQuery.of(context).padding.top + 90,
            right: 16,
            child: FloatingActionButton.small(
              heroTag: 'reload_stream',
              backgroundColor: Colors.white,
              onPressed: () {
                if (_isDriverActive) {
                  _startListeningToPendingTrips();
                }
                _loadDriverState();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Buscando viajes recientes...'), duration: Duration(seconds: 1)),
                );
              },
              child: const Icon(Icons.refresh, color: Colors.black),
            ),
          ),

          // 4. Panel Inferior de Viajes (DraggableBottomSheet o Stacked container)
          if (_activeTrip != null)
            Positioned(
              bottom: 140, // Elevado para evitar colisión con el menú inferior
              left: 16,
              right: 16,
              child: _buildActiveTripCard().animate().fade(duration: 600.ms, delay: 200.ms).slideY(begin: 0.5, end: 0, duration: 600.ms, delay: 200.ms, curve: Curves.easeOutQuad),
            )
          else if (_isDriverActive)
            Positioned(
              bottom: 140, // Elevado para evitar colisión con el menú inferior
              left: 0,
              right: 0,
              child: _buildPendingTripsList().animate().fade(duration: 600.ms, delay: 200.ms).slideY(begin: 0.5, end: 0, duration: 600.ms, delay: 200.ms, curve: Curves.easeOutQuad),
            )
          else
            Positioned(
              bottom: 140, // Elevado para evitar colisión con el menú inferior
              left: 16,
              right: 16,
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: const Color(0xFF141414),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: Colors.white.withOpacity(0.12), width: 1.2),
                  boxShadow: const [
                    BoxShadow(color: Colors.black54, blurRadius: 20, offset: Offset(0, 10)),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.bedtime, size: 48, color: Colors.white38),
                    const SizedBox(height: 16),
                    const Text('Estás desconectado', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                    const SizedBox(height: 8),
                    const Text(
                      'Ponte en línea para recibir solicitudes de viaje cercanas.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white60),
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
          color: const Color(0xFF141414),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Colors.white.withOpacity(0.12), width: 1.2),
          boxShadow: const [
            BoxShadow(color: Colors.black54, blurRadius: 16, offset: Offset(0, 8)),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFD600).withOpacity(0.15),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.navigation, color: Color(0xFFFFD600), size: 24),
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
    if (_isLoadingPendingTrips && _pendingTrips.isEmpty) {
      return Container(
        height: 180,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: const Color(0xFF141414),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Colors.white.withOpacity(0.12), width: 1.2),
        ),
        child: const Center(child: CircularProgressIndicator(color: Color(0xFFFFD600))),
      );
    }

    // Filtrar viajes vigentes usando la lista única en memoria (_pendingTrips)
    // sin recrear nuevos canales Realtime en cada actualización de GPS.
    final trips = _pendingTrips.where((trip) {
      if (trip.createdAt != null) {
        try {
          final createdTime = trip.createdAt!;
          if (DateTime.now().difference(createdTime).inMinutes > 35) {
            return false; // Ignorar viajes con más de 35 minutos de antigüedad
          }
        } catch (e) {
          debugPrint('Error parseando fecha: $e');
        }
      }

      if (trip.originLat == null || trip.originLng == null) return true;
      final distanceInMeters = Geolocator.distanceBetween(
        _currentLocation.latitude,
        _currentLocation.longitude,
        trip.originLat!,
        trip.originLng!,
      );
      return distanceInMeters <= 5000000;
    }).toList();

    if (trips.isEmpty) {
      return Container(
        height: 180,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFF141414),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Colors.white.withOpacity(0.12), width: 1.2),
          boxShadow: const [BoxShadow(color: Colors.black54, blurRadius: 20, offset: Offset(0, 10))],
        ),
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.radar, size: 48, color: Color(0xFFFFD600)),
              SizedBox(height: 12),
              Text('Buscando viajes cercanos...', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
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
              color: const Color(0xFF141414),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: Colors.white.withOpacity(0.12), width: 1.2),
              boxShadow: const [BoxShadow(color: Colors.black54, blurRadius: 18, offset: Offset(0, 8))],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        color: const Color(0xFF262626),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: const Color(0xFFFFD600).withOpacity(0.4), width: 1),
                      ),
                      child: const Text('Nuevo Viaje', style: TextStyle(color: Color(0xFFFFD600), fontSize: 12, fontWeight: FontWeight.bold)),
                    ),
                    if (trip.fare != null)
                      Text('\$${trip.fare!.toStringAsFixed(2)}', style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold))
                    else
                      const Text('Por cotizar', style: TextStyle(color: Colors.white70, fontSize: 14)),
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    const Icon(Icons.location_on, size: 20, color: Color(0xFFFFD600)),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        trip.destinationAddress,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
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
                      backgroundColor: const Color(0xFFFFD600), // Taxi Yellow
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      elevation: 0,
                    ),
                    child: const Text('Aceptar Viaje', style: TextStyle(fontFamily: 'Google Sans', fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
