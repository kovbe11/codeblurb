package hu.codeblurb.backend.controller.dto.content;

import javax.validation.constraints.NotNull;
import java.util.Map;

public record QuizSolutionRequest(@NotNull Map<Integer, Integer> solutions) {
}
