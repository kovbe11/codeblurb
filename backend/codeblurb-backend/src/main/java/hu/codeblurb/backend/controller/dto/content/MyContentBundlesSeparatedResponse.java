package hu.codeblurb.backend.controller.dto.content;

import java.util.List;

public record MyContentBundlesSeparatedResponse(List<SeparatedContentBundleResponse> contentBundles) {
}
