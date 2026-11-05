import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../services/brevo_service.dart';

enum EmailAudience { passengers, drivers, all, test }

class AdminMassEmailScreen extends StatefulWidget {
  const AdminMassEmailScreen({super.key});

  @override
  State<AdminMassEmailScreen> createState() => _AdminMassEmailScreenState();
}

class _AdminMassEmailScreenState extends State<AdminMassEmailScreen> with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();

  // Controladores de texto
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();
  final _ctaTextController = TextEditingController();
  final _ctaUrlController = TextEditingController();
  final _testEmailController = TextEditingController();

  // Estado
  EmailAudience _selectedAudience = EmailAudience.passengers;
  bool _isLoadingData = true;
  bool _isSending = false;
  bool _showCtaFields = false;
  int _sendProgressCurrent = 0;
  int _sendProgressTotal = 0;

  // Listas de destinatarios de Supabase
  List<BrevoRecipient> _passengers = [];
  List<BrevoRecipient> _drivers = [];
  Map<String, dynamic>? _brevoAccountInfo;

  @override
  void initState() {
    super.initState();
    _loadRecipientsAndAccount();
  }

  @override
  void dispose() {
    _subjectController.dispose();
    _messageController.dispose();
    _ctaTextController.dispose();
    _ctaUrlController.dispose();
    _testEmailController.dispose();
    super.dispose();
  }

  Future<void> _loadRecipientsAndAccount() async {
    setState(() => _isLoadingData = true);
    final supabase = Supabase.instance.client;

    try {
      // 1. Cargar info de Brevo
      final accountInfo = await BrevoService.getAccountInfo();

      // 2. Cargar usuarios (pasajeros) con correo válido
      final usersRes = await supabase
          .from('users')
          .select('nombre, correo')
          .not('correo', 'is', null);

      final List<BrevoRecipient> loadedPassengers = [];
      final Set<String> passengerEmails = {};
      for (var u in usersRes) {
        final email = (u['correo'] ?? '').toString().trim();
        final name = (u['nombre'] ?? 'Pasajero').toString().trim();
        if (_isValidEmail(email) && !passengerEmails.contains(email.toLowerCase())) {
          passengerEmails.add(email.toLowerCase());
          loadedPassengers.add(BrevoRecipient(email: email, name: name.isNotEmpty ? name : 'Pasajero'));
        }
      }

      // 3. Cargar conductores con correo válido
      final driversRes = await supabase
          .from('conductores')
          .select('nombre, nombre_completo, correo')
          .not('correo', 'is', null);

      final List<BrevoRecipient> loadedDrivers = [];
      final Set<String> driverEmails = {};
      for (var d in driversRes) {
        final email = (d['correo'] ?? '').toString().trim();
        final name = (d['nombre_completo'] ?? d['nombre'] ?? 'Conductor').toString().trim();
        if (_isValidEmail(email) && !driverEmails.contains(email.toLowerCase())) {
          driverEmails.add(email.toLowerCase());
          loadedDrivers.add(BrevoRecipient(email: email, name: name.isNotEmpty ? name : 'Conductor'));
        }
      }

      if (mounted) {
        setState(() {
          _brevoAccountInfo = accountInfo;
          _passengers = loadedPassengers;
          _drivers = loadedDrivers;
          _isLoadingData = false;
        });
      }
    } catch (e) {
      print('Error cargando destinatarios para Brevo: $e');
      if (mounted) {
        setState(() => _isLoadingData = false);
      }
    }
  }

  bool _isValidEmail(String email) {
    if (email.isEmpty) return false;
    final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return regex.hasMatch(email);
  }

  List<BrevoRecipient> get _currentRecipients {
    switch (_selectedAudience) {
      case EmailAudience.passengers:
        return _passengers;
      case EmailAudience.drivers:
        return _drivers;
      case EmailAudience.all:
        // Combinar evitando correos duplicados
        final Map<String, BrevoRecipient> all = {};
        for (var p in _passengers) {
          all[p.email.toLowerCase()] = p;
        }
        for (var d in _drivers) {
          all[d.email.toLowerCase()] = d;
        }
        return all.values.toList();
      case EmailAudience.test:
        final testEmail = _testEmailController.text.trim();
        if (_isValidEmail(testEmail)) {
          return [BrevoRecipient(email: testEmail, name: 'Prueba Admin')];
        }
        return [];
    }
  }

  void _applyTemplate({
    required String subject,
    required String message,
    String? ctaText,
    String? ctaUrl,
  }) {
    setState(() {
      _subjectController.text = subject;
      _messageController.text = message;
      if (ctaText != null) {
        _showCtaFields = true;
        _ctaTextController.text = ctaText;
        _ctaUrlController.text = ctaUrl ?? 'https://taxiseguro.net';
      } else {
        _showCtaFields = false;
        _ctaTextController.clear();
        _ctaUrlController.clear();
      }
    });
  }

  void _showPreviewDialog() {
    final title = _subjectController.text.trim().isEmpty ? 'Asunto del Correo' : _subjectController.text.trim();
    final message = _messageController.text.trim().isEmpty
        ? 'Este es un ejemplo de cómo se verá el contenido de tu correo electrónico enviado mediante la API de Brevo a través de TaxiSeguro.'
        : _messageController.text.trim();
    final ctaText = _showCtaFields ? _ctaTextController.text.trim() : null;

    showDialog(
      context: context,
      builder: (ctx) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Container(
          constraints: const BoxConstraints(maxWidth: 520),
          decoration: BoxDecoration(
            color: const Color(0xFFF3F4F6),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Barra superior modal
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.visibility, size: 20, color: Colors.black87),
                        SizedBox(width: 8),
                        Text(
                          'Vista Previa del Correo',
                          style: TextStyle(fontFamily: 'Google Sans', fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ],
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(ctx),
                      visualDensity: VisualDensity.compact,
                    ),
                  ],
                ),
              ),
              const Divider(height: 1),

              // Contenido simulado del email
              Flexible(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 15,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Header del correo
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
                          decoration: const BoxDecoration(
                            color: Color(0xFF121212),
                            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                          ),
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFC7FF2E),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Text(
                                  'TAXISEGURO',
                                  style: TextStyle(
                                    fontFamily: 'Google Sans',
                                    fontWeight: FontWeight.w900,
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 6),
                              const Text(
                                'Tu viaje confiable y seguro',
                                style: TextStyle(fontSize: 12, color: Colors.white70),
                              ),
                            ],
                          ),
                        ),

                        // Cuerpo
                        Padding(
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                title,
                                style: const TextStyle(
                                  fontFamily: 'Google Sans',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              const SizedBox(height: 14),
                              const Text(
                                'Hola [Nombre del Destinatario],',
                                style: TextStyle(fontFamily: 'Inter', fontSize: 14, color: Colors.black54),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                message,
                                style: const TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 14,
                                  color: Colors.black87,
                                  height: 1.5,
                                ),
                              ),
                              if (ctaText != null && ctaText.isNotEmpty) ...[
                                const SizedBox(height: 24),
                                Center(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFC7FF2E),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Text(
                                      ctaText,
                                      style: const TextStyle(
                                        fontFamily: 'Google Sans',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                              const SizedBox(height: 24),
                              const Divider(),
                              const SizedBox(height: 8),
                              const Center(
                                child: Text(
                                  'Enviado oficialmente por TaxiSeguro desde admin@taxiseguro.net',
                                  style: TextStyle(fontSize: 11, color: Colors.grey),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Botón cerrar
              Padding(
                padding: const EdgeInsets.all(16),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(ctx),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                    ),
                    child: const Text('Entendido'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _confirmAndSend() async {
    if (!_formKey.currentState!.validate()) return;

    final recipients = _currentRecipients;
    if (recipients.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No hay destinatarios válidos para la audiencia seleccionada.'),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    final String audienceLabel = _selectedAudience == EmailAudience.passengers
        ? 'Usuarios / Pasajeros'
        : _selectedAudience == EmailAudience.drivers
            ? 'Conductores'
            : _selectedAudience == EmailAudience.all
                ? 'Todos (Pasajeros + Conductores)'
                : 'Correo de Prueba (${_testEmailController.text.trim()})';

    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Row(
          children: [
            Icon(Icons.send_rounded, color: Colors.black87),
            SizedBox(width: 8),
            Text('¿Confirmar Envío Masivo?'),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Estás a punto de enviar un correo oficial a través de la API de Brevo a:'),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFF3F4F6),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('• Audiencia: $audienceLabel', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                  const SizedBox(height: 4),
                  Text('• Total de correos: ${recipients.length}', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.green, fontSize: 13)),
                  const SizedBox(height: 4),
                  Text('• Remitente: admin@taxiseguro.net', style: const TextStyle(fontSize: 12, color: Colors.black54)),
                ],
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Cada usuario recibirá un correo individual y privado con el diseño oficial de TaxiSeguro.',
              style: TextStyle(fontSize: 12, color: Colors.black54),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancelar', style: TextStyle(color: Colors.black54)),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFC7FF2E),
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            child: const Text('Sí, Enviar Ahora', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );

    if (confirm != true) return;

    _executeSending(recipients);
  }

  Future<void> _executeSending(List<BrevoRecipient> recipients) async {
    setState(() {
      _isSending = true;
      _sendProgressCurrent = 0;
      _sendProgressTotal = recipients.length;
    });

    final subject = _subjectController.text.trim();
    final message = _messageController.text.trim();
    final ctaText = _showCtaFields ? _ctaTextController.text.trim() : null;
    final ctaUrl = _showCtaFields ? _ctaUrlController.text.trim() : null;

    final htmlContent = BrevoService.buildHtmlTemplate(
      title: subject,
      message: message,
      ctaText: ctaText,
      ctaUrl: ctaUrl,
    );

    // Diálogo de progreso
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (progressCtx) => StatefulBuilder(
        builder: (context, setProgressState) {
          final progress = _sendProgressTotal > 0 ? (_sendProgressCurrent / _sendProgressTotal) : 0.0;
          return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            title: const Text('Enviando Correos...', style: TextStyle(fontFamily: 'Google Sans', fontWeight: FontWeight.bold)),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                LinearProgressIndicator(
                  value: progress,
                  backgroundColor: Colors.grey[200],
                  valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFC7FF2E)),
                  minHeight: 10,
                  borderRadius: BorderRadius.circular(5),
                ),
                const SizedBox(height: 16),
                Text(
                  'Enviando $_sendProgressCurrent de $_sendProgressTotal correos...',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Por favor no cierres esta pantalla.',
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                ),
              ],
            ),
          );
        },
      ),
    );

    final result = await BrevoService.sendMassEmail(
      recipients: recipients,
      subject: subject,
      htmlContent: htmlContent,
      onProgress: (current, total) {
        if (mounted) {
          setState(() {
            _sendProgressCurrent = current;
          });
        }
      },
    );

    if (mounted) {
      Navigator.of(context, rootNavigator: true).pop(); // Cierra el diálogo de progreso
      setState(() => _isSending = false);

      // Mostrar resumen de éxito
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Row(
            children: [
              Icon(
                result.failedCount == 0 ? Icons.check_circle : Icons.warning_amber_rounded,
                color: result.failedCount == 0 ? Colors.green : Colors.orange,
              ),
              const SizedBox(width: 8),
              const Text('Resumen del Envío'),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                result.failedCount == 0
                    ? '¡Todos los correos fueron enviados con éxito a través de Brevo!'
                    : 'El proceso terminó con algunos envíos pendientes.',
                style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 14),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFF3F4F6),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Enviados con éxito:'),
                        Text('${result.sentCount}', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
                      ],
                    ),
                    if (result.failedCount > 0) ...[
                      const SizedBox(height: 6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Fallidos:'),
                          Text('${result.failedCount}', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(ctx);
                _loadRecipientsAndAccount(); // Actualizar créditos
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text('Aceptar'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentList = _currentRecipients;

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: const Text(
          'Correos Masivos (Brevo)',
          style: TextStyle(fontFamily: 'Google Sans', fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),
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
            padding: const EdgeInsets.only(right: 16.0, top: 8, bottom: 8),
            child: IconButton(
              icon: const Icon(Icons.refresh, color: Colors.black, size: 22),
              tooltip: 'Recargar datos',
              style: IconButton.styleFrom(
                backgroundColor: Colors.grey.shade100,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: _loadRecipientsAndAccount,
            ),
          ),
        ],
      ),
      body: _isLoadingData
          ? const Center(child: CircularProgressIndicator(color: Colors.black))
          : Form(
              key: _formKey,
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  // 1. Tarjeta informativa de Brevo
                  _buildBrevoStatusCard(),

                  const SizedBox(height: 18),

                  // 2. Selector de Audiencia
                  _buildAudienceSection(),

                  const SizedBox(height: 18),

                  // 3. Plantillas Rápidas
                  _buildTemplatesSection(),

                  const SizedBox(height: 18),

                  // 4. Formulario de Redacción
                  _buildComposerSection(),

                  const SizedBox(height: 24),

                  // 5. Botones de Acción (Vista Previa y Enviar)
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: _showPreviewDialog,
                          icon: const Icon(Icons.visibility_outlined, size: 18, color: Colors.black87),
                          label: const Text('Vista Previa', style: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.bold, color: Colors.black87)),
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            side: const BorderSide(color: Colors.black26),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        flex: 2,
                        child: ElevatedButton.icon(
                          onPressed: _isSending ? null : _confirmAndSend,
                          icon: const Icon(Icons.send_rounded, size: 18, color: Colors.black),
                          label: Text(
                            'Enviar (${currentList.length})',
                            style: const TextStyle(fontFamily: 'Google Sans', fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFC7FF2E), // Electric Green
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                            elevation: 0,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),
    );
  }

  Widget _buildBrevoStatusCard() {
    int remainingCredits = 300;
    try {
      final plans = _brevoAccountInfo?['plan'] as List<dynamic>?;
      if (plans != null && plans.isNotEmpty) {
        remainingCredits = (plans[0]['credits'] as num?)?.toInt() ?? 300;
      }
    } catch (_) {}

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
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
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFC7FF2E).withValues(alpha: 0.25),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.mark_email_read, color: Colors.black87, size: 24),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      'API de Brevo Conectada',
                      style: TextStyle(fontFamily: 'Google Sans', fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    const SizedBox(width: 6),
                    Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(color: Color(0xFF10B981), shape: BoxShape.circle),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                const Text(
                  'Remitente: admin@taxiseguro.net',
                  style: TextStyle(fontFamily: 'Inter', fontSize: 12, color: Colors.black54),
                ),
                const SizedBox(height: 2),
                Text(
                  'Créditos disponibles hoy: $remainingCredits correos',
                  style: const TextStyle(fontFamily: 'Inter', fontSize: 11.5, fontWeight: FontWeight.w600, color: Color(0xFF047857)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAudienceSection() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.group_outlined, size: 20, color: Colors.black87),
              SizedBox(width: 8),
              Text(
                'Selecciona la Audiencia',
                style: TextStyle(fontFamily: 'Google Sans', fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _buildAudienceChip('Pasajeros (${_passengers.length})', EmailAudience.passengers, Icons.people_outline),
              _buildAudienceChip('Conductores (${_drivers.length})', EmailAudience.drivers, Icons.local_taxi_outlined),
              _buildAudienceChip('Todos (${_passengers.length + _drivers.length})', EmailAudience.all, Icons.public_outlined),
              _buildAudienceChip('Prueba (1)', EmailAudience.test, Icons.science_outlined),
            ],
          ),
          if (_selectedAudience == EmailAudience.test) ...[
            const SizedBox(height: 14),
            TextFormField(
              controller: _testEmailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Correo electrónico para prueba',
                hintText: 'ej: admin@taxiseguro.net',
                filled: true,
                fillColor: const Color(0xFFF3F4F6),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
                prefixIcon: const Icon(Icons.email_outlined),
              ),
              onChanged: (_) => setState(() {}),
              validator: (val) {
                if (_selectedAudience == EmailAudience.test) {
                  if (val == null || val.trim().isEmpty) return 'Ingresa un correo de prueba';
                  if (!_isValidEmail(val.trim())) return 'Correo no válido';
                }
                return null;
              },
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildAudienceChip(String label, EmailAudience audience, IconData icon) {
    final isSelected = _selectedAudience == audience;
    return InkWell(
      onTap: () => setState(() => _selectedAudience = audience),
      borderRadius: BorderRadius.circular(16),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : const Color(0xFFF3F4F6),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 16, color: isSelected ? const Color(0xFFC7FF2E) : Colors.black87),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
                color: isSelected ? Colors.white : Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTemplatesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 4, bottom: 8),
          child: Text(
            'Plantillas Rápidas',
            style: TextStyle(fontFamily: 'Google Sans', fontWeight: FontWeight.bold, fontSize: 13, color: Colors.black54),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _buildTemplateChip(
                '📢 Comunicado Oficial',
                () => _applyTemplate(
                  subject: 'Información Importante de TaxiSeguro',
                  message: 'Estimado miembro de nuestra comunidad,\n\nQueremos informarte sobre las nuevas actualizaciones y mejoras operativas en la plataforma TaxiSeguro pensadas para brindarte un servicio más ágil, seguro y confiable.',
                  ctaText: 'Ver Novedades',
                  ctaUrl: 'https://taxiseguro.net',
                ),
              ),
              const SizedBox(width: 8),
              _buildTemplateChip(
                '🎁 Promoción Viajes',
                () => _applyTemplate(
                  subject: '¡Viaja con Descuento este Fin de Semana!',
                  message: '¡Aprovecha grandes beneficios!\n\nEste fin de semana disfruta de tus traslados con tarifa preferencial en TaxiSeguro. Solo abre la aplicación, solicita tu viaje y viaja con total seguridad y comodidad.',
                  ctaText: 'Pedir Viaje',
                  ctaUrl: 'https://taxiseguro.net',
                ),
              ),
              const SizedBox(width: 8),
              _buildTemplateChip(
                '🚕 Aviso a Conductores',
                () => _applyTemplate(
                  subject: 'Recordatorio de Fechas de Corte y Bonificaciones',
                  message: 'Estimado conductor aliado,\n\nTe recordamos que la próxima fecha de corte de la plataforma se llevará a cabo puntualmente. Asegúrate de tener tus viajes debidamente cerrados en la app para recibir tus pagos y comisiones en tiempo y forma.',
                  ctaText: 'Ir al Panel',
                  ctaUrl: 'https://taxiseguro.net',
                ),
              ),
              const SizedBox(width: 8),
              _buildTemplateChip(
                '🛠️ Mantenimiento',
                () => _applyTemplate(
                  subject: 'Mantenimiento Programado de la Plataforma',
                  message: 'Aviso importante:\n\nEstaremos realizando labores de optimización y mantenimiento en nuestros servidores para mejorar la velocidad y estabilidad del servicio. Agradecemos tu comprensión.',
                ),
              ),
              const SizedBox(width: 8),
              _buildTemplateChip(
                '✏️ En Blanco',
                () => _applyTemplate(subject: '', message: ''),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTemplateChip(String label, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Text(
          label,
          style: const TextStyle(fontFamily: 'Inter', fontSize: 11.5, fontWeight: FontWeight.w600, color: Colors.black87),
        ),
      ),
    );
  }

  Widget _buildComposerSection() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Redacción del Correo',
            style: TextStyle(fontFamily: 'Google Sans', fontWeight: FontWeight.bold, fontSize: 15),
          ),
          const SizedBox(height: 14),

          // Asunto
          TextFormField(
            controller: _subjectController,
            style: const TextStyle(fontFamily: 'Inter', fontSize: 14, fontWeight: FontWeight.w600),
            decoration: InputDecoration(
              labelText: 'Asunto del Correo *',
              hintText: 'Ej: ¡Novedades importantes en TaxiSeguro!',
              filled: true,
              fillColor: const Color(0xFFF7F8FA),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
              prefixIcon: const Icon(Icons.title, size: 20),
            ),
            validator: (val) {
              if (val == null || val.trim().isEmpty) return 'El asunto es obligatorio';
              return null;
            },
          ),

          const SizedBox(height: 14),

          // Mensaje
          TextFormField(
            controller: _messageController,
            minLines: 6,
            maxLines: 12,
            style: const TextStyle(fontFamily: 'Inter', fontSize: 14, height: 1.5),
            decoration: InputDecoration(
              labelText: 'Contenido del Mensaje *',
              hintText: 'Escribe aquí el cuerpo del correo...',
              alignLabelWithHint: true,
              filled: true,
              fillColor: const Color(0xFFF7F8FA),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
            ),
            validator: (val) {
              if (val == null || val.trim().isEmpty) return 'El contenido del mensaje es obligatorio';
              return null;
            },
          ),

          const SizedBox(height: 14),

          // Toggle botón CTA
          InkWell(
            onTap: () => setState(() => _showCtaFields = !_showCtaFields),
            child: Row(
              children: [
                Icon(
                  _showCtaFields ? Icons.check_box : Icons.check_box_outline_blank,
                  color: _showCtaFields ? Colors.black : Colors.grey,
                  size: 20,
                ),
                const SizedBox(width: 8),
                const Text(
                  'Incluir botón de acción (Call-to-Action)',
                  style: TextStyle(fontFamily: 'Inter', fontSize: 13, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),

          if (_showCtaFields) ...[
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _ctaTextController,
                    style: const TextStyle(fontFamily: 'Inter', fontSize: 13),
                    decoration: InputDecoration(
                      labelText: 'Texto del botón',
                      hintText: 'Ej: Abrir TaxiSeguro',
                      filled: true,
                      fillColor: const Color(0xFFF7F8FA),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide.none),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextFormField(
                    controller: _ctaUrlController,
                    style: const TextStyle(fontFamily: 'Inter', fontSize: 13),
                    decoration: InputDecoration(
                      labelText: 'Enlace (URL)',
                      hintText: 'https://taxiseguro.net',
                      filled: true,
                      fillColor: const Color(0xFFF7F8FA),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide.none),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
