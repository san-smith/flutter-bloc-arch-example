import 'package:dio/dio.dart';
import 'package:flutter_bloc_arch/data/api/api_exception.dart';
import 'package:flutter_bloc_arch/data/api/mapper/user_mapper.dart';
import 'package:flutter_bloc_arch/data/api/model/api_user.dart';
import 'package:flutter_bloc_arch/domain/model/user.dart';

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

  ///// ROUTES /////

  static const _USERS = '/users/';

  ///// METHODS /////

  Future<Response<T>> _try<T>(Future<Response<T>> request) async {
    try {
      return await request;
    } on DioError catch (error) {
      switch (error.response.statusCode) {
        case 401:
          throw AuthorizationException();
        default:
          throw ApiException(error.response.statusCode);
      }
    }
  }

  Map<String, String> _getHeaders({String token}) {
    Map<String, String> header = {
      'accept': 'application/json',
    };
    if (token != null) {
      header['Auth'] = token;
    }
    return header;
  }

  Future<Response<T>> _post<T>(
    String path, {
    dynamic data,
    String token,
    Function(int, int) onSendProgress,
    Function(int, int) onReceiveProgress,
  }) async {
    return await _try(_dio.post(
      path,
      data: data,
      options: Options(headers: _getHeaders(token: token)),
      onSendProgress: onSendProgress,
    ));
  }

  Future<Response<T>> _get<T>(
    String path, {
    Map<String, dynamic> queryParameters,
    String token,
    Function(int, int) onReceiveProgress,
  }) async {
    return await _try(_dio.get(
      path,
      queryParameters: queryParameters,
      options: Options(headers: _getHeaders(token: token)),
    ));
  }

  ///// REQUESTS /////

  Future<List<User>> getUsers() async {
    var response = await _get(_USERS);
    return List.of(response.data)
        .map((item) => ApiUser.fromMap(item))
        .map((item) => UserMapper.fromApi(item))
        .toList();
  }
}
