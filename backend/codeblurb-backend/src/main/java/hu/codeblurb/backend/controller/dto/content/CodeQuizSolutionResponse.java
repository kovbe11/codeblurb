package hu.codeblurb.backend.controller.dto.content;

import java.util.List;

public record CodeQuizSolutionResponse(List<Integer> correctAnswerIndices,
                                       List<IncorrectCodeQuizSolutionResponse> incorrectSolutions) {
}
