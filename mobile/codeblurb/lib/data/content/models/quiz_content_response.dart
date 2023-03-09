import 'package:codeblurb/data/common/network/models/content_type.dart';
import 'package:codeblurb/data/content/models/quiz_question_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'quiz_content_response.g.dart';

@JsonSerializable(createToJson: false)
class QuizContentResponse {
  final String name;
  final int id;
  final List<QuizQuestionResponse> questions;

  QuizContentResponse(this.id, this.name, this.questions);

  ContentType get contentType => ContentType.quiz;

  factory QuizContentResponse.fromJson(Map<String, dynamic> json) =>
      _$QuizContentResponseFromJson(json);
}
