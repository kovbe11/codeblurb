import 'package:codeblurb/data/common/network/models/overall_result.dart';
import 'package:codeblurb/data/content/models/test_case_outcome_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'code_solution_response.g.dart';

@JsonSerializable(createToJson: false)
class CodeSolutionResponse {
  final List<TestCaseOutcomeResponse> results;
  final OverallResult overallResult;

  CodeSolutionResponse(this.results, this.overallResult);

  factory CodeSolutionResponse.fromJson(Map<String, dynamic> json) =>
      _$CodeSolutionResponseFromJson(json);
}
