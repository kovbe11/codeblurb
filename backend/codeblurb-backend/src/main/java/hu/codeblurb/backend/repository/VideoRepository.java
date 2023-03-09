package hu.codeblurb.backend.repository;

import hu.codeblurb.backend.domain.content.VideoContent;
import org.springframework.data.repository.CrudRepository;

public interface VideoRepository extends CrudRepository<VideoContent, Integer> {
}
