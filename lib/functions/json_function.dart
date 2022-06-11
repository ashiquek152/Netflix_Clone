// ignore_for_file: non_constant_identifier_names, constant_identifier_names

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:netflix_tmdb/models/movie_data/movie_data.dart';
import 'package:netflix_tmdb/screens/screen_search.dart';




Future<MovieData> getMoives() async {
  final response = await http.get(Uri.parse(
      "https://api.themoviedb.org/3/movie/upcoming?api_key=$API_KEY"));
  final responseBody = await jsonDecode(response.body) as Map<String, dynamic>;
  final data = MovieData.fromJson(responseBody);
  return data;
}
