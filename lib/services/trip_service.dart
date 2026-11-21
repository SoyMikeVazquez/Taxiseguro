import 'dart:convert';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/trip.dart';
import 'package:latlong2/latlong.dart';
import 'rating_service.dart';
import 'resend_service.dart';
import 'brevo_service.dart';
import 'mapbox_service.dart';
import 'location_service.dart';
import 'geofence_service.dart';
import 'whatsapp_notifications.dart';
import 'onesignal_service.dart';
import 'referral_service.dart';

class TripService {
  final SupabaseClient _client = Supabase.instance.client;

  /// Helper para notificar a pasajero y conductor sobre cambios de estatus
  Future<void> notifyTripStatusChange(String tripId, String status) async {
    try {
      final trip = await _client.from('trips').select().eq('id', tripId).maybeSingle();
      if (trip == null) return;
      
      final String? userId = trip['user_id'];
      final String? driverId = trip['driver_id'];
      
      String passengerName = 'Pasajero';
      String passengerEmail = '';
      if (userId != null) {
        final userRes = await _client.from('users').select().eq('user_id', userId).maybeSingle();
        if (userRes != null) {
          passengerName = userRes['nombre'] ?? 'Pasajero';
          passengerEmail = userRes['correo'] ?? '';
        }
      }

      String driverName = 'Conductor';
      String driverEmail = '';
      if (driverId != null) {
        final driverRes = await _client.from('conductores').select().eq('user_id', driverId).maybeSingle();
        final dRes = driverRes ?? await _client.from('conductores').select().eq('id', driverId).maybeSingle();
        if (dRes != null) {
          driverName = dRes['nombre_completo'] ?? dRes['nombre'] ?? 'Conductor';
          driverEmail = dRes['correo'] ?? '';
        }
      }

      if (passengerEmail.isNotEmpty) {
        ResendService.notifyPassengerTripStatus(
          passengerEmail: passengerEmail,
          passengerName: passengerName,
          driverName: driverName,
          status: status,
        ).then((_) => print('Email a pasajero enviado')).catchError((e) => print('Error email pasajero: $e'));
      }

      if (driverEmail.isNotEmpty && (status == 'aceptado' || status == 'accepted' || status == 'cancelado' || status == 'cancelled')) {
        ResendService.notifyDriverTripStatus(
          driverEmail: driverEmail,
          driverName: driverName,
          passengerName: passengerName,
          status: status,
        ).then((_) => print('Email a conductor enviado')).catchError((e) => print('Error email conductor: $e'));
      }

      // Notificaciones Push remotas vía OneSignal (iOS y Android en reposo)
      final oneSignal = OneSignalService();
      if (userId != null && userId.isNotEmpty) {
        String pushTitle = 'Actualizacion de Viaje';
        String pushBody = 'Tu viaje ha cambiado de estado a: $status';

        if (status == 'aceptado' || status == 'accepted') {
          pushTitle = 'Conductor Asignado';
          pushBody = '$driverName acepto tu viaje y se dirige a tu ubicacion.';
        } else if (status == 'en camino' || status == 'arrived') {
          pushTitle = 'Tu Conductor Llego';
          pushBody = '$driverName esta afuera esperandote en tu punto de partida.';
        } else if (status == 'in_progress' || status == 'en curso') {
          pushTitle = 'Viaje en Curso';
          pushBody = 'Vas en camino seguro a tu destino con $driverName.';
        } else if (status == 'finalizado' || status == 'completed') {
          pushTitle = 'Viaje Finalizado';
          pushBody = 'Has llegado a tu destino. Gracias por viajar con TaxiSeguro.';
        } else if (status == 'cancelado' || status == 'cancelled') {
          pushTitle = 'Viaje Cancelado';
          pushBody = 'El servicio ha sido cancelado.';
        }

        oneSignal.notifyTripStatusChangeForUser(
          targetUserId: userId,
          title: pushTitle,
          body: pushBody,
          tripId: tripId,
          status: status,
        );
      }

      if (driverId != null && driverId.isNotEmpty && (status == 'cancelado' || status == 'cancelled')) {
        oneSignal.notifyTripStatusChangeForUser(
          targetUserId: driverId,
          title: 'Viaje Cancelado',
          body: 'El pasajero ha cancelado el servicio.',
          tripId: tripId,
          status: status,
        );
      }
    } catch (e) {
      print('Error en notifyTripStatusChange: $e');
    }
  }

  /// Crear un nuevo viaje (Intento 1: estado pending)
  Future<Trip?> createTrip(Trip trip) async {
    // 0. Validar geofence (solo Chiapas a menos que tenga permiso especial)
    if (trip.originLat != null && trip.originLng != null) {
      final canRequest = await GeofenceService.canRequestTrip(
        userId: trip.userId,
        origin: LatLng(trip.originLat!, trip.originLng!),
      );
      if (!canRequest) {
        print('Creación de viaje bloqueada: El origen está fuera del estado de Chiapas y el usuario no tiene permiso especial.');
        return null;
      }
    }

    // 1. Validar que el usuario no tenga ya un viaje activo
    final activeTrip = await getActiveTripForPassenger(trip.userId);
    if (activeTrip != null) {
      print('El usuario ya tiene un viaje activo. No se puede crear otro.');
      return activeTrip; // Retornamos el viaje activo existente para que la UI lo retome
    }

    final payload = trip.toJson();
    payload.remove('id'); // Supabase genera el UUID
    payload.remove('created_at');
    payload.removeWhere((key, value) => value == null);

    Trip? createdTrip;
    bool notifiedByTrigger = false;

    // Intento 1: Inserción completa
    try {
      final response = await _client
          .from('trips')
          .insert(payload)
          .select()
          .single();
          
      createdTrip = Trip.fromJson(response);
      notifiedByTrigger = response['notified_drivers'] == true;
    } catch (e) {
      print('Error creando viaje (Intento 1): $e');
    }

    // Intento 2: Si 'pending' falla por restricción CHECK antigua (in_progress, completed, cancelled)
    if (createdTrip == null) {
      try {
        final fallbackPayload = Map<String, dynamic>.from(payload);
        fallbackPayload['status'] = 'in_progress';
        final response = await _client
            .from('trips')
            .insert(fallbackPayload)
            .select()
            .single();
            
        createdTrip = Trip.fromJson(response);
        notifiedByTrigger = response['notified_drivers'] == true;
      } catch (e2) {
        print('Error creando viaje (Intento 2 - in_progress): $e2');
      }
    }

    // Intento 3: Columnas esenciales mínimas (user_id, origin_address, destination_address)
    if (createdTrip == null) {
      try {
        final response = await _client
            .from('trips')
            .insert({
              'user_id': trip.userId,
              'origin_address': trip.originAddress,
              'destination_address': trip.destinationAddress,
              'fare': trip.fare ?? 0.0,
              'distance_km': trip.distanceKm ?? 0.0,
            })
            .select()
            .single();

        createdTrip = Trip.fromJson(response);
        notifiedByTrigger = response['notified_drivers'] == true;
      } catch (e3) {
        print('Error creando viaje (Intento 3 - mínimo): $e3');
      }
    }

    // Disparar notificaciones (OneSignal + WhatsApp) a conductores a menos de 5 km si no las despachó ya el trigger de Supabase
    if (createdTrip != null && createdTrip.id != null && !notifiedByTrigger) {
      _dispatchPushForNewTrip(createdTrip);
    }

    return createdTrip;
  }

