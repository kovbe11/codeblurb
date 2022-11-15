package hu.codeblurb.backend.repository;

import hu.codeblurb.backend.domain.Customer;
import hu.codeblurb.backend.domain.shop.ShoppingCart;
import org.springframework.data.repository.CrudRepository;

import java.util.Optional;

public interface ShoppingCartRepository extends CrudRepository<ShoppingCart, Integer> {
    Optional<ShoppingCart> findShoppingCartByCustomer(Customer customer);
}
