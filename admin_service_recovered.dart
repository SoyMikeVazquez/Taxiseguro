Created At: 2026-09-23T20:49:40-06:00
Completed At: 2026-09-23T20:49:40-06:00
File Path: `file:///Users/black/Documents/Apps/Taxiseguro%20proyecto/Aplicacion%20flutter%20Taxiseguro/lib/services/admin_service.dart`
Total Lines: 824
Total Bytes: 28018
Showing lines 1 to 150
The following code has been modified to include a line number before every line, in the format: <line_number>: <original_line>. Please note that any changes targeting the original code should remove the line number, colon, and leading space.
1: import 'dart:convert';
2: import 'package:supabase_flutter/supabase_flutter.dart';
3: import 'package:latlong2/latlong.dart';
4: import 'package:fl_chart/fl_chart.dart';
5: import 'driver_shift_service.dart';
6: 
7: class AdminStats {
8:   final int totalDrivers;
9:   final int activeDrivers;
10:   final int pendingApprovals;
11:   final int totalUsers;
12:   final int totalTrips;
13:   final double totalRevenue;
14:   final double platformCommission;
15:   final double averageTicketToday;
16: 
17:   AdminStats({
18:     required this.totalDrivers,
19:     required this.activeDrivers,
20:     required this.pendingApprovals,
21:     required this.totalUsers,
22:     required this.totalTrips,
23:     required this.totalRevenue,
24:     required this.platformCommission,
25:     required this.averageTicketToday,
26:   });
27: }
28: 
29: class DashboardFinancialData {
30:   final double totalRevenue;
31:   final double platformCommission;
32:   final int totalTrips;
33:   final double cashTotal;
34:   final int cashTrips;
35:   final double cardTotal;
36:   final int cardTrips;
37:   final List<FlSpot> chartSpots;
38:   final double maxY;
39:   final double maxX;
40:   final bool isSingleDay;
41:   final List<String> xLabels;
42: 
43:   DashboardFinancialData({
44:     required this.totalRevenue,
45:     required this.platformCommission,
46:     required this.totalTrips,
47:     required this.cashTotal,
48:     required this.cashTrips,
49:     required this.cardTotal,
50:     required this.cardTrips,
51:     required this.chartSpots,
52:     required this.maxY,
53:     required this.maxX,
54:     required this.isSingleDay,
55:     required this.xLabels,
56:   });
57: 
58:   factory DashboardFinancialData.empty({bool isSingleDay = true}) {
59:     return DashboardFinancialData(
60:       totalRevenue: 0.0,
61:       platformCommission: 0.0,
62:       totalTrips: 0,
63:       cashTotal: 0.0,
64:       cashTrips: 0,
65:       cardTotal: 0.0,
66:       cardTrips: 0,
67:       chartSpots: const [FlSpot(0, 0)],
68:       maxY: 100.0,
69:       maxX: isSingleDay ? 7.0 : 6.0,
70:       isSingleDay: isSingleDay,
71:       xLabels: isSingleDay
72:           ? const ['12a', '3a', '6a', '9a', '12p', '3p', '6p', '9p']
73:           : const [],
74:     );
75:   }
76: }
77: 
78: class DriverFullDetailData {
79:   final Map<String, dynamic> driver;
80:   final bool isOnline;
81:   final DriverShiftStats shiftStats;
82:   final List<Map<String, dynamic>> completedTrips;
83:   final List<Map<String, dynamic>> cancelledTrips;
84:   final List<Map<String, dynamic>> allTrips;
85:   final double totalRevenue;
86:   final double platformCommission;
87:   final double netEarnings;
88:   final double cashTotal;
89:   final int cashTrips;
90:   final double cardTotal;
91:   final int cardTrips;
92:   final double averageRating;
93:   final int totalRatings;
94:   final List<Map<String, dynamic>> ratings;
95: 
96:   DriverFullDetailData({
97:     required this.driver,
98:     required this.isOnline,
99:     required this.shiftStats,
100:     required this.completedTrips,
101:     required this.cancelledTrips,
102:     required this.allTrips,
103:     required this.totalRevenue,
104:     required this.platformCommission,
105:     required this.netEarnings,
106:     required this.cashTotal,
107:     required this.cashTrips,
108:     required this.cardTotal,
109:     required this.cardTrips,
110:     required this.averageRating,
111:     required this.totalRatings,
112:     required this.ratings,
113:   });
114: 
115:   factory DriverFullDetailData.empty(Map<String, dynamic> driver) {
116:     final estatus = (driver['estatus'] ?? '').toString().toLowerCase().trim();
117:     return DriverFullDetailData(
118:       driver: driver,
119:       isOnline: estatus == 'activo',
120:       shiftStats: DriverShiftStats.empty(),
121:       completedTrips: [],
122:       cancelledTrips: [],
123:       allTrips: [],
124:       totalRevenue: 0.0,
125:       platformCommission: 0.0,
126:       netEarnings: 0.0,
127:       cashTotal: 0.0,
128:       cashTrips: 0,
129:       cardTotal: 0.0,
130:       cardTrips: 0,
131:       averageRating: 5.0,
132:       totalRatings: 0,
133:       ratings: [],
134:     );
135:   }
136: }
137: 
138: class AdminService {
139:   final SupabaseClient _supabase = Supabase.instance.client;
140: 
141:   /// Sincroniza viajes completados o con cobro a la tabla de facturación si aún no existen
142:   Future<void> syncTripsToFacturacion() async {
143:     try {
144:       final tripsRes = await _supabase.from('trips').select();
145:       final trips = (tripsRes as List<dynamic>?) ?? [];
146: 
147:       List<dynamic> existingFacts = [];
148:       try {
149:         final factRes = await _supabase.from('facturacion').select();
150:         existingFacts = (factRes as List<dynamic>?) ?? [];
The above content does NOT show the entire file contents. If you need to view any lines of the file which were not shown to complete your task, call this tool again to view those lines.
