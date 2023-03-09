package hu.codeblurb.backend.domain.shop;

import hu.codeblurb.backend.domain.Customer;
import hu.codeblurb.backend.domain.content.ContentBundle;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import java.util.Set;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class Payment {
    @Id
    @GeneratedValue
    private Integer id;
    @ManyToOne(fetch = FetchType.LAZY)
    private Customer customer;
    @ManyToMany
    @JoinTable(
            name = "content_bundles_bought_with_payment",
            joinColumns = @JoinColumn(name = "payment_id"),
            inverseJoinColumns = @JoinColumn(name = "content_bundle_id")
    )
    private Set<ContentBundle> contentBundlesBought;
    private Double pricePayed;
}
