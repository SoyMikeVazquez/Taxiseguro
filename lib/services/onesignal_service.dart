import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:onesignal_flutter/onesignal_flutter.dart';
import '../env/env.dart';

class OneSignalService {
  static const String appId = 'e31e6d9c-3560-4565-ae62-3dfec8feea87';

  static final OneSignalService _instance = OneSignalService._internal();
  factory OneSignalService() => _instance;
  OneSignalService._internal();

  bool _isInitialized = false;

  void initialize([String? customAppId]) {
    if (_isInitialized) return;

    final targetAppId = customAppId ?? appId;

    if (kDebugMode) {
      OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
    }

    OneSignal.initialize(targetAppId);
    _isInitialized = true;
    debugPrint('OneSignal inicializado con App ID: $targetAppId');

    // Solicitar permiso de notificaciones push y activar suscripcion para segundo plano / pantalla de bloqueo
    OneSignal.Notifications.requestPermission(true).then((accepted) {
      debugPrint('OneSignal permiso de notificaciones: $accepted');
      OneSignal.User.pushSubscription.optIn();
    });

    // Manejar clics en notificaciones
    OneSignal.Notifications.addClickListener((event) {
      debugPrint('OneSignal: Notificacion clickeada: ${event.notification.title}');
    });

    // Permitir que la notificacion se muestre visualmente en pantalla incluso con la app abierta
    OneSignal.Notifications.addForegroundWillDisplayListener((event) {
      debugPrint('OneSignal: Notificacion recibida en primer plano: ${event.notification.title}');
      event.notification.display();
    });
  }

  void login(String externalId) {
    if (externalId.isEmpty) return;
    OneSignal.login(externalId);
    OneSignal.User.pushSubscription.optIn();
    debugPrint('OneSignal login para usuario: $externalId');
  }

  void logout() {
    OneSignal.logout();
    debugPrint('OneSignal logout');
  }

  void setEmail(String email) {
    OneSignal.User.addEmail(email);
  }

  void setSmsNumber(String number) {
    OneSignal.User.addSms(number);
  }

  void setTag(String key, String value) {
    OneSignal.User.addTagWithKey(key, value);
  }

  Future<bool> requestPermission() async {
    final granted = await OneSignal.Notifications.requestPermission(true);
    OneSignal.User.pushSubscription.optIn();
    return granted;
  }

  void setLogLevel(OSLogLevel level) {
    OneSignal.Debug.setLogLevel(level);
  }

  void setNotificationClickListener(void Function(OSNotificationClickEvent) handler) {
    OneSignal.Notifications.addClickListener(handler);
  }

  void setNotificationForegroundListener(void Function(OSNotificationWillDisplayEvent) handler) {
    OneSignal.Notifications.addForegroundWillDisplayListener(handler);
  }

