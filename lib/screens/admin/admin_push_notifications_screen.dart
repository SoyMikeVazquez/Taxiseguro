import 'package:flutter/material.dart';
import '../../services/onesignal_service.dart';
import '../../env/env.dart';

enum PushAudience { drivers, passengers, all, specificUser }

class AdminPushNotificationsScreen extends StatefulWidget {
  const AdminPushNotificationsScreen({super.key});

  @override
  State<AdminPushNotificationsScreen> createState() => _AdminPushNotificationsScreenState();
}

class _AdminPushNotificationsScreenState extends State<AdminPushNotificationsScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _bodyController = TextEditingController();
  final _userIdController = TextEditingController();
  final _apiKeyController = TextEditingController(text: Env.oneSignalRestApiKey);

  PushAudience _selectedAudience = PushAudience.drivers;
  bool _isSending = false;
  final List<Map<String, dynamic>> _sentHistory = [];

  @override
  void dispose() {
    _titleController.dispose();
    _bodyController.dispose();
    _userIdController.dispose();
    _apiKeyController.dispose();
    super.dispose();
  }

  String get _audienceLabel {
    switch (_selectedAudience) {
      case PushAudience.drivers:
        return 'Todos los Conductores';
      case PushAudience.passengers:
        return 'Todos los Pasajeros';
      case PushAudience.all:
        return 'Toda la Comunidad (Conductores y Pasajeros)';
      case PushAudience.specificUser:
        return 'Usuario Especifico';
    }
  }

  Future<void> _sendNotification() async {
    if (!_formKey.currentState!.validate()) return;

    final title = _titleController.text.trim();
    final body = _bodyController.text.trim();
    final customKey = _apiKeyController.text.trim();

    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text('Confirmar Envio Push'),
        content: Text(
          '¿Deseas enviar esta notificacion a $_audienceLabel?\n\nLos dispositivos en reposo recibiran la alerta con sonido y vibracion.',
          style: const TextStyle(fontSize: 14, height: 1.4),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancelar', style: TextStyle(color: Colors.grey)),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              foregroundColor: const Color(0xFFC7FF2E),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            child: const Text('Confirmar y Enviar'),
          ),
        ],
      ),
    );

    if (confirm != true) return;

    setState(() => _isSending = true);

    String? targetRole;
    List<String>? targetUserIds;

    switch (_selectedAudience) {
      case PushAudience.drivers:
        targetRole = 'conductor';
        break;
      case PushAudience.passengers:
        targetRole = 'pasajero';
        break;
      case PushAudience.all:
        targetRole = 'todos';
        break;
      case PushAudience.specificUser:
        final uid = _userIdController.text.trim();
        if (uid.isNotEmpty) {
          targetUserIds = [uid];
        }
        break;
    }

    final result = await OneSignalService().sendPushNotification(
      title: title,
      body: body,
      targetRole: targetRole,
      targetUserIds: targetUserIds,
      customApiKey: customKey.isNotEmpty ? customKey : null,
      additionalData: {
        'sent_from': 'super_admin_broadcast',
        'timestamp': DateTime.now().toIso8601String(),
      },
    );

    setState(() => _isSending = false);

    final bool success = result['success'] == true;
    final String message = result['message']?.toString() ?? 'Proceso terminado';

    if (success) {
      _sentHistory.insert(0, {
        'title': title,
        'body': body,
        'audience': _audienceLabel,
        'recipients': result['recipients'] ?? 0,
        'time': DateTime.now(),
      });
      _titleController.clear();
      _bodyController.clear();
    }

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            message,
            style: TextStyle(
              color: success ? Colors.black : Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: success ? const Color(0xFFC7FF2E) : Colors.redAccent,
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 4),
        ),
      );
    }
  }

  void _showApiKeyConfigDialog() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Row(
          children: [
            Icon(Icons.key, color: Colors.black87),
            SizedBox(width: 8),
            Text('OneSignal REST API Key'),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Ingresa tu clave de API REST de OneSignal (se obtiene en OneSignal Dashboard -> Settings -> Keys & IDs).',
              style: TextStyle(fontSize: 13, color: Colors.black54),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _apiKeyController,
              decoration: InputDecoration(
                labelText: 'REST API Key',
                hintText: 'os_v2_app_... o clave secreta',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                isDense: true,
              ),
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(ctx);
              setState(() {});
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            child: const Text('Guardar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const lime = Color(0xFFC7FF2E);

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: const Text(
          'Difusion Push OneSignal',
          style: TextStyle(
            fontFamily: 'Google Sans',
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        actions: [
          IconButton(
            icon: const Icon(Icons.vpn_key_outlined, color: Colors.black87),
            tooltip: 'Configurar REST API Key',
            onPressed: _showApiKeyConfigDialog,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Estado de conexion OneSignal
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.03),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: lime.withValues(alpha: 0.2),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.notifications_active, color: Colors.black, size: 22),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'OneSignal Push Server',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            _apiKeyController.text.trim().isNotEmpty
                                ? 'REST API Key configurada y lista.'
                                : 'Toca la llave arriba para configurar tu REST API Key.',
                            style: TextStyle(
                              fontSize: 12,
                              color: _apiKeyController.text.trim().isNotEmpty
                                  ? Colors.green[700]
                                  : Colors.orange[800],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: _showApiKeyConfigDialog,
                      child: const Text('Configurar', style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Selector de Audiencia
              const Text(
                'Audiencia Objetivo',
                style: TextStyle(
                  fontFamily: 'Google Sans',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Selecciona quien recibira la notificacion en su dispositivo móvil (iOS y Android).',
                style: TextStyle(fontSize: 12, color: Colors.black54),
              ),
              const SizedBox(height: 14),

              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  _buildAudienceChip(
                    title: 'Solo Conductores',
                    icon: Icons.local_taxi,
                    audience: PushAudience.drivers,
                  ),
                  _buildAudienceChip(
                    title: 'Solo Pasajeros',
                    icon: Icons.person_outline,
                    audience: PushAudience.passengers,
                  ),
                  _buildAudienceChip(
                    title: 'Toda la Comunidad',
                    icon: Icons.people_outline,
                    audience: PushAudience.all,
                  ),
                  _buildAudienceChip(
                    title: 'Usuario Especifico',
                    icon: Icons.account_circle_outlined,
                    audience: PushAudience.specificUser,
                  ),
                ],
              ),

              if (_selectedAudience == PushAudience.specificUser) ...[
                const SizedBox(height: 14),
                TextFormField(
                  controller: _userIdController,
                  decoration: InputDecoration(
                    labelText: 'User ID (UUID de Supabase)',
                    hintText: 'Ej. 7ec9bc58-8d74-4ea1-81cb-0c79858ec359',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  validator: (val) {
                    if (_selectedAudience == PushAudience.specificUser && (val == null || val.trim().isEmpty)) {
                      return 'Ingresa el User ID del destinatario';
                    }
                    return null;
                  },
                ),
              ],

              const SizedBox(height: 24),

              // Formulario de Mensaje
              const Text(
                'Redactar Notificacion',
                style: TextStyle(
                  fontFamily: 'Google Sans',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),

              TextFormField(
                controller: _titleController,
                maxLength: 65,
                decoration: InputDecoration(
                  labelText: 'Titulo de la Notificacion',
                  hintText: 'Ej. ¡Alta demanda de viajes en tu zona!',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                  filled: true,
                  fillColor: Colors.white,
                ),
                onChanged: (_) => setState(() {}),
                validator: (val) {
                  if (val == null || val.trim().isEmpty) {
                    return 'Ingresa un titulo para la notificacion';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 12),

              TextFormField(
                controller: _bodyController,
                maxLength: 180,
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: 'Mensaje / Contenido',
                  hintText: 'Ej. Hay decenas de solicitudes de taxi esperando. Conéctate ahora.',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                  filled: true,
                  fillColor: Colors.white,
                ),
                onChanged: (_) => setState(() {}),
                validator: (val) {
                  if (val == null || val.trim().isEmpty) {
                    return 'Ingresa el contenido de la notificacion';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              // Vista Previa Interactiva de la Notificación en Vivo
              const Text(
                'Vista Previa en Dispositivo (iOS & Android)',
                style: TextStyle(
                  fontFamily: 'Google Sans',
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 10),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E1E22),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 4)),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: lime,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(Icons.local_taxi, color: Colors.black, size: 14),
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'TAXISEGURO',
                          style: TextStyle(
                            fontFamily: 'Google Sans',
                            fontSize: 12,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                            letterSpacing: 0.8,
                          ),
                        ),
                        const Spacer(),
                        const Text(
                          'Ahora',
                          style: TextStyle(fontSize: 11, color: Colors.white54),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      _titleController.text.trim().isNotEmpty
                          ? _titleController.text.trim()
                          : 'Titulo de ejemplo de notificacion',
                      style: const TextStyle(
                        fontFamily: 'Google Sans',
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      _bodyController.text.trim().isNotEmpty
                          ? _bodyController.text.trim()
                          : 'Mensaje descriptivo que recibiran los conductores o pasajeros con sonido y vibracion.',
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 13,
                        color: Colors.white70,
                        height: 1.3,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              // Boton Enviar
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton.icon(
                  onPressed: _isSending ? null : _sendNotification,
                  icon: _isSending
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2, color: Colors.black),
                        )
                      : const Icon(Icons.send_rounded, color: Colors.black),
                  label: Text(
                    _isSending ? 'Enviando Notificacion...' : 'Enviar Notificacion Push',
                    style: const TextStyle(
                      fontFamily: 'Google Sans',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: lime,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    elevation: 0,
                  ),
                ),
              ),

              // Historial reciente de envíos
              if (_sentHistory.isNotEmpty) ...[
                const SizedBox(height: 36),
                const Text(
                  'Envios Recientes de esta Sesion',
                  style: TextStyle(
                    fontFamily: 'Google Sans',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _sentHistory.length,
                  itemBuilder: (context, index) {
                    final item = _sentHistory[index];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.black12),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.check_circle, color: Colors.green, size: 22),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item['title'],
                                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  'Audiencia: ${item['audience']} • ${item['recipients']} dispositivo(s)',
                                  style: TextStyle(fontSize: 11, color: Colors.grey[600]),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAudienceChip({
    required String title,
    required IconData icon,
    required PushAudience audience,
  }) {
    final isSelected = _selectedAudience == audience;
    const lime = Color(0xFFC7FF2E);

    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        setState(() {
          _selectedAudience = audience;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? Colors.black : Colors.grey[300]!,
            width: isSelected ? 1.5 : 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 18,
              color: isSelected ? lime : Colors.black87,
            ),
            const SizedBox(width: 8),
            Text(
              title,
              style: TextStyle(
                fontFamily: 'Google Sans',
                fontWeight: FontWeight.bold,
                fontSize: 13,
                color: isSelected ? Colors.white : Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
