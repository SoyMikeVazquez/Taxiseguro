class Trip {
  final String? id;
  final String userId;
  final String? driverId;
  final String originAddress;
  final String destinationAddress;
  final double? originLat;
  final double? originLng;
  final double? destinationLat;
  final double? destinationLng;
  final String? postalCode;
  final String? delegation;
  final String status; // pending, accepted, in_progress, completed, cancelled
  final double? fare;
  final double? distanceKm;
  final DateTime? createdAt;
  final DateTime? completedAt;
  final String? paymentMethod; // 'efectivo' o 'tarjeta'
  final String? nameDriver;
  final String? photoDriver;

  Trip({
    this.id,
    required this.userId,
    this.driverId,
    required this.originAddress,
    required this.destinationAddress,
    this.originLat,
    this.originLng,
    this.destinationLat,
    this.destinationLng,
    this.postalCode,
    this.delegation,
    this.status = 'pending',
    this.fare,
    this.distanceKm,
    this.createdAt,
    this.completedAt,
    this.paymentMethod,
    this.nameDriver,
    this.photoDriver,
  });

  factory Trip.fromJson(Map<String, dynamic> json) {
    return Trip(
      id: json['id']?.toString(),
      userId: json['user_id']?.toString() ?? '',
      driverId: json['driver_id']?.toString(),
      originAddress: json['origin_address']?.toString() ?? '',
      destinationAddress: json['destination_address']?.toString() ?? '',
      originLat: json['origin_lat'] != null ? (json['origin_lat'] as num).toDouble() : null,
      originLng: json['origin_lng'] != null ? (json['origin_lng'] as num).toDouble() : null,
      destinationLat: json['destination_lat'] != null ? (json['destination_lat'] as num).toDouble() : null,
      destinationLng: json['destination_lng'] != null ? (json['destination_lng'] as num).toDouble() : null,
      postalCode: json['postal_code']?.toString(),
      delegation: json['delegation']?.toString(),
      status: json['status']?.toString() ?? 'pending',
      fare: json['fare'] != null ? (json['fare'] as num).toDouble() : null,
      distanceKm: json['distance_km'] != null ? (json['distance_km'] as num).toDouble() : null,
      createdAt: json['created_at'] != null ? DateTime.tryParse(json['created_at'].toString()) : null,
      completedAt: json['completed_at'] != null ? DateTime.tryParse(json['completed_at'].toString()) : null,
      paymentMethod: json['payment_method']?.toString(),
      nameDriver: json['name_driver']?.toString(),
      photoDriver: json['photo_driver']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'user_id': userId,
      if (driverId != null) 'driver_id': driverId,
      'origin_address': originAddress,
      'destination_address': destinationAddress,
      if (originLat != null) 'origin_lat': originLat,
      if (originLng != null) 'origin_lng': originLng,
      if (destinationLat != null) 'destination_lat': destinationLat,
      if (destinationLng != null) 'destination_lng': destinationLng,
      if (postalCode != null) 'postal_code': postalCode,
      if (delegation != null) 'delegation': delegation,
      'status': status,
      if (fare != null) 'fare': fare,
      if (distanceKm != null) 'distance_km': distanceKm,
      if (createdAt != null) 'created_at': createdAt?.toIso8601String(),
      if (completedAt != null) 'completed_at': completedAt?.toIso8601String(),
      if (paymentMethod != null) 'payment_method': paymentMethod,
      if (nameDriver != null) 'name_driver': nameDriver,
      if (photoDriver != null) 'photo_driver': photoDriver,
    };
  }
}
