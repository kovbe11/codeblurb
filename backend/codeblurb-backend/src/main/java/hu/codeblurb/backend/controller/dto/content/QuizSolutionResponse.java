package hu.codeblurb.backend.controller.dto.content;

import java.util.List;

public record QuizSolutionResponse(List<Integer> correctAnswerQuestionIds,
                                   List<IncorrectQuizSolutionResponse> incorrectSolutions) {
}
