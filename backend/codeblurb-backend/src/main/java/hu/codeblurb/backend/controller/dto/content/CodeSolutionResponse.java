package hu.codeblurb.backend.controller.dto.content;

import java.util.List;

public record CodeSolutionResponse(List<TestCaseOutcomeResponse> results, OverallResult overallResult) {

    enum OverallResult {
        ALL_PASSED, TESTCASES_FAILED
    }
}
