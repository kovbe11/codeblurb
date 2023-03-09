package hu.codeblurb.backend.domain.content;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.ManyToMany;
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
    @ManyToMany(fetch = FetchType.LAZY, mappedBy = "includedContent")
    private Set<ContentBundle> contentBundles;

    public enum ContentType {
        CODING, VIDEO, QUIZ
    }
}