  /// Encuentra la información completa (user_id, nombre, telefono, distancia_km)
  /// de todos los conductores activos dentro del radio de cobertura (5 km por defecto)
  Future<List<Map<String, dynamic>>> findNearbyActiveDrivers({
    required double originLat,
    required double originLng,
    double radiusKm = 5.0,
  }) async {
    final Map<String, Map<String, dynamic>> nearbyDriversMap = {};

    // 1. Consulta directa a la tabla conductores calculando distancia exacta en metros
    try {
      final res = await _client
          .from('conductores')
          .select('id, user_id, nombre, nombre_completo, telefono, current_lat, current_lng, isActivo, estatus')
          .or('isActivo.eq.true,estatus.eq.activo');

      final List<dynamic> list = (res as List<dynamic>?) ?? [];
      for (final d in list) {
        final uid = (d['user_id'] ?? d['id'])?.toString();
        final dLat = (d['current_lat'] as num?)?.toDouble();
        final dLng = (d['current_lng'] as num?)?.toDouble();

        if (uid != null && uid.isNotEmpty && dLat != null && dLng != null) {
          final distInMeters = Geolocator.distanceBetween(originLat, originLng, dLat, dLng);
          if (distInMeters <= (radiusKm * 1000)) {
            final driverName = (d['nombre_completo'] ?? d['nombre'] ?? 'Conductor').toString().trim();
            final driverPhone = (d['telefono'] ?? '').toString().trim();
            nearbyDriversMap[uid] = {
              'user_id': uid,
              'nombre': driverName.isNotEmpty ? driverName : 'Conductor',
              'telefono': driverPhone,
              'distancia_km': distInMeters / 1000.0,
            };
          }
        }
      }
    } catch (err) {
      debugPrint('Aviso al filtrar conductores activos en Supabase: $err');
    }

    // 2. Respaldo / complemento con la función RPC en Supabase
    try {
      final rpcResult = await _client.rpc('get_nearby_active_drivers', params: {
        'origin_lat': originLat,
        'origin_lng': originLng,
        'max_radius_km': radiusKm,
      });

      if (rpcResult is List) {
        for (final item in rpcResult) {
          final uid = item['user_id']?.toString();
          if (uid != null && uid.isNotEmpty && !nearbyDriversMap.containsKey(uid)) {
            nearbyDriversMap[uid] = {
              'user_id': uid,
              'nombre': (item['nombre'] ?? 'Conductor').toString(),
              'telefono': (item['telefono'] ?? '').toString(),
              'distancia_km': (item['distancia_km'] as num?)?.toDouble() ?? 0.0,
            };
          }
        }
      }
    } catch (_) {}

    // 3. Si algún conductor cercano no tenía teléfono en 'conductores', buscarlo en 'users'
    final List<String> missingPhoneUids = nearbyDriversMap.entries
        .where((e) => (e.value['telefono'] as String).isEmpty)
        .map((e) => e.key)
        .toList();

    if (missingPhoneUids.isNotEmpty) {
      try {
        final usersRes = await _client
            .from('users')
            .select('user_id, telefono, nombre')
            .inFilter('user_id', missingPhoneUids);
        for (final u in (usersRes as List<dynamic>)) {
          final uid = u['user_id']?.toString();
          final phone = (u['telefono'] ?? '').toString().trim();
          if (uid != null && nearbyDriversMap.containsKey(uid) && phone.isNotEmpty) {
            nearbyDriversMap[uid]!['telefono'] = phone;
          }
        }
      } catch (_) {}
    }

    return nearbyDriversMap.values.toList();
  }

  /// Encuentra los user_id de los conductores activos en un radio de cobertura (5 km por defecto)
  Future<List<String>> findNearbyActiveDriverUserIds({
    required double originLat,
    required double originLng,
    double radiusKm = 5.0,
  }) async {
    final drivers = await findNearbyActiveDrivers(
      originLat: originLat,
      originLng: originLng,
      radiusKm: radiusKm,
    );
    return drivers.map((d) => d['user_id'].toString()).toList();
  }

  /// Despacha notificaciones por OneSignal Push y por WhatsApp a todos los conductores activos dentro de 5 km
  Future<void> _dispatchPushForNewTrip(Trip trip) async {
    try {
      List<Map<String, dynamic>> nearbyDrivers = [];
      List<String>? targetDriverIds;

      if (trip.originLat != null && trip.originLng != null) {
        nearbyDrivers = await findNearbyActiveDrivers(
          originLat: trip.originLat!,
          originLng: trip.originLng!,
          radiusKm: 5.0,
        );

        if (nearbyDrivers.isNotEmpty) {
          targetDriverIds = nearbyDrivers.map((d) => d['user_id'].toString()).toList();
          debugPrint('Notificando (OneSignal + WhatsApp) a ${nearbyDrivers.length} conductor(es) a menos de 5 km de ${trip.originAddress}');
        } else {
          debugPrint('No se detectaron conductores activos con ubicación dentro de 5 km.');
          targetDriverIds = null;
        }
      }

      // 1. Notificación Push vía OneSignal
      await OneSignalService().notifyNewTripForDrivers(
        tripId: trip.id!,
        originAddress: trip.originAddress,
        fare: trip.fare,
        targetDriverUserIds: targetDriverIds,
      );

      // 2. Notificación vía WhatsApp a todos los conductores cercanos dentro de 5 km
      for (final driver in nearbyDrivers) {
        final String phone = (driver['telefono'] ?? '').toString().trim();
        final String name = (driver['nombre'] ?? 'Conductor').toString().trim();
        final double? distKm = (driver['distancia_km'] as num?)?.toDouble();

        if (phone.isNotEmpty) {
          WhatsAppService.sendNewTripAlertToDriverWhatsApp(
            driverPhone: phone,
            driverName: name,
            tripId: trip.id!,
            origin: trip.originAddress,
            destination: trip.destinationAddress,
            fare: trip.fare,
            distanceFromDriverKm: distKm,
          );
        }
      }
    } catch (e) {
      debugPrint('Error al despachar notificaciones para nuevo viaje: $e');
    }
  }

