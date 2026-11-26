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

## Regla de Estabilidad y Congelamiento para el Agente (Screens y Notificaciones)

- **Pantallas Validadas (`lib/screens/`):** Todas las pantallas de Pasajero, Conductor y Super Administrador se encuentran validadas y funcionando correctamente en producción. **NO modificar diseño, estructura ni flujos de ninguna pantalla** a menos que el usuario lo solicite de manera explícita.
- **Sistema de Notificaciones Protegido:** El flujo completo de notificaciones (Push en segundo plano y pantalla de bloqueo con **OneSignal** en [lib/services/onesignal_service.dart](file:///Users/black/Documents/Apps/TAXISEGURO/Taxiseguro/lib/services/onesignal_service.dart), alertas por **WhatsApp** en [lib/services/whatsapp_notifications.dart](file:///Users/black/Documents/Apps/TAXISEGURO/Taxiseguro/lib/services/whatsapp_notifications.dart), correos por **Brevo/Resend** en [lib/services/brevo_service.dart](file:///Users/black/Documents/Apps/TAXISEGURO/Taxiseguro/lib/services/brevo_service.dart), servicio en segundo plano / Live Activities en [lib/services/background_service.dart](file:///Users/black/Documents/Apps/TAXISEGURO/Taxiseguro/lib/services/background_service.dart), despacho de viajes cercanos en [lib/services/trip_service.dart](file:///Users/black/Documents/Apps/TAXISEGURO/Taxiseguro/lib/services/trip_service.dart) y [supabase_conductores_ubicacion.sql](file:///Users/black/Documents/Apps/TAXISEGURO/Taxiseguro/supabase_conductores_ubicacion.sql)) está **verificado y operando correctamente en iOS y Android**.
- **Restricción Estricta de Cambios:** No alterar ni mover ningún archivo o configuración ajena a lo puntualmente solicitado; especialmente mantener intacta toda la arquitectura de notificaciones y pantallas existentes.
