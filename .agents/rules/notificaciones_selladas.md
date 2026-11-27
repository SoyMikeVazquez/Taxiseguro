---
trigger: always_on
description: Blindaje absoluto del sistema de notificaciones (OneSignal, Live Activities, Dynamic Island, Background Service, WhatsApp y Brevo) y pantallas de TaxiSeguro.
---

# Directriz de Blindaje: Sistema de Notificaciones Sellado

La configuracion completa de notificaciones de TaxiSeguro esta **excelente, validada en produccion y 100% sellada**.

## Reglas Estrictas para el Agente

1. **PROHIBIDO MODIFICAR NOTIFICACIONES:** No alteres, refactorices ni modifiques bajo ninguna circunstancia la logica, payloads, canales, permisos ni ciclo de vida de notificaciones en:
   - `lib/services/onesignal_service.dart` (Push remotas fuera de la app y en pantalla de bloqueo para conductores cercanos y cambios de estado del pasajero).
   - `lib/services/background_service.dart` (Live Activities en Dynamic Island / Lock Screen de iOS, notificacion persistente `id: 888` en Android y su cierre inmediato con `endAllLiveActivities()` / `endAllActivities()` al finalizar o cancelar el viaje).
   - `ios/TaxiSeguroWidget/TaxiSeguroWidgetLiveActivity.swift` (Diseño y configuracion nativa de Live Activity y Dynamic Island en iOS).
   - `lib/services/trip_service.dart` (Metodos `_dispatchPushForNewTrip`, `findNearbyActiveDrivers`, `notifyTripStatusChange`).
   - `lib/services/whatsapp_notifications.dart` y `lib/services/brevo_service.dart`.
   - El registro de OneSignal y ciclo de vida de `BackgroundServiceHelper` en `lib/screens/taxiseguro_home_screen.dart`, `lib/screens/splash_router_screen.dart`, `lib/screens/driver_map_screen.dart` y `lib/screens/active_trip_screen.dart`.

2. **PANTALLAS SELLADAS:** No modifiques ninguna pantalla existente a menos que el usuario lo pida de forma explicita para una tarea puntual, y aun entonces manten intacto todo el flujo de notificaciones.
