enum OverallResult {
  allPassed("ALL_PASSED"),
  someFailed("TESTCASES_FAILED");

  final String value;

  const OverallResult(this.value);
}
