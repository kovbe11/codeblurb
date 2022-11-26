package hu.codeblurb.backend.controller.dto.content;

import java.util.List;

public record SeparatedContentBundleResponse(List<VideoContentResponse> includedVideos,
                                             List<CodingContentResponse> includedCodings,
                                             List<QuizContentResponse> includedQuizzes) {
}
