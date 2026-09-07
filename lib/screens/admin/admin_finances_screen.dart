import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../models/trip.dart';

class AdminFinancesScreen extends StatefulWidget {
  const AdminFinancesScreen({super.key});

  @override
  State<AdminFinancesScreen> createState() => _AdminFinancesScreenState();
}

class _AdminFinancesScreenState extends State<AdminFinancesScreen> {
  int _selectedPeriod = 0; // 0: Día, 1: Quincena, 2: Mes, 3: Personalizado
  DateTimeRange? _customDateRange;
  
  bool _isLoading = true;
  
  double _ingresosBrutos = 0.0;
  double _comisionApp = 0.0;
  double _gananciaConductores = 0.0;
  double _retenciones = 0.0;
  int _totalViajes = 0;
  double _ticketPromedio = 0.0;
  
  List<FlSpot> _chartSpots = [];
  double _maxY = 1000.0;
  double _maxX = 6.0;
  
  final SupabaseClient _supabase = Supabase.instance.client;
  List<Trip> _trips = [];

  @override
  void initState() {
    super.initState();
    _fetchFinances();
  }
  
  DateTime _getStartDateForPeriod() {
    final now = DateTime.now();
    switch (_selectedPeriod) {
      case 0: // Día
        return DateTime(now.year, now.month, now.day);
      case 1: // Quincena
        return DateTime(now.year, now.month, now.day).subtract(const Duration(days: 14));
      case 2: // Mes
        return DateTime(now.year, now.month, now.day).subtract(const Duration(days: 29));
      case 3: // Personalizado
        return _customDateRange?.start ?? DateTime(now.year, now.month, now.day);
      default:
        return DateTime(now.year, now.month, now.day);
    }
  }

  DateTime _getEndDateForPeriod() {
    final now = DateTime.now();
    switch (_selectedPeriod) {
      case 3: // Personalizado
        return _customDateRange?.end.add(const Duration(hours: 23, minutes: 59, seconds: 59)) ?? 
               DateTime(now.year, now.month, now.day, 23, 59, 59);
      default:
        return DateTime(now.year, now.month, now.day, 23, 59, 59);
    }
  }

  Future<void> _fetchFinances() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final startDate = _getStartDateForPeriod();
      final endDate = _getEndDateForPeriod();

      final response = await _supabase
          .from('trips')
          .select()
          .eq('status', 'completed')
          .gte('completed_at', startDate.toIso8601String())
          .lte('completed_at', endDate.toIso8601String());

