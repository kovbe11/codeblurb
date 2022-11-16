import 'package:codeblurb/data/auth/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginNotifier extends StateNotifier<AsyncValue<void>> {
  LoginNotifier(
    this._authRepo,
  ) : super(const AsyncData(null));

  final AuthRepository _authRepo;

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> login() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => _authRepo.login(
        username: "testUser",
        password: "testPassword",
      ),
    );
  }

  Future<void> logout() => _authRepo.logout();

  Future<void> forceLogout() => _authRepo.forceLogout();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
