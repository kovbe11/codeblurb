package hu.codeblurb.backend.domain.content;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.Entity;

import static hu.codeblurb.backend.domain.content.Content.ContentType.VIDEO;

@Entity
@AllArgsConstructor
@Getter
@Setter
@ToString
public class VideoContent extends Content {

    private String description;
    private String resourceUrl;

    public VideoContent() {
        super(null, null, VIDEO, null);
    }

    public VideoContent(String title, String description, String resourceUrl) {
        super(null, title, VIDEO, null);
        this.description = description;
        this.resourceUrl = resourceUrl;
    }
}
