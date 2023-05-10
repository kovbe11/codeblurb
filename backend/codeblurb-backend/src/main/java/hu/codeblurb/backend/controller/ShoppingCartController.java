package hu.codeblurb.backend.controller;

import hu.codeblurb.backend.controller.dto.shoppingcart.GetAvailableShoppingItemsResponse;
import hu.codeblurb.backend.controller.dto.shoppingcart.ShoppingCartResponse;
import hu.codeblurb.backend.controller.mapper.ShopMapper;
import hu.codeblurb.backend.service.ShoppingCartService;
import hu.codeblurb.backend.service.ShoppingItemService;
import hu.codeblurb.backend.service.dto.ShoppingItemResult;
import io.micrometer.core.annotation.Timed;
import lombok.AllArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/shopping")
@AllArgsConstructor
public class ShoppingCartController {

    private final ShoppingCartService shoppingCartService;
    private final ShoppingItemService shoppingItemService;
    private final ShopMapper mapper;

    @PreAuthorize("authorizationService.customerHasNotBoughtShoppingItem(#shoppingCartItem)")
    @PostMapping("/add-item/{shoppingCartItem}")
    @Timed(value = "codeblurb.shopping.add-item")
    public ShoppingCartResponse addItemToShoppingCart(@PathVariable Integer shoppingCartItem) {
        shoppingCartService.addItemToCart(shoppingCartItem);
        return restoreShoppingCart();
    }

    @DeleteMapping("/delete-item/{shoppingCartItem}")
    @Timed(value = "codeblurb.shopping.delete-item")
    public ShoppingCartResponse removeItemFromShoppingCart(@PathVariable Integer shoppingCartItem) {
        shoppingCartService.removeItemFromCart(shoppingCartItem);
        return restoreShoppingCart();
    }

    @GetMapping("/restore-shopping-cart")
    public ShoppingCartResponse restoreShoppingCart() {
        final var shoppingItems = getCustomersShoppingItemsFromCart();
        return new ShoppingCartResponse(mapper.mapShoppingItems(shoppingItems));
    }

    @GetMapping("/available-shopping-items")
    @Timed(value = "codeblurb.shopping.available-items")
    public GetAvailableShoppingItemsResponse getAvailableShoppingItems() {
        final var shoppingItems = shoppingCartService.getAvailableShoppingItems();
        return new GetAvailableShoppingItemsResponse(mapper.mapShoppingItems(shoppingItems));
    }

    private List<ShoppingItemResult> getCustomersShoppingItemsFromCart() {
        return shoppingCartService.getCustomersShoppingItemsFromCart();
    }
}
