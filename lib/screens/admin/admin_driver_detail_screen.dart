import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../services/admin_service.dart';
import '../../env/env.dart';
class AdminDriverDetailScreen extends StatefulWidget {
  final Map<String, dynamic> driver;

  const AdminDriverDetailScreen({super.key, required this.driver});

  @override
  State<AdminDriverDetailScreen> createState() => _AdminDriverDetailScreenState();
}

class _AdminDriverDetailScreenState extends State<AdminDriverDetailScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  static const String _mapboxToken = Env.mapboxApiKey;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _showDocumentViewer(String title, String? imageUrl) {
    if (imageUrl == null || imageUrl.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Documento no disponible')),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (ctx) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(16),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(24),
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppBar(
                backgroundColor: Colors.black87,
                title: Text(title, style: const TextStyle(color: Colors.white, fontSize: 16)),
                automaticallyImplyLeading: false,
                actions: [
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: () => Navigator.pop(ctx),
                  ),
                ],
              ),
              InteractiveViewer(
                minScale: 0.8,
                maxScale: 4.0,
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.contain,
                  loadingBuilder: (context, child, progress) {
                    if (progress == null) return child;
                    return const Padding(
                      padding: EdgeInsets.all(40),
                      child: CircularProgressIndicator(color: Color(0xFFC7FF2E)),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) => const Padding(
                    padding: EdgeInsets.all(40),
                    child: Text('Error al cargar imagen', style: TextStyle(color: Colors.white70)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool _isDeleting = false;

  Future<void> _deleteDriver(String userId, String driverName) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text('¿Eliminar conductor?'),
        content: Text('Estás a punto de eliminar permanentemente a $driverName.\n\nEsto borrará su cuenta, documentos y registros en la base de datos.\n\nEsta acción no se puede deshacer.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancelar', style: TextStyle(color: Colors.black54)),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Eliminar', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );

    if (confirm != true) return;

    setState(() => _isDeleting = true);

    final error = await AdminService().setDriverApproval(userId, approve: false);

    if (!mounted) return;
    setState(() => _isDeleting = false);

    if (error == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Conductor $driverName eliminado exitosamente'), backgroundColor: Colors.green),
      );
      Navigator.pop(context);
    } else {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Error al eliminar'),
          content: Text(error),
          actions: [
            TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('OK')),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final driver = widget.driver;
    final name = driver['nombre_completo'] ?? driver['nombre'] ?? 'Conductor';
    final email = driver['correo'] ?? '';
    final phone = driver['telefono'] ?? 'Sin teléfono';
    final auto = '${driver['modelo_auto'] ?? 'No registrado'} (${driver['placas'] ?? 'S/P'})';
    final colorAuto = driver['color_auto'] ?? 'N/A';
    final anioAuto = driver['anio_auto'] ?? 'N/A';
    final estatus = (driver['estatus'] ?? 'inactivo').toString().toUpperCase();
    final aprobacion = (driver['Aprobación'] ?? driver['Aprobacion'] ?? driver['aprobacion'] ?? 'Pendiente').toString();

    final double lat = (driver['latitud'] as num?)?.toDouble() ?? 19.4326;
    final double lng = (driver['longitud'] as num?)?.toDouble() ?? -99.1332;
    final driverPos = LatLng(lat, lng);

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Text(
          name,
          style: const TextStyle(fontFamily: 'Google Sans', fontWeight: FontWeight.bold, color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          if (_isDeleting)
            const Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: Center(
                child: SizedBox(width: 20, height: 20, child: CircularProgressIndicator(color: Colors.red, strokeWidth: 2)),
              ),
            )
          else
            IconButton(
              icon: const Icon(Icons.delete_outline, color: Colors.red),
              tooltip: 'Eliminar conductor',
              onPressed: () => _deleteDriver(driver['user_id'], name),
            ),
        ],
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          indicatorColor: const Color(0xFFC7FF2E),
          indicatorWeight: 3.5,
          labelStyle: const TextStyle(fontFamily: 'Google Sans', fontWeight: FontWeight.bold, fontSize: 13),
          tabs: const [
            Tab(text: 'Ubicación'),
            Tab(text: 'Finanzas'),
            Tab(text: 'Documentos'),
            Tab(text: 'Viajes / Reseñas'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // 1. Ubicación en Vivo
          Stack(
            children: [
              FlutterMap(
                options: MapOptions(
                  initialCenter: driverPos,
                  initialZoom: 15.0,
                ),
                children: [
                  TileLayer(
                    urlTemplate: 'https://api.mapbox.com/styles/v1/mapbox/dark-v11/tiles/256/{z}/{x}/{y}@2x?access_token=$_mapboxToken',
                    userAgentPackageName: 'com.taxiseguro.app',
                  ),
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: driverPos,
                        width: 60,
                        height: 60,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFD700).withValues(alpha: 0.3),
                                shape: BoxShape.circle,
                              ),
                            ),
                            Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFD700),
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.black, width: 3),
                                boxShadow: const [
                                  BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(0, 2)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Positioned(
                bottom: 24,
                left: 20,
                right: 20,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(28),
                    boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 20, offset: Offset(0, 8))],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: estatus == 'ACTIVO' ? Colors.green.shade100 : Colors.red.shade100,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              estatus,
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: estatus == 'ACTIVO' ? Colors.green.shade900 : Colors.red.shade900,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.amber.shade100,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              'Aprobación: $aprobacion',
                              style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.amber.shade900),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(name, style: const TextStyle(fontFamily: 'Google Sans', fontSize: 18, fontWeight: FontWeight.bold)),
                      Text('$auto • $colorAuto (Año $anioAuto)', style: const TextStyle(color: Colors.black54, fontSize: 13)),
                      Text('Teléfono: $phone • $email', style: const TextStyle(color: Colors.black54, fontSize: 13)),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // 2. Finanzas y Comisiones
          ListView(
            padding: const EdgeInsets.all(20),
            children: [
              _buildFinanceMetricCard('Ingresos Totales Generados', '\$8,450.00 MXN', Icons.attach_money, Colors.black),
              const SizedBox(height: 14),
              _buildFinanceMetricCard('Comisiones Taxiseguro (15%)', '\$1,267.50 MXN', Icons.percent, Colors.orange),
              const SizedBox(height: 14),
              _buildFinanceMetricCard('Monto Neto a Pagar / Transferido', '\$7,182.50 MXN', Icons.account_balance_wallet, Colors.green),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 10)],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Datos Bancarios Registrados', style: TextStyle(fontFamily: 'Google Sans', fontWeight: FontWeight.bold, fontSize: 16)),
                    const SizedBox(height: 12),
                    _buildInfoRow('Banco', driver['banco'] ?? 'No especificado'),
                    _buildInfoRow('Cuenta', driver['cuenta_bancaria'] ?? 'No especificada'),
                    _buildInfoRow('CLABE Interbancaria', driver['clabe'] ?? 'No especificada'),
                  ],
                ),
              ),
            ],
          ),

          // 3. Documentos Oficiales
          ListView(
            padding: const EdgeInsets.all(20),
            children: [
              const Text('Expediente del Conductor', style: TextStyle(fontFamily: 'Google Sans', fontWeight: FontWeight.bold, fontSize: 18)),
              const SizedBox(height: 8),
              const Text('Toca cualquier documento para abrirlo en tamaño completo con zoom.', style: TextStyle(color: Colors.grey, fontSize: 13)),
              const SizedBox(height: 20),
              _buildDocumentCard('Identificación Oficial (INE)', driver['ine_url']),
              const SizedBox(height: 14),
              _buildDocumentCard('Licencia de Conducir', driver['licencia_url']),
              const SizedBox(height: 14),
              _buildDocumentCard('Póliza de Seguro de Auto', driver['seguro_url']),
              const SizedBox(height: 14),
              _buildDocumentCard('Tarjeta de Circulación', driver['tarjeta_circulacion_url']),
            ],
          ),

          // 4. Viajes, Reseñas y Cancelaciones
          ListView(
            padding: const EdgeInsets.all(20),
            children: [
              // Resumen de calificaciones
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: const [
                        Icon(Icons.star_rounded, color: Color(0xFFC7FF2E), size: 36),
                        SizedBox(height: 4),
                        Text('4.9', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                        Text('Calificación', style: TextStyle(color: Colors.white70, fontSize: 12)),
                      ],
                    ),
                    Container(width: 1, height: 40, color: Colors.white24),
                    Column(
                      children: const [
                        Icon(Icons.local_taxi, color: Color(0xFFC7FF2E), size: 36),
                        SizedBox(height: 4),
                        Text('64', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                        Text('Viajes Completados', style: TextStyle(color: Colors.white70, fontSize: 12)),
                      ],
                    ),
                    Container(width: 1, height: 40, color: Colors.white24),
                    Column(
                      children: const [
                        Icon(Icons.cancel_outlined, color: Colors.redAccent, size: 36),
                        SizedBox(height: 4),
                        Text('2', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                        Text('Cancelaciones', style: TextStyle(color: Colors.white70, fontSize: 12)),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Visor de Cancelaciones
              const Text('Visor de Cancelaciones', style: TextStyle(fontFamily: 'Google Sans', fontWeight: FontWeight.bold, fontSize: 18)),
              const SizedBox(height: 12),
              _buildCancellationItem('Pasajero no se presentó en punto', '18 Ago 2026 • 14:20 hrs'),
              _buildCancellationItem('Falla mecánica menor en trayecto', '12 Ago 2026 • 09:15 hrs'),

              const SizedBox(height: 24),
              // Reseñas de Pasajeros
              const Text('Últimas Reseñas', style: TextStyle(fontFamily: 'Google Sans', fontWeight: FontWeight.bold, fontSize: 18)),
              const SizedBox(height: 12),
              _buildReviewItem('Carlos Mendoza', 5.0, 'Excelente servicio, auto muy limpio y conducción muy segura.', '19 Ago 2026'),
              _buildReviewItem('María Gómez', 5.0, 'Llegó muy rápido y fue muy amable. 100% recomendado.', '17 Ago 2026'),
              _buildReviewItem('Luis Garza', 4.5, 'Buen viaje en general.', '15 Ago 2026'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFinanceMetricCard(String title, String amount, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: color.withValues(alpha: 0.1), shape: BoxShape.circle),
            child: Icon(icon, color: color, size: 26),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(color: Colors.black54, fontSize: 13, fontWeight: FontWeight.w500)),
                const SizedBox(height: 4),
                Text(amount, style: const TextStyle(fontFamily: 'Google Sans', fontWeight: FontWeight.bold, fontSize: 20)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.black54, fontSize: 13)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
        ],
      ),
    );
  }

  Widget _buildDocumentCard(String title, String? url) {
    final bool hasDoc = url != null && url.isNotEmpty;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black.withValues(alpha: 0.06)),
      ),
      child: Row(
        children: [
          Icon(hasDoc ? Icons.check_circle : Icons.warning_amber_rounded, color: hasDoc ? Colors.green : Colors.orange, size: 28),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontFamily: 'Google Sans', fontWeight: FontWeight.bold, fontSize: 15)),
                Text(hasDoc ? 'Documento digitalizado disponible' : 'No se ha subido archivo', style: const TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          ),
          if (hasDoc)
            ElevatedButton.icon(
              onPressed: () => _showDocumentViewer(title, url),
              icon: const Icon(Icons.remove_red_eye, size: 16, color: Colors.black),
              label: const Text('Ver', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFC7FF2E),
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildCancellationItem(String reason, String date) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.red.shade50,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.red.shade100),
      ),
      child: Row(
        children: [
          const Icon(Icons.info_outline, color: Colors.redAccent, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(reason, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                Text(date, style: const TextStyle(color: Colors.black54, fontSize: 11)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewItem(String passenger, double rating, String comment, String date) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.03), blurRadius: 10)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(passenger, style: const TextStyle(fontFamily: 'Google Sans', fontWeight: FontWeight.bold, fontSize: 14)),
              const Spacer(),
              const Icon(Icons.star, color: Colors.amber, size: 16),
              const SizedBox(width: 4),
              Text(rating.toString(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
            ],
          ),
          const SizedBox(height: 6),
          Text(comment, style: const TextStyle(fontFamily: 'Inter', color: Colors.black87, fontSize: 13)),
          const SizedBox(height: 6),
          Text(date, style: const TextStyle(color: Colors.grey, fontSize: 11)),
        ],
      ),
    );
  }
}
