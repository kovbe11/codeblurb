package hu.codeblurb.backend.service;

import hu.codeblurb.backend.controller.dto.content.QuizSolutionRequest;
import hu.codeblurb.backend.domain.content.QuizContent;
import hu.codeblurb.backend.domain.content.QuizQuestion;
import hu.codeblurb.backend.service.dto.IncorrectSolution;
import hu.codeblurb.backend.service.dto.QuizSolutionResult;
import hu.codeblurb.backend.service.exception.QuizSolutionRequestMalformedException;
import org.springframework.stereotype.Service;

import java.util.Comparator;

@Service
public class QuizSolutionCheckerService {

    public QuizSolutionResult checkSolution(QuizContent quiz, QuizSolutionRequest quizSolutionRequest) {
        if (quiz.getQuestions().size() != quizSolutionRequest.solutions().size()) {
            throw new QuizSolutionRequestMalformedException(quiz.getId(), quiz.getQuestions().size(), quizSolutionRequest.solutions().size());
        }

        final var result = new QuizSolutionResult();
        quizSolutionRequest.solutions().forEach((questionIndex, answer) -> {
            final var question = quiz.getQuestions().get(questionIndex);
            if (isCorrect(question, answer)) {
                result.correctAnswerQuestionIds().add(question.getId());
            } else {
                result.incorrectSolutions().add(createIncorrectSolutionInfo(question, answer));
            }
        });
        result.incorrectSolutions().sort(Comparator.comparing(IncorrectSolution::incorrectQuestionId));
        result.correctAnswerQuestionIds().sort(Comparator.naturalOrder());
        return result;
    }

    private IncorrectSolution createIncorrectSolutionInfo(QuizQuestion question, Integer answer) {
        return new IncorrectSolution(question.getId(), answer, question.getSolutionIndex());
    }

    private static boolean isCorrect(QuizQuestion question, Integer answer) {
        return question.getSolutionIndex() == answer;
    }

}
