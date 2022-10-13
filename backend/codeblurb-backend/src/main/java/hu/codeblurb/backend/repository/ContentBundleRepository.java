package hu.codeblurb.backend.repository;

import hu.codeblurb.backend.domain.Customer;
import hu.codeblurb.backend.domain.content.ContentBundle;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface ContentBundleRepository extends JpaRepository<ContentBundle, Integer> {

    @Query("SELECT cb FROM Customer c" +
            " JOIN c.payments p" +
            " JOIN p.contentBundlesBought cb" +
            " WHERE c.id = :#{#customer.id}" +
            " ORDER BY cb.title")
    List<ContentBundle> findContentBundlesPurchasedByCustomer(@Param("customer") Customer customer);
}
