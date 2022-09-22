package hu.codeblurb.backend.domain.shop;

import hu.codeblurb.backend.domain.Customer;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;
import java.util.List;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class ShoppingCart {
    @Id
    @GeneratedValue
    private Integer id;
    @OneToOne
    private Customer customer;
    @ManyToMany
    private List<ShoppingItem> items;
}
