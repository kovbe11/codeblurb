package hu.codeblurb.backend.domain.content;

import hu.codeblurb.backend.domain.shop.Payment;
import hu.codeblurb.backend.domain.shop.ShoppingItem;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import java.util.Set;

@Entity
@NoArgsConstructor
@Getter
@Setter
@ToString
public class ContentBundle {
    @Id
    private Integer id;
    @ManyToMany(cascade = {CascadeType.PERSIST, CascadeType.MERGE})
    @JoinTable(
            name = "content_included_in_bundles",
            joinColumns = @JoinColumn(name = "content_bundle_id"),
            inverseJoinColumns = @JoinColumn(name = "content_id")
    )
    private Set<Content> includedContent;
    @ManyToMany(fetch = FetchType.LAZY, mappedBy = "contentBundlesBought", cascade = {CascadeType.PERSIST, CascadeType.MERGE})
    private Set<Payment> payments;
    @OneToOne(mappedBy = "contentBundle", cascade = {CascadeType.PERSIST, CascadeType.MERGE})
    private ShoppingItem shoppingItem;
    @Column(nullable = false, unique = true)
    private String title;

    public ContentBundle(Integer id, Set<Content> includedContent, String title) {
        this.id = id;
        this.includedContent = includedContent;
        this.title = title;
    }
}
