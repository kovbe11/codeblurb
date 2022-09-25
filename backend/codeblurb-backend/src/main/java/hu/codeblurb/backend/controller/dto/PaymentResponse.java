package hu.codeblurb.backend.controller.dto;

import java.util.List;

public record PaymentResponse(double pricePayed, List<ContentBundleResponse> boughtContentBundles) {
}
