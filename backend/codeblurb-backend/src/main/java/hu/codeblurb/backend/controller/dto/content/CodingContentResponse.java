package hu.codeblurb.backend.controller.dto.content;

import hu.codeblurb.backend.domain.content.CodingContent.CodingContentType;
import lombok.Getter;

import java.util.List;

import static hu.codeblurb.backend.domain.content.Content.ContentType.CODING;

@Getter
public class CodingContentResponse extends ContentResponse {

    private final Integer id;
    private final String description;
    private final List<String> codeSkeleton;
    private final List<String> codeSnippets;

    private final List<TestCaseResponse> testCases;

    private final CodingContentType codingContentType;

    public CodingContentResponse(Integer id, String name, String description, List<String> codeSkeleton, List<String> codeSnippets, List<TestCaseResponse> testCases, CodingContentType codingContentType) {
        super(name, CODING);
        this.id = id;
        this.description = description;
        this.codeSkeleton = codeSkeleton;
        this.codeSnippets = codeSnippets;
        this.testCases = testCases;
        this.codingContentType = codingContentType;
    }

    @Override
    public String toString() {
        return "CodingContentResponse[" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                ", codeSkeleton=" + codeSkeleton +
                ", codeSnippets=" + codeSnippets +
                ", testCases=" + testCases +
                ']';
    }
}
