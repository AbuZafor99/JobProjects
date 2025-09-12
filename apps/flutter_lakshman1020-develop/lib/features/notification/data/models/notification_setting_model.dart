class NotificationSetting {
  final String title;
  bool isEnabled;

  NotificationSetting({
    required this.title,
    required this.isEnabled,
  });

  // Convert to map for storage
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'isEnabled': isEnabled,
    };
  }

  // Create from map
  factory NotificationSetting.fromMap(Map<String, dynamic> map) {
    return NotificationSetting(
      title: map['title'],
      isEnabled: map['isEnabled'],
    );
  }
}