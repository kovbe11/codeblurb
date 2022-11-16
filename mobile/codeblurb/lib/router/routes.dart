part of 'app_router.dart';

const _routes = [
  AutoRoute(page: SplashScreen),
  AutoRoute(page: LoginScreen, initial: true),
  AutoRoute(page: DraggableCodeEditingScreen),
  AutoRoute(page: CodeEditingScreen)
];
