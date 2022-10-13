package hu.codeblurb.backend.controller.dto.content;

import hu.codeblurb.backend.domain.content.Content.ContentType;
import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public abstract class ContentResponse {
    protected final String name;
    private final ContentType contentType;
}
