package hu.codeblurb.backend.controller.dto.content;

public record IncorrectSolutionResponse(Integer incorrectQuestionId, Integer incorrectSolutionSent,
                                        Integer correctSolution) {
}
