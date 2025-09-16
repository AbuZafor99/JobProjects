import 'package:get/get.dart';

import '../../../../core/base/base_controller.dart';
import '../../data/league_repository.dart';
import '../../data/models/league_model.dart';

class LeagueController extends BaseController {
  final LeagueRepository repository;
  LeagueController(this.repository);

  final RxList<LeagueModel> leagues = <LeagueModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadLeagues();
  }

  Future<void> loadLeagues() async {
    setLoading(true);
    clearError();
    try {
      final result = await repository.fetchLeagues();
      leagues.assignAll(result);
    } catch (e) {
      setError('Failed to load leagues');
    } finally {
      setLoading(false);
    }
  }
}
