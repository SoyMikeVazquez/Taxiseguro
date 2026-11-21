import 'dart:async';
import 'package:flutter/material.dart';
import '../../services/background_service.dart';

enum SimulationRole { passenger, driver }

class AdminLiveActivitySimulationScreen extends StatefulWidget {
  const AdminLiveActivitySimulationScreen({super.key});

  @override
  State<AdminLiveActivitySimulationScreen> createState() =>
      _AdminLiveActivitySimulationScreenState();
}

class _AdminLiveActivitySimulationScreenState
    extends State<AdminLiveActivitySimulationScreen> {
  SimulationRole _role = SimulationRole.passenger;
  int _currentPhase = 0; // 0: inactivo, 1: asignado, 2: en el punto, 3: en curso, 4: finalizado
  int _phaseSecondsLeft = 10;
  bool _isRunning = false;
  Timer? _timer;

  // Datos simulados
  final String _driverName = 'Carlos Mendoza';
  final String _vehicleInfo = 'Toyota Prius Blanco';
  final String _plateNumber = 'NXX-4821';
  final String _passengerName = 'Andrea Gomez';
  final String _destination = 'Plaza Fiesta San Agustin';
  final String _origin = 'Col. Del Valle';
  final String _fare = '\$85.00 MXN';
  final String _pinCode = '49201';

  @override
  void dispose() {
    _timer?.cancel();
    _stopLiveActivity();
    super.dispose();
  }

  void _startSimulation() {
    _timer?.cancel();
    setState(() {
      _isRunning = true;
      _currentPhase = 1;
      _phaseSecondsLeft = 10;
    });

    _applyPhase(1);

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }

      setState(() {
        _phaseSecondsLeft--;
        if (_phaseSecondsLeft <= 0) {
          if (_currentPhase < 4) {
            _currentPhase++;
            _phaseSecondsLeft = 10;
            _applyPhase(_currentPhase);
          } else {
            // Fin de la simulacion
            timer.cancel();
            _isRunning = false;
            _currentPhase = 0;
            _phaseSecondsLeft = 10;
            _stopLiveActivity();
            _showNotification('Simulacion completada exitosamente.');
          }
        }
      });
    });
  }

  Future<void> _applyPhase(int phase) async {
    try {
      if (_role == SimulationRole.passenger) {
        switch (phase) {
          case 1:
            await BackgroundServiceHelper.startPassengerTrip(
              'TaxiSeguro',
              'Conductor en camino (ETA: 4 min)',
              driverName: _driverName,
              vehicleInfo: _vehicleInfo,
              plateNumber: _plateNumber,
              pinCode: _pinCode,
              destination: _destination,
              fare: _fare,
            );
            _showNotification('Fase 1/4: Conductor en camino. Bloquea tu pantalla.');
            break;

          case 2:
            await BackgroundServiceHelper.updateTripStatus(
              'TaxiSeguro',
              'Tu conductor ha llegado al punto',
              driverName: _driverName,
              vehicleInfo: _vehicleInfo,
              plateNumber: _plateNumber,
              pinCode: _pinCode,
              destination: _destination,
              fare: _fare,
            );
            _showNotification('Fase 2/4: Conductor en el punto de encuentro.');
            break;

          case 3:
            await BackgroundServiceHelper.updateTripStatus(
              'TaxiSeguro',
              'Viaje en curso hacia el destino',
              driverName: _driverName,
              vehicleInfo: _vehicleInfo,
              plateNumber: _plateNumber,
              pinCode: _pinCode,
              destination: _destination,
              fare: _fare,
            );
            _showNotification('Fase 3/4: Viaje en curso.');
            break;

          case 4:
            await BackgroundServiceHelper.updateTripStatus(
              'TaxiSeguro',
              'Has llegado a tu destino',
              driverName: _driverName,
              vehicleInfo: _vehicleInfo,
              plateNumber: _plateNumber,
              pinCode: _pinCode,
              destination: _destination,
              fare: _fare,
            );
            _showNotification('Fase 4/4: Viaje finalizado.');
            break;
        }
      } else {
        // Modo Conductor
        switch (phase) {
          case 1:
            await BackgroundServiceHelper.startDriverTrip(
              'TaxiSeguro Conductor',
              'En camino por $_passengerName',
              passengerName: _passengerName,
              origin: _origin,
              destination: _destination,
              fare: _fare,
              pinCode: _pinCode,
            );
            _showNotification('Fase 1/4: En camino por el pasajero.');
            break;

          case 2:
            await BackgroundServiceHelper.updateDriverTripStatus(
              'Has llegado',
              'Esperando a $_passengerName',
              passengerName: _passengerName,
              origin: _origin,
              destination: _destination,
              fare: _fare,
              pinCode: _pinCode,
            );
            _showNotification('Fase 2/4: Llegaste al punto de recogida.');
            break;

          case 3:
            await BackgroundServiceHelper.updateDriverTripStatus(
              'Viaje en curso',
              'Ruta a: $_destination',
              passengerName: _passengerName,
              origin: _origin,
              destination: _destination,
              fare: _fare,
              pinCode: _pinCode,
            );
            _showNotification('Fase 3/4: Traslado al destino en curso.');
            break;

          case 4:
            await BackgroundServiceHelper.updateDriverTripStatus(
              'Viaje completado',
              'Servicio finalizado con exito',
              passengerName: _passengerName,
              origin: _origin,
              destination: _destination,
              fare: _fare,
              pinCode: _pinCode,
            );
            _showNotification('Fase 4/4: Servicio concluido.');
            break;
        }
      }
    } catch (e) {
      _showNotification('Error al actualizar fase: $e', isError: true);
    }
  }

  void _stopSimulation() {
    _timer?.cancel();
    setState(() {
      _isRunning = false;
      _currentPhase = 0;
      _phaseSecondsLeft = 10;
    });
    _stopLiveActivity();
    _showNotification('Simulacion detenida y Live Activity cerrada.');
  }

  void _stopLiveActivity() {
    if (_role == SimulationRole.passenger) {
      BackgroundServiceHelper.stopPassengerTrip();
    } else {
      BackgroundServiceHelper.stopDriverTrip();
    }
  }

  void _simulateCancellation() {
    _timer?.cancel();
    setState(() {
      _isRunning = false;
      _currentPhase = 0;
      _phaseSecondsLeft = 10;
    });
    BackgroundServiceHelper.notifyTripCancelled(
      reason: 'El pasajero cancelo la solicitud de taxi.',
      displayDuration: const Duration(seconds: 7),
    );
    _showNotification('Alerta roja de cancelacion enviada a la Live Notification (duracion: 7s).');
  }

  void _showNotification(String message, {bool isError = false}) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: isError ? Colors.redAccent : const Color(0xFFC7FF2E),
        duration: const Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const lime = Color(0xFFC7FF2E);

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Simulador de Live Activity',
          style: TextStyle(
            fontFamily: 'Google Sans',
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
          children: [
            // Badge superior informativa
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: lime.withValues(alpha: 0.2),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.shield, color: lime, size: 22),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'MODO SUPER ADMIN',
                          style: TextStyle(
                            color: lime,
                            fontWeight: FontWeight.w900,
                            fontSize: 11,
                            letterSpacing: 0.5,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'Prueba la pantalla de bloqueo e Isla Dinamica. Las 4 fases avanzan solas cada 10 segundos sin tocar la base de datos.',
                          style: TextStyle(color: Colors.white70, fontSize: 12, height: 1.3),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Selector de Rol (Pasajero / Conductor)
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: const Color(0xFFEBEBEB),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: _isRunning
                          ? null
                          : () => setState(() => _role = SimulationRole.passenger),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: _role == SimulationRole.passenger ? Colors.white : Colors.transparent,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: _role == SimulationRole.passenger
                              ? [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.05),
                                    blurRadius: 6,
                                    offset: const Offset(0, 2),
                                  ),
                                ]
                              : null,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'Vista Pasajero',
                          style: TextStyle(
                            fontFamily: 'Google Sans',
                            color: _role == SimulationRole.passenger ? Colors.black : Colors.black54,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: _isRunning
                          ? null
                          : () => setState(() => _role = SimulationRole.driver),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: _role == SimulationRole.driver ? Colors.white : Colors.transparent,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: _role == SimulationRole.driver
                              ? [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.05),
                                    blurRadius: 6,
                                    offset: const Offset(0, 2),
                                  ),
                                ]
                              : null,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'Vista Conductor',
                          style: TextStyle(
                            fontFamily: 'Google Sans',
                            color: _role == SimulationRole.driver ? Colors.black : Colors.black54,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Tarjeta de Estado y Cuenta Regresiva
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.04),
                    blurRadius: 14,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Estado del simulador:',
                            style: TextStyle(fontFamily: 'Inter', color: Colors.black54, fontSize: 12),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            _isRunning
                                ? 'Fase $_currentPhase de 4 en ejecucion'
                                : 'Simulador detenido',
                            style: TextStyle(
                              fontFamily: 'Google Sans',
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: _isRunning ? Colors.black : Colors.black45,
                            ),
                          ),
                        ],
                      ),
                      if (_isRunning)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                          decoration: BoxDecoration(
                            color: lime,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            '${_phaseSecondsLeft}s restantes',
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Barra de progreso de la fase actual
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: LinearProgressIndicator(
                      value: _isRunning ? (10 - _phaseSecondsLeft) / 10.0 : 0.0,
                      backgroundColor: const Color(0xFFEEEEEE),
                      valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFC7FF2E)),
                      minHeight: 8,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Stepper de las 4 Fases (cada una de 10s)
            const Text(
              'Ciclo del viaje (10 segundos por fase):',
              style: TextStyle(
                fontFamily: 'Google Sans',
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 12),

            _buildPhaseItem(
              phaseNumber: 1,
              title: _role == SimulationRole.passenger
                  ? 'Fase 1: Conductor en camino'
                  : 'Fase 1: En camino por el pasajero',
              description: _role == SimulationRole.passenger
                  ? 'Conductor: $_driverName ($_vehicleInfo, $_plateNumber). PIN Seguro: $_pinCode'
                  : 'Pasajero: $_passengerName. Origen: $_origin',
              isActive: _currentPhase == 1,
              isCompleted: _currentPhase > 1,
            ),
            _buildPhaseItem(
              phaseNumber: 2,
              title: _role == SimulationRole.passenger
                  ? 'Fase 2: Conductor ha llegado'
                  : 'Fase 2: Has llegado al punto de recogida',
              description: _role == SimulationRole.passenger
                  ? 'Esperando en el punto de abordaje con PIN $_pinCode visible'
                  : 'Esperando a que suba el pasajero $_passengerName',
              isActive: _currentPhase == 2,
              isCompleted: _currentPhase > 2,
            ),
            _buildPhaseItem(
              phaseNumber: 3,
              title: 'Fase 3: Viaje en curso',
              description: 'Destino: $_destination | Tarifa: $_fare',
              isActive: _currentPhase == 3,
              isCompleted: _currentPhase > 3,
            ),
            _buildPhaseItem(
              phaseNumber: 4,
              title: 'Fase 4: Viaje finalizado',
              description: 'Llegada al destino. Al terminar los 10s, la Live Activity se retira sola.',
              isActive: _currentPhase == 4,
              isCompleted: false,
            ),

            const SizedBox(height: 28),

            // Boton Principal
            SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton(
                onPressed: _isRunning ? _stopSimulation : _startSimulation,
                style: ElevatedButton.styleFrom(
                  backgroundColor: _isRunning ? Colors.redAccent : Colors.black,
                  foregroundColor: _isRunning ? Colors.white : lime,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  elevation: 0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(_isRunning ? Icons.stop_rounded : Icons.play_arrow_rounded, size: 24),
                    const SizedBox(width: 10),
                    Text(
                      _isRunning
                          ? 'Detener Simulacion'
                          : 'Iniciar Simulacion (Cambio cada 10s)',
                      style: const TextStyle(
                        fontFamily: 'Google Sans',
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Boton para probar la alerta roja de cancelacion
            SizedBox(
              width: double.infinity,
              height: 48,
              child: OutlinedButton.icon(
                onPressed: _simulateCancellation,
                icon: const Icon(Icons.cancel_outlined, color: Colors.redAccent, size: 20),
                label: const Text(
                  'Probar Alerta en Rojo (Cancelacion)',
                  style: TextStyle(
                    fontFamily: 'Google Sans',
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.redAccent,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.redAccent, width: 1.4),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  backgroundColor: Colors.red.withValues(alpha: 0.05),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPhaseItem({
    required int phaseNumber,
    required String title,
    required String description,
    required bool isActive,
    required bool isCompleted,
  }) {
    const lime = Color(0xFFC7FF2E);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isActive ? Colors.black : Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: isActive ? lime : (isCompleted ? lime.withValues(alpha: 0.6) : Colors.black12),
          width: isActive ? 1.8 : 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: isCompleted
                  ? lime
                  : (isActive ? lime : const Color(0xFFF0F0F0)),
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: isCompleted
                ? const Icon(Icons.check, size: 18, color: Colors.black)
                : Text(
                    '$phaseNumber',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: isActive ? Colors.black : Colors.black54,
                    ),
                  ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: TextStyle(
                          fontFamily: 'Google Sans',
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: isActive ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                    if (isActive)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: lime,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          'EN VIVO',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 12,
                    color: isActive ? Colors.white70 : Colors.black54,
                    height: 1.35,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
