package hu.codeblurb.backend.service;

import hu.codeblurb.backend.domain.shop.ShoppingItem;
import hu.codeblurb.backend.repository.ShoppingItemRepository;
import hu.codeblurb.backend.service.exception.EntityNotFoundException;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class ShoppingItemService {

    private final ShoppingItemRepository shoppingItemRepository;

    //CACHEABLE
    public ShoppingItem getShoppingItem(Integer shoppingItemId) {
        return null;
    }
}
