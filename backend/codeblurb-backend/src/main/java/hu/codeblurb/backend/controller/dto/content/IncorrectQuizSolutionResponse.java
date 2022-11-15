package hu.codeblurb.backend.controller.dto.content;

public record IncorrectQuizSolutionResponse(Integer incorrectQuestionId, Integer incorrectSolutionSent,
                                            Integer correctSolution) {
}
