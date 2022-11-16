import 'dart:convert';

import 'package:codeblurb/data/auth/models/token.dart';

Token decode({required String token}) {
  String normalizedSource = base64Url.normalize(token.split('.')[1]);
  final decodedTokenString = utf8.decode(base64Url.decode(normalizedSource));
  return Token.fromJson(jsonDecode(decodedTokenString));
}
