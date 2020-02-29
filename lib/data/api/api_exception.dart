class ApiException implements Exception {
  final int statusCode;

  ApiException(this.statusCode);
}

class AuthorizationException implements Exception {}