  /// Obtiene el historial de viajes de un usuario (pasajero)
  Future<List<Trip>> getUserTrips(String userId) async {
    try {
      final response = await _client
          .from('trips')
          .select()
          .eq('user_id', userId)
          .order('created_at', ascending: false);

      return (response as List).map((json) => Trip.fromJson(json)).toList();
    } catch (e) {
      print('Error obteniendo viajes del usuario: $e');
      return [];
    }
  }

  /// Stream en tiempo real de viajes disponibles (en espera)
  Stream<List<Trip>> streamPendingTrips() {
    return _client
        .from('trips')
        .stream(primaryKey: ['id'])
        .eq('status', 'pending')
        .order('created_at', ascending: false)
        .map((data) => data.map((json) => Trip.fromJson(json)).toList());
  }

  /// Obtiene la información pública del conductor (nombre, foto y teléfono)
  Future<Map<String, String?>> getDriverPublicInfo(String driverId) async {
    try {
      String? name;
      String? photo;
      String? phone;

      // 1. Intentar desde public.conductores por user_id
      final driverResp = await _client
          .from('conductores')
          .select('nombre, nombre_completo, imagen_perfil, telefono, celular')
          .eq('user_id', driverId)
          .maybeSingle();

      if (driverResp != null) {
        final nComp = driverResp['nombre_completo'] as String?;
        final nSimple = driverResp['nombre'] as String?;
        name = (nComp != null && nComp.trim().isNotEmpty) ? nComp.trim() : nSimple?.trim();
        photo = driverResp['imagen_perfil'] as String?;
        phone = (driverResp['telefono'] ?? driverResp['celular']) as String?;
      }

      // 2. Si no se encontró por user_id, intentar por id
      if (name == null || name.isEmpty) {
        final driverRespById = await _client
            .from('conductores')
            .select('nombre, nombre_completo, imagen_perfil, telefono, celular')
            .eq('id', driverId)
            .maybeSingle();
        if (driverRespById != null) {
          final nComp = driverRespById['nombre_completo'] as String?;
          final nSimple = driverRespById['nombre'] as String?;
          name = (nComp != null && nComp.trim().isNotEmpty) ? nComp.trim() : nSimple?.trim();
          photo ??= driverRespById['imagen_perfil'] as String?;
          phone ??= (driverRespById['telefono'] ?? driverRespById['celular']) as String?;
        }
      }

      // 3. Si no tiene nombre o foto o teléfono, buscar en public.users
      if (name == null || name.isEmpty || photo == null || photo.isEmpty || phone == null || phone.isEmpty) {
        final userResp = await _client
            .from('users')
            .select('nombre, imagen_perfil, fotodeperfil, telefono, phone_number, celular')
            .eq('user_id', driverId)
            .maybeSingle();

        if (userResp != null) {
          name ??= (userResp['nombre'] as String?)?.trim();
          photo ??= (userResp['imagen_perfil'] as String?) ?? (userResp['fotodeperfil'] as String?);
          phone ??= (userResp['telefono'] ?? userResp['phone_number'] ?? userResp['celular']) as String?;
        }
      }

      // 4. Si aún no tiene nombre y coincide con el currentUser actual
      final currentAuth = _client.auth.currentUser;
      if (currentAuth != null && currentAuth.id == driverId) {
        final meta = currentAuth.userMetadata;
        if (meta != null) {
          name ??= (meta['name'] ?? meta['full_name'] ?? meta['nombre'])?.toString().trim();
          photo ??= (meta['avatar_url'] ?? meta['picture'])?.toString();
          phone ??= (meta['phone'] ?? meta['phone_number'] ?? meta['telefono'])?.toString();
        }
      }

      return {
        'name': (name != null && name.trim().isNotEmpty) ? name.trim() : 'Conductor',
        'photo': photo,
        'phone': phone,
      };
    } catch (e) {
      print('Error al obtener información pública del conductor: $e');
      return {'name': null, 'photo': null, 'phone': null};
    }
  }

  /// Obtiene la información pública del pasajero (nombre, teléfono, foto y calificación promedio)
  Future<Map<String, dynamic>> getPassengerPublicInfo(String passengerUserId) async {
    try {
      String? name;
      String? phone;
      String? photo;

      // 1. Consultar en public.users por user_id o por id
      var userResp = await _client
          .from('users')
          .select('nombre, apellido, telefono, phone_number, celular, imagen_perfil, fotodeperfil')
          .eq('user_id', passengerUserId)
          .maybeSingle();

      if (userResp == null) {
        userResp = await _client
            .from('users')
            .select('nombre, apellido, telefono, phone_number, celular, imagen_perfil, fotodeperfil')
            .eq('id', passengerUserId)
            .maybeSingle();
      }

      if (userResp != null) {
        final n = userResp['nombre'] as String?;
        final a = userResp['apellido'] as String?;
        name = '${n ?? ''} ${a ?? ''}'.trim();
        phone = (userResp['telefono'] ?? userResp['phone_number'] ?? userResp['celular']) as String?;
        photo = (userResp['imagen_perfil'] as String?) ?? (userResp['fotodeperfil'] as String?);
      }

      // 2. Obtener calificación promedio del pasajero
      final ratingService = RatingService();
      final stats = await ratingService.getUserRatingStats(passengerUserId, role: 'passenger');
      final double avgRating = stats['average'] as double;
      final int totalRatings = stats['total'] as int;

      return {
        'name': (name != null && name.trim().isNotEmpty) ? name.trim() : 'Pasajero',
        'phone': phone,
        'photo': photo,
        'rating': avgRating,
        'totalRatings': totalRatings,
      };
    } catch (e) {
      print('Error al obtener info del pasajero: $e');
      return {
        'name': 'Pasajero',
        'phone': null,
        'photo': null,
        'rating': 5.0,
        'totalRatings': 0,
      };
    }
  }

