import 'dart:html';

import 'package:movie_app/data/core/api_constants.dart';
import 'package:http/http.dart' as http;

class ApiClient{

  ApiClient();

  dynamic get(String path) async{
    String url = '${ApiConstants.BASE_URL}$path?api_key=${ApiConstants.API_KEY}';
    final response = await http.get(
      Uri.parse(url),
    );
  }

}