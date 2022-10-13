package hu.codeblurb.backend.controller.dto.shoppingcart;

import hu.codeblurb.backend.domain.content.Content;

public record MinimalContentResponse(Integer id, String name, Content.ContentType contentType) {
}
