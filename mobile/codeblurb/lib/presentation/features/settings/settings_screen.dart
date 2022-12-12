import 'package:auto_route/auto_route.dart';
import 'package:codeblurb/router/app_router.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.amber,
      child: Center(
        child: ElevatedButton(
            onPressed: () {
              context.router.push(const CodeEditingRoute());
            },
            child: const Text("To Code editing screen")),
      ),
    );
  }
}
