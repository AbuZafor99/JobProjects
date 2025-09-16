import 'package:get/get.dart';

import '../../../../core/base/base_controller.dart';
import '../../data/league_repository.dart';
import '../../data/models/league_model.dart';
import '../../data/models/standing_model.dart';

class LeagueStandingController extends BaseController {
  final LeagueRepository repository;
  final LeagueModel league;
  LeagueStandingController({required this.repository, required this.league});

  final RxList<StandingRowModel> rows = <StandingRowModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadStandings();
  }

  Future<void> loadStandings() async {
    setLoading(true);
    clearError();
    try {
      final result = await repository.fetchStandings(league.id);
      rows.assignAll(result);
    } catch (e) {
      setError('Failed to load standings');
    } finally {
      setLoading(false);
    }
  }
}
