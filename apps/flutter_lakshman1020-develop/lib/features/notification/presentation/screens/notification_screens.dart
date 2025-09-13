import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/notification_controller.dart';
import '../widgets/empty_notification.dart';
import '../widgets/notification_item.dart';


class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NotificationController());
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => controller.refreshNotifications(),
            tooltip: 'Refresh',
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        
        if (controller.notifications.isEmpty) {
          return EmptyNotifications(onRefresh: controller.refreshNotifications);
        }
        
        return RefreshIndicator(
          onRefresh: () async {
            await controller.refreshNotifications();
          },
          child: ListView.separated(
            itemCount: controller.notifications.length,
            separatorBuilder: (context, index) => Divider(
              height: 1,
              color: Colors.grey.shade300,
              thickness: 1,
            ),
            itemBuilder: (context, index) {
              final notification = controller.notifications[index];
              return NotificationItem(notification: notification);
            },
          ),
        );
      }),
    );
  }
}