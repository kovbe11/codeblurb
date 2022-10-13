package hu.codeblurb.backend.domain.content;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import java.util.List;

import static hu.codeblurb.backend.domain.content.Content.ContentType.CODING;

@Entity
@Getter
@Setter
@ToString
public class CodingContent extends Content {

    private String description;

    @ElementCollection
    private List<String> codeSkeleton;

    @ElementCollection
    private List<String> codeSnippets;

    @OneToMany(orphanRemoval = true, cascade = CascadeType.ALL)
    @JoinColumn(name = "coding_content_id")
    private List<TestCase> testCases;

    @Column(nullable = false)
    private CodingContentType codingContentType;

    public CodingContent() {
        super(null, null, CODING, null);
    }

    public CodingContent(String name, String description, List<String> codeSkeleton, List<String> codeSnippets, List<TestCase> testCases) {
        super(null, name, CODING, null);
        this.description = description;
        this.codeSkeleton = codeSkeleton;
        this.codeSnippets = codeSnippets;
        this.testCases = testCases;
    }

    public enum CodingContentType {
        SCRATCH, DRAG_AND_DROP, FILL_THE_GAP
    }
}
