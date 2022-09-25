package hu.codeblurb.backend.controller.dto;

public record IncorrectSolutionsResponse(Integer incorrectQuestionId, Integer incorrectSolutionSent,
                                         Integer correctSolution) {
}
