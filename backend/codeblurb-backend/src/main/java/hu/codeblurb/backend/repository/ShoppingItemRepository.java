package hu.codeblurb.backend.repository;

import hu.codeblurb.backend.domain.Customer;
import hu.codeblurb.backend.domain.shop.ShoppingItem;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface ShoppingItemRepository extends JpaRepository<ShoppingItem, Integer> {

    @Query("SELECT CASE WHEN COUNT(p) > 0 THEN true ELSE false END" +
            " FROM Customer cu" +
            " JOIN cu.payments p" +
            " JOIN p.contentBundlesBought cb" +
            " JOIN cb.shoppingItem si" +
            " WHERE cu.id = :#{#customer.id} AND si.id = :#{#shoppingItem.id}"
    )
    boolean hasCustomerBoughtShoppingItem(@Param("customer") Customer customer, @Param("shoppingItem") ShoppingItem shoppingItem);
}
