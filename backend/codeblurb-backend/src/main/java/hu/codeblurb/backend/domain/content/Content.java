package hu.codeblurb.backend.domain.content;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Inheritance;

import static javax.persistence.InheritanceType.JOINED;

@Entity
@Inheritance(strategy = JOINED)
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public abstract class Content {
    @Id
    private Integer id;
    private ContentType contentType;

    public enum ContentType {
        CODING, VIDEO, QUIZ
    }
}