  /// Conductor acepta un viaje
  Future<bool> acceptTrip(String tripId, String driverId) async {
    try {
      final driverInfo = await getDriverPublicInfo(driverId);
      final updateData = <String, dynamic>{
        'driver_id': driverId,
        'status': 'accepted',
      };
      if (driverInfo['name'] != null && driverInfo['name']!.isNotEmpty) {
        updateData['name_driver'] = driverInfo['name'];
      }
      if (driverInfo['photo'] != null && driverInfo['photo']!.isNotEmpty) {
        updateData['photo_driver'] = driverInfo['photo'];
      }

      final response = await _client.from('trips').update(updateData)
      .eq('id', tripId)
      .eq('status', 'pending')
      .select()
      .maybeSingle();

      if (response == null) {
        print('El viaje ya no está pendiente o fue tomado por otro conductor.');
        return false;
      }
      
      // Notificar a ambos por correo
      notifyTripStatusChange(tripId, 'aceptado');

      // Notificar al Pasajero vía WhatsApp (En segundo plano)
      try {
        final userId = response['user_id'] as String?;
        if (userId != null && userId.isNotEmpty) {
          getPassengerPublicInfo(userId).then((pInfo) {
            final pPhone = pInfo['phone'] as String?;
            if (pPhone != null && pPhone.isNotEmpty) {
              _client
                  .from('conductores')
                  .select('modelo_auto, color_auto, placas')
                  .eq('user_id', driverId)
                  .maybeSingle()
                  .then((dData) {
                final auto = '${dData?['modelo_auto'] ?? 'Taxi'} ${dData?['color_auto'] ?? ''}'.trim();
                final placas = (dData?['placas'] ?? '').toString();
                WhatsAppService.sendTripAssignedWhatsApp(
                  passengerPhone: pPhone,
                  passengerName: (pInfo['name'] as String?) ?? 'Pasajero',
                  driverName: driverInfo['name'] ?? 'Conductor',
                  vehicleInfo: auto.isNotEmpty ? auto : 'Taxi Oficial',
                  plateNumber: placas.isNotEmpty ? placas : 'En camino',
                  origin: (response['origin_address'] as String?) ?? 'Tu ubicación',
                  destination: (response['destination_address'] as String?) ?? 'Destino solicitado',
                  fare: (response['fare'] as num?)?.toDouble() ?? 0.0,
                  pinCode: (response['codigo'] as num?)?.toInt(),
                );
              }).catchError((_) {});
            }
          }).catchError((_) {});
        }
      } catch (_) {}
      
      return true;
    } catch (e) {
      print('Error aceptando viaje: $e');
      return false;
    }
  }

  /// Obtener el viaje activo del conductor, si existe
  Future<Trip?> getActiveTrip(String driverId) async {
    try {
      final response = await _client
          .from('trips')
          .select()
          .eq('driver_id', driverId)
          .inFilter('status', const ['accepted', 'arrived', 'in_progress'])
          .order('created_at', ascending: false)
          .limit(1)
          .maybeSingle();
      
      if (response != null) {
        return Trip.fromJson(response);
      }
      return null;
    } catch (e) {
      print('Error obteniendo viaje activo: $e');
      return null;
    }
  }

  /// Stream de un viaje específico por ID para actualizaciones en tiempo real
  Stream<Trip?> streamTrip(String tripId) {
    return _client
        .from('trips')
        .stream(primaryKey: ['id'])
        .eq('id', tripId)
        .map((data) => data.isEmpty ? null : Trip.fromJson(data.first));
  }

  /// Obtener el viaje activo o pendiente del pasajero, si existe
  Future<Trip?> getActiveTripForPassenger(String userId) async {
    try {
      final response = await _client
          .from('trips')
          .select()
          .eq('user_id', userId)
          .inFilter('status', const ['pending', 'accepted', 'arrived', 'in_progress'])
          .order('created_at', ascending: false)
          .limit(1)
          .maybeSingle();
      
      if (response != null) {
        return Trip.fromJson(response);
      }
      return null;
    } catch (e) {
      print('Error obteniendo viaje activo del pasajero: $e');
      return null;
    }
  }

  /// Actualizar el estado del viaje (ej: arrived, in_progress)
  Future<bool> updateTripStatus(String tripId, String newStatus, {int? codigo}) async {
    try {
      final updateData = <String, dynamic>{
        'status': newStatus,
      };
      
      if (newStatus == 'arrived') {
        updateData['arrived_at'] = DateTime.now().toUtc().toIso8601String();
        // Generar código de 5 dígitos para verificación (estilo Uber) si no viene provisto
        final pinCode = codigo ?? (10000 + Random().nextInt(90000));
        updateData['codigo'] = pinCode;
      } else if (codigo != null) {
        updateData['codigo'] = codigo;
      }

      await _client.from('trips').update(updateData).eq('id', tripId);
      
      // Notificar cambio de estado
      notifyTripStatusChange(tripId, newStatus == 'arrived' ? 'en camino' : newStatus);

      // Si el conductor llegó, enviar WhatsApp al Pasajero con el PIN de abordaje
      if (newStatus == 'arrived') {
        try {
          _client.from('trips').select().eq('id', tripId).maybeSingle().then((tripData) {
            if (tripData != null) {
              final userId = tripData['user_id'] as String?;
              final driverId = tripData['driver_id'] as String?;
              if (userId != null && userId.isNotEmpty) {
                getPassengerPublicInfo(userId).then((pInfo) {
                  final pPhone = pInfo['phone'] as String?;
                  if (pPhone != null && pPhone.isNotEmpty) {
                    _client.from('conductores').select().eq('user_id', driverId ?? '').maybeSingle().then((dData) {
                      final auto = '${dData?['modelo_auto'] ?? 'Taxi'} ${dData?['color_auto'] ?? ''}'.trim();
                      final placas = (dData?['placas'] ?? '').toString();
                      final driverName = (dData?['nombre_completo'] ?? dData?['nombre'] ?? 'Conductor').toString();
                      WhatsAppService.sendDriverArrivedWhatsApp(
                        passengerPhone: pPhone,
                        passengerName: (pInfo['name'] as String?) ?? 'Pasajero',
                        driverName: driverName,
                        vehicleInfo: auto.isNotEmpty ? auto : 'Taxi Oficial',
                        plateNumber: placas.isNotEmpty ? placas : 'En sitio',
                        origin: (tripData['origin_address'] as String?) ?? 'Punto de recogida',
                        pinCode: updateData['codigo'] as int?,
                      );
                    }).catchError((_) {});
                  }
                }).catchError((_) {});
              }
            }
          }).catchError((_) {});
        } catch (_) {}
      }
      
      return true;
    } catch (e) {
      print('Error actualizando estado del viaje: $e');
      return false;
    }
  }

