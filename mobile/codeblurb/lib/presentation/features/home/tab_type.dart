import 'package:auto_route/auto_route.dart';
import 'package:codeblurb/router/app_router.dart';
import 'package:flutter/material.dart';

enum TabType {
  browseCourses,
  myCourses,
  settings;

  PageRouteInfo<dynamic> get route {
    switch (this) {
      case TabType.browseCourses:
        return const BrowseCoursesRouter();
      case TabType.myCourses:
        return const MyCoursesRouter();
      case TabType.settings:
        return const SettingsRouter();
    }
  }

  String get label {
    switch (this) {
      case TabType.browseCourses:
        return 'Browse';
      case TabType.myCourses:
        return 'My courses';
      case TabType.settings:
        return 'Settings';
    }
  }

  IconData get icon {
    switch (this) {
      case TabType.browseCourses:
        return Icons.search_rounded;
      case TabType.myCourses:
        return Icons.play_circle_outlined;
      case TabType.settings:
        return Icons.settings;
    }
  }
}
