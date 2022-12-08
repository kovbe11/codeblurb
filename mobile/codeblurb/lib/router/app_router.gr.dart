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
    DraggableCodeEditingRoute.name: (routeData) {
      return CupertinoPageX<dynamic>(
          routeData: routeData, child: const DraggableCodeEditingScreen());
    },
    CodeEditingRoute.name: (routeData) {
      return CupertinoPageX<dynamic>(
          routeData: routeData, child: const CodeEditingScreen());
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
      return CupertinoPageX<dynamic>(
          routeData: routeData, child: const MyCoursesScreen());
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
        RouteConfig(DraggableCodeEditingRoute.name,
            path: '/draggable-code-editing-screen'),
        RouteConfig(CodeEditingRoute.name, path: '/code-editing-screen'),
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
/// [DraggableCodeEditingScreen]
class DraggableCodeEditingRoute extends PageRouteInfo<void> {
  const DraggableCodeEditingRoute()
      : super(DraggableCodeEditingRoute.name,
            path: '/draggable-code-editing-screen');

  static const String name = 'DraggableCodeEditingRoute';
}

/// generated route for
/// [CodeEditingScreen]
class CodeEditingRoute extends PageRouteInfo<void> {
  const CodeEditingRoute()
      : super(CodeEditingRoute.name, path: '/code-editing-screen');

  static const String name = 'CodeEditingRoute';
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
class MyCoursesRoute extends PageRouteInfo<void> {
  const MyCoursesRoute() : super(MyCoursesRoute.name, path: '');

  static const String name = 'MyCoursesRoute';
}

/// generated route for
/// [SettingsScreen]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute() : super(SettingsRoute.name, path: '');

  static const String name = 'SettingsRoute';
}
