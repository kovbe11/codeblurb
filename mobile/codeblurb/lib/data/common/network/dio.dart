import 'dart:convert';

import 'package:codeblurb/core/app_constants.dart';
import 'package:codeblurb/providers/core_providers.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_interceptor.dart';
part 'dio_utils.dart';

final dioProvider = Provider<Dio>(
  (ref) {
    final dio = Dio(BaseOptions(baseUrl: AppConstants.baseUrl))
      ..interceptors.addAll([
        if (!kReleaseMode)
          PrettyDioLogger(requestBody: true, responseBody: true),
        _AuthInterceptor(ref.watch(sharedPrefsProvider)),
      ]);

    (dio.transformer as DefaultTransformer).jsonDecodeCallback = _parseJson;

    return dio;
  },
  name: 'Dio Provider',
);
