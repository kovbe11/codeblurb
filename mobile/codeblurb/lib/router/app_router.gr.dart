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
    DraggableCodeEditingRoute.name: (routeData) {
      return CupertinoPageX<dynamic>(
          routeData: routeData, child: const DraggableCodeEditingScreen());
    },
    CodeEditingRoute.name: (routeData) {
      return CupertinoPageX<dynamic>(
          routeData: routeData, child: const CodeEditingScreen());
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(SplashRoute.name, path: '/splash-screen'),
        RouteConfig(DraggableCodeEditingRoute.name,
            path: '/draggable-code-editing-screen'),
        RouteConfig(CodeEditingRoute.name, path: '/')
      ];
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/splash-screen');

  static const String name = 'SplashRoute';
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
  const CodeEditingRoute() : super(CodeEditingRoute.name, path: '/');

  static const String name = 'CodeEditingRoute';
}
