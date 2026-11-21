import 'dart:async';
import 'dart:io';
import 'dart:ui';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:live_activities/live_activities.dart';
import 'package:live_activities/models/activity_update.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> initializeBackgroundService() async {
  final service = FlutterBackgroundService();

  const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'taxiseguro_foreground', // id
    'Alertas de Viaje TaxiSeguro', // title
    description: 'Notificaciones y estado de tus viajes en segundo plano.', // description
    importance: Importance.max,
    playSound: true,
    enableVibration: true,
  );

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  if (Platform.isIOS || Platform.isAndroid) {
    await flutterLocalNotificationsPlugin.initialize(
      settings: const InitializationSettings(
        iOS: DarwinInitializationSettings(),
        android: AndroidInitializationSettings('@mipmap/launcher_icon'),
      ),
    );
  }

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await service.configure(
    androidConfiguration: AndroidConfiguration(
      onStart: onStart,
      autoStart: false,
      isForegroundMode: true,
      notificationChannelId: 'taxiseguro_foreground',
      initialNotificationTitle: 'TaxiSeguro',
      initialNotificationContent: 'Servicio de viaje activo',
      foregroundServiceNotificationId: 888,
    ),
    iosConfiguration: IosConfiguration(
      autoStart: false,
      onForeground: onStart,
      onBackground: onIosBackground,
    ),
  );
}

@pragma('vm:entry-point')
Future<bool> onIosBackground(ServiceInstance service) async {
  return true;
}

@pragma('vm:entry-point')
void onStart(ServiceInstance service) async {
  DartPluginRegistrant.ensureInitialized();
  
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
      
  service.on('update_notification').listen((event) {
    if (event != null) {
      final String title = event['title'] ?? 'TaxiSeguro';
      final String body = event['body'] ?? 'Actualización de viaje';
      final String? driverName = event['driverName'];
      final String? vehicleInfo = event['vehicleInfo'];
      final String? plateNumber = event['plateNumber'];
      final String? pinCode = event['pinCode'];
      final String? destination = event['destination'];
      final String? fare = event['fare'];
      final bool isCancelled = event['isCancelled'] == true ||
          body.toLowerCase().contains('cancel') ||
          title.toLowerCase().contains('cancel');

      // Construcción del contenido enriquecido para Android (BigTextStyleInformation)
      final List<String> details = [];
      if (driverName != null && driverName.isNotEmpty) {
        details.add('Conductor: $driverName');
      }
      if (vehicleInfo != null && vehicleInfo.isNotEmpty) {
        final plateText = (plateNumber != null && plateNumber.isNotEmpty) ? ' ($plateNumber)' : '';
        details.add('Vehiculo: $vehicleInfo$plateText');
      }
      if (pinCode != null && pinCode.isNotEmpty) {
        details.add('PIN de Abordaje Seguro: $pinCode');
      }
      if (destination != null && destination.isNotEmpty) {
        details.add('Destino: $destination');
      }
      if (fare != null && fare.isNotEmpty) {
        details.add('Tarifa: $fare');
      }

      final String bigText = details.isNotEmpty
          ? '$body\n\n${details.join('\n')}'
          : body;

      final Color themeColor = isCancelled ? const Color(0xFFDC2626) : const Color(0xFFC7FF2E);

      // Actualizar información en Android Foreground Service
      if (Platform.isAndroid && service is AndroidServiceInstance) {
        service.setForegroundNotificationInfo(
          title: title,
          content: details.isNotEmpty ? '${details.first} • $body' : body,
        );
      }

      // Notificación enriquecida en Android (Visible en pantalla de bloqueo y barra de estado)
      flutterLocalNotificationsPlugin.show(
        id: 888,
        title: title,
        body: body,
        notificationDetails: NotificationDetails(
          android: AndroidNotificationDetails(
            'taxiseguro_foreground',
            'Alertas de Viaje TaxiSeguro',
            channelDescription: 'Seguimiento en vivo y estado del viaje en TaxiSeguro.',
            icon: '@mipmap/launcher_icon',
            ongoing: !isCancelled,
            autoCancel: isCancelled,
            color: themeColor,
            colorized: isCancelled, // Resalta la notificación completamente en ROJO al cancelarse
            importance: Importance.max,
            priority: Priority.max,
            showWhen: true,
            category: AndroidNotificationCategory.status,
            visibility: NotificationVisibility.public,
            subText: isCancelled ? 'CANCELADO' : (pinCode != null ? 'PIN: $pinCode' : 'TaxiSeguro En Vivo'),
            styleInformation: BigTextStyleInformation(
              bigText,
              contentTitle: title,
              summaryText: isCancelled ? 'VIAJE CANCELADO' : (pinCode != null ? 'PIN: $pinCode' : 'TaxiSeguro En Vivo'),
            ),
            playSound: true,
            enableVibration: true,
          ),
          iOS: const DarwinNotificationDetails(),
        ),
      );
    }
  });

  service.on('stopService').listen((event) {
    service.stopSelf();
  });
}

