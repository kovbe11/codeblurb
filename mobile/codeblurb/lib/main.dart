import 'dart:async';

import 'package:codeblurb/codeblurb_app.dart';
import 'package:codeblurb/core/firebase_constants.dart';
import 'package:codeblurb/firebase_options.dart';
import 'package:codeblurb/providers/core_providers.dart';
import 'package:codeblurb/utils/logger.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    final sharedPrefs = await SharedPreferences.getInstance();
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    final remoteConfig = FirebaseRemoteConfig.instance;
    await remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(minutes: 1),
        minimumFetchInterval: const Duration(hours: 1),
      ),
    );
    await remoteConfig.setDefaults(const {
      RemoteConfigKeys.dummy: 'local remote config value',
    });
    runApp(
      ProviderScope(
        overrides: [
          remoteConfigProvider.overrideWithValue(remoteConfig),
          sharedPrefsProvider.overrideWithValue(sharedPrefs),
        ],
        observers: const [Logger()],
        child: CodeblurbApp(),
      ),
    );
  },
      ((error, stack) =>
          FirebaseCrashlytics.instance.recordError(error, stack, fatal: true)));
}
