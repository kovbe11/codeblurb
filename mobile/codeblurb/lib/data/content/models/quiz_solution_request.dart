import 'package:json_annotation/json_annotation.dart';

part 'quiz_solution_request.g.dart';

@JsonSerializable(createFactory: false)
class QuizSolutionRequest {
  final Map<String, int> solutions;

  QuizSolutionRequest(this.solutions);

  Map<String, dynamic> toJson() => _$QuizSolutionRequestToJson(this);
}
