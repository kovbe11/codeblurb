package hu.codeblurb.backend.repository;

import hu.codeblurb.backend.domain.content.QuizContent;
import org.springframework.data.repository.CrudRepository;

public interface QuizRepository extends CrudRepository<QuizContent, Integer> {
}
