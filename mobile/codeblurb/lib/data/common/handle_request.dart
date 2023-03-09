import 'dart:developer';

import 'package:codeblurb/data/common/network/models/error_response.dart';
import 'package:dio/dio.dart';

import 'exceptions/api_exception.dart';

Future<T> handleRequest<T>({
  required Future<Response<dynamic>> request,
  required T Function(Map<String, dynamic>) jsonParser,
  Never Function(DioError)? onDioError,
  Never Function(Object)? onOtherError,
}) async {
  try {
    final response = await request;
    return jsonParser(response.data);
  } on DioError catch (e) {
    final errorData = e.response?.data;
    if (errorData != null && onDioError == null) {
      throw ApiException(ErrorResponse.fromJson(errorData).errorMessage);
    }
    onDioError?.call(e);
    rethrow;
  } catch (e) {
    log(e.toString());
    onOtherError?.call(e);
    rethrow;
  }
}
