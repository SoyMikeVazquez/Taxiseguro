import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class CorteConductor {
  final String id;
  final String periodoInicio;
  final String periodoFin;
  final String fechaCorte;
  final String conductorId;
  final String nombreConductor;
  final String? correoConductor;
  final String? telefonoConductor;
  final int totalViajes;
  final double totalGenerado;
  final double comisionApp;
  final double totalEfectivo;
  final double totalTarjeta;
  final double saldoAPagar;
  final String estatusPago; // 'pendiente', 'pagado'
  final bool correoEnviado;
  final DateTime? fechaEnvioCorreo;

  CorteConductor({
    required this.id,
    required this.periodoInicio,
    required this.periodoFin,
    required this.fechaCorte,
    required this.conductorId,
    required this.nombreConductor,
    this.correoConductor,
    this.telefonoConductor,
    required this.totalViajes,
    required this.totalGenerado,
    required this.comisionApp,
    required this.totalEfectivo,
    required this.totalTarjeta,
    required this.saldoAPagar,
    required this.estatusPago,
    required this.correoEnviado,
    this.fechaEnvioCorreo,
  });

  factory CorteConductor.fromJson(Map<String, dynamic> json) {
    return CorteConductor(
      id: json['id']?.toString() ?? '',
      periodoInicio: json['periodo_inicio']?.toString() ?? '',
      periodoFin: json['periodo_fin']?.toString() ?? '',
      fechaCorte: json['fecha_corte']?.toString() ?? '',
      conductorId: json['conductor_id']?.toString() ?? '',
      nombreConductor: json['nombre_conductor']?.toString() ?? 'Conductor',
      correoConductor: json['correo_conductor']?.toString(),
      telefonoConductor: json['telefono_conductor']?.toString(),
      totalViajes: (json['total_viajes'] as num?)?.toInt() ?? 0,
      totalGenerado: (json['total_generado'] as num?)?.toDouble() ?? 0.0,
      comisionApp: (json['comision_app'] as num?)?.toDouble() ?? 0.0,
      totalEfectivo: (json['total_efectivo'] as num?)?.toDouble() ?? 0.0,
      totalTarjeta: (json['total_tarjeta'] as num?)?.toDouble() ?? 0.0,
      saldoAPagar: (json['saldo_a_pagar'] as num?)?.toDouble() ?? 0.0,
      estatusPago: json['estatus_pago']?.toString() ?? 'pendiente',
      correoEnviado: json['correo_enviado'] == true,
      fechaEnvioCorreo: json['fecha_envio_correo'] != null
          ? DateTime.tryParse(json['fecha_envio_correo'].toString())
          : null,
    );
  }
}

class CortePeriodoGroup {
  final String periodoInicio;
  final String periodoFin;
  final double totalCobrar;
  final int totalViajes;
  final List<CorteConductor> cortes;

  CortePeriodoGroup({
    required this.periodoInicio,
    required this.periodoFin,
    required this.totalCobrar,
    required this.totalViajes,
    required this.cortes,
  });

  String get periodoLabel => '$periodoInicio al $periodoFin';
}

class CorteService {
  final SupabaseClient _supabase = Supabase.instance.client;

  /// Consulta todos los cortes registrados y los agrupa por periodo de 2 días
  Future<List<CortePeriodoGroup>> obtenerCortesAgrupados() async {
    try {
      final res = await _supabase
          .from('cortes_conductores')
          .select()
          .order('periodo_fin', ascending: false)
          .order('saldo_a_pagar', ascending: false);

      final List<dynamic> rows = (res as List<dynamic>?) ?? [];
      final List<CorteConductor> list = rows.map((r) => CorteConductor.fromJson(r)).toList();

      final Map<String, List<CorteConductor>> grouped = {};
      for (var c in list) {
        final key = '${c.periodoInicio}_${c.periodoFin}';
        grouped.putIfAbsent(key, () => []).add(c);
      }

      final List<CortePeriodoGroup> result = [];
      grouped.forEach((key, cortes) {
        final double sumCobrar = cortes.fold(0.0, (acc, item) => acc + item.saldoAPagar);
        final int sumViajes = cortes.fold(0, (acc, item) => acc + item.totalViajes);
        result.add(CortePeriodoGroup(
          periodoInicio: cortes.first.periodoInicio,
          periodoFin: cortes.first.periodoFin,
          totalCobrar: sumCobrar,
          totalViajes: sumViajes,
          cortes: cortes,
        ));
      });

      return result;
    } catch (e) {
      debugPrint('CorteService: Error al obtener cortes: $e');
      return [];
    }
  }

