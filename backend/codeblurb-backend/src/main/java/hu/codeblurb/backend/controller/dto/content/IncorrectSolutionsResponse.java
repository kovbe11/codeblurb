package hu.codeblurb.backend.controller.dto.content;

public record IncorrectSolutionsResponse(Integer incorrectQuestionId, Integer incorrectSolutionSent,
                                         Integer correctSolution) {
}
