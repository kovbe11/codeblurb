package hu.codeblurb.backend.service;


import hu.codeblurb.backend.repository.ShoppingCartRepository;
import hu.codeblurb.backend.service.dto.ShoppingItemResult;
import hu.codeblurb.backend.service.mapper.Mapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class ShoppingCartService {

    private final ShoppingCartRepository shoppingCartRepository;
    private final ShoppingItemService shoppingItemService;
    private final Mapper shoppingCartMapper;

    public List<ShoppingItemResult> getAvailableShoppingItems() {
        return null;
    }

    public List<ShoppingItemResult> getCustomersShoppingItemsFromCart() {
        return null;
    }

    public void addItemToCart(Integer shoppingCartItem) {

    }

    public void removeItemFromCart(Integer shoppingCartItem) {

    }
}