class BackgroundServiceHelper {
  static final _liveActivitiesPlugin = LiveActivities();
  static String? _liveActivityId;
  static Timer? _cancelDismissTimer;

  static Future<bool> requestNotificationPermission() async {
    if (!Platform.isAndroid && !Platform.isIOS) return true;
    final status = await Permission.notification.status;
    if (!status.isGranted) {
      final result = await Permission.notification.request();
      return result.isGranted;
    }
    return true;
  }

  static Future<void> startService() async {
    if (!Platform.isAndroid && !Platform.isIOS) return;
    
    await requestNotificationPermission();

    final service = FlutterBackgroundService();
    bool isRunning = await service.isRunning();
    if (!isRunning) {
      await service.startService();
    }
  }

  static void stopService() async {
    if (!Platform.isAndroid && !Platform.isIOS) return;
    
    final service = FlutterBackgroundService();
    bool isRunning = await service.isRunning();
    if (isRunning) {
      service.invoke("stopService");
    }
  }

  static void updateNotification(
    String title,
    String body, {
    String? driverName,
    String? vehicleInfo,
    String? plateNumber,
    String? pinCode,
    String? destination,
    String? fare,
    bool isCancelled = false,
  }) {
    if (!Platform.isAndroid && !Platform.isIOS) return;
    
    final service = FlutterBackgroundService();
    service.invoke(
      'update_notification',
      {
        'title': title,
        'body': body,
        if (driverName != null) 'driverName': driverName,
        if (vehicleInfo != null) 'vehicleInfo': vehicleInfo,
        if (plateNumber != null) 'plateNumber': plateNumber,
        if (pinCode != null) 'pinCode': pinCode,
        if (destination != null) 'destination': destination,
        if (fare != null) 'fare': fare,
        'isCancelled': isCancelled,
      },
    );
  }

  /// Muestra la notificacion de cancelacion en ROJO de alta atencion tanto en iOS (Live Activity)
  /// como en Android (Notificacion persistente colorizada) durante unos momentos antes de cerrarla.
  static Future<void> notifyTripCancelled({
    String reason = 'Tu viaje ha sido cancelado.',
    Duration displayDuration = const Duration(seconds: 6),
  }) async {
    _cancelDismissTimer?.cancel();

    // 1. Notificación en Android en color ROJO
    updateNotification(
      'Viaje Cancelado',
      reason,
      isCancelled: true,
    );

    // 2. Live Activity en iOS con badge y tema ROJO
    if (Platform.isIOS) {
      try {
        final data = <String, dynamic>{
          'title': 'Viaje Cancelado',
          'status': 'Cancelado',
        };
        if (_liveActivityId != null) {
          await _liveActivitiesPlugin.updateActivity(_liveActivityId!, data);
        } else {
          await _liveActivitiesPlugin.init(appGroupId: 'group.com.taxiseguro.app');
          _liveActivityId = await _liveActivitiesPlugin.createActivity(
            'taxiseguro_trip',
            data,
            iOSEnableRemoteUpdates: true,
          );
        }
      } catch (e) {
        print('Error actualizando Live Activity a cancelado: $e');
      }
    }

    // 3. Mantener visible durante unos segundos para que el usuario preste atención, luego remover
    _cancelDismissTimer = Timer(displayDuration, () async {
      stopService();
      if (Platform.isIOS && _liveActivityId != null) {
        try {
          await _liveActivitiesPlugin.endActivity(_liveActivityId!);
          _liveActivityId = null;
        } catch (_) {}
      }
    });
  }

