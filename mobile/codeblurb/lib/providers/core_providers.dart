import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final remoteConfigProvider = Provider<FirebaseRemoteConfig>(
  (_) => throw UnimplementedError(),
  name: 'Remote Config Provider',
);

final sharedPrefsProvider = Provider<SharedPreferences>(
  (_) => throw UnimplementedError(),
  name: 'Shared Preferences Provider',
);
