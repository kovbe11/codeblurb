package hu.codeblurb.backend.service.dto;

import java.util.List;

public record PaymentResult(double pricePayed, List<ContentBundleResult> boughtContentBundles) {
}
