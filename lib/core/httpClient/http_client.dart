import 'package:dio/dio.dart';

import '../api.dart';

class HttpDio {
  var dio = Dio();
  var response;

  Future getStatusCode() async {
    try {
      response = await dio.get(Api.url);
      print(response.statusCode);
      return response.statusCode;
    } catch (e) {
      rethrow;
    }
  }
}
