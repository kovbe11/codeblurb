package hu.codeblurb.backend.controller;

import hu.codeblurb.backend.controller.dto.content.CodeQuizSolutionRequest;
import hu.codeblurb.backend.controller.dto.content.CodeQuizSolutionResponse;
import hu.codeblurb.backend.controller.dto.content.CodeSolutionRequest;
import hu.codeblurb.backend.controller.dto.content.CodeSolutionResponse;
import hu.codeblurb.backend.controller.dto.content.CodingContentResponse;
import hu.codeblurb.backend.controller.dto.content.ContentBundleResponse;
import hu.codeblurb.backend.controller.dto.content.MyContentBundlesResponse;
import hu.codeblurb.backend.controller.dto.content.MyContentBundlesSeparatedResponse;
import hu.codeblurb.backend.controller.dto.content.QuizContentResponse;
import hu.codeblurb.backend.controller.dto.content.QuizSolutionRequest;
import hu.codeblurb.backend.controller.dto.content.QuizSolutionResponse;
import hu.codeblurb.backend.controller.dto.content.SeparatedContentBundleResponse;
import hu.codeblurb.backend.controller.dto.content.VideoContentResponse;
import hu.codeblurb.backend.controller.mapper.ContentMapper;
import hu.codeblurb.backend.service.ContentService;
import lombok.AllArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/content")
@AllArgsConstructor
public class ContentController {

    private final ContentService contentService;
    private final ContentMapper mapper;

    @GetMapping("/my-content-bundles")
    public MyContentBundlesResponse getMyContentBundles() {
        final var contentBundles = contentService.getPurchasedContentBundles();
        return new MyContentBundlesResponse(mapper.mapContentBundles(contentBundles));
    }

    @GetMapping("/my-content-bundles/separated")
    public MyContentBundlesSeparatedResponse getMyContentBundlesSeparated() {
        final var contentBundles = mapper.mapContentBundles(contentService.getPurchasedContentBundles());
        final var separatedContentBundles = separateContentBundles(contentBundles);
        return new MyContentBundlesSeparatedResponse(separatedContentBundles);
    }

    @PreAuthorize("authorizationService.customerHasAccessToContent(#contentId)")
    @PostMapping("/code/scratch-solution/{contentId}")
    public CodeSolutionResponse runSolutionFor(@PathVariable Integer contentId, @Valid @RequestBody CodeSolutionRequest code) {
        contentService.runCodeSolutionFor(contentId, code.code());
        return null;
    }

    @PreAuthorize("authorizationService.customerHasAccessToContent(#contentId)")
    @PostMapping("/code/code-quiz-solution/{contentId}")
    public CodeQuizSolutionResponse checkCodeQuizSolutionFor(@PathVariable Integer contentId, @Valid @RequestBody CodeQuizSolutionRequest code) {
        contentService.checkCodeQuizSolutionFor(contentId, code.solutionsByIndex());
        return null;
    }

    @PreAuthorize("authorizationService.customerHasAccessToContent(#contentId)")
    @PostMapping("/quiz/solution/{contentId}")
    public QuizSolutionResponse checkSolutionForQuiz(@PathVariable Integer contentId,
                                                     @Valid @RequestBody QuizSolutionRequest quizSolutionRequest) {
        final var result = contentService.checkSolutionForQuiz(contentId, quizSolutionRequest);
        return mapper.map(result);
    }

    private static List<SeparatedContentBundleResponse> separateContentBundles(List<ContentBundleResponse> contentBundles) {
        return contentBundles.stream()
                .map(it -> {
                    final var videos = new ArrayList<VideoContentResponse>();
                    final var codings = new ArrayList<CodingContentResponse>();
                    final var quizzes = new ArrayList<QuizContentResponse>();
                    it.includedContent()
                            .forEach(content -> {
                                if (content instanceof CodingContentResponse code) {
                                    codings.add(code);
                                } else if (content instanceof VideoContentResponse video) {
                                    videos.add(video);
                                } else if (content instanceof QuizContentResponse quiz) {
                                    quizzes.add(quiz);
                                }
                            });
                    return new SeparatedContentBundleResponse(videos, codings, quizzes);
                })
                .toList();
    }

}
