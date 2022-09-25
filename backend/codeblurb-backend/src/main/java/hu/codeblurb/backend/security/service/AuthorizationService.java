package hu.codeblurb.backend.security.service;

import hu.codeblurb.backend.service.ContentService;
import hu.codeblurb.backend.service.ShoppingItemService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class AuthorizationService {

    private final ContentService contentService;
    private final ShoppingItemService shoppingItemService;


    public boolean customerHasAccessToContent(Integer contentId) {
        contentService.getPurchasedContentBundles();
        return false; //TODO
    }

    public boolean customerHasNotBoughtShoppingItem(Integer shoppingItemId) {
        shoppingItemService.getShoppingItem(shoppingItemId);
        contentService.getPurchasedContentBundles();
        return false; //TODO
    }
}
