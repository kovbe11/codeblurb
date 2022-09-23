package hu.codeblurb.backend.repository;

import hu.codeblurb.backend.domain.shop.ShoppingItem;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ShoppingItemRepository extends JpaRepository<ShoppingItem, Integer> {
}