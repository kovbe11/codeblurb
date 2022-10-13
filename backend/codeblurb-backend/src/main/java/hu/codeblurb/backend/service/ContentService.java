package hu.codeblurb.backend.service;

import hu.codeblurb.backend.controller.dto.content.QuizSolutionRequest;
import hu.codeblurb.backend.domain.content.CodingContent;
import hu.codeblurb.backend.domain.content.ContentBundle;
import hu.codeblurb.backend.domain.content.QuizContent;
import hu.codeblurb.backend.repository.CodingRepository;
import hu.codeblurb.backend.repository.ContentBundleRepository;
import hu.codeblurb.backend.repository.QuizRepository;
import hu.codeblurb.backend.security.exception.InconsistentDatabaseException;
import hu.codeblurb.backend.security.service.AuthenticationFacade;
import hu.codeblurb.backend.service.dto.ContentBundleResult;
import hu.codeblurb.backend.service.exception.EntityNotFoundException;
import hu.codeblurb.backend.service.mapper.Mapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class ContentService {

    private final AuthenticationFacade authenticationFacade;
    private final CodingRepository codingRepository;
    private final QuizRepository quizRepository;
    private final ContentBundleRepository contentBundleRepository;
    private final CodeRunnerService codeRunnerService;
    private final QuizSolutionCheckerService quizSolutionCheckerService;
    private final Mapper mapper;

    public List<ContentBundleResult> getPurchasedContentBundles() {
        return authenticationFacade.getCurrentCustomerId()
                .map(this::getPurchasedContentBundles)
                .map(mapper::mapContentBundles)
                .orElseThrow(() -> new InconsistentDatabaseException("Authenticated request does not have customer id!")); //should not happen
    }

    //TODO: CACHE
    private List<ContentBundle> getPurchasedContentBundles(Integer customerId) {
        return contentBundleRepository.findContentBundlesPurchasedByCustomerId(customerId);
    }


    public void runCodeSolutionFor(Integer contentId, String code) {
        final var coding = codingRepository.findById(contentId)
                .filter(it -> it.getCodingContentType() == CodingContent.CodingContentType.SCRATCH)
                .orElseThrow(() -> new EntityNotFoundException(CodingContent.class, contentId));

        codeRunnerService.runAndCheckOutputFor(coding);
        //TODO
    }

    public void checkSolutionForQuiz(Integer contentId, QuizSolutionRequest quizSolutionRequest) {
        final var quiz = quizRepository.findById(contentId)
                .orElseThrow(() -> new EntityNotFoundException(QuizContent.class, contentId));

        quizSolutionCheckerService.checkSolution(quiz, quizSolutionRequest);
        //TODO
    }
}
