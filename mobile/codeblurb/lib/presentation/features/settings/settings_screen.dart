import 'package:auto_route/auto_route.dart';
import 'package:codeblurb/presentation/extensions/async_value_ui.dart';
import 'package:codeblurb/presentation/features/settings/notifier/settings_notifier_provider.dart';
import 'package:codeblurb/presentation/widgets/primary_button.dart';
import 'package:codeblurb/presentation/widgets/secondary_button.dart';
import 'package:codeblurb/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage(name: "SettingsRouter")
class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue<void>>(
        settingsNotifierProvider,
        (_, state) => state
          ..bindLoader(context)
          ..whenData((data) {
            if (!state.isRefreshing) {
              if (state.hasValue) {
                context.router.replace(const LoginRoute());
              }
            }
          }));

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Expanded(
              child: Center(child: Text("additional settings wil go here")),
            ),
            PrimaryButton(
                title: "log out",
                onTap: () =>
                    ref.read(settingsNotifierProvider.notifier).logout()),
            const SizedBox(height: 24),
            SecondaryButton(
                title: "log out with all devices",
                onTap: () =>
                    ref.read(settingsNotifierProvider.notifier).forceLogout()),
          ],
        ),
      ),
    );
  }
}
