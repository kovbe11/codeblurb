package hu.codeblurb.backend.service.dto;

import lombok.Getter;

import static hu.codeblurb.backend.domain.content.Content.ContentType.VIDEO;

@Getter
public class VideoContentResult extends ContentResult {
    private final String description;
    private final String resourceUrl;

    public VideoContentResult(Integer id, String name, String description, String resourceUrl) {
        super(id, name, VIDEO);
        this.description = description;
        this.resourceUrl = resourceUrl;
    }
}
