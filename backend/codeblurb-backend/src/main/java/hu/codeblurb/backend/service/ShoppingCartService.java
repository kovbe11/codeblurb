package hu.codeblurb.backend.service;


import hu.codeblurb.backend.repository.ShoppingCartRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class ShoppingCartService {

    private final ShoppingCartRepository shoppingCartRepository;
    private final ShoppingItemService shoppingItemService;

    public void getAvailableShoppingItems() {

    }

    public void getCurrentShoppingCart() {

    }

    public void addItemToCart(Integer shoppingCartItem) {

    }

    public void removeItemFromCart(Integer shoppingCartItem) {

    }
}
