import 'package:json_annotation/json_annotation.dart';

part 'error_response.g.dart';

@JsonSerializable(createToJson: false)
class ErrorResponse {
  final String errorMessage;

  ErrorResponse(this.errorMessage);

  factory ErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$ErrorResponseFromJson(json);
}
