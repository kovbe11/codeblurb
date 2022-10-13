package hu.codeblurb.backend.service.mapper;

import hu.codeblurb.backend.domain.content.CodingContent;
import hu.codeblurb.backend.domain.content.Content;
import hu.codeblurb.backend.domain.content.ContentBundle;
import hu.codeblurb.backend.domain.content.QuizContent;
import hu.codeblurb.backend.domain.content.QuizQuestion;
import hu.codeblurb.backend.domain.content.TestCase;
import hu.codeblurb.backend.domain.content.VideoContent;
import hu.codeblurb.backend.domain.shop.Payment;
import hu.codeblurb.backend.domain.shop.ShoppingItem;
import hu.codeblurb.backend.service.dto.CodingContentResult;
import hu.codeblurb.backend.service.dto.ContentBundleResult;
import hu.codeblurb.backend.service.dto.ContentResult;
import hu.codeblurb.backend.service.dto.PaymentResult;
import hu.codeblurb.backend.service.dto.QuizContentResult;
import hu.codeblurb.backend.service.dto.QuizQuestionResult;
import hu.codeblurb.backend.service.dto.ShoppingItemResult;
import hu.codeblurb.backend.service.dto.TestCaseResult;
import hu.codeblurb.backend.service.dto.VideoContentResult;
import org.mapstruct.Mapping;
import org.mapstruct.MappingConstants;

import java.util.List;

@org.mapstruct.Mapper(componentModel = MappingConstants.ComponentModel.SPRING)
public interface Mapper {
    ContentBundleResult map(ContentBundle contentBundle);

    List<ContentBundleResult> mapContentBundles(List<ContentBundle> contentBundleList);

    default ContentResult mapContent(Content content) {
        return switch (content.getContentType()) {
            case QUIZ -> map((QuizContent) content);
            case VIDEO -> map((VideoContent) content);
            case CODING -> map((CodingContent) content);
        };
    }

    CodingContentResult map(CodingContent codingContent);
//    CodeSolutionResult map(CodeSolution codeSolution);

    QuizContentResult map(QuizContent quizContent);

    QuizQuestionResult map(QuizQuestion quizQuestion);
//    QuizSolutionResult map(QuizSolution quizSolution);

    TestCaseResult map(TestCase testCase);
//    TestCaseOutcomeResult map(TestCaseOutcome testCaseOutcome);

    VideoContentResult map(VideoContent videoContent);

    @Mapping(target = "boughtContentBundles", source = "contentBundlesBought")
    PaymentResult map(Payment payment);

    List<PaymentResult> mapPayments(List<Payment> paymentList);

    ShoppingItemResult map(ShoppingItem shoppingItem);
}
