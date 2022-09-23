package hu.codeblurb.backend.repository;

import hu.codeblurb.backend.domain.content.Content;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ContentRepository extends JpaRepository<Content, Integer> {
}