  /// Genera o recalcula el corte de 2 días a partir de los viajes completados en Supabase
  Future<bool> generarCorte2Dias({DateTime? inicio, DateTime? fin}) async {
    try {
      final now = DateTime.now();
      final DateTime endDateTime = fin ?? DateTime(now.year, now.month, now.day, 23, 59, 59);
      final DateTime startDateTime = inicio ?? DateTime(now.year, now.month, now.day).subtract(const Duration(days: 1));

      final String startDateStr = '${startDateTime.year}-${startDateTime.month.toString().padLeft(2, '0')}-${startDateTime.day.toString().padLeft(2, '0')}';
      final String endDateStr = '${endDateTime.year}-${endDateTime.month.toString().padLeft(2, '0')}-${endDateTime.day.toString().padLeft(2, '0')}';
      final String todayDateStr = '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}';

      // 1. Obtener viajes completados en este periodo
      final tripsRes = await _supabase
          .from('trips')
          .select()
          .eq('status', 'completed');

      final List<dynamic> allTrips = (tripsRes as List<dynamic>?) ?? [];

      // 2. Obtener catálogo de conductores
      final driversRes = await _supabase.from('conductores').select();
      final List<dynamic> driversList = (driversRes as List<dynamic>?) ?? [];

      // 3. Filtrar viajes dentro de la ventana de 2 días
      final filteredTrips = allTrips.where((t) {
        final dateStr = t['completed_at'] ?? t['created_at'];
        if (dateStr == null) return false;
        final d = DateTime.tryParse(dateStr.toString())?.toLocal();
        if (d == null) return false;
        return (d.isAfter(startDateTime) || d.isAtSameMomentAs(startDateTime)) &&
               (d.isBefore(endDateTime) || d.isAtSameMomentAs(endDateTime));
      }).toList();

      // 4. Agrupar por driver_id
      final Map<String, List<dynamic>> tripsByDriver = {};
      for (var t in filteredTrips) {
        final driverId = t['driver_id']?.toString();
        if (driverId != null && driverId.isNotEmpty) {
          tripsByDriver.putIfAbsent(driverId, () => []).add(t);
        }
      }

      // Si no hay viajes con conductor pero hay conductores registrados, asegurar cálculo
      if (tripsByDriver.isEmpty) {
        debugPrint('CorteService: No se encontraron viajes completados en el periodo $startDateStr al $endDateStr');
      }

      // 5. Para cada conductor con viajes en el periodo, generar registro de corte
      for (var entry in tripsByDriver.entries) {
        final driverId = entry.key;
        final driverTrips = entry.value;

        // Datos del conductor
        final driverInfo = driversList.firstWhere(
          (d) => d['user_id']?.toString() == driverId || d['id']?.toString() == driverId,
          orElse: () => <String, dynamic>{},
        );

        String nombre = driverInfo['nombre_completo'] ?? driverInfo['nombre'] ?? driverInfo['Nombre'] ?? 'Conductor';
        if (driverInfo['Apellidos'] != null) {
          nombre += ' ${driverInfo['Apellidos']}';
        }
        final String correo = driverInfo['correo'] ?? '';
        final String telefono = driverInfo['telefono'] ?? '';

        double totalFare = 0.0;
        double totalCash = 0.0;
        double totalCard = 0.0;

        for (var t in driverTrips) {
          final fare = (t['fare'] as num?)?.toDouble() ?? 0.0;
          final method = (t['metodo_pago'] ?? t['payment_method'] ?? 'efectivo').toString().toLowerCase();

          totalFare += fare;
          if (method.contains('tarjeta') || method.contains('card') || method.contains('terminal')) {
            totalCard += fare;
          } else {
            totalCash += fare;
          }
        }

        final double comisionApp = totalFare * 0.20; // 20% Comisión TaxiSeguro

        // Lo que el conductor debe transferir:
        // Cobró totalCash en mano. Debe el 20% de ese efectivo.
        // Si tuvo viajes con tarjeta, la app tiene retenido el 80% que le pertenece al conductor.
        final double comisionEfectivoAdeudada = totalCash * 0.20;
        final double gananciaTarjetaRetenida = totalCard * 0.80;
        final double saldoNetoAPagar = comisionEfectivoAdeudada - gananciaTarjetaRetenida;
        final double saldoFinal = saldoNetoAPagar > 0 ? saldoNetoAPagar : 0.0;

        // Upsert en la tabla cortes_conductores
        await _supabase.from('cortes_conductores').upsert({
          'periodo_inicio': startDateStr,
          'periodo_fin': endDateStr,
          'fecha_corte': todayDateStr,
          'conductor_id': driverId,
          'nombre_conductor': nombre,
          'correo_conductor': correo,
          'telefono_conductor': telefono,
          'total_viajes': driverTrips.length,
          'total_generado': totalFare,
          'comision_app': comisionApp,
          'total_efectivo': totalCash,
          'total_tarjeta': totalCard,
          'saldo_a_pagar': saldoFinal,
          'estatus_pago': 'pendiente',
        }, onConflict: 'conductor_id,periodo_inicio,periodo_fin');
      }

      return true;
    } catch (e) {
      debugPrint('CorteService: Error al generar corte de 2 días: $e');
      return false;
    }
  }

