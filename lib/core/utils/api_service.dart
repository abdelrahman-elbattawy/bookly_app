import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = 'https://www.googleapis.com/books/v1/v';
  final Dio dio;

  ApiService({required this.dio});

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var respone = await dio.get('$_baseUrl$endPoint');

    return respone.data;
  }
}
