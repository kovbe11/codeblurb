package hu.codeblurb.backend.domain.content;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import java.util.Set;

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
    @Column(unique = true, nullable = false)
    private String name;
    @Column(nullable = false)
    private ContentType contentType;
    @ManyToMany(fetch = FetchType.LAZY, mappedBy = "includedContent", cascade = {CascadeType.PERSIST, CascadeType.MERGE})
    private Set<ContentBundle> contentBundles;

    public enum ContentType {
        CODING, VIDEO, QUIZ
    }
}
