import 'package:json_annotation/json_annotation.dart';

import '../../common/network/models/content_type.dart';

part 'video_content_response.g.dart';

@JsonSerializable(createToJson: false)
class VideoContentResponse {
  final String name;
  final String description;
  final String resourceUrl;

  VideoContentResponse(this.name, this.description, this.resourceUrl);

  ContentType get contentType => ContentType.video;

  factory VideoContentResponse.fromJson(Map<String, dynamic> json) =>
      _$VideoContentResponseFromJson(json);
}
