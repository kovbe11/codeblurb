package hu.codeblurb.backend.controller.dto;

import java.util.List;

public record CodeSolutionResponse(List<TestCaseResultResponse> results, OverallResult overallResult) {

    enum OverallResult {
        ALL_PASSED, TESTCASES_FAILED
    }
}
