import 'package:flutter/material.dart';
import 'package:flutter_lakshman1020/features/notification/presentation/screens/notification_onboarding_screen.dart';

import 'core/Theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.light,
      home: NotificationOnboardingScreen(),
    );
  }
}
