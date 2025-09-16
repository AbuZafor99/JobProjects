import 'standing_repository.dart';
import 'models/standing_row_model.dart';

class MockStandingRepository extends StandingRepository {
  MockStandingRepository() : super(baseUrl: '');

  @override
  Future<List<StandingRowModel>> fetchStandings(String leagueId) async {
    await Future.delayed(const Duration(milliseconds: 200));
    return List.generate(
      24,
      (i) => StandingRowModel(
        position: i + 1,
        teamName: 'Deathradder',
        played: 0,
        won: 0,
        draw: 0,
        lost: 0,
        goalDiff: 0,
        points: 0,
      ),
    );
  }
}
