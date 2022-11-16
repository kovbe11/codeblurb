import 'package:codeblurb/data/auth/models/login_request.dart';
import 'package:codeblurb/data/auth/models/refresh_token_request.dart';
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

  Future<Response> register() async {
    return _dio.post('/auth/register');
  }

  Future<Response> refreshToken(RefreshTokenRequest request) async {
    return _dio.post('/auth/refresh', data: request.toJson());
  }

  Future<Response> logout() async {
    return _dio.post('/auth/logout');
  }

  Future<Response> login(LoginRequest request) async {
    return _dio.post('/auth/login', data: request.toJson());
  }

  Future<Response> forceLogout() async {
    return _dio.post('/auth/force-logout');
  }
}
