import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart';
import 'package:movie_app/data/core/api_constants.dart';
import 'package:movie_app/data/models/movie_model.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/data/models/movies_trending_result_model.dart';

import '../../core/api_client.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getTrending();
  Future<List<MovieModel>> getPopular();
  Future<List<MovieModel>> getPlayingNow();
  Future<List<MovieModel>> getComingSoon();
}

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource {
  final ApiClient _client;

  MovieRemoteDataSourceImpl(this._client);

  /*
    * Function to get trending movies
    *
    * return a list movie
  */
  @override
  Future<List<MovieModel>> getTrending() async {
    try {
      final response = await _client.get("trending/movie/day");
      var jsonData = response["results"] as List;
      List<MovieModel> movies =
          List<MovieModel>.from(jsonData.map((e) => MovieModel.fromJson(e)))
              .toList();
      print("Trending");
      print(movies);
      return movies;
    } catch (ex) {
      throw Exception('error getting list of');
    }
  }

  /*
    * Function to get popular movies
    *
    * return a list movie
  */
  @override
  Future<List<MovieModel>> getPopular() async {
    try {
      final response = await _client.get("movie/popular");
      var jsonData = response["results"] as List;
      List<MovieModel> movies =
          List<MovieModel>.from(jsonData.map((e) => MovieModel.fromJson(e)))
              .toList();
      print("Popular");
      print(movies);
      return movies;
    } catch (ex) {
      throw Exception('error getting list of');
    }
  }

  /*
    * Function to get on playing now
    *
    * return a list movie
  */
  @override
  Future<List<MovieModel>> getPlayingNow() async{
    try{
      final response = await _client.get("movie/now_playing");
      var jsonData = response["results"] as List;
      List<MovieModel> movies = List<MovieModel>.from(jsonData.map((e) => MovieModel.fromJson(e))).toList();
      print("Playing now");
      print(movies);
      return movies;
    }catch(ex){
      throw Exception("error getting list of");
    }
  }

  /*
    * Function to get movies coming soon movies
    *
    * return a list movie
  */
  @override
  Future<List<MovieModel>> getComingSoon() async{
    try{
      final response = await _client.get("movie/upcoming");
      var jsonData = response["results"] as List;
      List<MovieModel> movies = List<MovieModel>.from(jsonData.map((e) => MovieModel.fromJson(e))).toList();
      print("Coming");
      print(movies);
      return movies;
    }catch(ex){
      throw Exception("error getting list of");
    }
  }

}
