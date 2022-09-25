package hu.codeblurb.backend.controller.dto;

import java.util.Map;

public record QuizSolutionRequest(Map<Integer, Integer> solutions) {
}
