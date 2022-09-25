package hu.codeblurb.backend.controller.dto;

import java.util.List;

public record TestCaseResultResponse(String expected, String actual, Result result, List<String> hints) {
    enum Result {
        PASSED, FAILED
    }
}
