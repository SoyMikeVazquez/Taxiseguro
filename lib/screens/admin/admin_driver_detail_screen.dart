import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../services/admin_service.dart';
import '../../widgets/admin/dashboard_revenue_card.dart';
import 'admin_driver_shifts_screen.dart';

class AdminDriverDetailScreen extends StatefulWidget {
  final Map<String, dynamic> driver;

  const AdminDriverDetailScreen({super.key, required this.driver});

  @override
  State<AdminDriverDetailScreen> createState() => _AdminDriverDetailScreenState();
}

class _AdminDriverDetailScreenState extends State<AdminDriverDetailScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final AdminService _adminService = AdminService();

  bool _isLoading = true;
  bool _isDeleting = false;
  bool _isTogglingStatus = false;
  late DriverFullDetailData _detailData;

  String _tripFilter = 'todos'; // 'todos', 'completed', 'cancelled'

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _detailData = DriverFullDetailData.empty(widget.driver);
    _loadDriverDetails();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _loadDriverDetails() async {
    setState(() => _isLoading = true);
    final userId = widget.driver['user_id']?.toString() ?? '';
    final internalId = widget.driver['id']?.toString();

    final data = await _adminService.getDriverFullDetails(
      userId,
      internalId: internalId,
      initialDriver: widget.driver,
    );

    if (mounted) {
      setState(() {
        _detailData = data;
        _isLoading = false;
      });
    }
  }

  Future<void> _toggleOnlineStatus() async {
    final currentStatus = _detailData.isOnline;
    final newStatus = !currentStatus;
    final userId = _detailData.driver['user_id']?.toString() ?? widget.driver['user_id']?.toString() ?? '';

    if (userId.isEmpty) return;

    setState(() => _isTogglingStatus = true);

    final success = await _adminService.setDriverOnlineStatus(userId, newStatus);
    if (mounted) {
      setState(() => _isTogglingStatus = false);
      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(newStatus ? 'Conductor marcado como ACTIVO' : 'Conductor marcado como INACTIVO'),
            backgroundColor: newStatus ? Colors.green : Colors.black87,
          ),
        );
        _loadDriverDetails();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error al cambiar estado del conductor'), backgroundColor: Colors.red),
        );
      }
    }
  }

  void _showDocumentViewer(String title, String? imageUrl) {
    if (imageUrl == null || imageUrl.trim().isEmpty) {
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

  Future<void> _deleteDriver(String userId, String driverName) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text('¿Eliminar conductor?'),
        content: Text(
          'Estás a punto de eliminar permanentemente a $driverName.\n\nEsto borrará su cuenta, documentos y registros en la base de datos.\n\nEsta acción no se puede deshacer.',
        ),
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

    final error = await _adminService.setDriverApproval(userId, approve: false);

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

  String _formatCurrency(double amount) {
    final fixed = amount.toStringAsFixed(2);
    final parts = fixed.split('.');
    final reg = RegExp(r'\B(?=(\d{3})+(?!\d))');
    parts[0] = parts[0].replaceAll(reg, ',');
    return '\$${parts[0]}.${parts[1]}';
  }

  String _formatDate(String? isoStr) {
    if (isoStr == null) return 'Fecha no disponible';
    final d = DateTime.tryParse(isoStr)?.toLocal();
    if (d == null) return isoStr;

    final months = ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'];
    final monthStr = months[d.month - 1];
    final hourStr = d.hour.toString().padLeft(2, '0');
    final minStr = d.minute.toString().padLeft(2, '0');
    return '${d.day} $monthStr ${d.year} • $hourStr:$minStr hrs';
  }

  String _formatTimeOnly(DateTime d) {
    final local = d.toLocal();
    final hourStr = local.hour.toString().padLeft(2, '0');
    final minStr = local.minute.toString().padLeft(2, '0');
    return '$hourStr:$minStr hrs';
  }

  void _showShiftHistoryDialog(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => AdminDriverShiftsScreen(
          shiftStats: _detailData.shiftStats,
          driverName: '${_detailData.driver['nombre_completo'] ?? _detailData.driver['nombre'] ?? 'Conductor'}'.trim(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final driver = _detailData.driver;
    final name = driver['nombre_completo'] ?? driver['nombre'] ?? 'Conductor';
    final userId = driver['user_id']?.toString() ?? widget.driver['user_id']?.toString() ?? '';

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Text(
          name,
          style: const TextStyle(
            fontFamily: 'Google Sans',
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 18,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        leadingWidth: 70,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 8, bottom: 8),
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black, size: 22),
            style: IconButton.styleFrom(
              backgroundColor: Colors.grey.shade100,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0, top: 8, bottom: 8),
            child: IconButton(
              icon: const Icon(Icons.refresh, color: Colors.black, size: 22),
              tooltip: 'Actualizar datos',
              style: IconButton.styleFrom(
                backgroundColor: Colors.grey.shade100,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: _loadDriverDetails,
            ),
          ),
          if (_isDeleting)
            const Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: Center(
                child: SizedBox(width: 20, height: 20, child: CircularProgressIndicator(color: Colors.red, strokeWidth: 2)),
              ),
            )
          else
            Padding(
              padding: const EdgeInsets.only(right: 16.0, top: 8, bottom: 8),
              child: IconButton(
                icon: const Icon(Icons.delete_outline, color: Colors.red, size: 22),
                tooltip: 'Eliminar conductor',
                style: IconButton.styleFrom(
                  backgroundColor: Colors.red.shade50,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () => _deleteDriver(userId, name),
              ),
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
            Tab(text: 'Info Personal'),
            Tab(text: 'Finanzas'),
            Tab(text: 'Historial de Viajes'),
          ],
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator(color: Colors.black))
          : RefreshIndicator(
              onRefresh: _loadDriverDetails,
              color: Colors.black,
              child: TabBarView(
                controller: _tabController,
                children: [
                  // TAB 1: INFORMACIÓN PERSONAL Y ESTADO ACTIVO/INACTIVO
                  _buildPersonalInfoTab(driver),

                  // TAB 2: FINANZAS Y COMISIONES REALES
                  _buildFinancesTab(),

                  // TAB 3: HISTORIAL DE VIAJES REAL
                  _buildTripHistoryTab(),
                ],
              ),
            ),
    );
  }

  // ==========================================
  // TAB 1: INFORMACIÓN PERSONAL
  // ==========================================
  Widget _buildPersonalInfoTab(Map<String, dynamic> driver) {
    final name = driver['nombre_completo'] ?? driver['nombre'] ?? 'Conductor';
    final email = driver['correo'] ?? 'Sin correo';
    final phone = driver['telefono'] ?? 'Sin teléfono';
    final auto = '${driver['modelo_auto'] ?? 'No registrado'} (${driver['placas'] ?? 'S/P'})';
    final colorAuto = driver['color_auto'] ?? 'N/A';
    final anioAuto = driver['anio_auto'] ?? 'N/A';
    final photoUrl = driver['imagen_perfil'] ?? driver['fotodeperfil'];
    final aprobacion = (driver['Aprobación'] ?? driver['Aprobacion'] ?? driver['aprobacion'] ?? 'Pendiente').toString();
    final isOnline = _detailData.isOnline;

    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        // 1. Tarjeta de Estado Activo / Inactivo en tiempo real
        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: isOnline ? const Color(0xFF0F172A) : Colors.grey.shade100,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: isOnline ? const Color(0xFFC7FF2E).withValues(alpha: 0.5) : Colors.grey.shade300,
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: isOnline ? const Color(0xFFC7FF2E).withValues(alpha: 0.1) : Colors.black.withValues(alpha: 0.03),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              // Indicador visual
              Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  color: isOnline ? const Color(0xFFC7FF2E).withValues(alpha: 0.2) : Colors.grey.shade300,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: isOnline ? const Color(0xFFC7FF2E) : Colors.grey.shade600,
                      shape: BoxShape.circle,
                      boxShadow: isOnline
                          ? [
                              BoxShadow(
                                color: const Color(0xFFC7FF2E).withValues(alpha: 0.6),
                                blurRadius: 8,
                                spreadRadius: 2,
                              ),
                            ]
                          : null,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      isOnline ? 'ACTIVO EN ESTE MOMENTO' : 'INACTIVO / DESCONECTADO',
                      style: TextStyle(
                        fontFamily: 'Google Sans',
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: isOnline ? const Color(0xFFC7FF2E) : Colors.black87,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      isOnline
                          ? 'Conductor en línea y disponible para recibir viajes'
                          : 'No está recibiendo solicitudes de viaje actualmente',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 12,
                        color: isOnline ? Colors.white70 : Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              if (_isTogglingStatus)
                const SizedBox(width: 24, height: 24, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.black))
              else
                InkWell(
                  onTap: _toggleOnlineStatus,
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: isOnline ? Colors.white.withValues(alpha: 0.15) : Colors.black,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      isOnline ? 'Desactivar' : 'Activar',
                      style: TextStyle(
                        fontFamily: 'Google Sans',
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: isOnline ? Colors.white : const Color(0xFFC7FF2E),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ).animate().fade(duration: 350.ms).slideY(begin: -0.1, end: 0),

        const SizedBox(height: 18),

        // 2. Tarjeta de Jornada y Horarios de Conexión (horarios_conductores)
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.schedule_rounded, color: Colors.black, size: 20),
                      SizedBox(width: 8),
                      Text(
                        'Jornada de Conexión',
                        style: TextStyle(fontFamily: 'Google Sans', fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () => _showShiftHistoryDialog(context),
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(Icons.history, size: 14, color: Colors.black87),
                          SizedBox(width: 4),
                          Text(
                            'Ver Historial',
                            style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.black87),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Tiempo Conectado Hoy', style: TextStyle(color: Colors.grey, fontSize: 11, fontWeight: FontWeight.w500)),
                    const SizedBox(height: 4),
                    Text(
                      _detailData.shiftStats.formattedTodayTime,
                      style: const TextStyle(fontFamily: 'Google Sans', fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '${_detailData.shiftStats.sessionsToday.length} ${_detailData.shiftStats.sessionsToday.length == 1 ? "sesión" : "sesiones"} hoy',
                      style: const TextStyle(color: Colors.black54, fontSize: 11),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ).animate().fade(duration: 350.ms, delay: 50.ms).slideY(begin: 0.1, end: 0),

        const SizedBox(height: 18),

        // 2. Tarjeta de Perfil
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
              Row(
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: const Color(0xFFC7FF2E),
                    backgroundImage: photoUrl != null && photoUrl.isNotEmpty ? NetworkImage(photoUrl) : null,
                    child: photoUrl == null || photoUrl.isEmpty
                        ? Text(
                            name.isNotEmpty ? name[0].toUpperCase() : 'C',
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.black),
                          )
                        : null,
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(fontFamily: 'Google Sans', fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                              decoration: BoxDecoration(
                                color: aprobacion.toLowerCase() == 'aprobado' ? Colors.green.shade100 : Colors.amber.shade100,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                'Aprobación: $aprobacion',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: aprobacion.toLowerCase() == 'aprobado' ? Colors.green.shade900 : Colors.amber.shade900,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Row(
                              children: [
                                const Icon(Icons.star_rounded, color: Colors.amber, size: 16),
                                const SizedBox(width: 2),
                                Text(
                                  _detailData.averageRating.toStringAsFixed(1),
                                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                                ),
                                Text(
                                  ' (${_detailData.totalRatings})',
                                  style: const TextStyle(color: Colors.grey, fontSize: 11),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Divider(height: 28),
              _buildInfoRow('Teléfono', phone, icon: Icons.phone_outlined, onAction: () async {
                final uri = Uri.parse('tel:$phone');
                if (await canLaunchUrl(uri)) await launchUrl(uri);
              }),
              _buildInfoRow('Correo', email, icon: Icons.email_outlined),
            ],
          ),
        ).animate().fade(duration: 350.ms, delay: 100.ms).slideY(begin: 0.1, end: 0),

        const SizedBox(height: 18),

        // 3. Tarjeta de Información del Vehículo
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
              Row(
                children: const [
                  Icon(Icons.directions_car_outlined, color: Colors.black, size: 20),
                  SizedBox(width: 8),
                  Text(
                    'Detalles del Vehículo',
                    style: TextStyle(fontFamily: 'Google Sans', fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              _buildInfoRow('Vehículo', auto),
              _buildInfoRow('Color', colorAuto),
              _buildInfoRow('Año del Modelo', anioAuto.toString()),
            ],
          ),
        ).animate().fade(duration: 350.ms, delay: 150.ms).slideY(begin: 0.1, end: 0),

        const SizedBox(height: 18),

        // 4. Datos Bancarios Registrados
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
              Row(
                children: const [
                  Icon(Icons.account_balance_outlined, color: Colors.black, size: 20),
                  SizedBox(width: 8),
                  Text(
                    'Datos Bancarios Registrados',
                    style: TextStyle(fontFamily: 'Google Sans', fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              _buildInfoRow('Banco', driver['banco'] ?? 'No especificado'),
              _buildInfoRow('Cuenta', driver['cuenta_bancaria'] ?? 'No especificada'),
              _buildInfoRow('CLABE Interbancaria', driver['clabe'] ?? 'No especificada'),
            ],
          ),
        ).animate().fade(duration: 350.ms, delay: 200.ms).slideY(begin: 0.1, end: 0),

        const SizedBox(height: 18),

        // 5. Documentos Oficiales
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
              Row(
                children: const [
                  Icon(Icons.folder_shared_outlined, color: Colors.black, size: 20),
                  SizedBox(width: 8),
                  Text(
                    'Expediente de Documentos',
                    style: TextStyle(fontFamily: 'Google Sans', fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              const Text(
                'Toca cualquier documento disponible para inspeccionarlo con zoom.',
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              const SizedBox(height: 16),
              _buildDocumentCard('Identificación Oficial (INE)', driver['ine_url']),
              const SizedBox(height: 10),
              _buildDocumentCard('Licencia de Conducir', driver['licencia_url']),
              const SizedBox(height: 10),
              _buildDocumentCard('Póliza de Seguro de Auto', driver['seguro_url']),
              const SizedBox(height: 10),
              _buildDocumentCard('Tarjeta de Circulación', driver['tarjeta_circulacion_url']),
            ],
          ),
        ).animate().fade(duration: 350.ms, delay: 250.ms).slideY(begin: 0.1, end: 0),
      ],
    );
  }

  // ==========================================
  // TAB 2: FINANZAS Y COMISIONES REALES
  // ==========================================
  Widget _buildFinancesTab() {
    final driver = _detailData.driver;
    final driverUserId = driver['user_id']?.toString();

    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        // Gráfica de ingresos con selector de fecha
        DashboardRevenueCard(
          adminService: _adminService,
          driverId: (driverUserId != null && driverUserId.isNotEmpty) ? driverUserId : driver['id']?.toString(),
        ).animate().fade(duration: 400.ms, delay: 100.ms).slideY(begin: 0.1, end: 0),
        
        const SizedBox(height: 24),

        const Text(
          'Métricas Históricas Globales',
          style: TextStyle(fontFamily: 'Google Sans', fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 14),

        // 1. Ingresos Totales Generados
        _buildFinanceMetricCard(
          'Ingresos Totales Generados',
          '${_formatCurrency(_detailData.totalRevenue)} MXN',
          '${_detailData.completedTrips.length} viajes completados',
          Icons.attach_money,
          Colors.black,
        ),
        const SizedBox(height: 14),

        // 2. Comisiones Taxiseguro (20%)
        _buildFinanceMetricCard(
          'Comisiones Taxiseguro (20%)',
          '${_formatCurrency(_detailData.platformCommission)} MXN',
          'Retención estimada de plataforma',
          Icons.percent,
          Colors.orange,
        ),
        const SizedBox(height: 14),

        // 3. Monto Neto a Pagar / Transferido
        _buildFinanceMetricCard(
          'Monto Neto a Pagar / Transferido',
          '${_formatCurrency(_detailData.netEarnings)} MXN',
          'Ganancia neta del conductor (85%)',
          Icons.account_balance_wallet,
          Colors.green,
        ),
        const SizedBox(height: 24),

        // 4. Segmentación por método de pago de este conductor
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
              const Text(
                'Desglose por Método de Pago',
                style: TextStyle(fontFamily: 'Google Sans', fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 14),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade50,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.grey.shade200),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: const [
                              Icon(Icons.payments_outlined, size: 16, color: Colors.black),
                              SizedBox(width: 6),
                              Text('Pago en Efectivo', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            _formatCurrency(_detailData.cashTotal),
                            style: const TextStyle(fontFamily: 'Google Sans', fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Text(
                            '${_detailData.cashTrips} viajes',
                            style: const TextStyle(color: Colors.grey, fontSize: 11),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade50,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.grey.shade200),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: const [
                              Icon(Icons.credit_card, size: 16, color: Colors.black),
                              SizedBox(width: 6),
                              Text('Pago con Tarjeta', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            _formatCurrency(_detailData.cardTotal),
                            style: const TextStyle(fontFamily: 'Google Sans', fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Text(
                            '${_detailData.cardTrips} viajes',
                            style: const TextStyle(color: Colors.grey, fontSize: 11),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        const SizedBox(height: 24),

        // 5. Datos Bancarios Registrados
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
              const Text(
                'Datos Bancarios Registrados',
                style: TextStyle(fontFamily: 'Google Sans', fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 12),
              _buildInfoRow('Banco', driver['banco'] ?? 'No especificado'),
              _buildInfoRow('Cuenta', driver['cuenta_bancaria'] ?? 'No especificada'),
              _buildInfoRow('CLABE Interbancaria', driver['clabe'] ?? 'No especificada'),
            ],
          ),
        ),
      ],
    );
  }

  // ==========================================
  // TAB 3: HISTORIAL DE VIAJES REAL
  // ==========================================
  Widget _buildTripHistoryTab() {
    List<Map<String, dynamic>> displayedTrips;
    if (_tripFilter == 'completed') {
      displayedTrips = _detailData.completedTrips;
    } else if (_tripFilter == 'cancelled') {
      displayedTrips = _detailData.cancelledTrips;
    } else {
      displayedTrips = _detailData.allTrips;
    }

    return Column(
      children: [
        // Selector de Filtro de Viajes
        Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            children: [
              _buildTripFilterChip('Todos (${_detailData.allTrips.length})', 'todos'),
              const SizedBox(width: 8),
              _buildTripFilterChip('Completados (${_detailData.completedTrips.length})', 'completed'),
              const SizedBox(width: 8),
              _buildTripFilterChip('Cancelados (${_detailData.cancelledTrips.length})', 'cancelled'),
            ],
          ),
        ),
        const Divider(height: 1),

        // Lista de Viajes
        Expanded(
          child: displayedTrips.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.directions_car_outlined, size: 54, color: Colors.grey.shade400),
                      const SizedBox(height: 12),
                      Text(
                        _tripFilter == 'cancelled'
                            ? 'Este conductor no tiene viajes cancelados'
                            : 'No hay viajes registrados para este conductor',
                        style: const TextStyle(fontFamily: 'Google Sans', fontSize: 15, color: Colors.black54),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: displayedTrips.length,
                  itemBuilder: (context, index) {
                    final t = displayedTrips[index];
                    return _buildTripCard(t);
                  },
                ),
        ),
      ],
    );
  }

  Widget _buildTripFilterChip(String label, String filterKey) {
    final isSelected = _tripFilter == filterKey;
    return InkWell(
      onTap: () => setState(() => _tripFilter = filterKey),
      borderRadius: BorderRadius.circular(16),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 11,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
            color: isSelected ? const Color(0xFFC7FF2E) : Colors.black87,
          ),
        ),
      ),
    );
  }

  Widget _buildTripCard(Map<String, dynamic> trip) {
    final status = (trip['status'] ?? 'pending').toString().toLowerCase();
    final isCompleted = status == 'completed';
    final isCancelled = status == 'cancelled';
    final fare = (trip['fare'] as num?)?.toDouble() ?? 0.0;
    final method = (trip['metodo_pago'] ?? trip['payment_method'] ?? 'efectivo').toString();
    final origin = trip['origin_address'] ?? 'Origen no registrado';
    final destination = trip['destination_address'] ?? 'Destino no registrado';
    final dateStr = trip['created_at'] ?? trip['completed_at'];
    final cancelReason = trip['cancel_reason'] ?? trip['cancellation_reason'];

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.03), blurRadius: 8, offset: const Offset(0, 3))],
        border: isCancelled ? Border.all(color: Colors.red.shade100) : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Badge Estado
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: isCompleted
                      ? Colors.green.shade50
                      : isCancelled
                          ? Colors.red.shade50
                          : Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      isCompleted
                          ? Icons.check_circle
                          : isCancelled
                              ? Icons.cancel
                              : Icons.access_time,
                      size: 12,
                      color: isCompleted
                          ? Colors.green.shade800
                          : isCancelled
                              ? Colors.red.shade800
                              : Colors.black87,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      isCompleted
                          ? 'Completado'
                          : isCancelled
                              ? 'Cancelado'
                              : status.toUpperCase(),
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: isCompleted
                            ? Colors.green.shade800
                            : isCancelled
                                ? Colors.red.shade800
                                : Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),

              // Tarifa & Método
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      method.toUpperCase(),
                      style: const TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: Colors.black87),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    _formatCurrency(fare),
                    style: const TextStyle(fontFamily: 'Google Sans', fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
            ],
          ),

          if (isCancelled && cancelReason != null && cancelReason.toString().trim().isNotEmpty) ...[
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  const Icon(Icons.info_outline, size: 14, color: Colors.redAccent),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      'Motivo: $cancelReason',
                      style: TextStyle(fontSize: 11, color: Colors.red.shade900),
                    ),
                  ),
                ],
              ),
            ),
          ],

          const SizedBox(height: 12),

          // Rutas Origen -> Destino
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  const Icon(Icons.radio_button_checked, size: 14, color: Colors.green),
                  Container(width: 1, height: 16, color: Colors.grey.shade300),
                  const Icon(Icons.location_on, size: 14, color: Colors.redAccent),
                ],
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      origin,
                      style: const TextStyle(fontSize: 12, color: Colors.black87, fontWeight: FontWeight.w500),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      destination,
                      style: const TextStyle(fontSize: 12, color: Colors.black87, fontWeight: FontWeight.w500),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),
          const Divider(height: 1),
          const SizedBox(height: 6),

          Text(
            _formatDate(dateStr?.toString()),
            style: const TextStyle(fontSize: 11, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  // ==========================================
  // HELPERS COMUNES
  // ==========================================
  Widget _buildFinanceMetricCard(String title, String amount, String subtitle, IconData icon, Color color) {
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
                const SizedBox(height: 2),
                Text(subtitle, style: const TextStyle(fontSize: 11, color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, {IconData? icon, VoidCallback? onAction}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              if (icon != null) ...[
                Icon(icon, size: 16, color: Colors.grey),
                const SizedBox(width: 6),
              ],
              Text(label, style: const TextStyle(color: Colors.black54, fontSize: 13)),
            ],
          ),
          const SizedBox(width: 12),
          Flexible(
            child: InkWell(
              onTap: onAction,
              child: Text(
                value,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                  color: Colors.black,
                  decoration: onAction != null ? TextDecoration.underline : null,
                ),
                textAlign: TextAlign.end,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDocumentCard(String title, String? url) {
    final bool hasDoc = url != null && url.trim().isNotEmpty;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(hasDoc ? Icons.check_circle_outline : Icons.error_outline,
                  color: hasDoc ? Colors.green : Colors.grey, size: 20),
              const SizedBox(width: 10),
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.black87),
              ),
            ],
          ),
          if (hasDoc)
            TextButton.icon(
              onPressed: () => _showDocumentViewer(title, url),
              icon: const Icon(Icons.visibility, size: 16, color: Colors.black),
              label: const Text('Ver', style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold)),
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xFFC7FF2E),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
            )
          else
            const Text('No subido', style: TextStyle(color: Colors.grey, fontSize: 11)),
        ],
      ),
    );
  }
}
