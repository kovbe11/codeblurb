package hu.codeblurb.backend.controller.dto.content;

public record IncorrectCodeQuizSolutionResponse(int incorrectSolutionIndex, String incorrectAnswer,
                                                String correctSolution) {
}
