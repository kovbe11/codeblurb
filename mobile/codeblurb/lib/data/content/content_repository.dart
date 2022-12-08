import 'package:codeblurb/data/common/handle_request.dart';
import 'package:codeblurb/data/common/network/models/my_content_bundles_separated_response.dart';
import 'package:codeblurb/data/content/content_api.dart';
import 'package:codeblurb/data/content/models/code_quiz_solution_request.dart';
import 'package:codeblurb/data/content/models/code_quiz_solution_response.dart';
import 'package:codeblurb/data/content/models/code_solution_request.dart';
import 'package:codeblurb/data/content/models/code_solution_response.dart';
import 'package:codeblurb/data/content/models/quiz_solution_request.dart';
import 'package:codeblurb/data/content/models/quiz_solution_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final contentRepoProvider = Provider<ContentRepository>(
  (ref) => ContentRepository(ref.watch(contentApiProvider)),
  name: 'Content Repository Provider',
);

class ContentRepository {
  final ContentApi _contentApi;

  ContentRepository(this._contentApi);

  Future<QuizSolutionResponse> sendQuizSolution(
      {required int contentId, required QuizSolutionRequest answers}) async {
    return handleRequest(
      request: _contentApi.sendQuizSolution(
        contentId: contentId,
        body: answers,
      ),
      jsonParser: QuizSolutionResponse.fromJson,
    );
  }

  Future<CodeSolutionResponse> sendCodeSolution(
      {required int contentId,
      required CodeSolutionRequest codeSolution}) async {
    return handleRequest(
        request: _contentApi.sendCodeSolution(
            contentId: contentId, body: codeSolution),
        jsonParser: CodeSolutionResponse.fromJson);
  }

  Future<CodeQuizSolutionResponse> getCodeQuizSolutionResultFor(
      {required int contentId,
      required CodeQuizSolutionRequest solutions}) async {
    return handleRequest(
      request: _contentApi.sendCodeQuizSolution(
          contentId: contentId, body: solutions),
      jsonParser: CodeQuizSolutionResponse.fromJson,
    );
  }

  Future<MyContentBundlesSeparatedResponse> getMyContent() async {
    return handleRequest(
      request: _contentApi.getMyContent(),
      jsonParser: MyContentBundlesSeparatedResponse.fromJson,
    );
  }
}
