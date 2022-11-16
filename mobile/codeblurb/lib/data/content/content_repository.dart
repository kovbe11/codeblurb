import 'package:codeblurb/data/content/content_api.dart';
import 'package:codeblurb/data/content/models/my_content_bundles_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final contentRepoProvider = Provider<ContentRepository>(
  (ref) => ContentRepository(ref.watch(contentApiProvider)),
  name: 'Content Repository Provider',
);

class ContentRepository {
  final ContentApi _contentApi;

  ContentRepository(this._contentApi);

  Future<dynamic> getQuizResultFor({required int contentId}) async {
    return _contentApi.getQuizResult(contentId: contentId);
  }

  Future<dynamic> getCodeSolutionResultFor({required int contentId}) async {
    return _contentApi.getCodeSolutionResult(contentId: contentId);
  }

  Future<dynamic> getCodeQuizSolutionResultFor({required int contentId}) async {
    return _contentApi.getCodeQuizSolutionResult(contentId: contentId);
  }

  Future<MyContentBundlesResponse> getMyContent() async {
    final response = await _contentApi.getMyContent();
    return MyContentBundlesResponse.fromJson(response.data);
  }
}
