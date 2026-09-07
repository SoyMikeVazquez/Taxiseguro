import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../widgets/map_widget.dart';
import '../widgets/search_bottom_sheet.dart';
import '../widgets/ride_options_sheet.dart';
import '../widgets/pin_picker_sheet.dart';
import '../widgets/searching_driver_sheet.dart';
import '../widgets/active_trip_sheet.dart';
import '../widgets/trip_completed_sheet.dart';
import '../screens/trip_history_screen.dart';
import '../screens/profile_screen.dart';
import '../models/trip.dart';
import '../services/trip_service.dart';
import '../services/mapbox_service.dart';
import '../services/pricing_service.dart';
import '../services/location_service.dart';
import '../theme/app_theme.dart';
import 'auth_screen.dart';

class TaxiseguroHomeScreen extends StatefulWidget {
  const TaxiseguroHomeScreen({super.key});

  @override
  State<TaxiseguroHomeScreen> createState() => _TaxiseguroHomeScreenState();
}

class _TaxiseguroHomeScreenState extends State<TaxiseguroHomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  
  List<Ad> _ads = [];
  bool _isLoadingAds = true;
  int _completedTripsCount = 0;
  double _userRating = 5.0;
  final TripService _tripService = TripService();
  final MapboxService _mapboxService = MapboxService();
  
  String? _selectedOrigin;
  LatLng? _selectedOriginLatLng;
  String? _selectedDestination;
  LatLng? _selectedDestinationLatLng;
  String? _currentTripId;
  Trip? _currentTripData;
  double? _routeDistance;
  double? _routeDuration;
  bool _isSearching = false;
  bool _isLoading = false;
  bool _isSearchingDriver = false;
  bool _isDriverAssigned = false;
  bool _isTripCompleted = false;
  bool _showActiveTripDetails = false;

  // Pin Picker State (Uber / DiDi pin selection mode)
  bool _isPinPickerMode = false;
  bool _isPinPickerForOrigin = false;
  String _pinnedAddress = '';
  Timer? _geocodeDebounceTimer;
  LatLng? _lastPinCenter;
  StreamSubscription<Trip?>? _tripSubscription;

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _checkActiveTrip();
    _fetchAds();
    _fetchUserStats();
  }

  Future<void> _fetchUserStats() async {
    final user = Supabase.instance.client.auth.currentUser;
    if (user == null) return;

    try {
      // Fetch completed trips count
      final tripsResponse = await Supabase.instance.client
          .from('trips')
          .select('id')
          .eq('user_id', user.id)
          .eq('status', 'completed');
      
      final tripsList = tripsResponse as List<dynamic>;
      
      // Fetch user rating
      final ratingsResponse = await Supabase.instance.client
          .from('ratings')
          .select('rating')
          .eq('receiver_id', user.id);
          
      final ratingsList = ratingsResponse as List<dynamic>;
      double avgRating = 5.0;
      if (ratingsList.isNotEmpty) {
        double sum = 0;
        for (var r in ratingsList) {
          sum += (r['rating'] as num).toDouble();
        }
        avgRating = sum / ratingsList.length;
      }

      if (mounted) {
        setState(() {
          _completedTripsCount = tripsList.length;
          _userRating = avgRating;
        });
      }
    } catch (e) {
      print('Error fetching user stats: $e');
    }
  }

  Future<void> _fetchAds() async {
    try {
      final response = await Supabase.instance.client
          .from('ads')
          .select()
          .order('created_at', ascending: false)
          .limit(5);
      
      final ads = (response as List).map((json) => Ad.fromJson(json)).toList();
      if (mounted) {
        setState(() {
          if (ads.isNotEmpty) {
            _ads = ads;
          } else {
            // Dummy ad to show UI if table is empty or RLS is blocking
            _ads = [
              Ad(
                id: 0,
                tituloAds: 'Espacio publicitario',
                descripcionAds: 'Tu tabla "ads" está vacía o tiene RLS activado. Agrega filas para ver tus anuncios aquí.',
                imagenAds: 'https://images.unsplash.com/photo-1549317661-bd32c8ce0be2?auto=format&fit=crop&q=80&w=800'
              )
            ];
          }
          _isLoadingAds = false;
        });
      }
    } catch (e) {
      print('Error fetching ads: $e');
      if (mounted) {
        setState(() {
          _ads = [
            Ad(
              id: 0,
              tituloAds: 'Error de conexión',
              descripcionAds: 'Hubo un error al leer la tabla ads. Verifica los permisos (RLS).',
            )
          ];
          _isLoadingAds = false;
        });
      }
    }
  }

  Future<void> _checkActiveTrip() async {
    final user = Supabase.instance.client.auth.currentUser;
    if (user == null) return;
    
    final activeTrip = await _tripService.getActiveTripForPassenger(user.id);
    if (activeTrip != null) {
      if (mounted) {
        setState(() {
          _currentTripId = activeTrip.id;
          _currentTripData = activeTrip;
          _selectedOrigin = activeTrip.originAddress;
          _selectedDestination = activeTrip.destinationAddress;
          if (activeTrip.destinationLat != null && activeTrip.destinationLng != null) {
            _selectedDestinationLatLng = LatLng(activeTrip.destinationLat!, activeTrip.destinationLng!);
          }
          if (activeTrip.status == 'pending') {
            if (activeTrip.createdAt != null) {
              try {
                final createdTime = activeTrip.createdAt!;
                if (DateTime.now().difference(createdTime).inMinutes > 35) {
                  // Viaje expirado, lo cancelamos automáticamente
                  _tripService.cancelTrip(activeTrip.id!);
                  return; // No mostramos nada, dejamos al usuario en el inicio
                }
              } catch (e) {
                print('Error parseando fecha: $e');
              }
            }
            _isSearchingDriver = true;
            _isDriverAssigned = false;
          } else if (activeTrip.status == 'accepted' || activeTrip.status == 'arrived' || activeTrip.status == 'in_progress') {
            _isSearchingDriver = false;
            _isDriverAssigned = true;
          }
        });
        _listenToTrip(activeTrip.id!);
      }
    }
  }

  @override
  void dispose() {
    _geocodeDebounceTimer?.cancel();
    _tripSubscription?.cancel();
    super.dispose();
  }

  void _listenToTrip(String tripId) {
    _tripSubscription?.cancel();
    _tripSubscription = _tripService.streamTrip(tripId).listen((trip) {
      if (trip == null) return;
      if (mounted) {
        setState(() {
          _currentTripData = trip;
          if (trip.status == 'accepted' || trip.status == 'arrived' || trip.status == 'in_progress') {
            _isSearchingDriver = false;
            _isDriverAssigned = true;
          } else if (trip.status == 'completed') {
            _isSearchingDriver = false;
            _isDriverAssigned = false;
            _isTripCompleted = true;
          } else if (trip.status == 'cancelled') {
            _isSearchingDriver = false;
            _isDriverAssigned = false;
            _currentTripId = null;
            _currentTripData = null;
            _selectedDestination = null;
            _showActiveTripDetails = false;
          }
        });
      }
    });
  }

  void _onCameraMove(LatLng center) {
    if (!_isPinPickerMode) return;
    _lastPinCenter = center;
    _geocodeDebounceTimer?.cancel();
    _geocodeDebounceTimer = Timer(const Duration(milliseconds: 350), () async {
      final address = await _mapboxService.reverseGeocode(center);
      if (mounted && address != null) {
        setState(() {
          _pinnedAddress = address;
        });
      }
    });
  }

  void _onRouteSelected(String origin, LatLng? originLatLng, String destination, LatLng? destinationLatLng) {
    setState(() {
      _selectedOrigin = origin;
      if (originLatLng != null) {
        _selectedOriginLatLng = originLatLng;
      } else if (origin.toLowerCase().contains('ubicación actual')) {
        _selectedOriginLatLng = null;
      }
      _selectedDestination = destination;
      if (destinationLatLng != null) {
        _selectedDestinationLatLng = destinationLatLng;
      }
      _isSearching = false;
    });
  }

  void _onPinConfirmed() {
    final chosenAddress = _pinnedAddress.isNotEmpty ? _pinnedAddress : 'Ubicación seleccionada en mapa';
    setState(() {
      _isPinPickerMode = false;
      if (_isPinPickerForOrigin) {
        _selectedOrigin = chosenAddress;
        _selectedOriginLatLng = _lastPinCenter;
        _onRouteSelected(chosenAddress, _lastPinCenter, _selectedDestination ?? '', _selectedDestinationLatLng);
      } else {
        _selectedDestinationLatLng = _lastPinCenter;
        _onRouteSelected(_selectedOrigin ?? 'Ubicación actual', _selectedOriginLatLng, chosenAddress, _lastPinCenter);
      }
    });
  }

  Future<void> _onCancelRide() async {
    if (_currentTripId != null) {
      await _tripService.cancelTrip(_currentTripId!);
    }
    
    setState(() {
      _currentTripId = null;
      _currentTripData = null;
      _selectedOrigin = null;
      _selectedOriginLatLng = null;
      _selectedDestination = null;
      _selectedDestinationLatLng = null;
      _routeDistance = null;
      _routeDuration = null;
      _isPinPickerMode = false;
      _isSearchingDriver = false;
      _isDriverAssigned = false;
      _isTripCompleted = false;
      _showActiveTripDetails = false;
    });
  }

  Future<void> _onConfirmRide() async {
    final user = Supabase.instance.client.auth.currentUser;
    if (user == null || _selectedOrigin == null || _selectedDestination == null) return;
    setState(() => _isLoading = true);

    final double calculatedFare = PricingService.calculateDynamicPrice(
      _routeDistance ?? 0,
      _routeDuration ?? 0,
    );

    final locService = LocationService();
    final currentLoc = await locService.getCurrentLocation();
    
    String finalOriginAddress = _selectedOrigin!;
    if (finalOriginAddress.toLowerCase().contains('ubicación actual') && currentLoc != null) {
      final reverseGeocoded = await _mapboxService.reverseGeocode(
        LatLng(currentLoc.latitude, currentLoc.longitude),
      );
      if (reverseGeocoded != null) {
        finalOriginAddress = reverseGeocoded;
      }
    }

    final newTrip = Trip(
      userId: user.id,
      originAddress: finalOriginAddress,
      destinationAddress: _selectedDestination!,
      originLat: _selectedOriginLatLng?.latitude ?? currentLoc?.latitude ?? 19.4326,
      originLng: _selectedOriginLatLng?.longitude ?? currentLoc?.longitude ?? -99.1332,
      destinationLat: _selectedDestinationLatLng?.latitude,
      destinationLng: _selectedDestinationLatLng?.longitude,
      fare: calculatedFare,
      distanceKm: _routeDistance != null ? (_routeDistance! / 1000.0) : null,
      status: 'pending',
      paymentMethod: 'efectivo',
    );
    final trip = await _tripService.createTrip(newTrip);
    setState(() => _isLoading = false);

    if (trip != null) {
      setState(() {
        _currentTripId = trip.id;
        _isSearchingDriver = true;
        _showActiveTripDetails = true;
      });
      _listenToTrip(trip.id!);
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('No se pudo procesar el viaje. Verifica tu conexión o intenta nuevamente.'),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  }

  void _showSearchSheet({String? initialOrigin, String? initialDestination}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => SizedBox(
        height: MediaQuery.of(context).size.height * 0.85,
        child: SearchBottomSheet(
          initialOrigin: initialOrigin ?? _selectedOrigin,
          initialDestination: initialDestination ?? _selectedDestination,
          onRouteSelected: (origin, originLatLng, dest, destLatLng) {
            Navigator.pop(context);
            _onRouteSelected(origin, originLatLng, dest, destLatLng);
          },
          onOpenPinPicker: (isOrigin) {
            Navigator.pop(context);
            setState(() {
              _isPinPickerMode = true;
              _isPinPickerForOrigin = isOrigin;
            });
          },
          isSearching: _isSearching,
          onSearchStateChanged: (s) => setState(() => _isSearching = s),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = Supabase.instance.client.auth.currentUser;
    final userName = user?.email?.split('@')[0] ?? 'Alex';

    final bool isSettingUpRide = _selectedDestination != null && _currentTripData == null;
    final bool isTripActive = isSettingUpRide || _isPinPickerMode || (_currentTripData != null && (_showActiveTripDetails || _isTripCompleted));

    return PopScope(
      canPop: !isTripActive,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        if (isTripActive) {
          if (_currentTripData != null) {
            setState(() => _showActiveTripDetails = false);
          } else {
            _onCancelRide();
          }
        } else if (_currentIndex != 0) {
          setState(() => _currentIndex = 0);
        }
      },
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: AppColors.pureWhite,
        body: Stack(
          children: [
            SafeArea(
              bottom: false,
              child: isTripActive ? _buildActiveTripLayout() : _buildCurrentTabBody(userName),
            ),
            
            if (!isTripActive)
              Positioned(
                left: 24,
                right: 24,
                bottom: 34,
                child: _buildFloatingBottomNav(),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildCurrentTabBody(String userName) {
    switch (_currentIndex) {
      case 1:
        return const TripHistoryScreen(showBackButton: false);
      case 2:
        return const ProfileScreen(showBackButton: false);
      case 0:
      default:
        return _buildIdleLayout(userName);
    }
  }

  Widget _buildIdleLayout(String userName) {
    bool hasActiveTrip = _currentTripData != null && !_isTripCompleted;
    Color buttonColor = AppColors.electricGreen;
    String buttonTitle = 'Pedir un viaje';
    String buttonSubtitle = 'Auto más cercano a 2 min';
    IconData buttonIcon = Icons.arrow_forward;
    Color textColor = AppColors.appBlack;
    Color subtitleColor = AppColors.appBlack.withValues(alpha: 0.6);
    Color iconBgColor = AppColors.appBlack;
    Color iconColor = AppColors.pureWhite;

    if (hasActiveTrip) {
      if (_isSearchingDriver) {
        buttonColor = Colors.green;
        buttonTitle = 'Estado: Pendiente';
        buttonSubtitle = 'Buscando conductor...';
        buttonIcon = Icons.search;
        textColor = Colors.white;
        subtitleColor = Colors.white70;
        iconBgColor = Colors.white24;
        iconColor = Colors.white;
      } else if (_isDriverAssigned) {
        buttonColor = Colors.blue;
        buttonTitle = 'Viaje en curso';
        buttonSubtitle = 'Tu conductor está en camino';
        buttonIcon = Icons.directions_car;
        textColor = Colors.white;
        subtitleColor = Colors.white70;
        iconBgColor = Colors.white24;
        iconColor = Colors.white;
      }
    }

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  'Buenos\ndías,\n${userName.capitalize()}',
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    fontSize: 42,
                    height: 1.05,
                    letterSpacing: -1.5,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => setState(() => _currentIndex = 2),
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: AppColors.electricGreen,
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Image.asset(
                    'assets/logo.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ).animate().fade(duration: 500.ms).slideY(begin: 0.1, end: 0, duration: 500.ms, curve: Curves.easeOutQuad),
          const SizedBox(height: 24),
          const Text(
            "Sugerencia de hoy",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.midGray,
            ),
          ).animate().fade(duration: 500.ms, delay: 100.ms).slideY(begin: 0.1, end: 0, duration: 500.ms, delay: 100.ms),
          const SizedBox(height: 12),
          
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.35,
            child: GestureDetector(
              onTap: _showSearchSheet,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: AppColors.charcoal,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 20,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                clipBehavior: Clip.antiAlias,
                child: Stack(
                  children: [
                    IgnorePointer(
                      child: MapWidget(
                        destination: null,
                      ),
                    ),
                  ],
                ),
              ),
            ).animate().fade(duration: 600.ms, delay: 200.ms).scale(begin: const Offset(0.95, 0.95), end: const Offset(1, 1), curve: Curves.easeOutQuad),
          ),
          
          const SizedBox(height: 16),
          
          GestureDetector(
            onTap: () {
              if (hasActiveTrip) {
                setState(() => _showActiveTripDetails = true);
              } else {
                _showSearchSheet();
              }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              decoration: BoxDecoration(
                color: buttonColor,
                borderRadius: BorderRadius.circular(36),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        buttonTitle,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: 22,
                          color: textColor,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        buttonSubtitle,
                        style: TextStyle(
                          color: subtitleColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: iconBgColor,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(buttonIcon, color: iconColor),
                  ),
                ],
              ),
            ),
          ).animate().fade(duration: 600.ms, delay: 300.ms).slideY(begin: 0.2, end: 0, curve: Curves.easeOutQuad),
          
          const SizedBox(height: 16),

          if (_isLoadingAds)
             const SizedBox(height: 140, child: Center(child: CircularProgressIndicator(color: Colors.black))),
          if (!_isLoadingAds && _ads.isNotEmpty) ...[
             SizedBox(
               height: 140,
               child: ListView.separated(
                 scrollDirection: Axis.horizontal,
                 itemCount: _ads.length,
                 separatorBuilder: (context, index) => const SizedBox(width: 16),
                 itemBuilder: (context, index) {
                   final ad = _ads[index];
                   return Container(
                     width: 240,
                     decoration: BoxDecoration(
                       color: AppColors.appBlack,
                       borderRadius: BorderRadius.circular(24),
                       image: ad.imagenAds != null && ad.imagenAds!.isNotEmpty
                           ? DecorationImage(
                               image: NetworkImage(ad.imagenAds!),
                               fit: BoxFit.cover,
                               colorFilter: ColorFilter.mode(Colors.black.withValues(alpha: 0.4), BlendMode.darken),
                             )
                           : null,
                     ),
                     padding: const EdgeInsets.all(16),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       mainAxisAlignment: MainAxisAlignment.end,
                       children: [
                         if (ad.tituloAds != null && ad.tituloAds!.isNotEmpty)
                           Text(
                             ad.tituloAds!,
                             style: const TextStyle(
                               color: Colors.white,
                               fontSize: 16,
                               fontWeight: FontWeight.bold,
                             ),
                             maxLines: 1,
                             overflow: TextOverflow.ellipsis,
                           ),
                         if (ad.descripcionAds != null && ad.descripcionAds!.isNotEmpty) ...[
                           const SizedBox(height: 4),
                           Text(
                             ad.descripcionAds!,
                             style: const TextStyle(
                               color: Colors.white70,
                               fontSize: 12,
                             ),
                             maxLines: 2,
                             overflow: TextOverflow.ellipsis,
                           ),
                         ],
                       ],
                     ),
                   );
                 },
               ),
             ).animate().fade(duration: 600.ms, delay: 350.ms).slideY(begin: 0.2, end: 0, curve: Curves.easeOutQuad),
             const SizedBox(height: 16),
          ],
          
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => setState(() => _currentIndex = 1),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF3F3F3),
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _completedTripsCount.toString(),
                          style: Theme.of(context).textTheme.displayLarge?.copyWith(
                            fontSize: 32,
                          ),
                        ),
                        const Text(
                          'Viajes tomados',
                          style: TextStyle(
                            color: AppColors.midGray,
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.appBlack,
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.star_rounded, color: AppColors.electricGreen, size: 24),
                          const SizedBox(width: 6),
                          Text(
                            _userRating.toStringAsFixed(1),
                            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                              fontSize: 28,
                              color: AppColors.electricGreen,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Calificación',
                        style: TextStyle(
                          color: AppColors.midGray,
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ).animate().fade(duration: 600.ms, delay: 400.ms).slideY(begin: 0.2, end: 0, curve: Curves.easeOutQuad),
          
          const SizedBox(height: 120),
        ],
      ),
    ));
  }

  Widget _buildActiveTripLayout() {
    return Stack(
      children: [
        Positioned.fill(
          child: MapWidget(
            originLatLng: _selectedOriginLatLng,
            destination: _selectedDestination,
            destinationLatLng: _selectedDestinationLatLng,
            isPinPickerMode: _isPinPickerMode,
            onCameraMove: _onCameraMove,
            onRouteCalculated: (distance, duration) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (mounted) {
                  setState(() {
                    _routeDistance = distance;
                    _routeDuration = duration;
                  });
                }
              });
            },
          ),
        ),
        
        Positioned(
          top: 16,
          left: 16,
          child: Material(
            color: AppColors.appBlack,
            shape: const CircleBorder(),
            elevation: 4,
            child: InkWell(
              customBorder: const CircleBorder(),
              onTap: () {
                if (_currentTripData != null) {
                  setState(() => _showActiveTripDetails = false);
                } else {
                  _onCancelRide();
                }
              },
              child: const Padding(
                padding: EdgeInsets.all(12),
                child: Icon(Icons.arrow_back, color: AppColors.pureWhite, size: 24),
              ),
            ),
          ),
        ),

        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: _isLoading
              ? const Center(
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: CircularProgressIndicator(),
                    ),
                  ),
                )
              : _isTripCompleted && _currentTripData != null
                  ? TripCompletedSheet(
                      trip: _currentTripData!,
                      onDismiss: () {
                        setState(() {
                          _isTripCompleted = false;
                          _currentTripId = null;
                          _currentTripData = null;
                          _selectedOrigin = null;
                          _selectedDestination = null;
                          _selectedDestinationLatLng = null;
                          _routeDistance = null;
                          _routeDuration = null;
                        });
                      },
                    )
                  : _isDriverAssigned
                      ? ActiveTripSheet(
                          trip: _currentTripData,
                          origin: _selectedOrigin ?? 'Ubicación actual',
                          destination: _selectedDestination!,
                          onFinishTrip: _onCancelRide,
                        )
                  : _isSearchingDriver
                      ? SearchingDriverSheet(
                          origin: _selectedOrigin ?? 'Ubicación actual',
                          destination: _selectedDestination!,
                          onCancel: _onCancelRide,
                          onSimulateDriverAssigned: () {
                            setState(() => _isDriverAssigned = true);
                          },
                        )
                  : _isPinPickerMode
                      ? PinPickerSheet(
                          currentAddress: _pinnedAddress,
                          onConfirm: _onPinConfirmed,
                        )
                      : RideOptionsSheet(
                          origin: _selectedOrigin ?? 'Ubicación actual',
                          destination: _selectedDestination!,
                          distanceMeters: _routeDistance,
                          durationSeconds: _routeDuration,
                          onCancel: _onCancelRide,
                          onConfirm: _onConfirmRide,
                          onEditDestination: () {
                            _showSearchSheet(
                              initialOrigin: _selectedOrigin,
                              initialDestination: _selectedDestination,
                            );
                          },
                          onEditOrigin: () {
                            _showSearchSheet(
                              initialOrigin: _selectedOrigin,
                              initialDestination: _selectedDestination,
                            );
                          },
                        ),
        ),

        // ALERTA TOP: VIAJE PENDIENTE / ACTIVO
        if (_currentTripData != null && !_isTripCompleted && (_isSearchingDriver || _isDriverAssigned))
          Positioned(
            top: 75,
            left: 16,
            right: 16,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: _isSearchingDriver ? Colors.orange[800] : Colors.blue[700],
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(0, 4))],
              ),
              child: Row(
                children: [
                  Icon(_isSearchingDriver ? Icons.search : Icons.directions_car, color: Colors.white),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      _isSearchingDriver 
                        ? 'Buscando conductor... No cierres la aplicación.'
                        : 'Tienes un viaje en curso. Desliza hacia arriba para ver los detalles.',
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
                    ),
                  ),
                ],
              ),
            ),
          ).animate().fade(duration: 400.ms).slideY(begin: -0.5, end: 0, curve: Curves.easeOutQuad),
      ],
    );
  }

  Widget _buildFloatingBottomNav() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.85),
        borderRadius: BorderRadius.circular(35),
        border: Border.all(color: Colors.white.withOpacity(0.9), width: 1.5),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 20,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(35),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 12.0, sigmaY: 12.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(Icons.home_filled, 0),
                _buildNavItem(Icons.directions_car_filled, 1),
                _buildNavItem(Icons.settings, 2),
                _buildNavItem(Icons.logout, 3, isLogout: true, onTap: () async {
                  await Supabase.instance.client.auth.signOut();
                  if (mounted) {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (_) => const AuthScreen()),
                      (route) => false,
                    );
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    ).animate().fade(duration: 600.ms, delay: 400.ms).slideY(begin: 0.5, end: 0, duration: 600.ms, delay: 400.ms, curve: Curves.easeOutBack);
  }

  Widget _buildNavItem(IconData icon, int index, {VoidCallback? onTap, bool isLogout = false}) {
    final isSelected = _currentIndex == index && !isLogout;
    return GestureDetector(
      onTap: () {
        if (!isLogout) {
          setState(() => _currentIndex = index);
        }
        if (onTap != null) onTap();
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.electricGreen : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: isLogout
              ? Colors.redAccent
              : (isSelected ? Colors.black : AppColors.midGray),
          size: 24,
        ),
      ),
    );
  }
}

extension StringExtension on String {
    String capitalize() {
      if (isEmpty) return this;
      return "${this[0].toUpperCase()}${substring(1)}";
    }
}

class Ad {
  final int id;
  final String? imagenAds;
  final String? tituloAds;
  final String? descripcionAds;

  Ad({
    required this.id,
    this.imagenAds,
    this.tituloAds,
    this.descripcionAds,
  });

  factory Ad.fromJson(Map<String, dynamic> json) {
    return Ad(
      id: json['id'] as int,
      imagenAds: json['imagen_ads']?.toString(),
      tituloAds: json['titulo_ads']?.toString(),
      descripcionAds: json['descripcion_ads']?.toString(),
    );
  }
}