  /// Conductor completa un viaje y se registra el cobro
  Future<bool> completeTrip(String tripId, double fare, {String? nameDriver, String? photoDriver}) async {
    try {
      final double gananciaConductor = fare * 0.80; // 80% del total

      String? finalName = nameDriver;
      String? finalPhoto = photoDriver;

      Map<String, dynamic>? currentTrip;
      try {
        currentTrip = await _client.from('trips').select().eq('id', tripId).maybeSingle();
      } catch (_) {}

      final String? driverId = currentTrip?['driver_id'] as String? ?? _client.auth.currentUser?.id;
      final String? userId = currentTrip?['user_id'] as String?;
      final String metodoPago = (currentTrip?['metodo_pago'] ?? currentTrip?['payment_method'] ?? 'efectivo').toString();

      if (finalName == null || finalName.isEmpty || finalPhoto == null || finalPhoto.isEmpty) {
        if (driverId != null) {
          try {
            final driverInfo = await getDriverPublicInfo(driverId);
            finalName ??= driverInfo['name'];
            finalPhoto ??= driverInfo['photo'];
          } catch (_) {}
        }
      }

      await _client.from('trips').update({
        'status': 'completed',
        'fare': fare,
        'total_final': gananciaConductor, // Guarda directamente el ingreso del conductor
        'completed_at': DateTime.now().toIso8601String(),
        if (finalName != null && finalName.isNotEmpty) 'name_driver': finalName,
        if (finalPhoto != null && finalPhoto.isNotEmpty) 'photo_driver': finalPhoto,
      }).eq('id', tripId);

      // Regla de Facturación TaxiSeguro: al finalizar el viaje, se mandan los detalles a los row de facturación
      String? passengerEmail;
      String? passengerPhone;
      String? passengerName;

      try {
        if (userId != null && userId.isNotEmpty) {
          try {
            final userRes = await _client.from('users').select().eq('user_id', userId).maybeSingle();
            if (userRes != null) {
              passengerEmail = userRes['correo'] as String?;
              passengerPhone = (userRes['telefono'] ?? userRes['phone_number'] ?? userRes['celular']) as String?;
              passengerName = userRes['nombre'] as String?;
            }

            final bool wasAlreadyActivated = userRes != null && userRes['usuario_activado'] == true;
            final bool hasReferido = userRes != null &&
                userRes['referido'] != null &&
                userRes['referido'].toString().trim().isNotEmpty;

            final Map<String, dynamic> updateUserData = {
              'usuario_activado': true,
              'descuento_siguiente_viaje': 0.0,
              'viajes_con_descuento': 0,
            };

            // Regla del Sistema de Referidos:
            // Al completar su PRIMER viaje:
            if (hasReferido && !wasAlreadyActivated) {
              final String tipoReferido = (userRes['tipo_referido'] ?? '').toString().toLowerCase();
              final String refPhone = userRes['referido'].toString().trim().replaceAll(RegExp(r'\D'), '');
              final String? referenteId = userRes['referente_id']?.toString();

              if (tipoReferido == 'conductor') {
                // Caso A: Referido por Conductor -> Comisión en efectivo del 20%
                final double comisionReferido = fare * 0.20;
                updateUserData['comision_referido'] = comisionReferido;
                print('Sistema de Referidos (Conductor): Comisión de \$${comisionReferido.toStringAsFixed(2)} asignada por 1er viaje de usuario $userId para conductor: $refPhone');
              } else {
                // Caso B: Referido por Pasajero -> Descuento del 20% en su siguiente viaje para el usuario referente
                try {
                  Map<String, dynamic>? referrerDoc;
                  if (referenteId != null && referenteId.isNotEmpty) {
                    referrerDoc = await _client.from('users').select('id, user_id, viajes_con_descuento').eq('user_id', referenteId).maybeSingle();
                  }
                  if (referrerDoc == null && refPhone.isNotEmpty) {
                    referrerDoc = await _client.from('users').select('id, user_id, viajes_con_descuento').eq('telefono', refPhone).maybeSingle();
                  }

                  if (referrerDoc != null) {
                    final int currentDiscounts = (referrerDoc['viajes_con_descuento'] as num?)?.toInt() ?? 0;
                    await _client.from('users').update({
                      'descuento_siguiente_viaje': 20.0,
                      'viajes_con_descuento': currentDiscounts + 1,
                    }).eq('id', referrerDoc['id']);
                    print('Sistema de Referidos (Pasajero): Usuario referente ${referrerDoc['user_id']} acreditado con 20% de descuento para su próximo viaje.');
                  }
                } catch (refUserErr) {
                  print('Error al acreditar descuento a usuario referente: $refUserErr');
                }
              }

              // Actualizar el estado 'activo: true' en la columna JSON usuarios_referidos del referente y en la tabla referidos
              ReferralService().markReferralActivated(
                referrerPhone: refPhone,
                referredUserId: userId,
                commission: (tipoReferido == 'conductor') ? (fare * 0.20) : null,
                tripId: tripId,
              );
            }

            await _client.from('users').update(updateUserData).eq('user_id', userId);
          } catch (activateError) {
            print('Error activando usuario o calculando comisión de referido: $activateError');
          }
        }

        final double comisionApp = fare * 0.20; // 20% TaxiSeguro

        await _client.from('facturacion').insert({
          'cantidad': fare,
          'metodo_pago': metodoPago,
          'fecha_servicio': DateTime.now().toIso8601String(),
          'status': 'completado',
          if (passengerEmail != null && passengerEmail.isNotEmpty) 'email': passengerEmail,
          if (passengerPhone != null && passengerPhone.isNotEmpty) 'telefono': passengerPhone,
          if (passengerName != null && passengerName.isNotEmpty) 'razon_social': passengerName,
          'datos_adicionales': jsonEncode({
            'trip_id': tripId,
            'driver_id': driverId,
            'user_id': userId,
            'fare': fare,
            'total_final': gananciaConductor,
            'comision_app': comisionApp,
            'ganancia_conductor': gananciaConductor,
            'origin_address': currentTrip?['origin_address'],
            'destination_address': currentTrip?['destination_address'],
            'distance_km': currentTrip?['distance_km'],
            'name_driver': finalName,
          }),
        });
        print('Detalle de facturación registrado correctamente en la tabla facturación para el viaje: $tripId');
      } catch (factErr) {
        print('Aviso: no se pudo registrar en tabla facturacion: $factErr');
      }

      // Notificar completado
      notifyTripStatusChange(tripId, 'finalizado');

      // Enviar Recibo de Viaje por WhatsApp al Pasajero (En segundo plano)
      try {
        if (passengerPhone != null && passengerPhone.isNotEmpty) {
          WhatsAppService.sendTripReceiptWhatsApp(
            passengerPhone: passengerPhone,
            passengerName: passengerName ?? 'Pasajero',
            tripId: tripId,
            driverName: finalName ?? 'Conductor',
            origin: (currentTrip?['origin_address'] as String?) ?? 'Origen',
            destination: (currentTrip?['destination_address'] as String?) ?? 'Destino',
            fare: fare,
            distanceKm: (currentTrip?['distance_km'] as num?)?.toDouble(),
            paymentMethod: metodoPago,
          );
        }
      } catch (_) {}

      return true;
    } catch (e) {
      print('Error completando viaje: $e');
      return false;
    }
  }

