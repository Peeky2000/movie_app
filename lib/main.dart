import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:movie_app/data/core/api_client.dart';
import 'package:movie_app/data/data_sources/remote/movie_remote_data_source.dart';
import 'package:movie_app/domain/repositories/movie_repository.dart';
import 'package:movie_app/domain/use_case/movie_use_case.dart';

import 'data/repositories/movie_repository_impl.dart';
import 'domain/entities/app_error.dart';
import 'domain/entities/movie_entity.dart';
import 'domain/entities/no_params.dart';

Future<void> main() async{
  MovieRemoteDataSource dataSource = MovieRemoteDataSourceImpl(ApiClient(Dio()));
  MovieRepository movieRepository = MovieRepositoryImpl(dataSource);
  MovieUseCaseImpl movies = MovieUseCaseImpl(movieRepository);
  final Either<AppError, List<MovieEntity>> eitherRes = await movies.getTrending(NoParams());
  eitherRes.fold(
    (l) {
      print('Error');
      print(l);
    },
    (r) {
      print("List of movies");
      print(r);
    },
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Hello World"
        ),
      ),
    );
  }
}


