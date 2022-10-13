package hu.codeblurb.backend.controller.mapper;

import hu.codeblurb.backend.controller.dto.content.CodingContentResponse;
import hu.codeblurb.backend.controller.dto.content.ContentBundleResponse;
import hu.codeblurb.backend.controller.dto.content.ContentResponse;
import hu.codeblurb.backend.controller.dto.content.QuizContentResponse;
import hu.codeblurb.backend.controller.dto.content.QuizQuestionResponse;
import hu.codeblurb.backend.controller.dto.content.TestCaseResponse;
import hu.codeblurb.backend.controller.dto.content.VideoContentResponse;
import hu.codeblurb.backend.controller.dto.payments.PaymentResponse;
import hu.codeblurb.backend.service.dto.CodingContentResult;
import hu.codeblurb.backend.service.dto.ContentBundleResult;
import hu.codeblurb.backend.service.dto.ContentResult;
import hu.codeblurb.backend.service.dto.PaymentResult;
import hu.codeblurb.backend.service.dto.QuizContentResult;
import hu.codeblurb.backend.service.dto.QuizQuestionResult;
import hu.codeblurb.backend.service.dto.TestCaseResult;
import hu.codeblurb.backend.service.dto.VideoContentResult;
import org.mapstruct.Mapper;
import org.mapstruct.MappingConstants;

import java.util.List;

@Mapper(componentModel = MappingConstants.ComponentModel.SPRING)
public interface ContentMapper {
    ContentBundleResponse map(ContentBundleResult contentBundleResult);

    List<ContentBundleResponse> mapContentBundles(List<ContentBundleResult> myContentBundlesResult);

    CodingContentResponse map(CodingContentResult codingContentResult);
//    CodeSolutionResponse map(CodeSolutionResult codeSolutionResult);

    QuizContentResponse map(QuizContentResult quizContentResult);

    QuizQuestionResponse map(QuizQuestionResult quizQuestionResult);
//    QuizSolutionResponse map(QuizSolutionResult quizSolutionResult);

    TestCaseResponse map(TestCaseResult testCaseResult);
//    TestCaseOutcomeResponse map(TestCaseOutcomeResult testCaseOutcomeResult);

    VideoContentResponse map(VideoContentResult videoContentResult);

    default ContentResponse mapContent(ContentResult contentResult) {
        return switch (contentResult.getContentType()) {
            case QUIZ -> map((QuizContentResult) contentResult);
            case VIDEO -> map((VideoContentResult) contentResult);
            case CODING -> map((CodingContentResult) contentResult);
        };
    }

    List<PaymentResponse> mapPayments(List<PaymentResult> paymentResultList);

    PaymentResponse map(PaymentResult paymentResult);
}
