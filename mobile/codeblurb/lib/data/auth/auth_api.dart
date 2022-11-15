import 'package:codeblurb/data/common/network/dio.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authApiProvider = Provider<AuthApi>(
  (ref) => AuthApi(ref.watch(dioProvider)),
  name: 'Auth API Provider',
);

class AuthApi {
  AuthApi(this._dio);

  final Dio _dio;

  Future<dynamic> register() async {
    return _dio.post('/auth/register');
  }

  Future<dynamic> refreshToken() async {
    return _dio.post('/auth/refresh');
  }

  Future<dynamic> logout() async {
    return _dio.post('/auth/logout');
  }

  Future<dynamic> login() async {
    return _dio.post('/auth/login');
  }

  Future<dynamic> forceLogout() async {
    return _dio.post('/auth/force-logout');
  }
}
