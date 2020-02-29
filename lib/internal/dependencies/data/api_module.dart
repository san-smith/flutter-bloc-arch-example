import 'package:flutter_bloc_arch/data/api/api_config.dart';
import 'package:flutter_bloc_arch/data/api/api_util.dart';
import 'package:flutter_bloc_arch/data/api/service/rest_service.dart';

class ApiModule {
  static ApiUtil _apiUtil;
  static RestService _restService;

  static RestService restService() {
    if (_restService == null) {
      _restService = RestService(
        ApiConfig.API_URL,
        ApiConfig.CONNECTION_TIMEOUT,
      );
    }
    return _restService;
  }

  static ApiUtil apiUtil() {
    if (_apiUtil == null) {
      _apiUtil = ApiUtil(
        restService: restService(),
      );
    }
    return _apiUtil;
  }
}
