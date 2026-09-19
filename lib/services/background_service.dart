import 'dart:async';
import 'dart:io';
import 'dart:ui';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:live_activities/live_activities.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> initializeBackgroundService() async {
  final service = FlutterBackgroundService();

  const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'taxiseguro_foreground', // id
    'Alertas de Viaje TaxiSeguro', // title
    description: 'Notificaciones y estado de tus viajes en segundo plano.', // description
    importance: Importance.high,
    playSound: true,
    enableVibration: true,
  );

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  if (Platform.isIOS || Platform.isAndroid) {
    await flutterLocalNotificationsPlugin.initialize(
      settings: const InitializationSettings(
        iOS: DarwinInitializationSettings(),
        android: AndroidInitializationSettings('launcher_icon'),
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

      // Update Foreground Service info on Android
      if (Platform.isAndroid && service is AndroidServiceInstance) {
        service.setForegroundNotificationInfo(
          title: title,
          content: body,
        );
      }

      // Display alert notification
      flutterLocalNotificationsPlugin.show(
        id: 888,
        title: title,
        body: body,
        notificationDetails: const NotificationDetails(
          android: AndroidNotificationDetails(
            'taxiseguro_foreground',
            'Alertas de Viaje TaxiSeguro',
            icon: 'launcher_icon',
            ongoing: true,
            importance: Importance.high,
            priority: Priority.high,
            showWhen: true,
            playSound: true,
            enableVibration: true,
          ),
          iOS: DarwinNotificationDetails(),
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

  static Future<void> startService() async {
    if (!Platform.isAndroid && !Platform.isIOS) return;
    
    if (Platform.isAndroid) {
      final status = await Permission.notification.status;
      if (!status.isGranted) {
        await Permission.notification.request();
      }
    }

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

  static void updateNotification(String title, String body) {
    if (!Platform.isAndroid && !Platform.isIOS) return;
    
    final service = FlutterBackgroundService();
    service.invoke(
      'update_notification',
      {
        'title': title,
        'body': body,
      },
    );
  }

  // --- Passenger Specific Methods ---

  static Future<void> startPassengerTrip(String title, String body) async {
    await startService();
    updateNotification(title, body);

    if (Platform.isIOS) {
      try {
        await _liveActivitiesPlugin.init(
          appGroupId: 'group.com.taxiseguro.app', // You may need an App Group if dealing with widgets
        );
        _liveActivityId = await _liveActivitiesPlugin.createActivity(
          'taxiseguro_trip',
          {
            'title': title,
            'status': body,
          },
        );
      } catch (e) {
        print('Error starting Live Activity: $e');
      }
    }
  }

  static Future<void> updateTripStatus(String title, String body) async {
    updateNotification(title, body);
    
    if (Platform.isIOS && _liveActivityId != null) {
      try {
        await _liveActivitiesPlugin.updateActivity(_liveActivityId!, {
          'title': title,
          'status': body,
        });
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

  static Future<void> startDriverTrip(String title, String body) async {
    await startService();
    updateNotification(title, body);

    if (Platform.isIOS) {
      try {
        await _liveActivitiesPlugin.init(
          appGroupId: 'group.com.taxiseguro.app', 
        );
        _liveActivityId = await _liveActivitiesPlugin.createActivity(
          'taxiseguro_trip',
          {
            'title': title,
            'status': body,
          },
        );
      } catch (e) {
        print('Error starting Driver Live Activity: $e');
      }
    }
  }

  static Future<void> updateDriverTripStatus(String title, String body) async {
    updateNotification(title, body);
    
    if (Platform.isIOS && _liveActivityId != null) {
      try {
        await _liveActivitiesPlugin.updateActivity(_liveActivityId!, {
          'title': title,
          'status': body,
        });
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

  // --- High Priority One-off Alert for Android & iOS ---
  static Future<void> showAlertNotification(String title, String body) async {
    if (!Platform.isAndroid && !Platform.isIOS) return;
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    await flutterLocalNotificationsPlugin.show(
      id: 889,
      title: title,
      body: body,
      notificationDetails: const NotificationDetails(
        android: AndroidNotificationDetails(
          'taxiseguro_foreground',
          'Alertas de Viaje TaxiSeguro',
          icon: 'launcher_icon',
          importance: Importance.max,
          priority: Priority.max,
          playSound: true,
          enableVibration: true,
        ),
        iOS: DarwinNotificationDetails(),
      ),
    );
  }
}