  // ===========================================================================
  // LÍMITES DIARIOS DE CANCELACIÓN Y PENALIZACIONES
  // (Conductor: 3 libres/día, luego $20 MXN penalización / Pasajero: 3 libres en búsqueda)
  // ===========================================================================
  static const int maxDriverCancellationsPerDay = 3;
  static const int maxPassengerCancellationsPerDay = 3;
  static const double driverCancellationPenaltyFee = 20.0;

  /// Cuenta las cancelaciones del día actual realizadas por el conductor
  Future<int> getDriverCancellationsToday(String driverId) async {
    try {
      final now = DateTime.now();
      final startOfDay = DateTime(now.year, now.month, now.day).toUtc().toIso8601String();

      final response = await _client
          .from('trips')
          .select('id, cancel_reason, created_at')
          .eq('driver_id', driverId)
          .eq('status', 'cancelled')
          .gte('created_at', startOfDay);

      int count = 0;
      for (final item in (response as List)) {
        final reason = (item['cancel_reason'] as String?)?.toLowerCase() ?? '';
        final isSystem = reason.contains('sistema') || reason.contains('automáticamente') || reason.contains('tiempo de espera');
        final isPassenger = reason.contains('pasajero');
        if (!isSystem && !isPassenger) {
          count++;
        }
      }
      return count;
    } catch (e) {
      print('Error consultando cancelaciones de conductor: $e');
      return 0;
    }
  }

  /// Cuenta las cancelaciones del día actual realizadas por el pasajero
  Future<int> getPassengerCancellationsToday(String userId) async {
    try {
      final now = DateTime.now();
      final startOfDay = DateTime(now.year, now.month, now.day).toUtc().toIso8601String();

      final response = await _client
          .from('trips')
          .select('id, cancel_reason, created_at')
          .eq('user_id', userId)
          .eq('status', 'cancelled')
          .gte('created_at', startOfDay);

      int count = 0;
      for (final item in (response as List)) {
        final reason = (item['cancel_reason'] as String?)?.toLowerCase() ?? '';
        final isSystem = reason.contains('sistema') || reason.contains('automáticamente') || reason.contains('tiempo de espera');
        final isDriver = reason.contains('conductor');
        if (!isSystem && !isDriver) {
          count++;
        }
      }
      return count;
    } catch (e) {
      print('Error consultando cancelaciones de pasajero: $e');
      return 0;
    }
  }

  /// Devuelve el estatus de cancelaciones de hoy para el conductor (3 libres, luego penalización de $20 MXN)
  Future<Map<String, dynamic>> getDriverCancellationStatus(String driverId) async {
    final count = await getDriverCancellationsToday(driverId);
    final remaining = (maxDriverCancellationsPerDay - count).clamp(0, maxDriverCancellationsPerDay);
    final bool hasFee = count >= maxDriverCancellationsPerDay;
    return {
      'count': count,
      'limit': maxDriverCancellationsPerDay,
      'freeLimit': maxDriverCancellationsPerDay,
      'remaining': remaining,
      'remainingFree': remaining,
      'hasFee': hasFee,
      'feeAmount': hasFee ? driverCancellationPenaltyFee : 0.0,
      'canCancel': true, // Siempre puede cancelar, aplicando penalización de $20 si superó el cupo libre
    };
  }

  /// Devuelve el estatus de cancelaciones de hoy para el pasajero (límite 3 en búsqueda)
  Future<Map<String, dynamic>> getPassengerCancellationStatus(String userId) async {
    final count = await getPassengerCancellationsToday(userId);
    final remaining = (maxPassengerCancellationsPerDay - count).clamp(0, maxPassengerCancellationsPerDay);
    return {
      'count': count,
      'limit': maxPassengerCancellationsPerDay,
      'remaining': remaining,
      'canCancel': count < maxPassengerCancellationsPerDay,
    };
  }

