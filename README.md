# taxiseguro_app

Plataforma móvil TaxiSeguro (Pasajero, Conductor y Super Administrador).

## Regla Financiera General del Agente y Plataforma (Pasarelas de Pago)

- **Exclusión de Pasarelas de Pago como Ingreso:** Los cargos y montos extras retenidos por la pasarela de pago (**Mercado Pago**: `3.49% + $4.00 MXN + 16% IVA`) aplicables exclusivamente a pagos con tarjeta de débito o crédito **NO se contemplan como ingresos** de TaxiSeguro ni del conductor.
- **Mención Informativa de Gasto en Pasarela:** En todos los tableros financieros (Dashboard General de Super Administrador, Finanzas Globales, Detalle por Conductor y Fechas de Corte de 2 Días), las comisiones de Mercado Pago se muestran separadas en su propia división únicamente como mención de cuánto se está destinando al procesamiento bancario digital.
- **Cálculo de Reparto 80/20 sobre Ingreso Real:**
  - **Pagos en Efectivo:** `0.00 MXN` de cargo de pasarela; el `100%` de la tarifa es Ingreso Real.
  - **Pagos con Tarjeta:** `Ingreso Real = Cobro Bruto Tarjeta - Cargo Pasarela Mercado Pago`.
  - **Comisión Administradores (20%):** `20%` calculado estrictamente sobre el **Ingreso Real Neto**.
  - **Ganancia Conductores (80%):** `80%` calculado estrictamente sobre el **Ingreso Real Neto**.

## Regla de Estabilidad y Blindaje Total para el Agente (Screens y Notificaciones)

- **Pantallas Validadas (`lib/screens/`):** Todas las pantallas de Pasajero, Conductor y Super Administrador se encuentran validadas y funcionando correctamente en producción. **NO modificar diseño, estructura ni flujos de ninguna pantalla** a menos que el usuario lo solicite de manera explícita.
- **Configuración de Notificaciones Excelente y Sellada (PROHIBIDO MODIFICAR):**
  - Toda la arquitectura y configuración de notificaciones está **100% verificada, aprobada y sellada en producción para iOS y Android**:
    1. **Push Remotas (Fuera de la App y Pantalla de Bloqueo) — [lib/services/onesignal_service.dart](file:///Users/black/Documents/Apps/TAXISEGURO/Taxiseguro/lib/services/onesignal_service.dart) y [lib/services/trip_service.dart](file:///Users/black/Documents/Apps/TAXISEGURO/Taxiseguro/lib/services/trip_service.dart):** Despacho a conductores cercanos (`notifyNewTripForDrivers`, `_dispatchPushForNewTrip`) y alertas de estado al pasajero (`accepted`, `arrived`, `in_progress`, `completed`, `cancelled` mediante `notifyTripStatusChangeForUser` con registro de `OneSignalService().login(user.id)` en [lib/screens/taxiseguro_home_screen.dart](file:///Users/black/Documents/Apps/TAXISEGURO/Taxiseguro/lib/screens/taxiseguro_home_screen.dart) y [lib/screens/splash_router_screen.dart](file:///Users/black/Documents/Apps/TAXISEGURO/Taxiseguro/lib/screens/splash_router_screen.dart)).
    2. **Live Activities (Dynamic Island / Pantalla de Bloqueo en iOS) y Notificación Persistente en Curso (Android) — [lib/services/background_service.dart](file:///Users/black/Documents/Apps/TAXISEGURO/Taxiseguro/lib/services/background_service.dart) y [ios/TaxiSeguroWidget/TaxiSeguroWidgetLiveActivity.swift](file:///Users/black/Documents/Apps/TAXISEGURO/Taxiseguro/ios/TaxiSeguroWidget/TaxiSeguroWidgetLiveActivity.swift):** Seguimiento en vivo durante el viaje y cierre inmediato garantizado (`endAllLiveActivities()` / `endAllActivities()` y cancelación de notificación `id: 888`) al finalizar el viaje (`_completeTripFinal` en [lib/screens/active_trip_screen.dart](file:///Users/black/Documents/Apps/TAXISEGURO/Taxiseguro/lib/screens/active_trip_screen.dart), estado `completed` en [lib/screens/taxiseguro_home_screen.dart](file:///Users/black/Documents/Apps/TAXISEGURO/Taxiseguro/lib/screens/taxiseguro_home_screen.dart), o ausencia de viaje activo en [lib/screens/driver_map_screen.dart](file:///Users/black/Documents/Apps/TAXISEGURO/Taxiseguro/lib/screens/driver_map_screen.dart)).
    3. **Alertas por WhatsApp Cloud API y Correos Transaccionales — [lib/services/whatsapp_notifications.dart](file:///Users/black/Documents/Apps/TAXISEGURO/Taxiseguro/lib/services/whatsapp_notifications.dart) y [lib/services/brevo_service.dart](file:///Users/black/Documents/Apps/TAXISEGURO/Taxiseguro/lib/services/brevo_service.dart).**
- **Restricción Estricta para Futuros Agentes:** Queda estrictamente prohibido alterar, refactorizar o mover cualquier archivo, método, payload o configuración del sistema de notificaciones.
