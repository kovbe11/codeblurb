package hu.codeblurb.backend.service.dto;

public record IncorrectSolution(Integer incorrectQuestionId, Integer incorrectSolutionSent, Integer correctSolution) {
}
