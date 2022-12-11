import 'package:auto_route/auto_route.dart';
import 'package:codeblurb/router/app_router.dart';
import 'package:flutter/material.dart';

class MyCoursesScreen extends StatelessWidget {
  const MyCoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          onPressed: () {
            context.router.push(const CodeEditingRoute());
          },
          child: const Text("To Code editing screen")),
    );
  }
}
