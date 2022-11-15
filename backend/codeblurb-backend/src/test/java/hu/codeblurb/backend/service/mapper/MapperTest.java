package hu.codeblurb.backend.service.mapper;

import hu.codeblurb.backend.domain.Customer;
import hu.codeblurb.backend.domain.content.CodingContent;
import hu.codeblurb.backend.domain.content.ContentBundle;
import hu.codeblurb.backend.domain.content.QuizContent;
import hu.codeblurb.backend.domain.content.QuizQuestion;
import hu.codeblurb.backend.domain.content.TestCase;
import hu.codeblurb.backend.domain.content.VideoContent;
import hu.codeblurb.backend.domain.shop.Payment;
import hu.codeblurb.backend.domain.shop.ShoppingCart;
import hu.codeblurb.backend.domain.shop.ShoppingItem;
import hu.codeblurb.backend.service.dto.CodingContentResult;
import hu.codeblurb.backend.service.dto.ContentBundleResult;
import hu.codeblurb.backend.service.dto.ContentResult;
import hu.codeblurb.backend.service.dto.PaymentResult;
import hu.codeblurb.backend.service.dto.QuizContentResult;
import hu.codeblurb.backend.service.dto.ShoppingItemResult;
import hu.codeblurb.backend.service.dto.VideoContentResult;
import org.junit.jupiter.api.Test;

import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

import static hu.codeblurb.backend.domain.content.Content.ContentType.CODING;
import static hu.codeblurb.backend.domain.content.Content.ContentType.QUIZ;
import static hu.codeblurb.backend.domain.content.Content.ContentType.VIDEO;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNull;

class MapperTest {

    private static final int ID = 1;
    private static final String NAME = "name";
    public static final String DESCRIPTION = "description";
    public static final String RESOURCE_URL = "resourceUrl";
    public static final String EXPECTED_OUTPUT = "expectedOutput";
    public static final double PRICE = 0.0;

    public static final String QUESTION = "question";
    public static final int SOLUTION_INDEX = 1;
    public static final String INPUT = "input";
    private static final TestCase testCase = new TestCase(ID, INPUT, EXPECTED_OUTPUT, true, List.of("a", "b", "c"));
    private static final CodingContent codingContent = new CodingContent(ID, NAME, DESCRIPTION, List.of("a", "b"), List.of("c"), List.of(testCase));
    private static final VideoContent videoContent = new VideoContent(NAME, DESCRIPTION, RESOURCE_URL);
    private static final QuizQuestion quizQuestion = new QuizQuestion(ID, QUESTION, List.of("answer1", "answer2"), SOLUTION_INDEX);
    private static final QuizContent quizContent = new QuizContent(ID, NAME, List.of(quizQuestion));
    private static final ContentBundle contentBundle = new ContentBundle(ID, Set.of(codingContent, videoContent, quizContent), NAME);

    private static final Customer customer = Customer.builder().id(ID).username("username").password("pass").build();

    private static final ShoppingItem shoppingItem = new ShoppingItem(ID, PRICE, contentBundle);
    private static final Payment payment = new Payment(ID, customer, Set.of(contentBundle), PRICE);
    private static final char SOLUTION_CHARACTER = 'b';

    private final Mapper mapper = new MapperImpl();

    @Test
    void mapContent() {
        assertContentResultEqualsContent(mapper.mapContent(videoContent));
        assertContentResultEqualsContent(mapper.mapContent(codingContent));
        assertContentResultEqualsContent(mapper.mapContent(quizContent));
    }

    @Test
    void mapContentBundle() {
        final var contentBundleResult = mapper.map(contentBundle);
        assertContentBundleResultEqualsContentBundle(contentBundleResult);
    }

    @Test
    void mapContentBundles() {
        final var contentBundleResults = mapper.mapContentBundles(List.of(contentBundle, contentBundle));
        contentBundleResults.forEach(MapperTest::assertContentBundleResultEqualsContentBundle);
    }

