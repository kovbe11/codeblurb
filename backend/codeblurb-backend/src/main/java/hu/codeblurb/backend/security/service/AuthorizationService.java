package hu.codeblurb.backend.security.service;

import hu.codeblurb.backend.security.exception.NoAuthenticationException;
import hu.codeblurb.backend.service.ContentService;
import hu.codeblurb.backend.service.CustomerService;
import hu.codeblurb.backend.service.ShoppingItemService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class AuthorizationService {

    private final ContentService contentService;
    private final ShoppingItemService shoppingItemService;
    private final AuthenticationFacade authenticationFacade;
    private final CustomerService customerService;

    public boolean customerHasAccessToContent(Integer contentId) {
        final var content = contentService.getContentById(contentId);
        final var customerId = getCustomerId();
        return customerService.hasCustomerPayedForContent(customerId, content);
    }

    public boolean customerHasNotBoughtShoppingItem(Integer shoppingItemId) {
        final var customer = customerService.getCustomerById(getCustomerId());
        return !shoppingItemService.hasCustomerBoughtShoppingItem(customer, shoppingItemId);
    }

    private Integer getCustomerId() {
        return authenticationFacade.getCurrentCustomerId()
                .orElseThrow(NoAuthenticationException::new);
    }

}
