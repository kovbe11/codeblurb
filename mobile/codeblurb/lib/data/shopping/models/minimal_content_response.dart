import 'package:codeblurb/data/common/network/models/content_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'minimal_content_response.g.dart';

@JsonSerializable(createToJson: false)
class MinimalContentResponse {
  final int id;
  final String name;
  final ContentType contentType;

  MinimalContentResponse(this.id, this.name, this.contentType);

  factory MinimalContentResponse.fromJson(Map<String, dynamic> json) =>
      _$MinimalContentResponseFromJson(json);
}
