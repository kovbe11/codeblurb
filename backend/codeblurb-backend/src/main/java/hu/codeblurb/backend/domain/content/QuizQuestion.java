package hu.codeblurb.backend.domain.content;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.FetchType;
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
    @Id
    private Integer id;
    @ManyToOne(fetch = FetchType.LAZY)
    QuizContent quiz;
    private String question;
    @ElementCollection
    private List<String> answers;
    private int solutionIndex;

    public char getSolution() {
        return (char) ((int) 'a' + solutionIndex);
    }

}
