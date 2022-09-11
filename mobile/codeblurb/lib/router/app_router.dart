import 'package:auto_route/auto_route.dart';
import 'package:codeblurb/presentation/features/splash_screen.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';
part 'routes.dart';

@CupertinoAutoRouter(
  routes: _routes,
  replaceInRouteName: 'Screen,Route',
)
class AppRouter extends _$AppRouter {}
