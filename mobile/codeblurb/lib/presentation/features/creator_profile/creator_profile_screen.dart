import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CreatorProfileScreen extends StatelessWidget {
  const CreatorProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("creatorProfileScreen"),
      ),
    );
  }
}
