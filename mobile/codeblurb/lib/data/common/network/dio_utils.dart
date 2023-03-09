part of 'dio.dart';

_parseAndDecode(String response) {
  return jsonDecode(response);
}

_parseJson(String json) async {
  return await compute(_parseAndDecode, json);
}
