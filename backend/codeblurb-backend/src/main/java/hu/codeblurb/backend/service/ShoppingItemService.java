package hu.codeblurb.backend.service;

import hu.codeblurb.backend.domain.Customer;
import hu.codeblurb.backend.domain.shop.ShoppingItem;
import hu.codeblurb.backend.repository.ShoppingItemRepository;
import hu.codeblurb.backend.service.exception.EntityNotFoundException;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class ShoppingItemService {

    private final ShoppingItemRepository shoppingItemRepository;

    //CACHEABLE
    public ShoppingItem getShoppingItem(Integer shoppingItemId) {
        return shoppingItemRepository.findById(shoppingItemId)
                .orElseThrow(() -> new EntityNotFoundException(ShoppingItem.class, shoppingItemId));
    }

    public boolean hasCustomerBoughtShoppingItem(Customer customer, Integer shoppingItemId) {
        final var shoppingItem = getShoppingItem(shoppingItemId);
        return shoppingItemRepository.hasCustomerBoughtShoppingItem(customer, shoppingItem);
    }

    public List<ShoppingItem> getAvailableShoppingItems(Customer customer) {
        return shoppingItemRepository.findShoppingItemsAvailableForPurchase(customer);
    }
}
