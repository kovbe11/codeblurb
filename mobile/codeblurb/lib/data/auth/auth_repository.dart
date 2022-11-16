import 'package:codeblurb/core/app_constants.dart';
import 'package:codeblurb/data/auth/auth_api.dart';
import 'package:codeblurb/data/auth/models/login_request.dart';
import 'package:codeblurb/data/auth/models/login_response.dart';
import 'package:codeblurb/data/auth/models/refresh_token_request.dart';
import 'package:codeblurb/data/auth/models/refresh_token_response.dart';
import 'package:codeblurb/providers/core_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final authRepoProvider = Provider<AuthRepository>(
  (ref) => AuthRepository(
      ref.watch(authApiProvider), ref.watch(sharedPrefsProvider)),
  name: 'Auth Repository Provider',
);

class AuthRepository {
  final AuthApi _authApi;
  final SharedPreferences _sharedPreferences;

  AuthRepository(this._authApi, this._sharedPreferences);

  Future<dynamic> register() async {
    return _authApi.register();
  }

  Future<dynamic> refreshToken() async {
    final response = await _authApi.refreshToken(RefreshTokenRequest(
      _sharedPreferences.getString(AppConstants.refreshToken) ?? '',
    ));
    final refreshResponse = RefreshTokenResponse.fromJson(response.data);
    await _saveTokens(
        access: refreshResponse.accessToken,
        refresh: refreshResponse.refreshToken);
  }

  Future<dynamic> logout() async {
    return _authApi.logout();
  }

  Future<void> login(
      {required String username, required String password}) async {
    final response = await _authApi.login(LoginRequest(username, password));
    final loginResponse = LoginResponse.fromJson(response.data);
    await _saveTokens(
        access: loginResponse.accessToken, refresh: loginResponse.refreshToken);
  }

  Future<dynamic> forceLogout() async {
    return _authApi.forceLogout();
  }

  Future<void> _saveTokens({required String access, required String refresh}) {
    return Future.wait([
      _sharedPreferences.setString(AppConstants.accessToken, access),
      _sharedPreferences.setString(AppConstants.refreshToken, refresh)
    ]);
  }
}
