import 'dart:convert';

import 'package:http/http.dart';
import 'package:movie_app/data/core/api_constants.dart';
import 'package:movie_app/data/models/movie_model.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/data/models/movies_trending_result_model.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getTrending();
  Future<List<MovieModel>> getPopular();
}

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource {
  final Client _client;

  MovieRemoteDataSourceImpl(this._client);

  @override
  Future<List<MovieModel>> getTrending() async {
    const url =
        '${ApiConstants.BASE_URL}trending/movie/day?api_key=${ApiConstants.API_KEY}';
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          "Content-Type": 'application/json',
        },
      );
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final movies =
            MoviesTrendingResultModel.fromJson(jsonData).results!.toList();
        print(movies);
        return movies;
      } else {
        throw Exception(response.reasonPhrase);
      }
    } catch (ex) {
      throw Exception('error getting list of');
    }
  }

  @override
  Future<List<MovieModel>> getPopular() async {
    const url =
        '${ApiConstants.BASE_URL}movie/popular?api_key=${ApiConstants.API_KEY}';
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          "Content-Type": 'application/json',
        },
      );
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final movies =
        MoviesTrendingResultModel.fromJson(jsonData).results!.toList();
        print(movies);
        return movies;
      } else {
        throw Exception(response.reasonPhrase);
      }
    } catch (ex) {
      throw Exception('error getting list of');
    }
  }
}
