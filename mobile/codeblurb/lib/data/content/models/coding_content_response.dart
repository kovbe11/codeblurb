import 'package:codeblurb/data/common/network/models/coding_content_type.dart';
import 'package:codeblurb/data/common/network/models/content_type.dart';
import 'package:codeblurb/data/content/models/test_case_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'coding_content_response.g.dart';

@JsonSerializable(createToJson: false)
class CodingContentResponse {
  final String name;
  final int id;
  final String description;
  final List<String> codeSkeleton;
  final List<String> codeSnippets;
  final List<TestCaseResponse> testCases;
  final CodingContentType codingContentType;

  CodingContentResponse(this.id, this.name, this.description, this.codeSkeleton,
      this.codeSnippets, this.testCases, this.codingContentType);

  ContentType get contentType => ContentType.coding;

  factory CodingContentResponse.fromJson(Map<String, dynamic> json) =>
      _$CodingContentResponseFromJson(json);
}
