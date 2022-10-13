package hu.codeblurb.backend.domain.content;

import hu.codeblurb.backend.domain.shop.Payment;
import hu.codeblurb.backend.domain.shop.ShoppingItem;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
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
    @JoinTable(
            name = "content_included_in_bundles",
            joinColumns = @JoinColumn(name = "content_bundle_id"),
            inverseJoinColumns = @JoinColumn(name = "content_id")
    )
    private Set<Content> includedContent;
    @ManyToMany(fetch = FetchType.LAZY, mappedBy = "contentBundlesBought")
    private Set<Payment> payments;
    @OneToOne(mappedBy = "contentBundle")
    private ShoppingItem shoppingItem;
    @Column(nullable = false, unique = true)
    private String title;
}
