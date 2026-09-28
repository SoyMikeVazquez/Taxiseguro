class DynamicPricingZone {
  final String id;
  final String name;
  final double lat;
  final double lng;
  final double radiusKm;
  final double percentageIncrease;
  final bool isActive;
  final DateTime createdAt;

  DynamicPricingZone({
    required this.id,
    required this.name,
    required this.lat,
    required this.lng,
    required this.radiusKm,
    required this.percentageIncrease,
    required this.isActive,
    required this.createdAt,
  });

  factory DynamicPricingZone.fromJson(Map<String, dynamic> json) {
    return DynamicPricingZone(
      id: json['id'] as String,
      name: json['name'] as String,
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
      radiusKm: (json['radius_km'] as num).toDouble(),
      percentageIncrease: (json['percentage_increase'] as num).toDouble(),
      isActive: json['is_active'] as bool? ?? true,
      createdAt: DateTime.tryParse(json['created_at'].toString()) ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'lat': lat,
      'lng': lng,
      'radius_km': radiusKm,
      'percentage_increase': percentageIncrease,
      'is_active': isActive,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
