package hu.codeblurb.backend.controller.dto.shoppingcart;

import java.util.List;

public record GetAvailableShoppingItemsResponse(List<ShoppingItemResponse> shoppingItems) {
}
