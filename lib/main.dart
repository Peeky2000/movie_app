import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:movie_app/data/core/api_client.dart';
import 'package:movie_app/data/data_sources/remote/movie_remote_data_source.dart';
import 'package:movie_app/domain/repositories/movie_repository.dart';
import 'package:movie_app/domain/use_case/movie_use_case.dart';
import 'package:movie_app/presentation/movie_app.dart';
import 'data/repositories/movie_repository_impl.dart';
import 'di/injection.dart' as getIt;
import 'domain/entities/app_error.dart';
import 'domain/entities/movie_entity.dart';
import 'domain/entities/no_params.dart';

Future<void> main() async{

  //make sure flutter framework has been initialized before
  // doing any other work (usually done in main )
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // When using Flutter Native Splash, some of Flutter's initialization commands
  // may be overridden by the splash screen, resulting in errors or unexpected behavior.
  // are not overwritten, helping to ensure that the initialization of widgets
  // in your application continues after the splash screen is finished.
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  //a method used to set the preferred screen orientation for your application
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

  await getIt.Injector.init();
  FlutterNativeSplash.remove();
  runApp(const MovieApp());
}
