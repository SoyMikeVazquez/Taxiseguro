import 'package:flutter/material.dart';
import '../../services/pricing_service.dart';

class AdminPricingConfigScreen extends StatefulWidget {
  const AdminPricingConfigScreen({super.key});

  @override
  State<AdminPricingConfigScreen> createState() => _AdminPricingConfigScreenState();
}

class _AdminPricingConfigScreenState extends State<AdminPricingConfigScreen> {
  bool _isLoading = true;
  bool _isSaving = false;

  // Switches de capas dinámicas sobre el tabulador
  bool _activarMapaCalorDemanda = false;
  bool _activarZonasManuales = false;

  // Parámetros base
  final _banderazoController = TextEditingController();
  final _precioKmExtraController = TextEditingController();
  final _costoMinutoController = TextEditingController();

  // Lista editable del tabulador de kilómetros (Siempre vigente)
  List<KmTarifaItem> _tabulador = [];

  // Simulador
  double _simulatedKm = 5.0;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  void dispose() {
    _banderazoController.dispose();
    _precioKmExtraController.dispose();
    _costoMinutoController.dispose();
    super.dispose();
  }

  Future<void> _loadData() async {
    setState(() => _isLoading = true);
    await PricingService.loadPricingConfig();

    if (mounted) {
      setState(() {
        _activarMapaCalorDemanda = PricingService.activarMapaCalorDemanda;
        _activarZonasManuales = PricingService.activarZonasManuales;
        _banderazoController.text = PricingService.banderazo.toStringAsFixed(2);
        _precioKmExtraController.text = PricingService.precioKmAdicional.toStringAsFixed(2);
        _costoMinutoController.text = PricingService.costoPorMinuto.toStringAsFixed(2);

        _tabulador = PricingService.tabuladorKm.map((e) => e.copyWith()).toList();
        _isLoading = false;
      });
    }
  }

