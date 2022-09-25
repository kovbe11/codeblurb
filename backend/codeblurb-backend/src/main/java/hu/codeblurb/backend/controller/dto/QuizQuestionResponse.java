package hu.codeblurb.backend.controller.dto;

import java.util.List;

public record QuizQuestionResponse(Integer id, String question, List<String> answers, int solutionIndex) {
}
