package hu.codeblurb.backend.domain.content;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import java.util.List;

@Entity
@NoArgsConstructor
@Getter
@Setter
@ToString
public class QuizQuestion {
    @Id
    private Integer id;
    @ManyToOne(fetch = FetchType.LAZY, cascade = {CascadeType.PERSIST, CascadeType.MERGE})
    QuizContent quiz;
    private String question;
    @ElementCollection
    private List<String> answers;
    private int solutionIndex;

    public QuizQuestion(Integer id, String question, List<String> answers, int solutionIndex) {
        this.id = id;
        this.question = question;
        this.answers = answers;
        this.solutionIndex = solutionIndex;
    }

    public char getSolution() {
        return (char) ((int) 'a' + solutionIndex);
    }

}
