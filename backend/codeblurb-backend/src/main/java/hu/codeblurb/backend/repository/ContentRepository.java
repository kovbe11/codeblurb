package hu.codeblurb.backend.repository;

import hu.codeblurb.backend.domain.content.Content;
import org.springframework.data.repository.CrudRepository;

public interface ContentRepository extends CrudRepository<Content, Integer> {
}
