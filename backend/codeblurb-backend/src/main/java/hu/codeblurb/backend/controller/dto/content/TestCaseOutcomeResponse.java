package hu.codeblurb.backend.controller.dto.content;

import java.util.List;

public record TestCaseOutcomeResponse(String expected, String actual, Outcome outcome, List<String> hints) {
    enum Outcome {
        PASSED, FAILED
    }
}
