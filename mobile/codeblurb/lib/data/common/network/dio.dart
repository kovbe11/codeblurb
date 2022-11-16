import 'dart:convert';

import 'package:codeblurb/core/app_constants.dart';
import 'package:codeblurb/data/auth/auth_repository.dart';
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
    final dio = Dio(BaseOptions(baseUrl: AppConstants.baseUrl));
    dio.interceptors.addAll([
      if (!kReleaseMode) PrettyDioLogger(requestBody: true, responseBody: true),
      _AuthInterceptor(ref.watch(sharedPrefsProvider)),
      InterceptorsWrapper(onError: (error, handler) async {
        if (error.response?.statusCode == 401 ||
            error.response?.statusCode == 403) {
          await ref.read(authRepoProvider).refreshToken();
          _retry(error.requestOptions, dio);
        }
        handler.next(error);
      }),
    ]);

    (dio.transformer as DefaultTransformer).jsonDecodeCallback = _parseJson;

    return dio;
  },
  name: 'Dio Provider',
);

Future<Response<dynamic>> _retry(RequestOptions requestOptions, Dio dio) async {
  final options = Options(
    method: requestOptions.method,
    headers: requestOptions.headers,
  );
  return dio.request<dynamic>(requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options);
}
