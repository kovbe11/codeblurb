import 'package:auto_route/auto_route.dart';
import 'package:codeblurb/router/app_router.dart';

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
}