  /// Cancelar un viaje y notificar automáticamente a Super Admins y Conductor (con letras grandes si aplica)
  Future<bool> cancelTrip(
    String tripId, {
    String? cancelReason,
    String? nameDriver,
    String? photoDriver,
    String? cancelledBy,
    LatLng? driverLocation,
    bool bypassLimit = false,
  }) async {
    try {
      String? finalName = nameDriver;
      String? finalPhoto = photoDriver;

      // 1. Obtener detalles completos del viaje antes de cancelar
      Map<String, dynamic>? currentTrip;
      try {
        currentTrip = await _client.from('trips').select().eq('id', tripId).maybeSingle();
      } catch (e) {
        print('Error consultando viaje para cancelar: $e');
      }

      final String previousStatus = currentTrip?['status'] as String? ?? 'pending';
      final String? driverId = currentTrip?['driver_id'] as String?;
      final String? userId = currentTrip?['user_id'] as String?;
      final String originAddr = currentTrip?['origin_address'] as String? ?? 'N/A';
      final String destAddr = currentTrip?['destination_address'] as String? ?? 'N/A';
      final double? fareVal = (currentTrip?['fare'] as num?)?.toDouble();

      final double? originLat = (currentTrip?['origin_lat'] as num?)?.toDouble();
      final double? originLng = (currentTrip?['origin_lng'] as num?)?.toDouble();
      final double? destLat = (currentTrip?['destination_lat'] as num?)?.toDouble();
      final double? destLng = (currentTrip?['destination_lng'] as num?)?.toDouble();

      // Resolver quién canceló
      final String currentAuthId = _client.auth.currentUser?.id ?? '';
      String role = cancelledBy ?? '';
      if (role.isEmpty) {
        if (currentAuthId.isNotEmpty && driverId != null && currentAuthId == driverId) {
          role = 'Conductor';
        } else if (currentAuthId.isNotEmpty && userId != null && currentAuthId == userId) {
          role = 'Pasajero';
        } else if (cancelReason != null && cancelReason.toLowerCase().contains('conductor')) {
          role = 'Conductor';
        } else {
          role = 'Pasajero';
        }
      } else {
        role = (role.toLowerCase().contains('driver') || role.toLowerCase().contains('conductor'))
            ? 'Conductor'
            : (role.toLowerCase().contains('sistema') ? 'Sistema' : 'Pasajero');
      }

      // 1.0 Regla: El pasajero NO puede cancelar una vez que el conductor ya tomó el viaje
      if (role == 'Pasajero' && (previousStatus == 'accepted' || previousStatus == 'arrived' || previousStatus == 'in_progress')) {
        print('Cancelación rechazada: El pasajero no puede cancelar un viaje asignado en curso ($previousStatus). Solo el conductor puede cancelar.');
        return false;
      }
      // Cuando el viaje aún está en búsqueda/solicitud (status: pending), el pasajero puede cancelar libremente.

      // 1.1 Evaluar penalización de $20 MXN para el conductor si superó su cupo libre diario
      double penalizacionConductor = 0.0;
      if (role == 'Conductor' && driverId != null && driverId.isNotEmpty) {
        final status = await getDriverCancellationStatus(driverId);
        if (status['hasFee'] == true) {
          penalizacionConductor = driverCancellationPenaltyFee; // $20.00 MXN
        }
      }

      // Si canceló el conductor, obtener ubicación GPS y dirección exacta de cancelación
      LatLng? finalDriverLoc = driverLocation;
      String? cancellationAddress;
      if (role == 'Conductor') {
        if (finalDriverLoc == null) {
          try {
            finalDriverLoc = await LocationService().getCurrentLocation();
          } catch (_) {}
        }
        if (finalDriverLoc != null) {
          try {
            cancellationAddress = await MapboxService().reverseGeocode(finalDriverLoc);
          } catch (e) {
            print('Error geocodificando ubicación de cancelación: $e');
          }
        }
      }

      // Generar URL del mapa estático (Mapbox Static Images API) con trayecto y punto de cancelación
      LatLng? originLatLng = (originLat != null && originLng != null && originLat != 0 && originLng != 0)
          ? LatLng(originLat, originLng)
          : null;
      LatLng? destLatLng = (destLat != null && destLng != null && destLat != 0 && destLng != 0)
          ? LatLng(destLat, destLng)
          : null;

      String staticMapUrl = '';
      try {
        staticMapUrl = MapboxService.getStaticMapUrl(
          origin: originLatLng,
          destination: destLatLng,
          driverLocation: finalDriverLoc,
        );
      } catch (e) {
        print('Error generando mapa estático de cancelación: $e');
      }

      // 2. Obtener datos del conductor
      Map<String, dynamic>? driverData;
      if (driverId != null && driverId.isNotEmpty) {
        try {
          driverData = await _client
              .from('conductores')
              .select('nombre, nombre_completo, correo, telefono, placas, modelo_auto, color_auto')
              .eq('user_id', driverId)
              .maybeSingle();
        } catch (_) {}

        if (finalName == null || finalName.isEmpty || finalPhoto == null || finalPhoto.isEmpty) {
          try {
            final driverInfo = await getDriverPublicInfo(driverId);
            finalName ??= driverInfo['name'];
            finalPhoto ??= driverInfo['photo'];
          } catch (_) {}
        }
      }

      final String resolvedDriverName = finalName ??
          driverData?['nombre_completo'] ??
          driverData?['nombre'] ??
          'Conductor';
      final String? driverEmail = driverData?['correo'] as String?;
      final String? driverPhone = driverData?['telefono'] as String?;
      final String? driverPlates = driverData?['placas'] as String?;
      final String driverVehicle =
          '${driverData?['modelo_auto'] ?? ''} ${driverData?['color_auto'] ?? ''}'.trim();

      // 3. Obtener datos del pasajero
      Map<String, dynamic>? passengerData;
      if (userId != null && userId.isNotEmpty) {
        try {
          passengerData = await _client
              .from('users')
              .select('nombre, apellido, correo, telefono')
              .eq('user_id', userId)
              .maybeSingle();
        } catch (_) {}
      }

      final String passengerName = '${passengerData?['nombre'] ?? ''} ${passengerData?['apellido'] ?? ''}'.trim();
      final String resolvedPassengerName = passengerName.isNotEmpty ? passengerName : 'Pasajero';
      final String? passengerEmail = passengerData?['correo'] as String?;
      final String? passengerPhone = passengerData?['telefono'] as String?;

      String finalReason = cancelReason ?? 'Cancelado por el $role';
      if (penalizacionConductor > 0) {
        finalReason = '$finalReason [Penalización aplicada: \$${penalizacionConductor.toStringAsFixed(2)} MXN]';
      }
      if (cancellationAddress != null && cancellationAddress.isNotEmpty) {
        finalReason = '$finalReason (Lugar de cancelación: $cancellationAddress)';
      }

      // 4. Actualizar viaje en Supabase
      final Map<String, dynamic> updatePayload = {
        'status': 'cancelled',
        'cancel_reason': finalReason,
        if (finalName != null && finalName.isNotEmpty) 'name_driver': finalName,
        if (finalPhoto != null && finalPhoto.isNotEmpty) 'photo_driver': finalPhoto,
      };

      if (penalizacionConductor > 0) {
        try {
          final penaltyPayload = Map<String, dynamic>.from(updatePayload);
          penaltyPayload['penalizacion_conductor'] = penalizacionConductor;
          await _client.from('trips').update(penaltyPayload).eq('id', tripId);
        } catch (_) {
          // Fallback seguro si la columna penalizacion_conductor aún no existe en Supabase
          await _client.from('trips').update(updatePayload).eq('id', tripId);
        }
      } else {
        await _client.from('trips').update(updatePayload).eq('id', tripId);
      }

      // Notificar cambio en tiempo real a clientes
      notifyTripStatusChange(tripId, 'cancelado');

      // 5. ENVIAR CORREOS MEDIANTE BREVO (En segundo plano)
      // A) A los Super Administradores (Siempre que se cancele un viaje)
      BrevoService.sendCancellationAlertToAdmins(
        tripId: tripId,
        cancelledByRole: role,
        cancelReason: finalReason,
        previousStatus: previousStatus,
        passengerName: resolvedPassengerName,
        passengerPhone: passengerPhone,
        passengerEmail: passengerEmail,
        driverName: driverId != null ? resolvedDriverName : null,
        driverPhone: driverPhone,
        driverEmail: driverEmail,
        driverPlates: driverPlates,
        driverVehicle: driverVehicle.isNotEmpty ? driverVehicle : null,
        origin: originAddr,
        destination: destAddr,
        fare: fareVal,
        driverCancellationAddress: cancellationAddress,
        staticMapUrl: staticMapUrl.isNotEmpty ? staticMapUrl : null,
        driverLocation: finalDriverLoc,
      );

      // B) Al Conductor (CON LETRAS GRANDES) si el Pasajero canceló y el conductor ya había aceptado
      final bool wasAccepted = previousStatus == 'accepted' || previousStatus == 'arrived' || previousStatus == 'in_progress';
      if (role == 'Pasajero' && driverId != null && wasAccepted) {
        if (driverEmail != null && driverEmail.contains('@')) {
          BrevoService.sendCancellationAlertToDriver(
            driverEmail: driverEmail,
            driverName: resolvedDriverName,
            tripId: tripId,
            passengerName: resolvedPassengerName,
            origin: originAddr,
            destination: destAddr,
            cancelReason: finalReason,
            fare: fareVal,
          );
        }
      }

      // C) Alertas de Cancelación por WhatsApp (En segundo plano)
      try {
        if (role == 'Pasajero' && wasAccepted && driverPhone != null && driverPhone.isNotEmpty) {
          // Alerta con máxima visibilidad para el conductor
          WhatsAppService.sendCancellationAlertToDriverWhatsApp(
            driverPhone: driverPhone,
            driverName: resolvedDriverName,
            tripId: tripId,
            passengerName: resolvedPassengerName,
            origin: originAddr,
            destination: destAddr,
            cancelReason: finalReason,
          );
        } else if (role == 'Conductor' && passengerPhone != null && passengerPhone.isNotEmpty) {
          // Aviso al pasajero de que el conductor canceló
          WhatsAppService.sendTripCancelledWhatsApp(
            toPhone: passengerPhone,
            recipientName: resolvedPassengerName,
            tripId: tripId,
            cancelledByRole: 'el Conductor',
            cancelReason: finalReason,
            origin: originAddr,
            destination: destAddr,
          );
        }

        // Alerta por WhatsApp a Super Administradores
        WhatsAppService.sendCancellationAlertToAdminsWhatsApp(
          tripId: tripId,
          cancelledByRole: role,
          cancelReason: finalReason,
          previousStatus: previousStatus,
          passengerName: resolvedPassengerName,
          passengerPhone: passengerPhone,
          driverName: driverId != null ? resolvedDriverName : null,
          driverPhone: driverPhone,
          origin: originAddr,
          destination: destAddr,
          fare: fareVal,
          driverCancellationAddress: cancellationAddress,
        );
      } catch (_) {}

      return true;
    } catch (e) {
      print('Error cancelando viaje: $e');
      return false;
    }
  }

