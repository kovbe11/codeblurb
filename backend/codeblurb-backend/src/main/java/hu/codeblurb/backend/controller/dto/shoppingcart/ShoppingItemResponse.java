package hu.codeblurb.backend.controller.dto.shoppingcart;

public record ShoppingItemResponse(Integer id, String title, double price, MinimalContentBundleResponse contentBundle) {
}
