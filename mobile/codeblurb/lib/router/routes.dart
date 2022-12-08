part of 'app_router.dart';

const _routes = [
  AutoRoute(page: SplashScreen),
  AutoRoute(page: LoginScreen, initial: true),
  AutoRoute(page: DraggableCodeEditingScreen),
  AutoRoute(page: CodeEditingScreen),
  AutoRoute(
    path: '/home',
    page: HomeScreen,
    children: [
      AutoRoute(
        path: 'browse',
        name: 'BrowseCoursesRouter',
        page: EmptyRouterPage,
        children: [
          AutoRoute(path: '', page: BrowseCoursesScreen),
        ],
      ),
      AutoRoute(
        path: 'my-courses',
        name: 'MyCoursesRouter',
        page: EmptyRouterPage,
        children: [
          AutoRoute(path: '', page: MyCoursesScreen),
        ],
      ),
      AutoRoute(
        path: 'settings',
        name: 'SettingsRouter',
        page: EmptyRouterPage,
        children: [
          AutoRoute(path: '', page: SettingsScreen),
        ],
      ),
    ],
  ),
];