  /// Envia una notificacion push a traves de la API REST de OneSignal
  Future<Map<String, dynamic>> sendPushNotification({
    required String title,
    required String body,
    String? targetRole, // 'conductor', 'pasajero', 'admin' o null (todos)
    List<String>? targetUserIds,
    Map<String, dynamic>? additionalData,
    String? customApiKey,
  }) async {
    final apiKey = (customApiKey != null && customApiKey.trim().isNotEmpty)
        ? customApiKey.trim()
        : Env.oneSignalRestApiKey;

    if (apiKey.isEmpty) {
      return {
        'success': false,
        'message': 'No se ha configurado la OneSignal REST API Key.',
      };
    }

    try {
      final url = Uri.parse('https://onesignal.com/api/v1/notifications');
      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Key $apiKey',
      };

      final Map<String, dynamic> payload = {
        'app_id': appId,
        'headings': {'es': title, 'en': title},
        'contents': {'es': body, 'en': body},
        'priority': 10,
        'android_visibility': 1,
        'ios_sound': 'default',
        'ttl': 300,
      };

      if (additionalData != null && additionalData.isNotEmpty) {
        payload['data'] = additionalData;
      }

      if (targetUserIds != null && targetUserIds.isNotEmpty) {
        payload['include_aliases'] = {
          'external_id': targetUserIds,
        };
        payload['include_external_user_ids'] = targetUserIds;
        payload['target_channel'] = 'push';
      } else if (targetRole != null && targetRole.isNotEmpty && targetRole != 'todos') {
        payload['filters'] = [
          {'field': 'tag', 'key': 'role', 'relation': '=', 'value': targetRole},
        ];
      } else {
        payload['included_segments'] = ['Total Subscriptions'];
      }

      final response = await http.post(url, headers: headers, body: jsonEncode(payload));
      final responseData = jsonDecode(response.body);
      final notifId = responseData['id']?.toString() ?? '';

      if (response.statusCode == 200 && notifId.isNotEmpty) {
        final recipients = responseData['recipients'];
        final message = (recipients != null && recipients > 0)
            ? 'Notificacion enviada exitosamente a $recipients dispositivo(s).'
            : 'Notificacion enviada exitosamente.';
        debugPrint('OneSignalService: Push enviado con exito (id: $notifId)');
        return {
          'success': true,
          'recipients': recipients ?? 1,
          'message': message,
          'id': notifId,
        };
      } else {
        final errors = responseData['errors']?.toString() ?? response.body;
        debugPrint('OneSignalService: Error de OneSignal: $errors');
        return {
          'success': false,
          'message': 'Error de OneSignal: $errors',
        };
      }
    } catch (e) {
      return {
        'success': false,
        'message': 'Excepcion al conectar con OneSignal: $e',
      };
    }
  }

  /// Notifica a los conductores sobre un nuevo viaje disponible (opcionalmente filtrado por radio)
  Future<void> notifyNewTripForDrivers({
    required String tripId,
    required String originAddress,
    double? fare,
    List<String>? targetDriverUserIds,
  }) async {
    final fareText = fare != null ? '\$${fare.toStringAsFixed(2)} MXN • ' : '';
    final hasSpecificDrivers = targetDriverUserIds != null && targetDriverUserIds.isNotEmpty;

    final res = await sendPushNotification(
      title: 'Nuevo Viaje Solicitado',
      body: '$fareText$originAddress. Toca para ver y aceptar.',
      targetRole: hasSpecificDrivers ? null : 'conductor',
      targetUserIds: hasSpecificDrivers ? targetDriverUserIds : null,
      additionalData: {
        'type': 'new_trip',
        'trip_id': tripId,
      },
    );

    // Si los IDs especificos de 5 km aun no tenian suscripcion OneSignal activa (recipients == 0), enviar por etiqueta role=conductor como respaldo
    final int recipients = (res['recipients'] as int?) ?? 0;
    if (hasSpecificDrivers && (res['success'] != true || recipients == 0)) {
      await sendPushNotification(
        title: 'Nuevo Viaje Solicitado',
        body: '$fareText$originAddress. Toca para ver y aceptar.',
        targetRole: 'conductor',
        additionalData: {
          'type': 'new_trip',
          'trip_id': tripId,
        },
      );
    }
  }

  /// Notifica a un usuario especifico sobre el cambio de estado de su viaje
  Future<void> notifyTripStatusChangeForUser({
    required String targetUserId,
    required String title,
    required String body,
    required String tripId,
    required String status,
  }) async {
    await sendPushNotification(
      title: title,
      body: body,
      targetUserIds: [targetUserId],
      additionalData: {
        'type': 'trip_status_change',
        'trip_id': tripId,
        'status': status,
      },
    );
  }
}

void setupPushSubscriptionObserver(BuildContext context) {
  OneSignal.User.pushSubscription.addObserver((state) {
    debugPrint('OneSignal pushSubscription id: ${state.current.id}, optedIn: ${state.current.optedIn}');
  });
}
