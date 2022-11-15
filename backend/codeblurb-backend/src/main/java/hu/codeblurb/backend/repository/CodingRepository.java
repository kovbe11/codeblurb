package hu.codeblurb.backend.repository;

import hu.codeblurb.backend.domain.content.CodingContent;
import org.springframework.data.repository.CrudRepository;

public interface CodingRepository extends CrudRepository<CodingContent, Integer> {
}
