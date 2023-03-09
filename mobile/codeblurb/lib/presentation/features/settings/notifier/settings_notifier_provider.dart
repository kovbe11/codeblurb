import 'package:codeblurb/data/auth/auth_repository.dart';
import 'package:codeblurb/presentation/features/settings/notifier/settings_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final settingsNotifierProvider =
    StateNotifierProvider.autoDispose<SettingsNotifier, AsyncValue<void>>(
  (ref) => SettingsNotifier(
    ref.watch(authRepoProvider),
  ),
  name: 'Settings Notifier Provider',
);
