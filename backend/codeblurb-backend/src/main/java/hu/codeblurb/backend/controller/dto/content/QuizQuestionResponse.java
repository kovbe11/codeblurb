package hu.codeblurb.backend.controller.dto.content;

import java.util.List;

public record QuizQuestionResponse(Integer id, String question, List<String> answers, int solutionIndex, char solutionChar) {
}
