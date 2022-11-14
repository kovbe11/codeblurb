package hu.codeblurb.backend.service.exception;

import hu.codeblurb.backend.exception.CodeBlurbException;
import org.springframework.http.HttpStatus;

public class QuizSolutionRequestMalformedException extends CodeBlurbException {
    public QuizSolutionRequestMalformedException(Integer quizId, Integer quizQuestionsSize, Integer requestAnswersSize) {
        super("Quiz with id " + quizId + " has " + quizQuestionsSize + " questions, but solution has " + requestAnswersSize + " answers!", HttpStatus.BAD_REQUEST);
    }
}
