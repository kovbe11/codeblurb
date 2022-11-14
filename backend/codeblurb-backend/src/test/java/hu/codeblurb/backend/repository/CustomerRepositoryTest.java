package hu.codeblurb.backend.repository;

import hu.codeblurb.backend.domain.Customer;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.test.context.jdbc.Sql;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import java.util.List;

import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

@ExtendWith(SpringExtension.class)
@DataJpaTest
class CustomerRepositoryTest {

    @Autowired
    private CustomerRepository customerRepository;
    @Autowired
    private ContentRepository contentRepository;

    private static final int notPurchasedContentId = 2;
    private static final List<Integer> purchasedContentIds = List.of(1, 3);

    @Test
    @Sql({"/scripts/cleanDb.sql", "/scripts/addCustomer.sql", "/scripts/addContent.sql", "/scripts/addPaymentForContent.sql"})
    void hasCustomerPayedForContent() {
        final var customer = new Customer(1, null, null, null);
        final var notPurchasedContent = contentRepository.findById(notPurchasedContentId).orElseThrow();
        final var purchasedContents = contentRepository.findAllById(purchasedContentIds);

        assertFalse(customerRepository.hasCustomerPayedForContent(customer, notPurchasedContent));
        purchasedContents.forEach(it -> assertTrue(customerRepository.hasCustomerPayedForContent(customer, it)));
    }
}