// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return CupertinoPageX<dynamic>(
          routeData: routeData, child: const SplashScreen());
    },
    LoginRoute.name: (routeData) {
      return CupertinoPageX<dynamic>(
          routeData: routeData, child: const LoginScreen());
    },
    CodeEditingRoute.name: (routeData) {
      return CupertinoPageX<dynamic>(
          routeData: routeData, child: const CodeEditingScreen());
    },
    ShoppingCartRoute.name: (routeData) {
      return CupertinoPageX<dynamic>(
          routeData: routeData, child: const ShoppingCartScreen());
    },
    CourseDetailsRoute.name: (routeData) {
      return CupertinoPageX<dynamic>(
          routeData: routeData, child: const CourseDetailsScreen());
    },
    HomeRoute.name: (routeData) {
      return CupertinoPageX<dynamic>(
          routeData: routeData, child: const HomeScreen());
    },
    BrowseCoursesRouter.name: (routeData) {
      return CupertinoPageX<dynamic>(
          routeData: routeData, child: const EmptyRouterPage());
    },
    MyCoursesRouter.name: (routeData) {
      return CupertinoPageX<dynamic>(
          routeData: routeData, child: const EmptyRouterPage());
    },
    SettingsRouter.name: (routeData) {
      return CupertinoPageX<dynamic>(
          routeData: routeData, child: const EmptyRouterPage());
    },
    BrowseCoursesRoute.name: (routeData) {
      final args = routeData.argsAs<BrowseCoursesRouteArgs>(
          orElse: () => const BrowseCoursesRouteArgs());
      return CupertinoPageX<dynamic>(
          routeData: routeData, child: BrowseCoursesScreen(key: args.key));
    },
    MyCoursesRoute.name: (routeData) {
      final args = routeData.argsAs<MyCoursesRouteArgs>(
          orElse: () => const MyCoursesRouteArgs());
      return CupertinoPageX<dynamic>(
          routeData: routeData, child: MyCoursesScreen(key: args.key));
    },
    SettingsRoute.name: (routeData) {
      return CupertinoPageX<dynamic>(
          routeData: routeData, child: const SettingsScreen());
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(SplashRoute.name, path: '/splash-screen'),
        RouteConfig(LoginRoute.name, path: '/'),
        RouteConfig(CodeEditingRoute.name, path: '/code-editing-screen'),
        RouteConfig(ShoppingCartRoute.name, path: '/shopping-cart-screen'),
        RouteConfig(CourseDetailsRoute.name, path: '/course-details-screen'),
        RouteConfig(HomeRoute.name, path: '/home', children: [
          RouteConfig(BrowseCoursesRouter.name,
              path: 'browse',
              parent: HomeRoute.name,
              children: [
                RouteConfig(BrowseCoursesRoute.name,
                    path: '', parent: BrowseCoursesRouter.name)
              ]),
          RouteConfig(MyCoursesRouter.name,
              path: 'my-courses',
              parent: HomeRoute.name,
              children: [
                RouteConfig(MyCoursesRoute.name,
                    path: '', parent: MyCoursesRouter.name)
              ]),
          RouteConfig(SettingsRouter.name,
              path: 'settings',
              parent: HomeRoute.name,
              children: [
                RouteConfig(SettingsRoute.name,
                    path: '', parent: SettingsRouter.name)
              ])
        ])
      ];
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/splash-screen');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [CodeEditingScreen]
class CodeEditingRoute extends PageRouteInfo<void> {
  const CodeEditingRoute()
      : super(CodeEditingRoute.name, path: '/code-editing-screen');

  static const String name = 'CodeEditingRoute';
}

/// generated route for
/// [ShoppingCartScreen]
class ShoppingCartRoute extends PageRouteInfo<void> {
  const ShoppingCartRoute()
      : super(ShoppingCartRoute.name, path: '/shopping-cart-screen');

  static const String name = 'ShoppingCartRoute';
}

/// generated route for
/// [CourseDetailsScreen]
class CourseDetailsRoute extends PageRouteInfo<void> {
  const CourseDetailsRoute()
      : super(CourseDetailsRoute.name, path: '/course-details-screen');

  static const String name = 'CourseDetailsRoute';
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(HomeRoute.name, path: '/home', initialChildren: children);

  static const String name = 'HomeRoute';
}

/// generated route for
/// [EmptyRouterPage]
class BrowseCoursesRouter extends PageRouteInfo<void> {
  const BrowseCoursesRouter({List<PageRouteInfo>? children})
      : super(BrowseCoursesRouter.name,
            path: 'browse', initialChildren: children);

  static const String name = 'BrowseCoursesRouter';
}

/// generated route for
/// [EmptyRouterPage]
class MyCoursesRouter extends PageRouteInfo<void> {
  const MyCoursesRouter({List<PageRouteInfo>? children})
      : super(MyCoursesRouter.name,
            path: 'my-courses', initialChildren: children);

  static const String name = 'MyCoursesRouter';
}

/// generated route for
/// [EmptyRouterPage]
class SettingsRouter extends PageRouteInfo<void> {
  const SettingsRouter({List<PageRouteInfo>? children})
      : super(SettingsRouter.name, path: 'settings', initialChildren: children);

  static const String name = 'SettingsRouter';
}

/// generated route for
/// [BrowseCoursesScreen]
class BrowseCoursesRoute extends PageRouteInfo<BrowseCoursesRouteArgs> {
  BrowseCoursesRoute({Key? key})
      : super(BrowseCoursesRoute.name,
            path: '', args: BrowseCoursesRouteArgs(key: key));

  static const String name = 'BrowseCoursesRoute';
}

class BrowseCoursesRouteArgs {
  const BrowseCoursesRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'BrowseCoursesRouteArgs{key: $key}';
  }
}

/// generated route for
/// [MyCoursesScreen]
class MyCoursesRoute extends PageRouteInfo<MyCoursesRouteArgs> {
  MyCoursesRoute({Key? key})
      : super(MyCoursesRoute.name,
            path: '', args: MyCoursesRouteArgs(key: key));

  static const String name = 'MyCoursesRoute';
}

class MyCoursesRouteArgs {
  const MyCoursesRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'MyCoursesRouteArgs{key: $key}';
  }
}

/// generated route for
/// [SettingsScreen]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute() : super(SettingsRoute.name, path: '');

  static const String name = 'SettingsRoute';
}
