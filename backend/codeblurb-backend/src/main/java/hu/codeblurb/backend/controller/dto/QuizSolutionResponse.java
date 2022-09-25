package hu.codeblurb.backend.controller.dto;

import java.util.List;

public record QuizSolutionResponse(List<Integer> correctAnswerQuestionIds,
                                   List<IncorrectSolutionsResponse> incorrectSolutions) {
}
