import 'package:codeblurb/core/app_constants.dart';
import 'package:codeblurb/data/auth/auth_repository.dart';
import 'package:codeblurb/presentation/extensions/build_context_x.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginNotifier extends StateNotifier<AsyncValue<void>> {
  LoginNotifier(
    this._authRepo,
    this._sharedPrefs,
  ) : super(const AsyncData(null));

  final AuthRepository _authRepo;
  final SharedPreferences _sharedPrefs;

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> init() async {
    final refreshToken = _sharedPrefs.getString(AppConstants.refreshToken);
    if (refreshToken != null) {
      state = const AsyncLoading();
      state = await AsyncValue.guard(_authRepo.refreshToken);
    }
  }

  Future<void> login(BuildContext context) async {
    if (context.isFormValid) {
      state = const AsyncLoading();
      state = await AsyncValue.guard(
        () => _authRepo.login(
          username: usernameController.text,
          password: passwordController.text,
        ),
      );
    }
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
