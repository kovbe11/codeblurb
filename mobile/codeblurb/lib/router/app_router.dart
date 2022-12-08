import 'package:auto_route/auto_route.dart';
import 'package:codeblurb/presentation/features/browse_courses_screen.dart';
import 'package:codeblurb/presentation/features/code_editing/code_editing_screen.dart';
import 'package:codeblurb/presentation/features/code_editing/draggable_code_editing_screen.dart';
import 'package:codeblurb/presentation/features/login/login_screen.dart';
import 'package:codeblurb/presentation/features/my_courses/my_courses_screen.dart';
import 'package:codeblurb/presentation/features/settings/settings_screen.dart';
import 'package:codeblurb/presentation/features/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';

import '../presentation/features/home/home_screen.dart';

part 'app_router.gr.dart';
part 'routes.dart';

@CupertinoAutoRouter(
  routes: _routes,
  replaceInRouteName: 'Screen,Route',
)
class AppRouter extends _$AppRouter {}
