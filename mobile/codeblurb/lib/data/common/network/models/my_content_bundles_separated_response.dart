import 'package:codeblurb/data/common/network/models/separated_content_bundle_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'my_content_bundles_separated_response.g.dart';

@JsonSerializable(createToJson: false)
class MyContentBundlesSeparatedResponse {
  final List<SeparatedContentBundleResponse> contentBundles;

  MyContentBundlesSeparatedResponse(this.contentBundles);

  factory MyContentBundlesSeparatedResponse.fromJson(
          Map<String, dynamic> json) =>
      _$MyContentBundlesSeparatedResponseFromJson(json);
}
