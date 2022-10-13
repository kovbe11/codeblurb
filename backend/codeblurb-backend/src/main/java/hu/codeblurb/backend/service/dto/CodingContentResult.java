package hu.codeblurb.backend.service.dto;

import hu.codeblurb.backend.domain.content.CodingContent;
import lombok.Getter;

import java.util.List;

import static hu.codeblurb.backend.domain.content.Content.ContentType.CODING;

@Getter
public class CodingContentResult extends ContentResult {
    private final String description;
    private final List<String> codeSkeleton;
    private final List<String> codeSnippets;

    private final List<TestCaseResult> testCases;

    private final CodingContent.CodingContentType codingContentType;

    public CodingContentResult(Integer id, String name, String description, List<String> codeSkeleton, List<String> codeSnippets, List<TestCaseResult> testCases, CodingContent.CodingContentType codingContentType) {
        super(id, name, CODING);
        this.description = description;
        this.codeSkeleton = codeSkeleton;
        this.codeSnippets = codeSnippets;
        this.testCases = testCases;
        this.codingContentType = codingContentType;
    }
}
