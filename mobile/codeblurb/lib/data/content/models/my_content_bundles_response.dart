import 'package:codeblurb/data/common/network/models/content_bundle_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'my_content_bundles_response.g.dart';

@JsonSerializable(createToJson: false)
class MyContentBundlesResponse {
  final List<ContentBundleResponse> contentBundles;

  MyContentBundlesResponse(this.contentBundles);

  factory MyContentBundlesResponse.fromJson(Map<String, dynamic> json) =>
      _$MyContentBundlesResponseFromJson(json);
}
