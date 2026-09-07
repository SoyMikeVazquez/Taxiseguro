import 'dart:io';

void main() {
  final file = File('lib/screens/driver_home_screen.dart');
  String content = file.readAsStringSync();

  // Add auth_screen import
  if (!content.contains('auth_screen.dart')) {
    content = content.replaceFirst(
      "import '../services/trip_service.dart';",
      "import '../services/trip_service.dart';\nimport 'auth_screen.dart';"
    );
  }

  // Fix logout button
  content = content.replaceAll(
    "await Supabase.instance.client.auth.signOut();",
    "await Supabase.instance.client.auth.signOut();\n              if (context.mounted) {\n                Navigator.of(context).pushAndRemoveUntil(\n                  MaterialPageRoute(builder: (_) => const AuthScreen()),\n                  (route) => false,\n                );\n              }"
  );

  // Update Finances Dashboard to include Chart
  final newFinancesDashboard = """
  Widget _buildFinancesDashboard() {
    // Generate some mock history ending with today's earnings
    final List<double> chartValues = [
      _todayEarnings * 0.5,
      _todayEarnings * 0.8,
      _todayEarnings * 0.3,
      _todayEarnings * 1.2,
      _todayEarnings * 0.9,
      _todayEarnings * 1.1,
      _todayEarnings,
    ];
    // If today is 0, just show a flat line or some small variation
    if (_todayEarnings == 0) {
      chartValues.fillRange(0, chartValues.length, 10.0); // flat line at 10 to not be completely empty
    }

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.green[700]!, Colors.teal[600]!],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x4D388E3C),
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Total Generado', style: TextStyle(color: Colors.white70, fontSize: 14)),
                  const SizedBox(height: 4),
                  Text(
                    '\\\$\${_todayEarnings.toStringAsFixed(2)}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: const BoxDecoration(
                  color: Color(0x33FFFFFF),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.account_balance_wallet, color: Colors.white, size: 32),
              ),
            ],
          ),
          const SizedBox(height: 24),
          SizedBox(
            height: 80,
            width: double.infinity,
            child: CustomPaint(
              painter: _LineChartPainter(
                chartValues,
                labels: ['Hace 7 días', 'Hoy'],
                textDirection: Directionality.of(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
""";

  content = content.replaceRange(
    content.indexOf("Widget _buildFinancesDashboard() {"),
    content.indexOf("Widget _buildRecentHistoryList() {"),
    newFinancesDashboard
  );

  // Append Painter class
  if (!content.contains('class _LineChartPainter extends CustomPainter')) {
    content += """

class _LineChartPainter extends CustomPainter {
  final List<double> values;
  final List<String> labels;
  final TextDirection textDirection;

  _LineChartPainter(
    this.values, {
    required this.labels,
    required this.textDirection,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (values.isEmpty) return;

    final maxVal = values.reduce((a, b) => a > b ? a : b);
    final n = values.length;

    List<Offset> points = [];
    for (var i = 0; i < n; i++) {
      final x = n == 1 ? size.width / 2 : (i / (n - 1)) * size.width;
      final y = maxVal > 0
          ? size.height - 20 - (values[i] / maxVal) * (size.height - 40)
          : size.height - 20;
      points.add(Offset(x, y));
    }

    if (points.length > 1) {
      final fillPath = Path();
      fillPath.moveTo(points.first.dx, size.height - 20);
      fillPath.lineTo(points.first.dx, points.first.dy);
      for (var i = 1; i < points.length; i++) {
        final prev = points[i - 1];
        final curr = points[i];
        final cpX = (prev.dx + curr.dx) / 2;
        fillPath.cubicTo(cpX, prev.dy, cpX, curr.dy, curr.dx, curr.dy);
      }
      fillPath.lineTo(points.last.dx, size.height - 20);
      fillPath.lineTo(points.first.dx, size.height - 20);

      final rect = Rect.fromLTWH(0, 0, size.width, size.height);
      final gradient = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.white.withOpacity(0.3),
          Colors.white.withOpacity(0.0),
        ],
      );
      final fillPaint = Paint()
        ..shader = gradient.createShader(rect)
        ..style = PaintingStyle.fill;
      canvas.drawPath(fillPath, fillPaint);
    }

    if (points.length > 1) {
      final linePaint = Paint()
        ..color = Colors.white
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.5
        ..strokeCap = StrokeCap.round
        ..strokeJoin = StrokeJoin.round;

      final linePath = Path();
      linePath.moveTo(points.first.dx, points.first.dy);
      for (var i = 1; i < points.length; i++) {
        final prev = points[i - 1];
        final curr = points[i];
        final cpX = (prev.dx + curr.dx) / 2;
        linePath.cubicTo(cpX, prev.dy, cpX, curr.dy, curr.dx, curr.dy);
      }
      canvas.drawPath(linePath, linePaint);
    }

    final dotPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    final dotBorderPaint = Paint()
      ..color = Colors.white.withOpacity(0.3)
      ..style = PaintingStyle.fill;

    for (final p in points) {
      canvas.drawCircle(p, 5, dotBorderPaint);
      canvas.drawCircle(p, 3, dotPaint);
    }

    final labelStyle = const TextStyle(
      color: Colors.white70,
      fontSize: 10,
      fontWeight: FontWeight.w500,
    );

    void drawLabel(String text, double x, {bool rightAlign = false}) {
      final tp = TextPainter(
        text: TextSpan(text: text, style: labelStyle),
        textDirection: textDirection,
      );
      tp.layout();
      double dx = x - (rightAlign ? tp.width : 0);
      dx = dx.clamp(0.0, size.width - tp.width);
      tp.paint(canvas, Offset(dx, size.height - 16));
    }

    if (n >= 1 && labels.isNotEmpty) {
      drawLabel(labels.first, 0);
    }
    if (n >= 2 && labels.length >= 2) {
      drawLabel(labels.last, size.width, rightAlign: true);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
""";
  }

  file.writeAsStringSync(content);
  print('Done patching driver_home_screen.dart');
}
