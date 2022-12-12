import 'package:auto_route/auto_route.dart';
import 'package:codeblurb/generated/assets/assets.gen.dart';
import 'package:codeblurb/generated/l10n.dart';
import 'package:codeblurb/presentation/extensions/async_value_ui.dart';
import 'package:codeblurb/presentation/features/login/notifier/login_notifier.dart';
import 'package:codeblurb/presentation/utils/validators.dart';
import 'package:codeblurb/presentation/widgets/image_card.dart';
import 'package:codeblurb/presentation/widgets/input_field.dart';
import 'package:codeblurb/presentation/widgets/primary_button.dart';
import 'package:codeblurb/presentation/widgets/secondary_button.dart';
import 'package:codeblurb/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'notifier/login_notifier_provider.dart';

part 'components/login_form.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue<void>>(
        loginNotifierProvider,
        (_, state) => state
          ..bindLoader(context)
          ..whenData((data) {
            if (!state.isRefreshing) {
              if (state.hasValue) {
                context.router.replace(const HomeRoute());
              }
            }
          }));

    final notifier = ref.watch(loginNotifierProvider.notifier);
    final l10n = S.of(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: FocusTraversalGroup(
              child: FormBuilder(
                child: _LoginForm(
                  l10n: l10n,
                  notifier: notifier,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
