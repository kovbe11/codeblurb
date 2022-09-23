package hu.codeblurb.backend.domain.content;

import hu.codeblurb.backend.domain.shop.ShoppingItem;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;
import java.util.Set;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class ContentBundle {
    @Id
    private Integer id;
    @ManyToMany
    private Set<Content> includedContent;
    @OneToOne(mappedBy = "contentBundle")
    private ShoppingItem shoppingItem;
    @Column(nullable = false, unique = true)
    private String title;
}
