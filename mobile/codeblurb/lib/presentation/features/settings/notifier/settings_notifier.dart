import 'package:codeblurb/data/auth/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsNotifier extends StateNotifier<AsyncValue<void>> {
  SettingsNotifier(
    this._authRepo,
  ) : super(const AsyncData(null));

  final AuthRepository _authRepo;

  Future<void> logout() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => _authRepo.logout(),
    );
  }

  Future<void> forceLogout() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => _authRepo.forceLogout(),
    );
  }
}
