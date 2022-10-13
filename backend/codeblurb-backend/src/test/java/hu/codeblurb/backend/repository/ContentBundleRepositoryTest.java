package hu.codeblurb.backend.repository;

import hu.codeblurb.backend.domain.content.CodingContent;
import hu.codeblurb.backend.domain.content.ContentBundle;
import hu.codeblurb.backend.domain.content.QuizContent;
import hu.codeblurb.backend.domain.content.QuizQuestion;
import hu.codeblurb.backend.domain.content.TestCase;
import hu.codeblurb.backend.domain.content.VideoContent;
import hu.codeblurb.backend.domain.shop.Payment;
import hu.codeblurb.backend.domain.shop.ShoppingItem;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.test.context.jdbc.Sql;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import java.util.List;
import java.util.Set;

import static hu.codeblurb.backend.domain.content.CodingContent.CodingContentType.DRAG_AND_DROP;
import static org.junit.jupiter.api.Assertions.assertEquals;

@ExtendWith(SpringExtension.class)
@DataJpaTest
class ContentBundleRepositoryTest {

    @Autowired
    private ContentBundleRepository contentBundleRepository;
    @Autowired
    private QuizRepository quizRepository;
    @Autowired
    private CodingRepository codingRepository;
    @Autowired
    private VideoRepository videoRepository;
    @Autowired
    private PaymentRepository paymentRepository;
    @Autowired
    private CustomerRepository customerRepository;

    @Test
    @Sql({"/scripts/cleanDb.sql", "/scripts/addCustomer.sql"})
    void findContentBundlesPurchasedByCustomerId() {
        setUp();

        List<ContentBundle> bundles = contentBundleRepository.findContentBundlesPurchasedByCustomerId(1);
        List<ContentBundle> emptyBundles = contentBundleRepository.findContentBundlesPurchasedByCustomerId(2);

        assertEquals(1, bundles.size());
        assertEquals(0, emptyBundles.size());
    }

    private void setUp() {
        final var codingContent = new CodingContent();
        codingContent.setId(1);
        codingContent.setName("Hello CodeBlurb");
        codingContent.setDescription("This is a hello world example");
        codingContent.setCodeSkeleton(List.of("public class CodeSolution {\n", "public static void main(String[] args) {\n", "}", "}"));
        codingContent.setCodeSnippets(List.of("System.out.println(\"Hello CodeBlurb!\");"));
        final var testCase = new TestCase();
        testCase.setId(1);
        testCase.setExampleTestCase(true);
        testCase.setInput("");
        testCase.setExpectedOutput("Hello CodeBlurb!");
        testCase.setHints(List.of());
        codingContent.setTestCases(List.of(testCase));
        codingContent.setCodingContentType(DRAG_AND_DROP);

        final var videoContent = new VideoContent();
        videoContent.setId(2);
        videoContent.setName("Introduction to java");
        videoContent.setDescription("This video will introduce the basic concepts of java");
        videoContent.setResourceUrl("resourceUrl");

        final var quizContent = new QuizContent();
        quizContent.setId(3);
        quizContent.setName("Java hello world quiz");
        final var quizQuestion = new QuizQuestion();
        quizQuestion.setId(1);
        quizQuestion.setQuestion("How to print hello world?");
        quizQuestion.setAnswers(List.of("hello world", "System.out.println(\"hello world\");", "console.log(\"hello world\")"));
        quizQuestion.setSolutionIndex(1);
        quizQuestion.setQuiz(quizContent);
        quizContent.setQuestions(List.of(quizQuestion));

        final var bundle1 = new ContentBundle();
        bundle1.setId(1);
        bundle1.setTitle("bundle1");
        bundle1.setIncludedContent(Set.of(codingContent, quizContent));

        final var bundle2 = new ContentBundle();
        bundle2.setId(2);
        bundle2.setTitle("bundle2");
        bundle2.setIncludedContent(Set.of(videoContent));

        final var shoppingItem1 = new ShoppingItem();
        shoppingItem1.setId(1);
        shoppingItem1.setPrice(50.0);
        shoppingItem1.setContentBundle(bundle1);

        final var shoppingItem2 = new ShoppingItem();
        shoppingItem2.setId(2);
        shoppingItem2.setPrice(10.0);
        shoppingItem2.setContentBundle(bundle2);

        final var payment = new Payment();
        payment.setId(1);
        payment.setCustomer(customerRepository.findById(1).get());
        payment.setContentBundlesBought(Set.of(bundle1));

        videoRepository.save(videoContent);
        codingRepository.save(codingContent);
        quizRepository.save(quizContent);
        contentBundleRepository.saveAllAndFlush(List.of(bundle1, bundle2));
        paymentRepository.save(payment);
    }

}