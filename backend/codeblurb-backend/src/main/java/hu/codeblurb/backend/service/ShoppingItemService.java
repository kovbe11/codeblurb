package hu.codeblurb.backend.service;

import hu.codeblurb.backend.domain.shop.ShoppingItem;
import hu.codeblurb.backend.repository.ShoppingItemRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class ShoppingItemService {

    private final ShoppingItemRepository shoppingItemRepository;

    public ShoppingItem getShoppingItem(Integer shoppingItemId) {
        return null;
    }
}
