class ShipmentModel {
  final String id;
  final String loadNumber;
  final String description;
  final String origin;
  final String destination;
  final String status; // 'pending', 'processing', 'delivered'
  final DateTime createdAt;

  ShipmentModel({
    required this.id,
    required this.loadNumber,
    required this.description,
    required this.origin,
    required this.destination,
    required this.status,
    required this.createdAt,
  });

  // Create from API response
  factory ShipmentModel.fromMap(Map<String, dynamic> map) {
    return ShipmentModel(
      id: map['id'] ?? '',
      loadNumber: map['loadNumber'] ?? '',
      description: map['description'] ?? '',
      origin: map['origin'] ?? '',
      destination: map['destination'] ?? '',
      status: map['status'] ?? 'pending',
      createdAt: DateTime.parse(map['createdAt']),
    );
  }
}