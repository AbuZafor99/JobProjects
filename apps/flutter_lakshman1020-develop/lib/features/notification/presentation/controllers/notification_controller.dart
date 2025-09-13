import 'package:get/get.dart';
import '../../data/models/notification_model.dart';

class NotificationController extends GetxController {
  var notifications = <NotificationModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadNotifications();
  }

  // Simulate API call to get notifications
  Future<void> loadNotifications() async {
    try {
      isLoading.value = true;
      
      // Simulate API delay
      await Future.delayed(const Duration(seconds: 1));
      
      // Demo data matching the screenshot exactly
      final demoNotifications = [
        // NotificationModel(
        //   id: '1',
        //   title: 'Jhon Alphabet',
        //   description: 'Contact Customer as soon as possible',
        //   timestamp: DateTime(2025, 9, 13, 8, 45), // 8:45am
        //   imageUrl: '',
        // ),
        // NotificationModel(
        //   id: '2',
        //   title: 'Jhon Alphabet',
        //   description: 'Contact Customer as soon as possible',
        //   timestamp: DateTime(2025, 9, 13, 8, 45), // 8:45am
        //   imageUrl: '',
        // ),
        // NotificationModel(
        //   id: '3',
        //   title: 'Admin',
        //   description: 'There\'s a technical error',
        //   timestamp: DateTime(2025, 9, 13, 8, 45), // 8:45am
        //   imageUrl: '',
        // ),
        // NotificationModel(
        //   id: '4',
        //   title: 'Admin',
        //   description: 'There\'s a technical error',
        //   timestamp: DateTime(2025, 9, 13, 8, 45), // 8:45am
        //   imageUrl: '',
        // ),
        // NotificationModel(
        //   id: '5',
        //   title: 'Admin',
        //   description: 'There\'s a technical error',
        //   timestamp: DateTime(2025, 9, 13, 8, 45), // 8:45am
        //   imageUrl: '',
        // ),
      ];
      
      // notifications.assignAll(demoNotifications);
    } catch (e) {
      Get.snackbar('Error', 'Failed to load notifications');
    } finally {
      isLoading.value = false;
    }          
  }

  // Refresh notifications
  Future<void> refreshNotifications() async {
    await loadNotifications();
  }
}