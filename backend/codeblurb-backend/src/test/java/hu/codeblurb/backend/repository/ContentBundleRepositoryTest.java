package hu.codeblurb.backend.repository;

import hu.codeblurb.backend.domain.Customer;
import hu.codeblurb.backend.domain.content.CodingContent;
import hu.codeblurb.backend.domain.content.ContentBundle;
import hu.codeblurb.backend.domain.content.QuizContent;
import hu.codeblurb.backend.domain.content.QuizQuestion;
import hu.codeblurb.backend.domain.content.TestCase;
import hu.codeblurb.backend.domain.content.VideoContent;
import hu.codeblurb.backend.domain.shop.Payment;
import hu.codeblurb.backend.domain.shop.ShoppingItem;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.test.context.jdbc.Sql;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import java.util.List;
import java.util.Set;

import static hu.codeblurb.backend.domain.content.CodingContent.CodingContentType.DRAG_AND_DROP;
import static org.junit.jupiter.api.Assertions.assertEquals;

@ExtendWith(SpringExtension.class)
@DataJpaTest
class ContentBundleRepositoryTest {

    @Autowired
    private ContentBundleRepository contentBundleRepository;

    @Test
    @Sql({"/scripts/cleanDb.sql", "/scripts/addCustomer.sql", "/scripts/addContent.sql", "/scripts/addPaymentForContent.sql"})
    void findContentBundlesPurchasedByCustomer() {
//        setUp();

        final var customer1 = new Customer();
        customer1.setId(1);
        final var customer2 = new Customer();
        customer2.setId(2);

        List<ContentBundle> bundles = contentBundleRepository.findContentBundlesPurchasedByCustomer(customer1);
        List<ContentBundle> emptyBundles = contentBundleRepository.findContentBundlesPurchasedByCustomer(customer2);

        assertEquals(1, bundles.size());
        assertEquals(0, emptyBundles.size());
    }

}