  /// Marca un corte como pagado
  Future<bool> marcarCortePagado(String corteId) async {
    try {
      await _supabase.from('cortes_conductores').update({
        'estatus_pago': 'pagado',
      }).eq('id', corteId);
      return true;
    } catch (e) {
      debugPrint('CorteService: Error al marcar como pagado: $e');
      return false;
    }
  }

  /// Marca que el correo de cobro ha sido enviado
  Future<bool> marcarCorreoEnviado(String corteId) async {
    try {
      await _supabase.from('cortes_conductores').update({
        'correo_enviado': true,
        'fecha_envio_correo': DateTime.now().toUtc().toIso8601String(),
      }).eq('id', corteId);
      return true;
    } catch (e) {
      debugPrint('CorteService: Error al marcar correo enviado: $e');
      return false;
    }
  }

  /// Genera y abre el cliente de correo para enviar la solicitud de pago de corte al conductor
  Future<bool> enviarCorreoCobro(CorteConductor corte) async {
    final email = corte.correoConductor?.trim();
    if (email == null || email.isEmpty || !email.contains('@')) {
      return false;
    }

    final subject = 'TaxiSeguro - Corte de Comisiones [Periodo: ${corte.periodoInicio} al ${corte.periodoFin}]';
    final body = '''Hola ${corte.nombreConductor},

Te saludamos del equipo administrativo de TaxiSeguro.

Se ha generado tu corte de comisiones correspondiente al periodo de 2 días (${corte.periodoInicio} al ${corte.periodoFin}):

RESUMEN DE VIAJES:
• Viajes Completados: ${corte.totalViajes}
• Total Generado en el Periodo: \$${corte.totalGenerado.toStringAsFixed(2)} MXN
• Cobrado en Efectivo: \$${corte.totalEfectivo.toStringAsFixed(2)} MXN
• Cobrado con Tarjeta: \$${corte.totalTarjeta.toStringAsFixed(2)} MXN
• Comisión TaxiSeguro (20%): \$${corte.comisionApp.toStringAsFixed(2)} MXN

---------------------------------------------
TOTAL A TRANSFERIR A TAXISEGURO: \$${corte.saldoAPagar.toStringAsFixed(2)} MXN
---------------------------------------------

DATOS DE TRANSFERENCIA BANCARIA:
Banco: BBVA Bancomer
Beneficiario: TaxiSeguro S.A.P.I. de C.V.
CLABE Interbancaria: 012180015482910293
Referencia: ${corte.nombreConductor} - Corte 2D

Por favor realiza tu transferencia y envía tu comprobante para mantener tu cuenta activa y al día.

Atentamente,
Equipo de Finanzas TaxiSeguro
''';

    final uri = Uri(
      scheme: 'mailto',
      path: email,
      queryParameters: {
        'subject': subject,
        'body': body,
      },
    );

    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
        await marcarCorreoEnviado(corte.id);
        return true;
      } else {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
        await marcarCorreoEnviado(corte.id);
        return true;
      }
    } catch (e) {
      debugPrint('CorteService: Error al lanzar mailto: $e');
      return false;
    }
  }
}
