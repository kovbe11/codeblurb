package hu.codeblurb.backend.repository;

import hu.codeblurb.backend.domain.content.ContentBundle;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ContentBundleRepository extends JpaRepository<ContentBundle, Integer> {

    @Query(value = "SELECT cb.id, cb.title FROM customer c " +
            "JOIN payment p on c.id = p.customer_id " +
            "JOIN payment_content_bundles_bought pcbb on p.id = pcbb.payment_id " +
            "JOIN content_bundle cb on cb.id = pcbb.content_bundles_bought_id " +
            "WHERE c.id = :customerId " +
            "ORDER BY cb.title;", nativeQuery = true)
    List<ContentBundle> findContentBundlesPurchasedByCustomerId(Integer customerId);
}
