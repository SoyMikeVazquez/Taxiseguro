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
