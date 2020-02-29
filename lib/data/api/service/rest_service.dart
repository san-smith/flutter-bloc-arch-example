import 'package:dio/dio.dart';

class RestService {
  final String baseUrl;
  final int connectionTimeout;

  Dio _dio;

  RestService(this.baseUrl, this.connectionTimeout) {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: connectionTimeout,
      ),
    );
  }
}
