part of 'app_router.dart';

final _routes = [
  AutoRoute(page: SplashRoute.page),
  AutoRoute(page: LoginRoute.page, initial: true),
  AutoRoute(page: RegistrationRoute.page),
  AutoRoute(page: CodeEditingRoute.page),
  AutoRoute(page: ShoppingCartRoute.page),
  AutoRoute(page: CourseDetailsRoute.page),
  AutoRoute(page: CreatorProfileRoute.page),
  AutoRoute(page: CodingTaskTabsRoute.page),
  AutoRoute(
    path: '/home',
    page: HomeRoute.page,
    children: [
      AutoRoute(
        path: 'browse',
        page: BrowseCoursesRouter.page,
      ),
      AutoRoute(
        path: 'my-courses',
        page: MyCoursesRouter.page,
      ),
      AutoRoute(
        path: 'settings',
        page: SettingsRouter.page,
      ),
    ],
  ),
];
