import 'dart:math';

import 'standing_repository.dart';
import 'models/standing_row_model.dart';

class MockStandingRepository extends StandingRepository {
  MockStandingRepository() : super(baseUrl: '');

  @override
  Future<List<StandingRowModel>> fetchStandings(String leagueId) async {
    await Future.delayed(const Duration(milliseconds: 200));
    
    // TEMPORARY MOCK DATA: This will be replaced with API data later
    // Comment: This is temporary dummy data that should be deleted later
    
    // List of team names for the dummy data
    final teams = [
      'Manchester United',
      'Liverpool',
      'Arsenal',
      'Chelsea',
      'Manchester City',
      'Tottenham',
      'Leicester City',
      'Everton',
      'Newcastle',
      'Aston Villa',
      'West Ham',
      'Crystal Palace',
      'Brighton',
      'Southampton',
      'Burnley',
      'Wolves',
      'Leeds United',
      'Watford',
      'Norwich City',
      'Brentford',
      'Fulham',
      'West Brom',
      'Sheffield United',
      'Bournemouth',
    ];
    
    final List<StandingRowModel> standings = [];
    
    // Generate realistic standings with dummy data
    for (int i = 0; i < teams.length; i++) {
      // Generate realistic stats based on position
      final played = 38; // Full season of matches
      final won = i < 6 ? 20 + (5 - i) : 15 - (i ~/ 3);
      final draw = 10 - (i ~/ 3).clamp(0, 9);
      final lost = played - won - draw;
      final goalDiff = i < 6 ? 30 - (i * 5) : 10 - i;
      final points = (won * 3) + draw;
      
      standings.add(StandingRowModel(
        position: i + 1,
        teamName: teams[i],
        played: played,
        won: won,
        draw: draw,
        lost: lost,
        goalDiff: goalDiff,
        points: points,
      ));
    }
    
    return standings;
  }
}
