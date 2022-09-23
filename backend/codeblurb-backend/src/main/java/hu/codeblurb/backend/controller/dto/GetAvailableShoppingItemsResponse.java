package hu.codeblurb.backend.controller.dto;

import java.util.List;

public record GetAvailableShoppingItemsResponse(List<ShoppingItemResponse> shoppingItems) {
}
