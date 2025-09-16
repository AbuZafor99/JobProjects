class LeagueModel {
  final String id;
  final String name;
  final String imageUrl;

  LeagueModel({required this.id, required this.name, required this.imageUrl});

  factory LeagueModel.fromJson(Map<String, dynamic> json) => LeagueModel(
    id: json['id'].toString(),
    name: json['name'] ?? '',
    imageUrl: json['image'] ?? '',
  );
}