  /// Obtiene las ganancias del día actual para un conductor
  Future<double> getDriverEarningsToday(String driverId) async {
    try {
      final now = DateTime.now();
      final startOfDay = DateTime(now.year, now.month, now.day).toIso8601String();

      final response = await _client
          .from('trips')
          .select('fare')
          .eq('driver_id', driverId)
          .eq('status', 'completed')
          .gte('completed_at', startOfDay);

      double total = 0.0;
      for (final row in response as List) {
        if (row['fare'] != null) {
          total += (row['fare'] as num).toDouble();
        }
      }
      return total;
    } catch (e) {
      print('Error calculando ganancias de hoy: $e');
      return 0.0;
    }
  }

  /// Obtiene los últimos viajes completados por el conductor
  Future<List<Trip>> getDriverCompletedTrips(String driverId) async {
    try {
      final response = await _client
          .from('trips')
          .select()
          .eq('driver_id', driverId)
          .eq('status', 'completed')
          .order('completed_at', ascending: false)
          .limit(10);

      return (response as List).map((json) => Trip.fromJson(json)).toList();
    } catch (e) {
      print('Error obteniendo viajes completados: $e');
      return [];
    }
  }

  /// Obtiene todos los viajes completados por el conductor para historial financiero
  Future<List<Trip>> getAllDriverCompletedTrips(String driverId) async {
    try {
      final response = await _client
          .from('trips')
          .select()
          .eq('driver_id', driverId)
          .eq('status', 'completed')
          .order('completed_at', ascending: false);

      return (response as List).map((json) => Trip.fromJson(json)).toList();
    } catch (e) {
      print('Error obteniendo todos los viajes completados: $e');
      return [];
    }
  }
}
