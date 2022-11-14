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
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
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
    @JoinTable(
            name = "shopping_items_in_carts",
            joinColumns = @JoinColumn(name = "shopping_cart_id"),
            inverseJoinColumns = @JoinColumn(name = "shopping_item_id")
    )
    private List<ShoppingItem> items;

    public void addShoppingItem(ShoppingItem shoppingItem) {
        shoppingItem.addShoppingCart(this);
        items.add(shoppingItem);
    }

    public void removeShoppingItem(ShoppingItem shoppingItem) {
        shoppingItem.removeShoppingCart(this);
        items.remove(shoppingItem);
    }

}
