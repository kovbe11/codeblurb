package hu.codeblurb.backend.controller.dto.content;

import java.util.Map;

public record QuizSolutionRequest(Map<Integer, Integer> solutions) {
}
