package hu.codeblurb.backend.domain.content;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.ElementCollection;
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

    @ElementCollection
    private List<String> codeSkeleton;

    @ElementCollection
    private List<String> codeSnippets;

    @OneToMany(orphanRemoval = true)
    private List<TestCase> testCases;

    private CodingContentType contentType;

    public CodingContent() {
        super(null, ContentType.CODING);
    }

    public enum CodingContentType {
        SCRATCH, DRAG_AND_DROP, FILL_THE_GAP
    }
}
