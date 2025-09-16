class StandingRowModel {
  final int position;
  final String teamName;
  final int played;
  final int won;
  final int draw;
  final int lost;
  final int goalDiff;
  final int points;

  StandingRowModel({
    required this.position,
    required this.teamName,
    required this.played,
    required this.won,
    required this.draw,
    required this.lost,
    required this.goalDiff,
    required this.points,
  });

  factory StandingRowModel.fromJson(Map<String, dynamic> json) =>
      StandingRowModel(
        position: json['position'] ?? json['pos'] ?? 0,
        teamName: json['team'] ?? json['team_name'] ?? '',
        played: json['p'] ?? json['played'] ?? 0,
        won: json['w'] ?? json['won'] ?? 0,
        draw: json['d'] ?? json['draw'] ?? 0,
        lost: json['l'] ?? json['lost'] ?? 0,
        goalDiff: json['gd'] ?? json['goal_diff'] ?? 0,
        points: json['pts'] ?? json['points'] ?? 0,
      );
}
