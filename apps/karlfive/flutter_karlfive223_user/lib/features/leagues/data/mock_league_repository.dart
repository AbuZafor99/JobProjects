// DEMO DATA: Mock repository used to render UI without backend.
// TODO(REMOVE): Delete this file and its DI registration when API is connected.
import 'league_repository.dart';
import 'models/league_model.dart';
import 'models/standing_model.dart';

class MockLeagueRepository extends LeagueRepository {
  MockLeagueRepository() : super(baseUrl: '');

  @override
  Future<List<LeagueModel>> fetchLeagues() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return <LeagueModel>[
      LeagueModel(
        id: '1',
        name: 'Premier League',
        imageUrl:
            'https://images.unsplash.com/photo-1521417531039-75e91486cc79?q=80&w=1200&auto=format&fit=crop',
      ),
      LeagueModel(
        id: '2',
        name: 'Championship',
        imageUrl:
            'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?q=80&w=1200&auto=format&fit=crop',
      ),
      LeagueModel(
        id: '3',
        name: 'Division 1',
        imageUrl:
            'https://images.unsplash.com/photo-1523419409543-a5e549c9def3?q=80&w=1200&auto=format&fit=crop',
      ),
      LeagueModel(
        id: '4',
        name: 'Premier League',
        imageUrl:
            'https://images.unsplash.com/photo-1521412644187-c49fa049e84d?q=80&w=1200&auto=format&fit=crop',
      ),
    ];
  }

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
