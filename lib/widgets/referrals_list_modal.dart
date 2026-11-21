import 'package:flutter/material.dart';

class ReferralsListModal extends StatefulWidget {
  final String title;
  final List<dynamic> usuariosReferidos;
  final List<dynamic> conductoresReferidos;

  const ReferralsListModal({
    super.key,
    required this.title,
    this.usuariosReferidos = const [],
    this.conductoresReferidos = const [],
  });

  static void show(
    BuildContext context, {
    required String title,
    List<dynamic> usuariosReferidos = const [],
    List<dynamic> conductoresReferidos = const [],
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      builder: (_) => ReferralsListModal(
        title: title,
        usuariosReferidos: usuariosReferidos,
        conductoresReferidos: conductoresReferidos,
      ),
    );
  }

  @override
  State<ReferralsListModal> createState() => _ReferralsListModalState();
}

class _ReferralsListModalState extends State<ReferralsListModal> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  String _formatDate(String? isoStr) {
    if (isoStr == null) return 'Reciente';
    final dt = DateTime.tryParse(isoStr)?.toLocal();
    if (dt == null) return isoStr;
    final months = ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'];
    return '${dt.day} ${months[dt.month - 1]} ${dt.year}';
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    final height = MediaQuery.of(context).size.height * 0.70;

    return Container(
      height: height + bottomInset,
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
      child: Column(
        children: [
          // Drag handle
          Center(
            child: Container(
              width: 44,
              height: 5,
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          // Header
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Color(0xFFC7FF2E),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.people_alt_rounded, color: Colors.black, size: 20),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: const TextStyle(
                        fontFamily: 'Google Sans',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      '${widget.usuariosReferidos.length} pasajeros • ${widget.conductoresReferidos.length} conductores',
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close, color: Colors.black54),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Tabs
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.all(4),
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(12),
              ),
              labelColor: const Color(0xFFC7FF2E),
              unselectedLabelColor: Colors.black87,
              indicatorSize: TabBarIndicatorSize.tab,
              dividerColor: Colors.transparent,
              labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              tabs: [
                Tab(text: 'Pasajeros (${widget.usuariosReferidos.length})'),
                Tab(text: 'Conductores (${widget.conductoresReferidos.length})'),
              ],
            ),
          ),
          const SizedBox(height: 12),

          // Tab content
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildList(widget.usuariosReferidos, isConductor: false),
                _buildList(widget.conductoresReferidos, isConductor: true),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildList(List<dynamic> items, {required bool isConductor}) {
    if (items.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                isConductor ? Icons.local_taxi_outlined : Icons.person_outline_rounded,
                size: 48,
                color: Colors.grey[400],
              ),
              const SizedBox(height: 12),
              Text(
                isConductor
                    ? 'Aún no hay conductores referidos'
                    : 'Aún no hay pasajeros referidos',
                style: const TextStyle(
                  fontFamily: 'Google Sans',
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Comparte tu número telefónico registrado para invitarlos.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              ),
            ],
          ),
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: items.length,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        final item = items[index];
        if (item is! Map) return const SizedBox.shrink();

        final String nombre = (item['nombre'] ?? 'Usuario').toString();
        final String telefono = (item['telefono'] ?? '').toString();
        final String fecha = _formatDate(item['fecha']?.toString());
        final bool isActivo = item['activo'] == true;
        final double comision = (item['comision'] as num?)?.toDouble() ?? 0.0;
        final String placas = (item['placas'] ?? '').toString();

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey[200]!),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: isConductor
                      ? Colors.amber.withValues(alpha: 0.15)
                      : const Color(0xFF10B981).withValues(alpha: 0.12),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  isConductor ? Icons.local_taxi : Icons.person,
                  color: isConductor ? Colors.amber[900] : const Color(0xFF047857),
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      nombre,
                      style: const TextStyle(
                        fontFamily: 'Google Sans',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      telefono.isNotEmpty ? 'Tel: $telefono' : 'Teléfono no disponible',
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                    if (placas.isNotEmpty) ...[
                      Text('Placas: $placas', style: TextStyle(fontSize: 11, color: Colors.grey[700])),
                    ],
                    Text(fecha, style: TextStyle(fontSize: 11, color: Colors.grey[500])),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: isActivo
                          ? const Color(0xFF10B981).withValues(alpha: 0.15)
                          : Colors.amber.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          isActivo ? Icons.check_circle : Icons.schedule,
                          color: isActivo ? const Color(0xFF047857) : Colors.amber[900],
                          size: 12,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          isActivo ? 'Primer viaje' : 'Pendiente',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: isActivo ? const Color(0xFF047857) : Colors.amber[900],
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (comision > 0) ...[
                    const SizedBox(height: 4),
                    Text(
                      '+\$${comision.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF047857),
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
