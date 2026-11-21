import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/trip.dart';
import '../services/location_service.dart';
import '../services/mapbox_service.dart';

class EmergencyDialog extends StatefulWidget {
  final bool isDriver;
  final Trip? trip;
  final LatLng? currentLocation;
  final String? currentAddress;

  const EmergencyDialog({
    super.key,
    required this.isDriver,
    this.trip,
    this.currentLocation,
    this.currentAddress,
  });

  static Future<void> show(
    BuildContext context, {
    required bool isDriver,
    Trip? trip,
    LatLng? currentLocation,
    String? currentAddress,
  }) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (ctx) => EmergencyDialog(
        isDriver: isDriver,
        trip: trip,
        currentLocation: currentLocation,
        currentAddress: currentAddress,
      ),
    );
  }

  @override
  State<EmergencyDialog> createState() => _EmergencyDialogState();
}

class _EmergencyDialogState extends State<EmergencyDialog> {
  String? _address;
  LatLng? _location;
  bool _isLoadingLocation = false;

  @override
  void initState() {
    super.initState();
    _address = widget.currentAddress;
    _location = widget.currentLocation;
    if (_address == null || _address!.isEmpty || _location == null) {
      _resolveLocation();
    }
  }

  Future<void> _resolveLocation() async {
    setState(() => _isLoadingLocation = true);
    try {
      final loc = widget.currentLocation ?? await LocationService().getCurrentLocation();
      if (loc != null) {
        _location = loc;
        final addr = widget.currentAddress ?? await MapboxService().reverseGeocode(loc);
        if (mounted) {
          setState(() {
            _address = addr ?? '${loc.latitude.toStringAsFixed(5)}, ${loc.longitude.toStringAsFixed(5)}';
            _isLoadingLocation = false;
          });
          return;
        }
      }
    } catch (_) {}
    if (mounted) {
      setState(() => _isLoadingLocation = false);
    }
  }

  Future<void> _call911() async {
    final uri = Uri.parse('tel:911');
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('No se pudo abrir el marcador telefónico: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  void _copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Ubicación copiada al portapapeles.'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final displayAddress = _address ??
        (_location != null
            ? '${_location!.latitude.toStringAsFixed(5)}, ${_location!.longitude.toStringAsFixed(5)}'
            : widget.trip?.originAddress ?? 'Ubicación en curso');

    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      titlePadding: EdgeInsets.zero,
      title: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        decoration: const BoxDecoration(
          color: Color(0xFFDC2626), // Rojo de alerta
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: const Row(
          children: [
            Icon(Icons.warning_amber_rounded, color: Colors.white, size: 28),
            SizedBox(width: 12),
            Expanded(
              child: Text(
                'Asistencia 911 de Emergencia',
                style: TextStyle(
                  fontFamily: 'Google Sans',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Esta función conectará directamente tu dispositivo con el número oficial de emergencias (911). Úsala únicamente ante situaciones reales de riesgo o seguridad.',
              style: TextStyle(fontSize: 13, color: Colors.black87, height: 1.4),
            ),
            const SizedBox(height: 16),

            // Tarjeta con la dirección actual para dar al operador
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: const Color(0xFFFEF2F2),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: const Color(0xFFFCA5A5)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.my_location, color: Color(0xFFDC2626), size: 18),
                      const SizedBox(width: 8),
                      const Text(
                        'Indica tu ubicación al operador:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: Color(0xFF991B1B),
                        ),
                      ),
                      const Spacer(),
                      if (_isLoadingLocation)
                        const SizedBox(
                          width: 14,
                          height: 14,
                          child: CircularProgressIndicator(strokeWidth: 2, color: Color(0xFFDC2626)),
                        ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    displayAddress,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  if (_location != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      'GPS: ${_location!.latitude.toStringAsFixed(5)}, ${_location!.longitude.toStringAsFixed(5)}',
                      style: const TextStyle(fontSize: 11, color: Colors.black54),
                    ),
                  ],
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton.icon(
                      onPressed: () => _copyToClipboard(displayAddress),
                      icon: const Icon(Icons.copy, size: 14, color: Color(0xFF991B1B)),
                      label: const Text(
                        'Copiar ubicación',
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF991B1B)),
                      ),
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            if (widget.trip != null) ...[
              const SizedBox(height: 14),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFF9FAFB),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFE5E7EB)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Folio del viaje: #${widget.trip!.id != null && widget.trip!.id!.length > 8 ? widget.trip!.id!.substring(0, 8) : (widget.trip!.id ?? 'N/A')}',
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black87),
                    ),
                    if (widget.trip!.nameDriver != null && widget.trip!.nameDriver!.isNotEmpty) ...[
                      const SizedBox(height: 2),
                      Text(
                        'Conductor: ${widget.trip!.nameDriver}',
                        style: const TextStyle(fontSize: 12, color: Colors.black54),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
      actionsPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      actions: [
        Row(
          children: [
            Expanded(
              child: TextButton(
                onPressed: () => Navigator.pop(context),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.black54,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                child: const Text('Volver', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              flex: 2,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                  _call911();
                },
                icon: const Icon(Icons.call, color: Colors.white, size: 20),
                label: const Text(
                  'LLAMAR 911',
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 15, letterSpacing: 0.5),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFDC2626),
                  foregroundColor: Colors.white,
                  elevation: 2,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
