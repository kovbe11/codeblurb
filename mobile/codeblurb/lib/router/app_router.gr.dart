// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    CodeEditingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CodeEditingScreen(),
      );
    },
    CourseDetailsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CourseDetailsScreen(),
      );
    },
    SettingsRouter.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    RegistrationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RegistrationScreen(),
      );
    },
    CreatorProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CreatorProfileScreen(),
      );
    },
    BrowseCoursesRouter.name: (routeData) {
      final args = routeData.argsAs<BrowseCoursesRouterArgs>(
          orElse: () => const BrowseCoursesRouterArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: BrowseCoursesScreen(key: args.key),
      );
    },
    CodingTaskTabsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CodingTaskTabsScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashScreen(),
      );
    },
    MyCoursesRouter.name: (routeData) {
      final args = routeData.argsAs<MyCoursesRouterArgs>(
          orElse: () => const MyCoursesRouterArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MyCoursesScreen(key: args.key),
      );
    },
    ShoppingCartRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ShoppingCartScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginScreen(),
      );
    },
  };
}

/// generated route for
/// [CodeEditingScreen]
class CodeEditingRoute extends PageRouteInfo<void> {
  const CodeEditingRoute({List<PageRouteInfo>? children})
      : super(
          CodeEditingRoute.name,
          initialChildren: children,
        );

  static const String name = 'CodeEditingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CourseDetailsScreen]
class CourseDetailsRoute extends PageRouteInfo<void> {
  const CourseDetailsRoute({List<PageRouteInfo>? children})
      : super(
          CourseDetailsRoute.name,
          initialChildren: children,
        );

  static const String name = 'CourseDetailsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingsScreen]
class SettingsRouter extends PageRouteInfo<void> {
  const SettingsRouter({List<PageRouteInfo>? children})
      : super(
          SettingsRouter.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRouter';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RegistrationScreen]
class RegistrationRoute extends PageRouteInfo<void> {
  const RegistrationRoute({List<PageRouteInfo>? children})
      : super(
          RegistrationRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegistrationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CreatorProfileScreen]
class CreatorProfileRoute extends PageRouteInfo<void> {
  const CreatorProfileRoute({List<PageRouteInfo>? children})
      : super(
          CreatorProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreatorProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [BrowseCoursesScreen]
class BrowseCoursesRouter extends PageRouteInfo<BrowseCoursesRouterArgs> {
  BrowseCoursesRouter({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          BrowseCoursesRouter.name,
          args: BrowseCoursesRouterArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'BrowseCoursesRouter';

  static const PageInfo<BrowseCoursesRouterArgs> page =
      PageInfo<BrowseCoursesRouterArgs>(name);
}

class BrowseCoursesRouterArgs {
  const BrowseCoursesRouterArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'BrowseCoursesRouterArgs{key: $key}';
  }
}

/// generated route for
/// [CodingTaskTabsScreen]
class CodingTaskTabsRoute extends PageRouteInfo<void> {
  const CodingTaskTabsRoute({List<PageRouteInfo>? children})
      : super(
          CodingTaskTabsRoute.name,
          initialChildren: children,
        );

  static const String name = 'CodingTaskTabsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MyCoursesScreen]
class MyCoursesRouter extends PageRouteInfo<MyCoursesRouterArgs> {
  MyCoursesRouter({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          MyCoursesRouter.name,
          args: MyCoursesRouterArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'MyCoursesRouter';

  static const PageInfo<MyCoursesRouterArgs> page =
      PageInfo<MyCoursesRouterArgs>(name);
}

class MyCoursesRouterArgs {
  const MyCoursesRouterArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'MyCoursesRouterArgs{key: $key}';
  }
}

/// generated route for
/// [ShoppingCartScreen]
class ShoppingCartRoute extends PageRouteInfo<void> {
  const ShoppingCartRoute({List<PageRouteInfo>? children})
      : super(
          ShoppingCartRoute.name,
          initialChildren: children,
        );

  static const String name = 'ShoppingCartRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
