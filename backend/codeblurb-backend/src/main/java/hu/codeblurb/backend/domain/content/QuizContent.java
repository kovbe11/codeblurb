package hu.codeblurb.backend.domain.content;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import java.util.List;

import static hu.codeblurb.backend.domain.content.Content.ContentType.QUIZ;

@Entity
@Getter
@Setter
@ToString
public class QuizContent extends Content {

    @OneToMany(mappedBy = "quiz", orphanRemoval = true, cascade = {CascadeType.PERSIST, CascadeType.MERGE})
    private List<QuizQuestion> questions;

    public QuizContent() {
        super(null, null, QUIZ, null);
    }

    public QuizContent(Integer id, String name, List<QuizQuestion> questions) {
        super(id, name, QUIZ, null);
        this.questions = questions;
    }

}
