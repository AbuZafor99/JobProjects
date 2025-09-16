import 'package:get/get.dart';

import '../../../../core/base/base_controller.dart';
import '../../../leagues/data/models/league_model.dart';
import '../../data/models/standing_row_model.dart';
import '../../data/standing_repository.dart';

class LeagueStandingController extends BaseController {
  final StandingRepository repository;
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
      rows.assignAll(await repository.fetchStandings(league.id));
    } catch (e) {
      setError('Failed to load standings');
    } finally {
      setLoading(false);
    }
  }
}
