package hu.codeblurb.backend.controller;

import hu.codeblurb.backend.controller.dto.GetAvailableShoppingItemsResponse;
import hu.codeblurb.backend.controller.dto.ShoppingCartResponse;
import hu.codeblurb.backend.service.ShoppingCartService;
import lombok.AllArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/shopping")
@AllArgsConstructor
public class ShoppingCartController {

    private final ShoppingCartService shoppingCartService;

    @PreAuthorize("authorizationService.customerHasNotBoughtShoppingItem(#shoppingCartItem)")
    @PostMapping("/add-item/{shoppingCartItem}")
    public ShoppingCartResponse addItemToShoppingCart(@PathVariable Integer shoppingCartItem) {
        shoppingCartService.addItemToCart(shoppingCartItem);
        return null;
        //TODO
    }

    @DeleteMapping("/delete-item/{shoppingCartItem}")
    public ShoppingCartResponse removeItemFromShoppingCart(@PathVariable Integer shoppingCartItem) {
        shoppingCartService.removeItemFromCart(shoppingCartItem);
        return null;
        //TODO
    }

    @GetMapping("/restore-shopping-cart")
    public ShoppingCartResponse restoreShoppingCart() {
        shoppingCartService.getCurrentShoppingCart();
        return null;
        //TODO
    }

    @GetMapping("/available-shopping-items")
    public GetAvailableShoppingItemsResponse getAvailableShoppingItems() {
        shoppingCartService.getAvailableShoppingItems();
        return null;
        //TODO
    }
}
