import 'package:codeblurb/data/auth/auth_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepoProvider = Provider<AuthRepository>(
  (ref) => AuthRepository(ref.watch(authApiProvider)),
  name: 'Auth Repository Provider',
);

class AuthRepository {
  final AuthApi _authApi;

  AuthRepository(this._authApi);

  Future<dynamic> register() async {
    return _authApi.register();
  }

  Future<dynamic> refreshToken() async {
    return _authApi.refreshToken();
  }

  Future<dynamic> logout() async {
    return _authApi.logout();
  }

  Future<dynamic> login() async {
    return _authApi.login();
  }

  Future<dynamic> forceLogout() async {
    return _authApi.forceLogout();
  }
}
