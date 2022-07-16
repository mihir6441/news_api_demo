import 'package:dio/dio.dart';

class DioClient {
  late final Dio _dio;

  DioClient() {
    const _baseUrl =
        'https://newsapi.org/v2'; // paste your API's baseUrl here...

    final BaseOptions _options = BaseOptions(
        sendTimeout: 30000,
        connectTimeout: 30000,
        receiveTimeout: 30000,
        baseUrl: _baseUrl,
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        });

    _dio = Dio(_options);
  }

  Dio getDio() => _dio;
}
