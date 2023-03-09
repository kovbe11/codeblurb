import 'package:json_annotation/json_annotation.dart';

part 'code_solution_request.g.dart';

@JsonSerializable(createFactory: false)
class CodeSolutionRequest {
  final String code;

  CodeSolutionRequest(this.code);

  Map<String, dynamic> toJson() => _$CodeSolutionRequestToJson(this);
}
