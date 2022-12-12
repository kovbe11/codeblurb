import 'package:codeblurb/data/auth/auth_repository.dart';
import 'package:codeblurb/presentation/features/registration/notifier/registration_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final registrationNotifierProvider =
    StateNotifierProvider.autoDispose<RegistrationNotifier, AsyncValue<void>>(
  (ref) => RegistrationNotifier(
    ref.watch(authRepoProvider),
  ),
  name: 'Registration Notifier Provider',
);
