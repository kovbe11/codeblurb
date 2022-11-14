package hu.codeblurb.backend.service;

import hu.codeblurb.backend.controller.dto.content.QuizSolutionRequest;
import hu.codeblurb.backend.domain.content.QuizContent;
import hu.codeblurb.backend.domain.content.QuizQuestion;
import hu.codeblurb.backend.service.dto.IncorrectSolution;
import hu.codeblurb.backend.service.exception.QuizSolutionRequestMalformedException;
import org.junit.jupiter.api.Test;

import java.util.List;
import java.util.Map;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;

class QuizSolutionCheckerServiceTest {

    public static final QuizQuestion QUIZ_QUESTION_1 = new QuizQuestion(1, "question", List.of("answer1", "answer2"), 0);
    public static final QuizQuestion QUIZ_QUESTION_2 = new QuizQuestion(2, "question", List.of("answer1", "answer2"), 1);
    public static final QuizQuestion QUIZ_QUESTION_3 = new QuizQuestion(3, "question", List.of("answer1", "answer2", "answer3"), 2);
    public static final QuizContent QUIZ_CONTENT = new QuizContent(1, "name", List.of(QUIZ_QUESTION_1, QUIZ_QUESTION_2, QUIZ_QUESTION_3));
    private final QuizSolutionCheckerService quizSolutionCheckerService = new QuizSolutionCheckerService();

    @Test
    void checkSolution() {
        final var request = new QuizSolutionRequest(Map.of(0, 0, 1, 1, 2, 0));

        final var result = quizSolutionCheckerService.checkSolution(QUIZ_CONTENT, request);

        assertEquals(List.of(new IncorrectSolution(3, 0, 2)), result.incorrectSolutions());
        assertEquals(List.of(2, 1), result.correctAnswerQuestionIds());
    }

    @Test
    void malformedRequestsThrow() {
        final var request = new QuizSolutionRequest(Map.of(0, 0, 1, 1, 2, 0, 3, 1));

        assertThrows(QuizSolutionRequestMalformedException.class, () -> quizSolutionCheckerService.checkSolution(QUIZ_CONTENT, request));
    }

    ;
}