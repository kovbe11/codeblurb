enum TokenType {
  access("accessToken"),
  refresh("refreshToken");

  final String value;

  const TokenType(this.value);
}
