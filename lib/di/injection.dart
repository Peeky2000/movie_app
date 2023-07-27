import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/data/core/api_client.dart';
import 'package:movie_app/data/data_sources/remote/movie_remote_data_source.dart';
import 'package:movie_app/data/repositories/movie_repository_impl.dart';
import 'package:movie_app/domain/repositories/movie_repository.dart';
import 'package:movie_app/domain/use_case/movie_use_case.dart';
import 'package:movie_app/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:movie_app/presentation/blocs/movie_carousel/movie_carousel_bloc.dart';

class Injector {
  static final getIt = GetIt.I..allowReassignment = true;

  static Future<void> init() async{
    setupEnviroment();
    setupData();
    setupDomain();
    setupPresentation();
  }

  static Future<void> setupEnviroment() async {}

  static Future<void> setupData() async {
    //di for remote data source
    getIt.registerLazySingleton<Dio>(() => Dio());

    getIt.registerLazySingleton<ApiClient>(() => ApiClient(getIt()));

    getIt.registerLazySingleton<MovieRemoteDataSource>(
        () => MovieRemoteDataSourceImpl(getIt()));
  }

  static Future<void> setupDomain() async {
    //di for repositories
    getIt.registerLazySingleton<MovieRepository>(
        () => MovieRepositoryImpl(getIt()));

    //di for use case
    getIt.registerLazySingleton<MovieUseCaseImpl>(
        () => MovieUseCaseImpl(getIt()));
  }

  static Future<void> setupPresentation() async {
    getIt.registerFactory(() => MovieCarouselBloc(getMovie: getIt() , movieBackdropBloc: getIt()));
    getIt.registerLazySingleton<MovieBackdropBloc>(() => MovieBackdropBloc());
  }
}
