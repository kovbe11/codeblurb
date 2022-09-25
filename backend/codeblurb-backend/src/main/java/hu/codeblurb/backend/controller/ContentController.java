package hu.codeblurb.backend.controller;

import hu.codeblurb.backend.controller.dto.CodeSolutionResponse;
import hu.codeblurb.backend.controller.dto.MyContentBundlesResponse;
import hu.codeblurb.backend.controller.dto.QuizSolutionRequest;
import hu.codeblurb.backend.controller.dto.QuizSolutionResponse;
import hu.codeblurb.backend.service.ContentService;
import lombok.AllArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/content")
@AllArgsConstructor
public class ContentController {

    private final ContentService contentService;

    @GetMapping("/my-content-bundles")
    public MyContentBundlesResponse getMyContentBundles() {
        contentService.getPurchasedContentBundles();
        return null;
        //TODO
    }

    @PreAuthorize("authorizationService.customerHasAccessToContent(#contentId)")
    @PostMapping("/code/solution/{contentId}")
    public CodeSolutionResponse runSolutionFor(@PathVariable Integer contentId, @RequestBody String code) { //TODO: dto
        contentService.runCodeSolutionFor(contentId, code);
        return null;
    }

    @PreAuthorize("authorizationService.customerHasAccessToContent(#contentId)")
    @PostMapping("/quiz/solution/{contentId}")
    public QuizSolutionResponse checkSolutionForQuiz(@PathVariable Integer contentId,
                                                     @RequestBody QuizSolutionRequest quizSolutionRequest) {

        contentService.checkSolutionForQuiz(contentId, quizSolutionRequest);
        return null;
    }


}
