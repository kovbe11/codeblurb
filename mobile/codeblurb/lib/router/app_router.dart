import 'package:auto_route/auto_route.dart';
import 'package:codeblurb/presentation/features/browse_courses/browse_courses_screen.dart';
import 'package:codeblurb/presentation/features/code_editing/code_editing_screen.dart';
import 'package:codeblurb/presentation/features/course_details/course_details_screen.dart';
import 'package:codeblurb/presentation/features/creator_profile/creator_profile_screen.dart';
import 'package:codeblurb/presentation/features/login/login_screen.dart';
import 'package:codeblurb/presentation/features/my_courses/my_courses_screen.dart';
import 'package:codeblurb/presentation/features/registration/registration_screen.dart';
import 'package:codeblurb/presentation/features/settings/settings_screen.dart';
import 'package:codeblurb/presentation/features/shopping_cart/shopping_cart_screen.dart';
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
