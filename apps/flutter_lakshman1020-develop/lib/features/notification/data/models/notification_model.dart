class NotificationModel {
  final String id;
  final String title;
  final String description;
  final DateTime timestamp;
  final String imageUrl;

  NotificationModel({
    required this.id,
    required this.title,
    required this.description,
    required this.timestamp,
    required this.imageUrl,
  });

  // Format time for display (AM/PM format)
  String get formattedTime {
    final hour = timestamp.hour % 12;
    final minute = timestamp.minute;
    final period = timestamp.hour < 12 ? 'am' : 'pm';
    
    return '${hour == 0 ? 12 : hour}:${minute.toString().padLeft(2, '0')}$period';
  }
}