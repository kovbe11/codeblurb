package hu.codeblurb.backend.domain.shop;


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
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;
import java.util.Set;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class ShoppingItem {
    @Id
    @GeneratedValue
    private Integer id;
    private Double price;
    @OneToOne
    private ContentBundle contentBundle;

    @ManyToMany(mappedBy = "items", fetch = FetchType.LAZY)
    private Set<ShoppingCart> shoppingCarts;

    public String getTitle() {
        return contentBundle.getTitle();
    }

    public void addShoppingCart(ShoppingCart shoppingCart) {
        shoppingCarts.add(shoppingCart);
    }

    public void removeShoppingCart(ShoppingCart shoppingCart) {
        shoppingCarts.remove(shoppingCart);
    }
}
