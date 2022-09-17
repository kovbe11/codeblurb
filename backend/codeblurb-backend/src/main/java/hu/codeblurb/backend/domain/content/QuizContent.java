package hu.codeblurb.backend.domain.content;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.Entity;
import javax.persistence.OneToMany;
import java.util.List;

@Entity
@AllArgsConstructor
@Getter
@Setter
@ToString
public class QuizContent extends Content {

    @OneToMany(mappedBy = "quiz", orphanRemoval = true)
    private List<QuizQuestion> questions;

    private String name;

    public QuizContent() {
        super(null, ContentType.QUIZ);
    }
}
