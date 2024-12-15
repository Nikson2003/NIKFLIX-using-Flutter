import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/movie.dart';

class ApiService {
  static const String baseUrl = 'https://api.tvmaze.com/search/shows?q=';

  static Future<List<Movie>> fetchMovies(String query) async {
    if (query.isEmpty) {
      return [];
    }

    final response = await http.get(Uri.parse('$baseUrl$query'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Movie.fromJson(json['show'])).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
