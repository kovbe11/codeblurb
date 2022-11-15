package hu.codeblurb.backend.service.dto;

public record ShoppingItemResult(Integer id, String title, double price, ContentBundleResult contentBundle) {
}