  // --- Passenger Specific Methods ---

  static Future<void> startPassengerTrip(
    String title,
    String body, {
    String? driverName,
    String? vehicleInfo,
    String? plateNumber,
    String? pinCode,
    String? destination,
    String? fare,
  }) async {
    await startService();
    updateNotification(
      title,
      body,
      driverName: driverName,
      vehicleInfo: vehicleInfo,
      plateNumber: plateNumber,
      pinCode: pinCode,
      destination: destination,
      fare: fare,
    );

    if (Platform.isIOS) {
      try {
        await _liveActivitiesPlugin.init(
          appGroupId: 'group.com.taxiseguro.app',
        );
        final data = <String, dynamic>{
          'title': title,
          'status': body,
          if (driverName != null) 'driverName': driverName,
          if (vehicleInfo != null) 'vehicleInfo': vehicleInfo,
          if (plateNumber != null) 'plateNumber': plateNumber,
          if (pinCode != null) 'pinCode': pinCode,
          if (destination != null) 'destination': destination,
          if (fare != null) 'fare': fare,
        };
        _liveActivityId = await _liveActivitiesPlugin.createActivity(
          'taxiseguro_trip',
          data,
          iOSEnableRemoteUpdates: true,
        );
      } catch (e) {
        print('Error starting Live Activity: $e');
      }
    }
  }

  static Future<void> updateTripStatus(
    String title,
    String body, {
    String? driverName,
    String? vehicleInfo,
    String? plateNumber,
    String? pinCode,
    String? destination,
    String? fare,
  }) async {
    updateNotification(
      title,
      body,
      driverName: driverName,
      vehicleInfo: vehicleInfo,
      plateNumber: plateNumber,
      pinCode: pinCode,
      destination: destination,
      fare: fare,
    );
    
    if (Platform.isIOS) {
      try {
        final data = <String, dynamic>{
          'title': title,
          'status': body,
          if (driverName != null) 'driverName': driverName,
          if (vehicleInfo != null) 'vehicleInfo': vehicleInfo,
          if (plateNumber != null) 'plateNumber': plateNumber,
          if (pinCode != null) 'pinCode': pinCode,
          if (destination != null) 'destination': destination,
          if (fare != null) 'fare': fare,
        };
        if (_liveActivityId != null) {
          await _liveActivitiesPlugin.updateActivity(_liveActivityId!, data);
        } else {
          await _liveActivitiesPlugin.init(appGroupId: 'group.com.taxiseguro.app');
          _liveActivityId = await _liveActivitiesPlugin.createActivity(
            'taxiseguro_trip',
            data,
            iOSEnableRemoteUpdates: true,
          );
        }
      } catch (e) {
        print('Error updating Live Activity: $e');
      }
    }
  }

  static Future<void> stopPassengerTrip() async {
    stopService();
    
    if (Platform.isIOS && _liveActivityId != null) {
      try {
        await _liveActivitiesPlugin.endActivity(_liveActivityId!);
        _liveActivityId = null;
      } catch (e) {
        print('Error ending Live Activity: $e');
      }
    }
  }

  // --- Driver Specific Methods ---

