import 'package:json_annotation/json_annotation.dart';

part 'test_case_response.g.dart';

@JsonSerializable()
class TestCaseResponse {
  final String input;
  final String expectedOutput;

  TestCaseResponse(this.input, this.expectedOutput);

  factory TestCaseResponse.fromJson(Map<String, dynamic> json) =>
      _$TestCaseResponseFromJson(json);
  Map<String, dynamic> toJson() => _$TestCaseResponseToJson(this);
}
