import 'dart:convert';

import 'package:http/http.dart' as http;

import 'models/standing_row_model.dart';

class StandingRepository {
  final String baseUrl;
  StandingRepository({required this.baseUrl});

  Future<List<StandingRowModel>> fetchStandings(String leagueId) async {
    final resp = await http.get(
      Uri.parse('$baseUrl/leagues/$leagueId/standings'),
    );
    if (resp.statusCode >= 200 && resp.statusCode < 300) {
      final data = jsonDecode(resp.body);
      final List list = (data is List) ? data : (data['data'] as List? ?? []);
      return list
          .map((e) => StandingRowModel.fromJson(e as Map<String, dynamic>))
          .toList();
    }
    throw Exception('Failed to load standings');
  }
}
