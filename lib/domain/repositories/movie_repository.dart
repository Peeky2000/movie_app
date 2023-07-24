import 'package:dartz/dartz.dart';

import '../entities/app_error.dart';
import '../entities/movie_entity.dart';

//holding logic ( what data user want to fetch )
abstract class MovieRepository{
  Future<Either<AppError, List<MovieEntity>>> getTrending();

  Future<Either<AppError, List<MovieEntity>>> getPopular();

  Future<Either<AppError, List<MovieEntity>>> getPlayingNow();

  Future<Either<AppError, List<MovieEntity>>> getComingSoon();
}