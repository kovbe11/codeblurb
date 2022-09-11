import 'package:codeblurb/generated/l10n.dart';
import 'package:codeblurb/router/app_router.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class CodeblurbApp extends StatelessWidget {
  const CodeblurbApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = AppRouter();

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      darkTheme: ThemeData(),
      themeMode: ThemeMode.system,
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
