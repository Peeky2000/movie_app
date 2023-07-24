import 'package:dio/dio.dart';
import 'package:movie_app/data/core/api_constants.dart';

abstract class ApiHandler {
  dynamic get(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  });

  dynamic post(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  });
}

class ApiClient implements ApiHandler {
  final Dio _dio;
  ApiClient(this._dio);

  @override
  get(String path,
      {Object? data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onReceiveProgress}) async {
    String url =
        '${ApiConstants.BASE_URL}$path?api_key=${ApiConstants.API_KEY}';
    final response = await _dio.get(
      url,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception("Failed to fetch data");
    }
  }

  @override
  post(String path,
      {Object? data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onReceiveProgress}) async {}
}
