package hu.codeblurb.backend.service;

import hu.codeblurb.backend.controller.dto.QuizSolutionRequest;
import hu.codeblurb.backend.domain.content.CodingContent;
import hu.codeblurb.backend.domain.content.Content;
import hu.codeblurb.backend.domain.content.ContentBundle;
import hu.codeblurb.backend.repository.ContentBundleRepository;
import hu.codeblurb.backend.repository.ContentRepository;
import hu.codeblurb.backend.security.service.AuthenticationFacade;
import hu.codeblurb.backend.service.dto.ContentBundleResult;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import javax.persistence.EntityNotFoundException;
import java.util.List;

@Service
@AllArgsConstructor
public class ContentService {

    private final AuthenticationFacade authenticationFacade;
    private final ContentRepository contentRepository;
    private final ContentBundleRepository contentBundleRepository;
    private final CodeRunnerService codeRunnerService;

    public List<ContentBundleResult> getPurchasedContentBundles() {
        return authenticationFacade.getCurrentCustomerId()
                .map(this::getPurchasedContentBundles)
                .orElseGet(List::of)
                .stream()
                .map(it -> new ContentBundleResult()) // TODO
                .toList();
    }

    //TODO: CACHE
    private List<ContentBundle> getPurchasedContentBundles(Integer customerId) {
        return List.of();
    }


    public void runCodeSolutionFor(Integer contentId, String code) {
        contentRepository.findById(contentId)
                .filter(it -> it.getContentType() == Content.ContentType.CODING && ((CodingContent) it).getCodingContentType() == CodingContent.CodingContentType.SCRATCH)
                .orElseThrow(() -> new EntityNotFoundException("todo"));

        final var result = codeRunnerService.runAndGetOutputFor(code);
        //TODO
    }

    public void checkSolutionForQuiz(Integer contentId, QuizSolutionRequest quizSolutionRequest) {

    }
}
