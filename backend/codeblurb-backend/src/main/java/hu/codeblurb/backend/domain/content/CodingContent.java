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
public class CodingContent extends Content {

    private String description;

    @OneToMany(orphanRemoval = true)
    private List<TestCase> testCases;

    public CodingContent() {
        super(null, ContentType.CODING);
    }

}
