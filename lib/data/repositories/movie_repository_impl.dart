import 'package:dartz/dartz.dart';
import 'package:movie_app/data/data_sources/remote/movie_remote_data_source.dart';
import 'package:movie_app/data/models/movie_model.dart';
import 'package:movie_app/domain/entities/app_error.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';
import 'package:movie_app/domain/repositories/movie_repository.dart';



//action what function , action that user want to do with logic
//include remote or local data
class MovieRepositoryImpl extends MovieRepository{

  final MovieRemoteDataSource _remoteDataSource;


  MovieRepositoryImpl(this._remoteDataSource);


  @override
  Future<Either<AppError, List<MovieEntity>>> getTrending() async {
    try{
      final movies = await _remoteDataSource.getTrending();
      return Right(movies);
    }on Exception{
      return const Left(AppError('Something went wrong'));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getComingSoon() async {
    try{
      final movies = await _remoteDataSource.getComingSoon();
      return Right(movies);
    }on Exception{
      return const Left(AppError('Something went wrong'));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getPlayingNow() async{
    try{
      final movies = await _remoteDataSource.getPlayingNow();
      return Right(movies);
    }on Exception{
      return const Left(AppError('Something went wrong'));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getPopular() async{
    try{
      final movies = await _remoteDataSource.getPopular();
      return Right(movies);
    }on Exception{
      return const Left(AppError('Something went wrong'));
    }
  }

}