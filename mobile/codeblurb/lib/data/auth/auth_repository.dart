import 'package:codeblurb/core/app_constants.dart';
import 'package:codeblurb/data/auth/auth_api.dart';
import 'package:codeblurb/data/auth/models/login_request.dart';
import 'package:codeblurb/data/auth/models/login_response.dart';
import 'package:codeblurb/data/auth/models/refresh_token_request.dart';
import 'package:codeblurb/data/auth/models/refresh_token_response.dart';
import 'package:codeblurb/data/common/handle_request.dart';
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

  Future<void> register() async {
    return handleRequest(
      request: _authApi.register(),
      jsonParser: (p0) {},
    );
  }

  Future<void> refreshToken() async {
    final refreshResponse = await handleRequest(
        request: _authApi.refreshToken(RefreshTokenRequest(
          _sharedPreferences.getString(AppConstants.refreshToken) ?? '',
        )),
        jsonParser: RefreshTokenResponse.fromJson);
    await _saveTokens(
        access: refreshResponse.accessToken,
        refresh: refreshResponse.refreshToken);
  }

  Future<void> logout() async {
    await _authApi.logout();
    await _clearTokens();
  }

  Future<void> login(
      {required String username, required String password}) async {
    final loginResponse = await handleRequest(
        request: _authApi.login(LoginRequest(username, password)),
        jsonParser: LoginResponse.fromJson);
    await _saveTokens(
        access: loginResponse.accessToken, refresh: loginResponse.refreshToken);
  }

  Future<void> forceLogout() async {
    await _authApi.forceLogout();
    await _clearTokens();
  }

  Future<void> _saveTokens({required String access, required String refresh}) {
    return Future.wait([
      _sharedPreferences.setString(AppConstants.accessToken, access),
      _sharedPreferences.setString(AppConstants.refreshToken, refresh)
    ]);
  }

  Future<void> _clearTokens() {
    return Future.wait([
      _sharedPreferences.remove(AppConstants.accessToken),
      _sharedPreferences.remove(AppConstants.refreshToken)
    ]);
  }
}
