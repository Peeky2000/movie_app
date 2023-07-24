import 'package:movie_app/data/core/url_end_point.dart';
import 'package:movie_app/data/models/movie_model.dart';


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
      String path = UrlEndPoint.movies.trendingMovie;
      final response = await _client.get(path);
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
      String path = UrlEndPoint.movies.popularMovie;
      final response = await _client.get(path);
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
      String path = UrlEndPoint.movies.playingNowMovie;
      final response = await _client.get(path);
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
      String path = UrlEndPoint.movies.comingSoonMovie;
      final response = await _client.get(path);
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
