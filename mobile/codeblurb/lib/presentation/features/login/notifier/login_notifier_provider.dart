import 'package:codeblurb/data/auth/auth_repository.dart';
import 'package:codeblurb/presentation/features/login/notifier/login_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginNotifierProvider =
    StateNotifierProvider.autoDispose<LoginNotifier, AsyncValue<void>>(
  (ref) => LoginNotifier(
    ref.watch(authRepoProvider),
  ),
  name: 'Login Notifier Provider',
);
