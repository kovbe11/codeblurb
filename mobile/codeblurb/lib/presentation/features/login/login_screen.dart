import 'package:auto_route/auto_route.dart';
import 'package:codeblurb/presentation/extensions/async_value_ui.dart';
import 'package:codeblurb/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'notifier/login_notifier_provider.dart';

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
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text('login screen'),
          ElevatedButton(
            onPressed: () => ref.read(loginNotifierProvider.notifier).login(),
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }
}
