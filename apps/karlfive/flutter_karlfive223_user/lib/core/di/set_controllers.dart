import 'package:get/get.dart';
import 'package:karlfive/features/auth/presentation/controller/auth_controller.dart';
import 'package:karlfive/features/join_league/presentation/controller/join_league_controller.dart';
import 'package:karlfive/features/leagues/presentation/controller/league_controller.dart';
import 'package:karlfive/features/leagues/data/league_repository.dart';
import 'package:karlfive/features/league_standing/data/standing_repository.dart';

void setupController() {
  // Auth Controller
  Get.lazyPut<AuthController>(() => AuthController());
  // Join League Controller
  Get.lazyPut<JoinLeagueController>(() => JoinLeagueController());
  // League listing controller
  Get.lazyPut<LeagueController>(
    () => LeagueController(Get.find<LeagueRepository>()),
  );
  // League standing controller is created with arguments in the screen; keep DI ready
  Get.lazyPut<StandingRepository>(() => Get.find<StandingRepository>());
}
