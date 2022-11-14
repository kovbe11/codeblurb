package hu.codeblurb.backend.service.dto;

import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

public record QuizSolutionResult(List<Integer> correctAnswerQuestionIds, List<IncorrectSolution> incorrectSolutions) {
    public QuizSolutionResult(){
        this(new ArrayList<>(), new ArrayList<>());
    }
}
