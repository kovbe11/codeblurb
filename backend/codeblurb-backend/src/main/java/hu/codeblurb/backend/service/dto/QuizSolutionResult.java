package hu.codeblurb.backend.service.dto;

import java.util.ArrayList;
import java.util.List;

public record QuizSolutionResult(List<Integer> correctAnswerQuestionIds, List<IncorrectSolution> incorrectSolutions) {
    public QuizSolutionResult(){
        this(new ArrayList<>(), new ArrayList<>());
    }
}
