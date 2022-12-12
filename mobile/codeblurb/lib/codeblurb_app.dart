import 'package:codeblurb/core/app_theme.dart';
import 'package:codeblurb/generated/l10n.dart';
import 'package:codeblurb/router/app_router.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class CodeblurbApp extends StatelessWidget {
  CodeblurbApp({super.key});
  final router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.dark,
      localizationsDelegates: const [
        S.delegate,
        ...GlobalMaterialLocalizations.delegates
      ],
      routerDelegate: router.delegate(
        navigatorObservers: () =>
            [FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance)],
      ),
      routeInformationParser: router.defaultRouteParser(),
      builder: (_, page) => _PageWrapper(child: page!),
    );
  }
}

class _PageWrapper extends StatelessWidget {
  const _PageWrapper({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: child,
    );
  }
}
