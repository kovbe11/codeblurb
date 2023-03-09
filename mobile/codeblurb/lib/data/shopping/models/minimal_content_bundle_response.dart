import 'package:codeblurb/data/shopping/models/minimal_content_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'minimal_content_bundle_response.g.dart';

@JsonSerializable(createToJson: false)
class MinimalContentBundleResponse {
  final List<MinimalContentResponse> includedContent;

  MinimalContentBundleResponse(this.includedContent);

  factory MinimalContentBundleResponse.fromJson(Map<String, dynamic> json) =>
      _$MinimalContentBundleResponseFromJson(json);
}
