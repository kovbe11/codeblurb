package hu.codeblurb.backend.sync.domain;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import hu.codeblurb.backend.domain.content.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import static hu.codeblurb.backend.domain.content.CodingContent.CodingContentType.valueOf;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@JsonIgnoreProperties(ignoreUnknown = true)
public class SyncData {

    private static final int quizOffset = 10000;
    private static final int videoOffset = 20000;

    private List<SyncBundle> data;

    public List<ContentBundle> getBundles() {
        return data.stream().map(SyncBundle::getContentBundle).toList();
    }

    @Getter
    @Setter
    @AllArgsConstructor
    @NoArgsConstructor
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class SyncBundle {
        private int id;
        private SyncBundleAttributes attributes;

        private Set<Content> mergeContent() {
            return Stream.concat(Stream.concat(
                            attributes.included_coding_contents.getCodingContents().stream(),
                            attributes.included_quiz_contents.getQuizContents().stream()),
                    attributes.included_video_contents.getVideoContents().stream()).collect(Collectors.toSet());
        }

        public ContentBundle getContentBundle() {
            return new ContentBundle(
                    id,
                    mergeContent(),
                    attributes.title
            );
        }
    }

    @Getter
    @Setter
    @AllArgsConstructor
    @NoArgsConstructor
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class SyncBundleAttributes {
        private String title;
        private IncludedCodingContents included_coding_contents;
        private IncludedQuizContents included_quiz_contents;
        private IncludedVideoContents included_video_contents;
    }

    @Getter
    @Setter
    @AllArgsConstructor
    @NoArgsConstructor
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class IncludedCodingContents {
        private List<SyncCodingContent> data;

        public List<CodingContent> getCodingContents() {
            return data.stream().map(SyncCodingContent::mapToContent).toList();
        }
    }

    @Getter
    @Setter
    @AllArgsConstructor
    @NoArgsConstructor
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class SyncCodingContent {
        private int id;
        private AttributesCoding attributes;

        public CodingContent mapToContent() {
            return new CodingContent(id, attributes.title, attributes.description, valueOf(attributes.codingContentType), attributes.codeSkeleton.stream().map(it -> it.codeSkeletonPart).toList(), attributes.codeSnippet.stream().map(it -> it.codeSnippetPart).toList(), attributes.testCases.stream().map(SyncTestCase::mapToContent).toList());
        }
    }

    @Getter
    @Setter
    @AllArgsConstructor
    @NoArgsConstructor
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class AttributesCoding {
        private String title;
        private String description;
        private String codingContentType;
        private List<SyncTestCase> testCases;
        private List<CodeSkeletonPart> codeSkeleton;
        private List<CodeSnippetPart> codeSnippet;
    }

    @Getter
    @Setter
    @AllArgsConstructor
    @NoArgsConstructor
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class SyncTestCase {
        private int id;
        private String input;
        private String expectedOutput;
        private boolean exampleTestCase;

        private List<Hint> hints; // Changed to List of Hint

        public TestCase mapToContent() {
            return new TestCase(id, input, expectedOutput, exampleTestCase, hints.stream().map(it -> it.hintPart).toList());
        }
    }

    @Getter
    @Setter
    @AllArgsConstructor
    @NoArgsConstructor
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class Hint {
        private int id;
        private String hintPart;
    }

    @Getter
    @Setter
    @AllArgsConstructor
    @NoArgsConstructor
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class CodeSkeletonPart {
        private int id;
        private String codeSkeletonPart;
    }

    @Getter
    @Setter
    @AllArgsConstructor
    @NoArgsConstructor
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class CodeSnippetPart {
        private int id;
        private String codeSnippetPart;
    }

    @Getter
    @Setter
    @AllArgsConstructor
    @NoArgsConstructor
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class IncludedQuizContents {
        private List<SyncQuizContent> data;

        public List<QuizContent> getQuizContents() {
            return data.stream().map(SyncQuizContent::mapToContent).toList();
        }
    }

    @Getter
    @Setter
    @AllArgsConstructor
    @NoArgsConstructor
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class SyncQuizContent {
        private int id;
        private AttributesQuiz attributes;

        public QuizContent mapToContent() {
            return new QuizContent(id + quizOffset, attributes.title, attributes.questions.stream().map(Question::mapToContent).toList());
        }
    }

    @Getter
    @Setter
    @AllArgsConstructor
    @NoArgsConstructor
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class AttributesQuiz {
        private String title;
        private List<Question> questions;
    }

    @Getter
    @Setter
    @AllArgsConstructor
    @NoArgsConstructor
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class Question {
        private int id;
        private String question;
        private int solutionIndex;
        private List<Answer> answers;

        public QuizQuestion mapToContent() {
            return new QuizQuestion(id, question, answers.stream().map(it -> it.answer).toList(), solutionIndex);
        }
    }

    @Getter
    @Setter
    @AllArgsConstructor
    @NoArgsConstructor
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class Answer {
        private int id;
        private String answer;
    }

    @Getter
    @Setter
    @AllArgsConstructor
    @NoArgsConstructor
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class IncludedVideoContents {
        private List<SyncVideoContent> data;

        public List<VideoContent> getVideoContents() {
            return data.stream().map(SyncVideoContent::mapToContent).toList();
        }
    }

    @Getter
    @Setter
    @AllArgsConstructor
    @NoArgsConstructor
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class SyncVideoContent {
        private int id;
        private AttributesVideo attributes;

        public VideoContent mapToContent() {
            final var content = new VideoContent(attributes.title, attributes.description, attributes.video.data.attributes.url);
            content.setId(id + videoOffset);
            return content;
        }

    }

    @Getter
    @Setter
    @AllArgsConstructor
    @NoArgsConstructor
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class AttributesVideo {
        private String title;
        private String description;
        private Video video;
    }

    @Getter
    @Setter
    @AllArgsConstructor
    @NoArgsConstructor
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class Video {
        private VideoData data;
    }

    @Getter
    @Setter
    @AllArgsConstructor
    @NoArgsConstructor
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class VideoData {
        private int id;
        private VideoAttributes attributes;
    }

    @Getter
    @Setter
    @AllArgsConstructor
    @NoArgsConstructor
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class VideoAttributes {
        private String name;
        private String ext;
        private String mime;
        private double size;
        private String url;
    }

}
