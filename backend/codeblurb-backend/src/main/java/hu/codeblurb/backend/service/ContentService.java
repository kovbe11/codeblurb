package hu.codeblurb.backend.service;

import hu.codeblurb.backend.domain.content.CodingContent;
import hu.codeblurb.backend.domain.content.Content;
import hu.codeblurb.backend.repository.ContentRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import javax.persistence.EntityNotFoundException;

@Service
@AllArgsConstructor
public class ContentService {

    private final ContentRepository contentRepository;
    private final CodeRunnerService codeRunnerService;

    public void getPurchasedContentBundles() {
        //TODO
    }

    public void runSolutionFor(Integer contentId, String code) {
        contentRepository.findById(contentId)
                .filter(it -> it.getContentType() == Content.ContentType.CODING && ((CodingContent) it).getCodingContentType() == CodingContent.CodingContentType.SCRATCH)
                .orElseThrow(() -> new EntityNotFoundException("todo"));

        final var result = codeRunnerService.runAndGetOutputFor(code);
        //TODO
    }
}
