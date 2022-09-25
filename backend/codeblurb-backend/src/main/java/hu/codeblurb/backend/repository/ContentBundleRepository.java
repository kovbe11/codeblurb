package hu.codeblurb.backend.repository;

import hu.codeblurb.backend.domain.content.ContentBundle;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ContentBundleRepository extends JpaRepository<ContentBundle, Integer> {
}
