package hu.codeblurb.backend.domain.content;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import java.util.List;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class QuizQuestion {
    @ManyToOne
    QuizContent quiz;
    @Id
    private Integer id;
    private String question;
    @ElementCollection
    private List<String> answers;
    private int solutionIndex;

    public char getSolution() {
        return (char) ((int) 'a' + solutionIndex);
    }

}
