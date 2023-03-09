package hu.codeblurb.backend.service.dto;

import hu.codeblurb.backend.domain.content.Content;
import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public abstract class ContentResult {
    private final Integer id;
    private final String name;
    private final Content.ContentType contentType;
}
