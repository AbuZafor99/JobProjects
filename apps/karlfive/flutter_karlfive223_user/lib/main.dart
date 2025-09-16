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
      // DEMO: Show League Standing directly
      // TODO(REMOVE): Set your real start page once API is connected
      // home: LeagueStandingScreen(
      //   league: LeagueModel(
      //     id: '1',
      //     name: 'Premier League',
      //     imageUrl:
      //         'https://images.unsplash.com/photo-1521417531039-75e91486cc79?q=80&w=1200&auto=format&fit=crop',
      //   ),
      home: LeagueListScreen(),
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
