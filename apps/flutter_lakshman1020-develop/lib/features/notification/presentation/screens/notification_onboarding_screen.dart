import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/notification_onbording_controller.dart';
import '../widgets/notification_card_items.dart';

class NotificationOnboardingScreen extends StatelessWidget {
  const NotificationOnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NotificationOnboardingController());
    
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 48,),
            Center(child: Image.asset("assets/images/logo_notification.png",height: 200,width: 200,)),
            const SizedBox(height: 32,),
            const Text(
              textAlign: TextAlign.start,
              'Get notified about \nimportant stuff',
              style: TextStyle(
                color: Color(0xff18191A),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'We will notified when',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xff18191A),
                fontWeight: FontWeight.w500
              ),
            ),
            const SizedBox(height: 16),
            Container(
              height: 136,
              decoration: BoxDecoration(
                color: Color(0xffF4F9FF),
                borderRadius: BorderRadius.circular(16)
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    NotificationCardItems(imagePath: 'assets/icons/notification_page_icon1.png', title: 'Gets new job',),
                    const SizedBox(height: 8,),
                    NotificationCardItems(imagePath: 'assets/icons/notification_page_icon1.png', title: 'Gets new job',),
                    const SizedBox(height: 8,),
                    NotificationCardItems(imagePath: 'assets/icons/notification_page_icon1.png', title: 'Gets new job',),
                    const SizedBox(height: 8,),
                    NotificationCardItems(imagePath: 'assets/icons/notification_page_icon1.png', title: 'Gets new job',),
                  ],
                ),
              ),
            ),
            Spacer(),
            const Text(
              'You can adjust these settings later',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => controller.skipOnboarding(),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      side: const BorderSide(color: Colors.grey),
                    ),
                    child: const Text('Later'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Obx(() => ElevatedButton(
                        onPressed: controller.isLoading.value
                            ? null
                            : () => controller.saveSettings(),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: controller.isLoading.value
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              )
                            : const Text(
                                'Get notified',
                                style: TextStyle(color: Colors.white),
                              ),
                      )),
                ),
              ],
            ),
            const SizedBox(height: 30,)
          ],
        ),
      ),
    );
  }
}

