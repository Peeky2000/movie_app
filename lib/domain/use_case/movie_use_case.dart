import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';
import 'package:movie_app/domain/repositories/movie_repository.dart';

import '../entities/app_error.dart';
import '../entities/no_params.dart';

abstract class MovieUseCase<Type , Params>{
  Future<Either<AppError , Type>> getTrending(Params params);
  Future<Either<AppError , Type>> getPopular(Params params);
  Future<Either<AppError , Type>> getPlayingNow(Params params);
  Future<Either<AppError , Type>> getComingSoon(Params params);
}

class MovieUseCaseImpl extends MovieUseCase<List<MovieEntity>, NoParams>{
  final MovieRepository _movieRepo;

  MovieUseCaseImpl(this._movieRepo);

  @override
  Future<Either<AppError, List<MovieEntity>>> getTrending(NoParams noParams) async{
    return await _movieRepo.getTrending();
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getPlayingNow(NoParams noParams) async{
    return await _movieRepo.getPlayingNow();
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getPopular(NoParams noParams) async{
    return await _movieRepo.getPopular();
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getComingSoon(NoParams noParams) async{
    return await _movieRepo.getComingSoon();
  }
}