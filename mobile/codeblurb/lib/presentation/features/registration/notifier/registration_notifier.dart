import 'package:codeblurb/data/auth/auth_repository.dart';
import 'package:codeblurb/presentation/extensions/build_context_x.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegistrationNotifier extends StateNotifier<AsyncValue<void>> {
  RegistrationNotifier(
    this._authRepo,
  ) : super(const AsyncData(null));

  final AuthRepository _authRepo;

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  Future<void> register(BuildContext context) async {
    if (context.isFormValid) {
      state = const AsyncLoading();
      state = await AsyncValue.guard(
        () => _authRepo.register(
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
    confirmPasswordController.dispose();
    super.dispose();
  }
}
