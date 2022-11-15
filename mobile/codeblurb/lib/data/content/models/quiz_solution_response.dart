import 'package:codeblurb/data/content/models/incorrect_quiz_solution_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'quiz_solution_response.g.dart';

@JsonSerializable(createToJson: false)
class QuizSolutionResponse {
  @JsonKey(name: 'correctAnsweredQuestionIds')
  final List<int> correctlyAnsweredQuestionIds;
  final List<IncorrectQuizSolutionResponse> incorrectSolutions;

  QuizSolutionResponse(
      this.correctlyAnsweredQuestionIds, this.incorrectSolutions);

  factory QuizSolutionResponse.fromJson(Map<String, dynamic> json) =>
      _$QuizSolutionResponseFromJson(json);
}
