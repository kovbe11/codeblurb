package hu.codeblurb.backend.controller.dto.content;

import java.util.List;

public record ContentBundleResponse(List<ContentResponse> includedContent) {
}