  void _resetToOfficialTabulador() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Row(
          children: [
            Icon(Icons.restore, color: Colors.black87),
            SizedBox(width: 10),
            Text(
              'Restablecer Tabulador',
              style: TextStyle(fontFamily: 'Google Sans', fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
            ),
          ],
        ),
        content: const Text(
          '¿Deseas restablecer los valores del tabulador a los precios oficiales de la Ley de Movilidad del Estado de Chiapas (1 a 25 KM)?',
          style: TextStyle(fontFamily: 'Inter', fontSize: 14, color: Colors.black87),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancelar', style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w600)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            onPressed: () {
              Navigator.pop(ctx);
              setState(() {
                _banderazoController.text = '25.00';
                _precioKmExtraController.text = '7.50';
                _costoMinutoController.text = '0.00';
                _activarMapaCalorDemanda = false;
                _activarZonasManuales = false;
                _tabulador = PricingService.defaultTabuladorOficial
                    .map((e) => KmTarifaItem.fromJson(e))
                    .toList();
              });
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Valores restablecidos a la tarifa oficial.'),
                  backgroundColor: Colors.black,
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
            child: const Text('Restablecer', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  void _addNewKm() {
    setState(() {
      int nextKm = 1;
      double suggestedPrice = 25.0;

      if (_tabulador.isNotEmpty) {
        nextKm = _tabulador.last.km + 1;
        final double extraRate = double.tryParse(_precioKmExtraController.text.trim()) ?? 7.50;
        suggestedPrice = (_tabulador.last.tarifa + extraRate).roundToDouble();
      }

      _tabulador.add(KmTarifaItem(km: nextKm, tarifa: suggestedPrice));
    });
  }

  void _removeKm(int index) {
    if (_tabulador.length <= 1) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Debe existir al menos 1 kilómetro en el tabulador.'),
          backgroundColor: Colors.black87,
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }
    setState(() {
      _tabulador.removeAt(index);
    });
  }

  void _editKmDialog(int index) {
    final item = _tabulador[index];
    final kmCtrl = TextEditingController(text: item.km.toString());
    final tarifaCtrl = TextEditingController(text: item.tarifa.toStringAsFixed(2));

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(
          'Editar KM ${item.km}',
          style: const TextStyle(fontFamily: 'Google Sans', fontWeight: FontWeight.bold, color: Colors.black),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: kmCtrl,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Kilómetro',
                labelStyle: const TextStyle(color: Colors.black87),
                filled: true,
                fillColor: const Color(0xFFF9FAFB),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.grey.shade300)),
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Colors.black, width: 1.5)),
                prefixIcon: const Icon(Icons.add_road, color: Colors.black87),
              ),
            ),
            const SizedBox(height: 14),
            TextField(
              controller: tarifaCtrl,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Tarifa (\$) MXN',
                labelStyle: const TextStyle(color: Colors.black87),
                filled: true,
                fillColor: const Color(0xFFF9FAFB),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.grey.shade300)),
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Colors.black, width: 1.5)),
                prefixIcon: const Icon(Icons.attach_money, color: Colors.black87),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancelar', style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w600)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            onPressed: () {
              final newKm = int.tryParse(kmCtrl.text.trim());
              final newTarifa = double.tryParse(tarifaCtrl.text.trim());
              if (newKm == null || newTarifa == null || newKm <= 0 || newTarifa < 0) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Valores inválidos')),
                );
                return;
              }
              setState(() {
                _tabulador[index] = KmTarifaItem(km: newKm, tarifa: newTarifa);
                _tabulador.sort((a, b) => a.km.compareTo(b.km));
              });
              Navigator.pop(ctx);
            },
            child: const Text('Actualizar', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  double _calculateSimulatedFare(double km) {
    if (_tabulador.isEmpty) return 25.0;

    double base;
    if (km <= _tabulador.first.km) {
      base = _tabulador.first.tarifa;
    } else if (km >= _tabulador.last.km) {
      final double extraRate = double.tryParse(_precioKmExtraController.text.trim()) ?? 7.50;
      final double extraDist = km - _tabulador.last.km;
      base = (_tabulador.last.tarifa + (extraDist * extraRate)).roundToDouble();
    } else {
      base = _tabulador.last.tarifa;
      for (int i = 0; i < _tabulador.length - 1; i++) {
        final cur = _tabulador[i];
        final nxt = _tabulador[i + 1];
        if (km >= cur.km && km <= nxt.km) {
          final double range = (nxt.km - cur.km).toDouble();
          final double fraction = (km - cur.km) / range;
          base = (cur.tarifa + fraction * (nxt.tarifa - cur.tarifa)).roundToDouble();
          break;
        }
      }
    }

    final double minBanderazo = double.tryParse(_banderazoController.text.trim()) ?? 25.0;
    if (base < minBanderazo) base = minBanderazo;

    return base;
  }

  Future<void> _saveConfig() async {
    final double? banderazoVal = double.tryParse(_banderazoController.text.trim());
    final double? extraKmVal = double.tryParse(_precioKmExtraController.text.trim());
    final double? minCostVal = double.tryParse(_costoMinutoController.text.trim());

    if (banderazoVal == null || banderazoVal < 0) {
      _showError('El banderazo debe ser un valor numérico válido mayor o igual a 0.');
      return;
    }
    if (extraKmVal == null || extraKmVal < 0) {
      _showError('El costo por KM adicional debe ser un número válido.');
      return;
    }
    if (minCostVal == null || minCostVal < 0) {
      _showError('El costo por minuto debe ser un número válido (0 si no aplica).');
      return;
    }
    if (_tabulador.isEmpty) {
      _showError('El tabulador debe tener al menos 1 registro de KM.');
      return;
    }

    setState(() => _isSaving = true);

    try {
      await PricingService.savePricingConfig(
        mapaCalorDemanda: _activarMapaCalorDemanda,
        zonasManuales: _activarZonasManuales,
        banderazoBase: banderazoVal,
        extraKm: extraKmVal,
        minCost: minCostVal,
        tabulador: _tabulador,
      );

      if (mounted) {
        setState(() => _isSaving = false);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Row(
              children: [
                Icon(Icons.check_circle_outline, color: Colors.white),
                SizedBox(width: 10),
                Text('Configuración guardada exitosamente.', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ],
            ),
            backgroundColor: Colors.black,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isSaving = false);
        _showError('Error al guardar en Supabase: $e');
      }
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.black87,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        title: const Text(
          'Configuración de Tarifas',
          style: TextStyle(fontFamily: 'Google Sans', fontWeight: FontWeight.bold, fontSize: 18),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(color: Colors.grey.shade200, height: 1),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.restore, color: Colors.black87),
            tooltip: 'Restablecer valores oficiales',
            onPressed: _resetToOfficialTabulador,
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator(color: Colors.black))
          : SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Banner descriptivo Minimalista Blanco y Negro con sombra elegante
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.12),
                          blurRadius: 18,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: const Color(0xFF1F1F1F),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.white12),
                              ),
                              child: const Icon(Icons.price_change_outlined, color: Colors.white, size: 24),
                            ),
                            const SizedBox(width: 14),
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Tabulador Oficial por KM',
                                    style: TextStyle(
                                      fontFamily: 'Google Sans',
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 2),
                                  Text(
                                    'Base regulada permanente y activa para todos los viajes',
                                    style: TextStyle(fontFamily: 'Inter', fontSize: 12, color: Colors.white60),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 14),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                          decoration: BoxDecoration(
                            color: const Color(0xFF1A1A1A),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.white10),
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.check_circle_outline, color: Colors.white70, size: 15),
                              SizedBox(width: 8),
                              Text(
                                'Ley de Movilidad y Transporte del Estado de Chiapas',
                                style: TextStyle(color: Colors.white70, fontFamily: 'Inter', fontSize: 11, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Switches de Capas Dinámicas
                  _buildSectionTitle('Aumentos Dinámicos'),
                  const SizedBox(height: 4),
                  Text(
                    'Activa o desactiva de forma independiente las capas de tarifa dinámica:',
                    style: TextStyle(fontFamily: 'Inter', fontSize: 12, color: Colors.grey.shade600),
                  ),
                  const SizedBox(height: 12),

                  // Switch 1: Mapa de Calor por Demanda
                  _buildToggleCard(
                    title: 'Mapa de Calor por Demanda (En vivo)',
                    subtitle: _activarMapaCalorDemanda
                        ? 'Activo: Aplica aumentos por alta densidad de solicitudes en tiempo real.'
                        : 'Desactivado: No aplica aumento por solicitudes ni horario.',
                    icon: Icons.local_fire_department_outlined,
                    value: _activarMapaCalorDemanda,
                    onChanged: (val) => setState(() => _activarMapaCalorDemanda = val),
                  ),
                  const SizedBox(height: 12),

                  // Switch 2: Círculos Manuales del Administrador
                  _buildToggleCard(
                    title: 'Círculos Manuales del Administrador',
                    subtitle: _activarZonasManuales
                        ? 'Activo: Aplica los aumentos de las zonas dibujadas en el mapa.'
                        : 'Desactivado: Ignora los círculos manuales del mapa.',
                    icon: Icons.radio_button_checked_outlined,
                    value: _activarZonasManuales,
                    onChanged: (val) => setState(() => _activarZonasManuales = val),
                  ),

                  const SizedBox(height: 24),

                  // Parámetros Base
                  _buildSectionTitle('Parámetros Base'),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color: Colors.grey.shade200),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.04),
                          blurRadius: 14,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: _buildInputField(
                                controller: _banderazoController,
                                label: 'Banderazo / Mínimo',
                                prefix: '\$',
                                helper: 'Tarifa inicial',
                              ),
                            ),
                            const SizedBox(width: 14),
                            Expanded(
                              child: _buildInputField(
                                controller: _precioKmExtraController,
                                label: 'KM Adicional',
                                prefix: '\$',
                                helper: 'A partir del último KM',
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 14),
                        _buildInputField(
                          controller: _costoMinutoController,
                          label: 'Costo por Minuto de Tráfico',
                          prefix: '\$',
                          helper: 'Dejar en 0.00 para no penalizar por tráfico (Tarifa oficial)',
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Simulador en vivo
                  _buildSectionTitle('Simulador de Tarifa en Vivo'),
                  const SizedBox(height: 10),
                  _buildLiveSimulator(),

                  const SizedBox(height: 24),

                  // Lista del Tabulador de Kilómetros
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildSectionTitle('Tabulador por KM (${_tabulador.length} rangos)'),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
                        ),
                        icon: const Icon(Icons.add, size: 16),
                        label: const Text('Añadir KM', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                        onPressed: _addNewKm,
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // Contenedor del Tabulador Minimalista con Sombras
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color: Colors.grey.shade200),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.04),
                          blurRadius: 14,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _tabulador.length,
                      separatorBuilder: (_, _) => Divider(height: 1, indent: 64, endIndent: 20, color: Colors.grey.shade200),
                      itemBuilder: (ctx, idx) {
                        final item = _tabulador[idx];
                        return ListTile(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                          leading: Container(
                            width: 44,
                            height: 44,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: const Color(0xFFF9FAFB),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.grey.shade200),
                            ),
                            child: Text(
                              '${item.km} km',
                              style: const TextStyle(
                                fontFamily: 'Google Sans',
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          title: Text(
                            '\$${item.tarifa.toStringAsFixed(2)} MXN',
                            style: const TextStyle(
                              fontFamily: 'Google Sans',
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          subtitle: Text(
                            idx == 0
                                ? 'Banderazo oficial'
                                : (idx == 1
                                    ? 'Incluido en banderazo'
                                    : (idx < 5 ? 'Tramo 3 a 5 KM' : 'Tramo > 5 KM')),
                            style: TextStyle(fontFamily: 'Inter', fontSize: 11, color: Colors.grey.shade500),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.edit_outlined, size: 20, color: Colors.black87),
                                tooltip: 'Editar precio',
                                onPressed: () => _editKmDialog(idx),
                              ),
                              if (_tabulador.length > 1 && idx == _tabulador.length - 1)
                                IconButton(
                                  icon: Icon(Icons.delete_outline, size: 20, color: Colors.grey.shade600),
                                  tooltip: 'Eliminar último KM',
                                  onPressed: () => _removeKm(idx),
                                ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Botón Guardar Cambios Minimalista Negro
                  Container(
                    width: double.infinity,
                    height: 52,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.15),
                          blurRadius: 14,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      ),
                      onPressed: _isSaving ? null : _saveConfig,
                      child: _isSaving
                          ? const SizedBox(
                              width: 22,
                              height: 22,
                              child: CircularProgressIndicator(strokeWidth: 2.2, color: Colors.white),
                            )
                          : const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.check, size: 20, color: Colors.white),
                                SizedBox(width: 8),
                                Text(
                                  'Guardar Configuración de Tarifas',
                                  style: TextStyle(
                                    fontFamily: 'Google Sans',
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                    ),
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontFamily: 'Google Sans',
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }

  Widget _buildToggleCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: value ? Colors.black87 : Colors.grey.shade200,
          width: value ? 1.2 : 1.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 12,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: value ? Colors.black : const Color(0xFFF3F4F6),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: value ? Colors.white : Colors.black54, size: 20),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontFamily: 'Google Sans', fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: TextStyle(fontFamily: 'Inter', fontSize: 12, color: Colors.grey.shade600),
                ),
              ],
            ),
          ),
          Switch(
            value: value,
            activeThumbColor: Colors.black,
            activeTrackColor: Colors.grey.shade300,
            inactiveThumbColor: Colors.grey.shade400,
            inactiveTrackColor: Colors.grey.shade200,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String label,
    required String prefix,
    required String helper,
  }) {
    return TextField(
      controller: controller,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      onChanged: (_) => setState(() {}),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.black87, fontSize: 13),
        helperText: helper,
        helperMaxLines: 2,
        helperStyle: TextStyle(color: Colors.grey.shade500, fontSize: 11),
        prefixText: '$prefix ',
        prefixStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        filled: true,
        fillColor: const Color(0xFFF9FAFB),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide(color: Colors.grey.shade200)),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide(color: Colors.grey.shade200)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: Colors.black, width: 1.5)),
      ),
    );
  }

  Widget _buildLiveSimulator() {
    final double fare = _calculateSimulatedFare(_simulatedKm);

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Distancia: ${_simulatedKm.toStringAsFixed(1)} KM',
                style: const TextStyle(fontFamily: 'Google Sans', fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.15),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Text(
                  '\$${fare.toStringAsFixed(2)} MXN',
                  style: const TextStyle(
                    fontFamily: 'Google Sans',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: Colors.black,
              inactiveTrackColor: Colors.grey.shade200,
              thumbColor: Colors.black,
              overlayColor: Colors.black.withValues(alpha: 0.06),
            ),
            child: Slider(
              value: _simulatedKm,
              min: 0.5,
              max: 30.0,
              divisions: 59,
              label: '${_simulatedKm.toStringAsFixed(1)} km',
              onChanged: (val) => setState(() => _simulatedKm = val),
            ),
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              _buildBadge(
                label: 'Demanda en vivo: ${_activarMapaCalorDemanda ? "ON" : "OFF"}',
                isActive: _activarMapaCalorDemanda,
              ),
              const SizedBox(width: 8),
              _buildBadge(
                label: 'Círculos del Admin: ${_activarZonasManuales ? "ON" : "OFF"}',
                isActive: _activarZonasManuales,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBadge({required String label, required bool isActive}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: isActive ? Colors.black : const Color(0xFFF3F4F6),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: isActive ? Colors.black : Colors.grey.shade200),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontFamily: 'Inter',
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: isActive ? Colors.white : Colors.grey.shade700,
        ),
      ),
    );
  }
}
