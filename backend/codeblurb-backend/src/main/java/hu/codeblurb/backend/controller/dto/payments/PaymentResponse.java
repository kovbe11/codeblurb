package hu.codeblurb.backend.controller.dto.payments;

import hu.codeblurb.backend.controller.dto.content.ContentBundleResponse;

import java.util.List;

public record PaymentResponse(double pricePayed, List<ContentBundleResponse> boughtContentBundles) {
}
