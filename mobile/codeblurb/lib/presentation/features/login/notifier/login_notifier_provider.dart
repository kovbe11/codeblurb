import 'package:codeblurb/data/auth/auth_repository.dart';
import 'package:codeblurb/presentation/features/login/notifier/login_notifier.dart';
import 'package:codeblurb/providers/core_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginNotifierProvider =
    StateNotifierProvider.autoDispose<LoginNotifier, AsyncValue<void>>(
  (ref) => LoginNotifier(
    ref.watch(authRepoProvider),
    ref.watch(sharedPrefsProvider),
  ),
  name: 'Login Notifier Provider',
);
