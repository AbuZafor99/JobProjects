import 'package:get/get.dart';
import 'package:karlfive/features/league_standing/data/standing_repository.dart';
import 'package:karlfive/features/leagues/data/league_repository.dart';
import 'package:karlfive/features/leagues/data/mock_league_repository.dart';

import '../../features/league_standing/data/mock_standing_repository.dart';


void setupRepository() {
  // DEMO DATA: Register mock repo for leagues.
  // TODO(REMOVE): Replace with real LeagueRepository when API is ready.
  Get.lazyPut<LeagueRepository>(() => MockLeagueRepository());
  // DEMO DATA: Register mock repo for standings.
  // TODO(REMOVE): Replace with real StandingRepository when API is ready.
  Get.lazyPut<StandingRepository>(() => MockStandingRepository());
}
