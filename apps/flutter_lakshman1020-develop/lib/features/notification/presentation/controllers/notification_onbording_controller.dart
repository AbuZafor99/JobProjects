import 'package:get/get.dart';

import '../../data/models/notification_setting_model.dart';

class NotificationOnboardingController extends GetxController {
  // Observable list of notification settings
  var notificationSettings = <NotificationSetting>[].obs;
  
  // Loading state
  var isLoading = false.obs;
  
  // Default settings
  final List<NotificationSetting> defaultSettings = [
    NotificationSetting(title: 'Gets new job', isEnabled: false),
    NotificationSetting(title: 'Promotion announcement', isEnabled: true),
    NotificationSetting(title: 'Delivery done', isEnabled: false),
    NotificationSetting(title: 'Technical issue', isEnabled: false),
  ];

  @override
  void onInit() {
    super.onInit();
    loadNotificationSettings();
  }

  // Load settings from storage or use defaults
  void loadNotificationSettings() {
    isLoading.value = true;
    
    // In a real app, you would load from shared preferences or local database
    // For now, we'll use the default settings
    notificationSettings.assignAll(defaultSettings);
    
    isLoading.value = false;
  }

  // Toggle a setting
  void toggleSetting(int index) {
    if (index >= 0 && index < notificationSettings.length) {
      notificationSettings[index].isEnabled = !notificationSettings[index].isEnabled;
      notificationSettings.refresh(); // Update the UI
    }
  }

  // Save settings and mark onboarding as completed
  Future<void> saveSettings() async {
    isLoading.value = true;
    
    try {
      // Save settings to storage (pseudo-code)
      // await _saveSettingsToStorage(notificationSettings);
      
      // Mark onboarding as completed
      // await _markOnboardingCompleted();
      
      // Navigate to the actual notification screen
      Get.offAllNamed('/notification-screen');
    } catch (e) {
      Get.snackbar('Error', 'Failed to save settings');
    } finally {
      isLoading.value = false;
    }
  }

  // Skip onboarding
  void skipOnboarding() {
    Get.back(); // Return to previous screen
  }
  
  // Check if onboarding was completed (for use in other parts of the app)
  static Future<bool> isOnboardingCompleted() async {
    // Check storage if onboarding was completed
    // return await _getOnboardingStatusFromStorage();
    return false; // Default to false for demo
  }
}