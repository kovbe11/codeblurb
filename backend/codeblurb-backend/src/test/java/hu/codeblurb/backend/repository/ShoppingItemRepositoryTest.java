package hu.codeblurb.backend.repository;

import hu.codeblurb.backend.domain.Customer;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.test.context.jdbc.Sql;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

@ExtendWith(SpringExtension.class)
@DataJpaTest
class ShoppingItemRepositoryTest {

    @Autowired
    private ShoppingItemRepository shoppingItemRepository;

    @Test
    @Sql({"/scripts/cleanDb.sql", "/scripts/addCustomer.sql", "/scripts/addContent.sql", "/scripts/addPaymentForContent.sql", "/scripts/addShoppingItems.sql"})
    void hasCustomerBoughtShoppingItem() {
        final var customer = getMockCustomer();
        final var availableItems = shoppingItemRepository.findShoppingItemsAvailableForPurchase(customer);

        assertEquals(1, availableItems.size());

        final var item = availableItems.get(0);

        assertEquals(2, item.getId());
        assertEquals(2, item.getContentBundle().getId());
    }

    @Test
    @Sql({"/scripts/cleanDb.sql", "/scripts/addCustomer.sql", "/scripts/addContent.sql", "/scripts/addPaymentForContent.sql", "/scripts/addShoppingItems.sql"})
    void findShoppingItemsAvailableForPurchase() {
        final var customer = getMockCustomer();
        final var shoppingItem1 = shoppingItemRepository.findById(1).orElseThrow();
        final var shoppingItem2 = shoppingItemRepository.findById(2).orElseThrow();

        assertTrue(shoppingItemRepository.hasCustomerBoughtShoppingItem(customer, shoppingItem1));
        assertFalse(shoppingItemRepository.hasCustomerBoughtShoppingItem(customer, shoppingItem2));
    }

    private static Customer getMockCustomer() {
        return new Customer(1, null, null, null);
    }

}