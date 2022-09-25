package hu.codeblurb.backend.controller.dto;

import lombok.Getter;

import static hu.codeblurb.backend.domain.content.Content.ContentType.VIDEO;

@Getter
public class VideoContentResponse extends ContentResponse {

    private final String description;
    private final String resourceUrl;

    public VideoContentResponse(String name, String description, String resourceUrl) {
        super(name, VIDEO);
        this.description = description;
        this.resourceUrl = resourceUrl;
    }

    @Override
    public String toString() {
        return "VideoContentResponse[" +
                "name='" + name + '\'' +
                ", description='" + description + '\'' +
                ", resourceUrl='" + resourceUrl + '\'' +
                ']';
    }
}
