import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karlfive/core/theme/app_theme.dart';
import 'package:karlfive/features/join_league/presentation/screens/join_league_screen.dart';
import 'package:karlfive/features/leagues/presentation/screens/league_list_screen.dart';
import 'package:karlfive/features/league_standing/presentation/screens/league_standing_screen.dart';
import 'package:karlfive/features/leagues/data/models/league_model.dart';

import 'core/init/app_initializer.dart';

void main() async {
  await AppInitializer.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.dark,
      // DEMO: Show League Standing directly with demo arguments
      // TODO(REMOVE): Set your real start page once API is connected
      home: LeagueStandingScreen(
        league: LeagueModel(
          id: 'demo-1',
          name: 'Premier League',
          imageUrl: 'https://via.placeholder.com/300x200?text=Premier+League',
        ),
      ),
      getPages: [
        GetPage(name: '/join-league', page: () => JoinLeagueScreen()),
        GetPage(name: '/leagues', page: () => LeagueListScreen()),
        GetPage(
          name: '/league-standing',
          page: () {
            final args = Get.arguments;
            return LeagueStandingScreen(league: args);
          },
        ),
      ],
    );
  }
}
