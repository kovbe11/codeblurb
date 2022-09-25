package hu.codeblurb.backend.controller.dto;

public record ShoppingItemResponse(Integer id, String title, double price, ContentBundleResponse contentBundle) {
}
