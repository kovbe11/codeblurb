import 'package:json_annotation/json_annotation.dart';

part 'code_quiz_solution_request.g.dart';

@JsonSerializable(createFactory: false)
class CodeQuizSolutionRequest {
  final Map<String, String> solutionsByIndex;

  CodeQuizSolutionRequest(this.solutionsByIndex);

  Map<String, dynamic> toJson() => _$CodeQuizSolutionRequestToJson(this);
}
