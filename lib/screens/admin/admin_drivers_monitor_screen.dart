import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../services/admin_service.dart';
import 'admin_driver_detail_screen.dart';
import 'admin_driver_registration_screen.dart';
import '../../env/env.dart';
class AdminDriversMonitorScreen extends StatefulWidget {
  const AdminDriversMonitorScreen({super.key});

  @override
  State<AdminDriversMonitorScreen> createState() => _AdminDriversMonitorScreenState();
}

class _AdminDriversMonitorScreenState extends State<AdminDriversMonitorScreen> {
  final AdminService _adminService = AdminService();
  final MapController _mapController = MapController();

  bool _isLoading = true;
  List<Map<String, dynamic>> _drivers = [];
  String _selectedFilter = 'todos'; // 'todos', 'activos', 'pendientes', 'inactivos'

  static const String _mapboxToken = Env.mapboxApiKey;

  @override
  void initState() {
    super.initState();
    _loadDrivers();
  }

  Future<void> _loadDrivers() async {
    setState(() => _isLoading = true);
    final list = await _adminService.getAllDrivers();
    if (mounted) {
      setState(() {
        _drivers = list;
        _isLoading = false;
      });
    }
  }

  List<Map<String, dynamic>> get _filteredDrivers {
    if (_selectedFilter == 'todos') return _drivers;
    return _drivers.where((d) {
      final status = (d['estatus'] ?? '').toString().toLowerCase();
      final aprobacion = (d['Aprobación'] ?? d['Aprobacion'] ?? d['aprobacion'] ?? '').toString().toLowerCase();

      if (_selectedFilter == 'activos') return status == 'activo' || aprobacion == 'aprobado';
      if (_selectedFilter == 'pendientes') return aprobacion == 'pendiente';
      if (_selectedFilter == 'inactivos') return status == 'inactivo' && aprobacion != 'pendiente';
      return true;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final filtered = _filteredDrivers;

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: const Text(
          'Monitor de Conductores',
          style: TextStyle(fontFamily: 'Google Sans', fontWeight: FontWeight.bold, color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_add, color: Colors.black),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const AdminDriverRegistrationScreen()));
            },
          ),
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.black),
            onPressed: _loadDrivers,
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator(color: Colors.black))
          : Column(
              children: [
                // 1. Mapa de Flota en Vivo
                SizedBox(
                  height: 250,
                  child: Stack(
                    children: [
                      FlutterMap(
                        mapController: _mapController,
                        options: const MapOptions(
                          initialCenter: LatLng(19.4326, -99.1332), // CDMX centro
                          initialZoom: 12.0,
                        ),
                        children: [
                          TileLayer(
                            urlTemplate: 'https://api.mapbox.com/styles/v1/mapbox/dark-v11/tiles/256/{z}/{x}/{y}@2x?access_token=$_mapboxToken',
                            userAgentPackageName: 'com.taxiseguro.app',
                          ),
                          MarkerLayer(
                            markers: filtered.map((driver) {
                              final double lat = (driver['latitud'] as num?)?.toDouble() ?? (19.4200 + (driver.hashCode % 100) * 0.0003);
                              final double lng = (driver['longitud'] as num?)?.toDouble() ?? (-99.1500 + (driver.hashCode % 100) * 0.0003);
                              final bool isActive = (driver['estatus'] ?? '').toString().toLowerCase() == 'activo';

                              return Marker(
                                point: LatLng(lat, lng),
                                width: 42,
                                height: 42,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (_) => AdminDriverDetailScreen(driver: driver)),
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: isActive ? const Color(0xFFC7FF2E) : Colors.amber,
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.black, width: 2.5),
                                      boxShadow: const [BoxShadow(color: Colors.black45, blurRadius: 6)],
                                    ),
                                    child: const Icon(Icons.local_taxi, size: 22, color: Colors.black),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                      Positioned(
                        top: 12,
                        right: 12,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.black87,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            '${filtered.length} en flota',
                            style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // 2. Filtros de Conductores
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    children: [
                      _buildFilterChip('Todos (${_drivers.length})', 'todos'),
                      const SizedBox(width: 8),
                      _buildFilterChip('Activos', 'activos'),
                      const SizedBox(width: 8),
                      _buildFilterChip('Pendientes Aprobación', 'pendientes'),
                      const SizedBox(width: 8),
                      _buildFilterChip('Inactivos', 'inactivos'),
                    ],
                  ),
                ),

                // 3. Lista de Conductores
                Expanded(
                  child: filtered.isEmpty
                      ? const Center(child: Text('No hay conductores en esta categoría'))
                      : ListView.builder(
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
                          itemCount: filtered.length,
                          itemBuilder: (context, index) {
                            final driver = filtered[index];
                            final name = driver['nombre_completo'] ?? driver['nombre'] ?? 'Conductor';
                            final auto = '${driver['modelo_auto'] ?? 'Auto'} (${driver['placas'] ?? 'S/P'})';
                            final phone = driver['telefono'] ?? 'Sin teléfono';
                            final estatus = (driver['estatus'] ?? 'inactivo').toString().toLowerCase();
                            final aprobacion = (driver['Aprobación'] ?? driver['Aprobacion'] ?? driver['aprobacion'] ?? '').toString();

                            final bool isAct = estatus == 'activo';
                            final bool isPend = aprobacion.toLowerCase() == 'pendiente';

                            return Container(
                              margin: const EdgeInsets.only(bottom: 12),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(22),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.03),
                                    blurRadius: 10,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: ListTile(
                                contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                                leading: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: isAct
                                        ? const Color(0xFFC7FF2E).withValues(alpha: 0.2)
                                        : isPend
                                            ? Colors.amber.withValues(alpha: 0.2)
                                            : Colors.grey.shade200,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.local_taxi,
                                    color: isAct ? Colors.black : isPend ? Colors.amber.shade900 : Colors.grey,
                                  ),
                                ),
                                title: Text(
                                  name,
                                  style: const TextStyle(fontFamily: 'Google Sans', fontWeight: FontWeight.bold, fontSize: 16),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('$auto • $phone', style: const TextStyle(fontSize: 12, color: Colors.black54)),
                                    const SizedBox(height: 4),
                                    Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                          decoration: BoxDecoration(
                                            color: isAct ? Colors.green.shade100 : isPend ? Colors.amber.shade100 : Colors.grey.shade200,
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: Text(
                                            isAct ? 'ACTIVO' : isPend ? 'PENDIENTE' : 'INACTIVO',
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                              color: isAct ? Colors.green.shade900 : isPend ? Colors.amber.shade900 : Colors.grey.shade800,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black38),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (_) => AdminDriverDetailScreen(driver: driver)),
                                  );
                                },
                              ),
                            ).animate().fade(duration: 300.ms, delay: (index * 40).ms).slideY(begin: 0.05, end: 0);
                          },
                        ),
                ),
              ],
            ),
    );
  }

  Widget _buildFilterChip(String label, String value) {
    final bool isSelected = _selectedFilter == value;

    return ChoiceChip(
      label: Text(
        label,
        style: TextStyle(
          fontFamily: 'Google Sans',
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          color: isSelected ? Colors.black : Colors.black87,
          fontSize: 13,
        ),
      ),
      selected: isSelected,
      selectedColor: const Color(0xFFC7FF2E),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      onSelected: (selected) {
        if (selected) {
          setState(() => _selectedFilter = value);
        }
      },
    );
  }
}
