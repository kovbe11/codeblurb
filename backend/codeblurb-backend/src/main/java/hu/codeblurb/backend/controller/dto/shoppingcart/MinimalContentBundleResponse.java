package hu.codeblurb.backend.controller.dto.shoppingcart;

import java.util.List;

public record MinimalContentBundleResponse(List<MinimalContentResponse> includedContent) {
}
