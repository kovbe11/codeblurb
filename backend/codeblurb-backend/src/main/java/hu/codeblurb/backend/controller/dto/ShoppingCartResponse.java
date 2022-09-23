package hu.codeblurb.backend.controller.dto;

import java.util.List;

public record ShoppingCartResponse(List<ShoppingItemResponse> shoppingItems) {
}
