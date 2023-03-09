class ApiException implements Exception {
  final String errorMessage;

  ApiException(this.errorMessage);
}
