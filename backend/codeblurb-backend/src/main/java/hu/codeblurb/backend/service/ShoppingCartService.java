package hu.codeblurb.backend.service;


import hu.codeblurb.backend.domain.shop.ShoppingCart;
import hu.codeblurb.backend.repository.ShoppingCartRepository;
import hu.codeblurb.backend.service.dto.ShoppingItemResult;
import hu.codeblurb.backend.service.mapper.Mapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
@AllArgsConstructor
public class ShoppingCartService {

    private final ShoppingCartRepository shoppingCartRepository;
    private final ShoppingItemService shoppingItemService;
    private final CustomerService customerService;
    private final Mapper mapper;

    public List<ShoppingItemResult> getAvailableShoppingItems() {
        final var customer = customerService.getCurrentCustomer();
        final var shoppingItems = shoppingItemService.getAvailableShoppingItems(customer);
        return mapper.mapShoppingItems(shoppingItems);
    }

    public List<ShoppingItemResult> getCustomersShoppingItemsFromCart() {
        final ShoppingCart shoppingCart = getShoppingCart();
        return mapper.mapShoppingItems(shoppingCart.getItems());
    }

    public ShoppingCart getCurrentShoppingCart() {
        return getShoppingCart();
    }

    public void addItemToCart(Integer shoppingItemId) {
        final var shoppingItem = shoppingItemService.getShoppingItem(shoppingItemId);
        final var shoppingCart = getShoppingCart();
        shoppingCart.addShoppingItem(shoppingItem);
        shoppingCartRepository.save(shoppingCart);
    }

    public void removeItemFromCart(Integer shoppingItemId) {
        final var shoppingItem = shoppingItemService.getShoppingItem(shoppingItemId);
        final var shoppingCart = getShoppingCart();
        shoppingCart.removeShoppingItem(shoppingItem);
        shoppingCartRepository.save(shoppingCart);
    }

    public void emptyShoppingCart() {
        final var shoppingCart = getShoppingCart();
        shoppingCart.clearShoppingCart();
    }

    private ShoppingCart getShoppingCart() {
        final var customer = customerService.getCurrentCustomer();
        return shoppingCartRepository.findShoppingCartByCustomer(customer)
                .orElseGet(() -> new ShoppingCart(null, customer, new ArrayList<>()));
    }
}
