import 'package:json_annotation/json_annotation.dart';

part 'register_request.g.dart';

@JsonSerializable()
class RegisterRequest {
  final String username;
  final String password;

  RegisterRequest(this.username, this.password);

  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);
}