      _trips = (response as List).map((t) => Trip.fromJson(t)).toList();
      _calculateFinances(startDate, endDate);
    } catch (e) {
      print('Error al cargar finanzas: $e');
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _calculateFinances(DateTime startDate, DateTime endDate) {
    double totalFare = 0.0;
    for (var trip in _trips) {
      totalFare += (trip.fare ?? 0.0);
    }

    _ingresosBrutos = totalFare;
    _comisionApp = totalFare * 0.15;
    _gananciaConductores = totalFare * 0.85;
    _retenciones = totalFare * 0.08; // Estimado 8%
    _totalViajes = _trips.length;
    _ticketPromedio = _totalViajes > 0 ? totalFare / _totalViajes : 0.0;

    _buildChartData(startDate, endDate);
  }

  String _formatDateString(DateTime d) {
    return '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';
  }

  void _buildChartData(DateTime startDate, DateTime endDate) {
    _chartSpots.clear();
    double maxY = 0;
    
    final diff = endDate.difference(startDate);
    final days = diff.inDays;
    
    if (_selectedPeriod == 0 || days == 0) {
      // Bloques de 3 horas
      _maxX = 7.0; 
      List<double> hourlyFares = List.filled(8, 0.0);
      for (var trip in _trips) {
        if (trip.completedAt != null) {
          // Ajustamos hora local
          final localTime = trip.completedAt!.toLocal();
          int block = localTime.hour ~/ 3;
          if (block >= 0 && block < 8) {
            hourlyFares[block] += (trip.fare ?? 0.0);
          }
        }
      }
      for (int i = 0; i < 8; i++) {
        _chartSpots.add(FlSpot(i.toDouble(), hourlyFares[i]));
        if (hourlyFares[i] > maxY) maxY = hourlyFares[i];
      }
    } else {
      // Por días
      _maxX = days.toDouble();
      Map<String, double> dailyFares = {};
      
      for (int i = 0; i <= days; i++) {
        final d = startDate.add(Duration(days: i));
        dailyFares[_formatDateString(d)] = 0.0;
      }
      
      for (var trip in _trips) {
        if (trip.completedAt != null) {
          final key = _formatDateString(trip.completedAt!.toLocal());
          if (dailyFares.containsKey(key)) {
            dailyFares[key] = dailyFares[key]! + (trip.fare ?? 0.0);
          }
        }
      }
      
      int i = 0;
      dailyFares.forEach((key, val) {
        _chartSpots.add(FlSpot(i.toDouble(), val));
        if (val > maxY) maxY = val;
        i++;
      });
    }
    
    _maxY = maxY > 0 ? maxY * 1.2 : 100.0; 
  }

  String _formatCurrency(double amount) {
    String fixed = amount.toStringAsFixed(2);
    final parts = fixed.split('.');
    final reg = RegExp(r'\B(?=(\d{3})+(?!\d))');
    parts[0] = parts[0].replaceAll(reg, ',');
    return '\$${parts[0]}.${parts[1]}';
  }

  Future<void> _selectCustomDateRange() async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2023),
      lastDate: DateTime.now(),
      initialDateRange: _customDateRange ?? DateTimeRange(
        start: DateTime.now().subtract(const Duration(days: 7)),
        end: DateTime.now(),
      ),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.black, // header background color
              onPrimary: Colors.white, // header text color
              onSurface: Colors.black, // body text color
            ),
          ),
          child: child!,
        );
      },
    );
    
    if (picked != null) {
      setState(() {
        _selectedPeriod = 3;
        _customDateRange = picked;
      });
      _fetchFinances();
    } else if (_selectedPeriod == 3 && _customDateRange == null) {
      setState(() {
        _selectedPeriod = 0;
      });
    }
  }

  void _onPeriodChanged(int index) {
    if (index == 3) {
      _selectCustomDateRange();
    } else {
      setState(() {
        _selectedPeriod = index;
      });
      _fetchFinances();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: const Text(
          'Finanzas Globales',
          style: TextStyle(fontFamily: 'Google Sans', fontWeight: FontWeight.bold, color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: _isLoading 
        ? const Center(child: CircularProgressIndicator(color: Colors.black))
        : ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // Selector de Periodo
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(24),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildPeriodTab('Día', 0),
                  _buildPeriodTab('Quincena', 1),
                  _buildPeriodTab('Mes', 2),
                  _buildPeriodTab('Custom', 3),
                ],
              ),
            ),
          ),
          
          if (_selectedPeriod == 3 && _customDateRange != null)
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Center(
                child: Text(
                  '${_customDateRange!.start.day}/${_customDateRange!.start.month}/${_customDateRange!.start.year} - ${_customDateRange!.end.day}/${_customDateRange!.end.month}/${_customDateRange!.end.year}',
                  style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black54),
                ),
              ),
            ),
          
          const SizedBox(height: 20),

          // Tarjetas de Métricas Rápidas
          Row(
            children: [
              Expanded(
                child: _buildSummaryCard(
                  'Ingresos Brutos',
                  '${_formatCurrency(_ingresosBrutos)} MXN',
                  'Total',
                  Colors.black,
                  Icons.trending_up,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildSummaryCard(
                  'Comisión App (15%)',
                  '${_formatCurrency(_comisionApp)} MXN',
                  'Bruto',
                  const Color(0xFFC7FF2E),
                  Icons.account_balance,
                  isDark: true,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Gráfica de Línea de Ingresos (fl_chart)
          Container(
            padding: const EdgeInsets.fromLTRB(16, 20, 20, 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(28),
              boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 15, offset: const Offset(0, 6))],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    'Evolución de Ingresos (MXN)',
                    style: TextStyle(fontFamily: 'Google Sans', fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                const SizedBox(height: 4),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    _selectedPeriod == 0 ? 'Ingresos cada 3 horas' : 'Ingresos diarios generados por la flota',
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  height: 220,
                  child: LineChart(
                    LineChartData(
                      gridData: FlGridData(
                        show: true,
                        drawVerticalLine: false,
                        getDrawingHorizontalLine: (value) => FlLine(color: Colors.grey.shade200, strokeWidth: 1),
                      ),
                      titlesData: FlTitlesData(
                        rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 46,
                            getTitlesWidget: (value, meta) {
                              if (value == _maxY) return const SizedBox.shrink();
                              return Padding(
                                padding: const EdgeInsets.only(right: 6.0),
                                child: Text(
                                  '\$${(value / 1000).toStringAsFixed(1)}k',
                                  style: const TextStyle(color: Colors.grey, fontSize: 10),
                                ),
                              );
                            },
                          ),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 26,
                            interval: 1,
                            getTitlesWidget: (value, meta) {
                              final int val = value.toInt();
                              final diff = _getEndDateForPeriod().difference(_getStartDateForPeriod());
                              final days = diff.inDays;
                              
                              if (_selectedPeriod == 0 || days == 0) {
                                 final labels = ['12a', '3a', '6a', '9a', '12p', '3p', '6p', '9p'];
                                 if (val >= 0 && val < labels.length) {
                                   return Padding(
                                     padding: const EdgeInsets.only(top: 6.0),
                                     child: Text(labels[val], style: const TextStyle(color: Colors.black87, fontSize: 10, fontWeight: FontWeight.bold)),
                                   );
                                 }
                              } else {
                                 int step = 1;
                                 if (days > 45) step = 10;
                                 else if (days > 20) step = 5;
                                 else if (days > 10) step = 3;
                                 else if (days > 7) step = 2;
                                 
                                 if (val % step == 0 && val <= days) {
                                    final d = _getStartDateForPeriod().add(Duration(days: val));
                                    return Padding(
                                      padding: const EdgeInsets.only(top: 6.0),
                                      child: Text('${d.day}/${d.month}', style: const TextStyle(color: Colors.black87, fontSize: 10, fontWeight: FontWeight.bold)),
                                    );
                                 }
                              }
                              return const SizedBox.shrink();
                            },
                          ),
                        ),
                      ),
                      borderData: FlBorderData(show: false),
                      minX: 0,
                      maxX: _maxX,
                      minY: 0,
                      maxY: _maxY,
                      lineBarsData: [
                        LineChartBarData(
                          spots: _chartSpots.isEmpty ? const [FlSpot(0, 0)] : _chartSpots,
                          isCurved: true,
                          color: const Color(0xFFC7FF2E),
                          barWidth: 4,
                          isStrokeCapRound: true,
                          belowBarData: BarAreaData(
                            show: true,
                            color: const Color(0xFFC7FF2E).withValues(alpha: 0.25),
                          ),
                          dotData: FlDotData(show: _maxX <= 15),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ).animate().fade(duration: 400.ms).slideY(begin: 0.1, end: 0),
          
          const SizedBox(height: 20),

          // Desglose de Distribución Financiera
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(28),
              boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 15, offset: const Offset(0, 6))],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Desglose de Reparto de Ganancias',
                  style: TextStyle(fontFamily: 'Google Sans', fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 16),
                _buildFinanceRow('Ganancia Conductores (85%)', _formatCurrency(_gananciaConductores), Colors.black87),
                _buildFinanceRow('Comisión Taxiseguro (15%)', _formatCurrency(_comisionApp), Colors.green),
                _buildFinanceRow('Retenciones fiscales (estimado 8%)', _formatCurrency(_retenciones), Colors.orange),
                const Divider(height: 24),
                _buildFinanceRow('Ticket Promedio por Viaje', _formatCurrency(_ticketPromedio), Colors.black, isBold: true),
                _buildFinanceRow('Total Viajes en el Periodo', '$_totalViajes viajes', Colors.black, isBold: true),
              ],
            ),
          ).animate().fade(duration: 400.ms, delay: 150.ms).slideY(begin: 0.1, end: 0),
        ],
      ),
    );
  }

  Widget _buildPeriodTab(String title, int index) {
    final bool isSelected = _selectedPeriod == index;
    return GestureDetector(
      onTap: () => _onPeriodChanged(index),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          boxShadow: isSelected ? [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 4)] : null,
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
            fontFamily: 'Google Sans',
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            color: isSelected ? Colors.black : Colors.black54,
            fontSize: 13,
          ),
        ),
      ),
    );
  }

  Widget _buildSummaryCard(String title, String amount, String growth, Color accentColor, IconData icon, {bool isDark = false}) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: isDark ? Colors.black : Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(icon, color: accentColor, size: 22),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: (isDark ? Colors.white24 : Colors.green.shade50),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  growth,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: isDark ? const Color(0xFFC7FF2E) : Colors.green.shade800,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text(title, style: TextStyle(color: isDark ? Colors.white70 : Colors.black54, fontSize: 12)),
          const SizedBox(height: 4),
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Text(
              amount,
              style: TextStyle(
                fontFamily: 'Google Sans',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: isDark ? Colors.white : Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFinanceRow(String label, String value, Color valueColor, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Text(label, style: TextStyle(color: Colors.black87, fontSize: 13, fontWeight: isBold ? FontWeight.bold : FontWeight.normal))),
          Text(value, style: TextStyle(color: valueColor, fontSize: 13, fontWeight: isBold ? FontWeight.bold : FontWeight.w600)),
        ],
      ),
    );
  }
}
