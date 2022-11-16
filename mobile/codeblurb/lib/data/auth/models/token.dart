import 'package:codeblurb/data/common/network/models/token_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'token.g.dart';

@JsonSerializable(createToJson: false)
class Token {
  @JsonKey(name: 'sub')
  final TokenType type;
  @JsonKey(name: 'aud')
  final String customerName;
  final int customerId;
  @JsonKey(name: 'exp')
  final int expirInMSE;

  Token(this.type, this.customerName, this.customerId, this.expirInMSE);

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);
}
