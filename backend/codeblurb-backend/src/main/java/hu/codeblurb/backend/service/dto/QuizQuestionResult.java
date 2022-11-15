package hu.codeblurb.backend.service.dto;

import java.util.List;

public record QuizQuestionResult(Integer id, String question, List<String> answers, int solutionIndex, char solutionChar) {
}