    @Test
    void mapPayment() {
        final var paymentResult = mapper.map(payment);
        assertPaymentResultEqualsPayment(paymentResult);
    }

    @Test
    void mapPayments() {
        final var paymentResults = mapper.mapPayments(List.of(payment, payment));
        paymentResults.forEach(MapperTest::assertPaymentResultEqualsPayment);
    }

    @Test
    void mapShoppingItem() {
        final var shoppingItemResult = mapper.map(shoppingItem);

        assertShoppingItemResultEqualsShoppingItem(shoppingItemResult);
    }

    @Test
    void mapShoppingItems() {
        final var shoppingItemResults = mapper.mapShoppingItems(List.of(shoppingItem, shoppingItem));

        shoppingItemResults.forEach(MapperTest::assertShoppingItemResultEqualsShoppingItem);
    }

    private static void assertContentResultEqualsContent(ContentResult contentResult) {
        if (contentResult instanceof final VideoContentResult videoContentResult) {
            assertEquals(VIDEO, videoContentResult.getContentType());
            assertNull(videoContentResult.getId());
            assertEquals(NAME, videoContentResult.getName());
            assertEquals(DESCRIPTION, videoContentResult.getDescription());
            assertEquals(RESOURCE_URL, videoContentResult.getResourceUrl());
        } else if (contentResult instanceof final QuizContentResult quizContentResult) {
            assertEquals(QUIZ, quizContentResult.getContentType());
            assertEquals(ID, quizContentResult.getId());
            assertEquals(NAME, quizContentResult.getName());
            assertEquals(QUESTION, quizContentResult.getQuestions().get(0).question());
            assertEquals(ID, quizContentResult.getQuestions().get(0).id());
            assertEquals(List.of("answer1", "answer2"), quizContentResult.getQuestions().get(0).answers());
            assertEquals(SOLUTION_INDEX, quizContentResult.getQuestions().get(0).solutionIndex());
            assertEquals(SOLUTION_CHARACTER, quizContentResult.getQuestions().get(0).solutionChar());
        } else if (contentResult instanceof final CodingContentResult codingContentResult) {
            assertEquals(CODING, codingContentResult.getContentType());
            assertEquals(ID, codingContentResult.getId());
            assertEquals(NAME, codingContentResult.getName());
            assertEquals(DESCRIPTION, codingContentResult.getDescription());
            assertEquals(List.of("a", "b"), codingContentResult.getCodeSkeleton());
            assertEquals(List.of("c"), codingContentResult.getCodeSnippets());
            assertEquals(EXPECTED_OUTPUT, codingContentResult.getTestCases().get(0).expectedOutput());
            assertEquals(INPUT, codingContentResult.getTestCases().get(0).input());
        }
    }

    private static void assertPaymentResultEqualsPayment(PaymentResult paymentResult) {
        assertEquals(PRICE, paymentResult.pricePayed());
        paymentResult.boughtContentBundles().forEach(it -> it.includedContent().forEach(MapperTest::assertContentResultEqualsContent));
    }

    private static void assertContentBundleResultEqualsContentBundle(ContentBundleResult contentBundleResult) {
        assertEquals(3, contentBundleResult.includedContent().size());
        assertEquals(Set.of(VideoContentResult.class, QuizContentResult.class, CodingContentResult.class), contentBundleResult.includedContent().stream().map(ContentResult::getClass).collect(Collectors.toSet()));
        contentBundleResult.includedContent().forEach(MapperTest::assertContentResultEqualsContent);
    }

    private static void assertShoppingItemResultEqualsShoppingItem(ShoppingItemResult shoppingItemResult) {
        assertEquals(ID, shoppingItemResult.id());
        assertEquals(PRICE, shoppingItemResult.price());
        assertEquals(NAME, shoppingItemResult.title());
        assertContentBundleResultEqualsContentBundle(shoppingItemResult.contentBundle());
    }

}