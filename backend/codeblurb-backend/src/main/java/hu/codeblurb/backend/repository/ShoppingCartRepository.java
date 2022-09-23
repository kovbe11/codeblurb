package hu.codeblurb.backend.repository;

import hu.codeblurb.backend.domain.shop.ShoppingCart;
import org.springframework.data.repository.CrudRepository;

public interface ShoppingCartRepository extends CrudRepository<ShoppingCart, Integer> {
}
