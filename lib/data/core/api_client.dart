import 'package:dio/dio.dart';
import 'package:movie_app/data/core/api_constants.dart';

class ApiClient{

  final Dio _dio;
  ApiClient(this._dio);

  dynamic get(String path) async{
    String url = '${ApiConstants.BASE_URL}$path?api_key=${ApiConstants.API_KEY}';
    final response = await _dio.get(
      url,
      options: Options(
        headers: {
          'Content-Type' : 'application/json',
        },
      ),
    );
    if(response.statusCode == 200){
      return response.data;
    }else{
      throw Exception("Failed to fetch data");
    }
  }

}