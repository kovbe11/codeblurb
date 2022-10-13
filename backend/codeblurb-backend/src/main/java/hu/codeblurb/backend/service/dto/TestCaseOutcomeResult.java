package hu.codeblurb.backend.service.dto;

import java.util.List;

public record TestCaseOutcomeResult(String expected, String actual, Outcome outcome, List<String> hints) {
    enum Outcome {
        PASSED, FAILED
    }
}
