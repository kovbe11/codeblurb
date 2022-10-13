package hu.codeblurb.backend.repository;

import hu.codeblurb.backend.domain.Customer;
import hu.codeblurb.backend.domain.content.Content;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.Optional;

public interface CustomerRepository extends CrudRepository<Customer, Integer> {
    Optional<Customer> findByUsername(String username);

    @Query("SELECT CASE WHEN COUNT(p) > 0 THEN true ELSE false END" +
            " FROM Customer cu" +
            " JOIN cu.payments p" +
            " JOIN p.contentBundlesBought cb" +
            " JOIN cb.includedContent co" +
            " WHERE cu.id = :#{#customer.id} AND co.id = :#{#content.id}"
    )
    boolean hasCustomerPayedForContent(@Param("customer") Customer customer, @Param("content") Content content);
}