  static Future<void> startDriverTrip(
    String title,
    String body, {
    String? passengerName,
    String? origin,
    String? destination,
    String? fare,
    String? pinCode,
  }) async {
    await startService();
    updateNotification(
      title,
      body,
      driverName: passengerName,
      vehicleInfo: origin,
      destination: destination,
      fare: fare,
      pinCode: pinCode,
    );

    if (Platform.isIOS) {
      try {
        await _liveActivitiesPlugin.init(
          appGroupId: 'group.com.taxiseguro.app', 
        );
        final data = <String, dynamic>{
          'title': title,
          'status': body,
          if (passengerName != null) 'driverName': passengerName,
          if (origin != null) 'vehicleInfo': origin,
          if (destination != null) 'destination': destination,
          if (fare != null) 'fare': fare,
          if (pinCode != null) 'pinCode': pinCode,
        };
        _liveActivityId = await _liveActivitiesPlugin.createActivity(
          'taxiseguro_trip',
          data,
          iOSEnableRemoteUpdates: true,
        );
      } catch (e) {
        print('Error starting Driver Live Activity: $e');
      }
    }
  }

  static Future<void> updateDriverTripStatus(
    String title,
    String body, {
    String? passengerName,
    String? origin,
    String? destination,
    String? fare,
    String? pinCode,
  }) async {
    updateNotification(
      title,
      body,
      driverName: passengerName,
      vehicleInfo: origin,
      destination: destination,
      fare: fare,
      pinCode: pinCode,
    );
    
    if (Platform.isIOS) {
      try {
        final data = <String, dynamic>{
          'title': title,
          'status': body,
          if (passengerName != null) 'driverName': passengerName,
          if (origin != null) 'vehicleInfo': origin,
          if (destination != null) 'destination': destination,
          if (fare != null) 'fare': fare,
          if (pinCode != null) 'pinCode': pinCode,
        };
        if (_liveActivityId != null) {
          await _liveActivitiesPlugin.updateActivity(_liveActivityId!, data);
        } else {
          await _liveActivitiesPlugin.init(appGroupId: 'group.com.taxiseguro.app');
          _liveActivityId = await _liveActivitiesPlugin.createActivity(
            'taxiseguro_trip',
            data,
            iOSEnableRemoteUpdates: true,
          );
        }
      } catch (e) {
        print('Error updating Driver Live Activity: $e');
      }
    }
  }

  static Future<void> stopDriverTrip() async {
    stopService();
    
    if (Platform.isIOS && _liveActivityId != null) {
      try {
        await _liveActivitiesPlugin.endActivity(_liveActivityId!);
        _liveActivityId = null;
      } catch (e) {
        print('Error ending Driver Live Activity: $e');
      }
    }
  }

  /// Obtiene el push token de APNs para la actividad activa (para actualización remota desde backend)
  static Future<String?> getLiveActivityPushToken() async {
    if (!Platform.isIOS || _liveActivityId == null) return null;
    try {
      return await _liveActivitiesPlugin.getPushToken(_liveActivityId!);
    } catch (e) {
      print('Error obteniendo pushToken de Live Activity: $e');
      return null;
    }
  }

  /// Stream para escuchar cambios del push token generado por Apple APNs
  static Stream<ActivityUpdate>? get activityUpdateStream {
    if (!Platform.isIOS) return null;
    return _liveActivitiesPlugin.activityUpdateStream;
  }

  // --- High Priority One-off Alert for Android & iOS ---
  static Future<void> showAlertNotification(String title, String body, {int? id}) async {
    if (!Platform.isAndroid && !Platform.isIOS) return;
    
    await requestNotificationPermission();

    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    await flutterLocalNotificationsPlugin.show(
      id: id ?? DateTime.now().millisecondsSinceEpoch.remainder(100000),
      title: title,
      body: body,
      notificationDetails: const NotificationDetails(
        android: AndroidNotificationDetails(
          'taxiseguro_foreground',
          'Alertas de Viaje TaxiSeguro',
          icon: '@mipmap/launcher_icon',
          importance: Importance.max,
          priority: Priority.max,
          fullScreenIntent: true,
          showWhen: true,
          playSound: true,
          enableVibration: true,
        ),
        iOS: DarwinNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
        ),
      ),
    );
  }
}
