import 'package:codeblurb/data/common/network/dio.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final contentApiProvider = Provider<ContentApi>(
  (ref) => ContentApi(ref.watch(dioProvider)),
  name: 'Content API Provider',
);

class ContentApi {
  ContentApi(this._dio);

  final Dio _dio;

  Future<Response> getQuizResult({required int contentId}) async {
    return _dio.post('/content/quiz/solution/$contentId');
  }

  Future<Response> getCodeSolutionResult({required int contentId}) async {
    return _dio.post('/content/code/solution/$contentId');
  }

  Future<Response> getCodeQuizSolutionResult({required int contentId}) async {
    return _dio.post('/content/code/code-quiz-solution/$contentId');
  }

  Future<Response> getMyContent() async {
    return _dio.get('/content/my-content-bundles');
  }
}
