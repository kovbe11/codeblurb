package hu.codeblurb.backend.service;

import hu.codeblurb.backend.controller.dto.content.QuizSolutionRequest;
import hu.codeblurb.backend.domain.Customer;
import hu.codeblurb.backend.domain.content.CodingContent;
import hu.codeblurb.backend.domain.content.Content;
import hu.codeblurb.backend.domain.content.ContentBundle;
import hu.codeblurb.backend.domain.content.QuizContent;
import hu.codeblurb.backend.repository.CodingRepository;
import hu.codeblurb.backend.repository.ContentBundleRepository;
import hu.codeblurb.backend.repository.ContentRepository;
import hu.codeblurb.backend.repository.QuizRepository;
import hu.codeblurb.backend.service.dto.ContentBundleResult;
import hu.codeblurb.backend.service.dto.QuizSolutionResult;
import hu.codeblurb.backend.service.exception.EntityNotFoundException;
import hu.codeblurb.backend.service.mapper.Mapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
@AllArgsConstructor
public class ContentService {

    private final CodingRepository codingRepository;
    private final QuizRepository quizRepository;
    private final ContentBundleRepository contentBundleRepository;
    private final ContentRepository contentRepository;
    private final CustomerService customerService;
    private final CodeRunnerService codeRunnerService;
    private final QuizSolutionCheckerService quizSolutionCheckerService;
    private final Mapper mapper;

    public List<ContentBundleResult> getPurchasedContentBundles() {
        final var customer = customerService.getCurrentCustomer();
        return mapper.mapContentBundles(getPurchasedContentBundles(customer));
    }

    public Content getContentById(Integer id) {
        return contentRepository.findById(id)
                .orElseThrow(() -> new EntityNotFoundException(Content.class, id));
    }

    //TODO: CACHE
    private List<ContentBundle> getPurchasedContentBundles(Customer customer) {
        return contentBundleRepository.findContentBundlesPurchasedByCustomer(customer);
    }


    public void runCodeSolutionFor(Integer contentId, String code) {
        final var coding = codingRepository.findById(contentId)
                .filter(it -> it.getCodingContentType() == CodingContent.CodingContentType.SCRATCH)
                .orElseThrow(() -> new EntityNotFoundException(CodingContent.class, contentId));

        codeRunnerService.runAndCheckOutputFor(coding, code);
        //TODO
    }

    public QuizSolutionResult checkSolutionForQuiz(Integer contentId, QuizSolutionRequest quizSolutionRequest) {
        final var quiz = quizRepository.findById(contentId)
                .orElseThrow(() -> new EntityNotFoundException(QuizContent.class, contentId));

        return quizSolutionCheckerService.checkSolution(quiz, quizSolutionRequest);
    }

    public void checkCodeQuizSolutionFor(Integer contentId, Map<Integer, String> solutionsByIndex) {

    }
}
