import 'package:dio/dio.dart';

class ApiServices {
  final Dio dio;
  final _baseUrl = 'https://newsapi.org/v2/';
  ApiServices(this.dio);

  Future<Map<String, dynamic>> get(String endPoint) async {
    var response = await dio.get("$_baseUrl$endPoint");
    return response.data;
  }
}
