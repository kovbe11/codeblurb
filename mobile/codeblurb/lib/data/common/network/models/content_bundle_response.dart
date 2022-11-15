import 'package:json_annotation/json_annotation.dart';

part 'content_bundle_response.g.dart';

@JsonSerializable(createToJson: false)
class ContentBundleResponse {
  final List<dynamic> includedContent; //todo

  ContentBundleResponse(this.includedContent);

  factory ContentBundleResponse.fromJson(Map<String, dynamic> json) =>
      _$ContentBundleResponseFromJson(json);
}
