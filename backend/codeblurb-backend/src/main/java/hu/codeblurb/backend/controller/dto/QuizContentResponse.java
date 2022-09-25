package hu.codeblurb.backend.controller.dto;

import lombok.Getter;

import java.util.List;

import static hu.codeblurb.backend.domain.content.Content.ContentType.QUIZ;

@Getter
public class QuizContentResponse extends ContentResponse {

    private final Integer id;
    private final List<QuizQuestionResponse> questions;

    public QuizContentResponse(Integer id, String name, List<QuizQuestionResponse> questions) {
        super(name, QUIZ);
        this.id = id;
        this.questions = questions;
    }

    @Override
    public String toString() {
        return "QuizContentResponse[" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", questions=" + questions +
                ']';
    }

}
