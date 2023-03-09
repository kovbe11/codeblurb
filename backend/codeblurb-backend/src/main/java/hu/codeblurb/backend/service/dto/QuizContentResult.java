package hu.codeblurb.backend.service.dto;

import lombok.Getter;

import java.util.List;

import static hu.codeblurb.backend.domain.content.Content.ContentType.QUIZ;

@Getter
public class QuizContentResult extends ContentResult {
    private final List<QuizQuestionResult> questions;

    public QuizContentResult(Integer id, String name, List<QuizQuestionResult> questions) {
        super(id, name, QUIZ);
        this.questions = questions;
    }
}
