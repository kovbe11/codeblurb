package hu.codeblurb.backend.controller.dto;

import java.util.List;

public record ContentBundleResponse(List<ContentResponse> includedContent) {
}
