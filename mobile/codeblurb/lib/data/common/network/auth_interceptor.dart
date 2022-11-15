part of 'dio.dart';

class _AuthInterceptor extends QueuedInterceptor {
  final SharedPreferences _preferences;

  _AuthInterceptor(this._preferences);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final headers = <String, String>{};
    final token = _preferences.getString(AppConstants.accessToken);
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }
    options.headers = headers;
    return handler.next(options);
  }
}
