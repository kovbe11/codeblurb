package hu.codeblurb.backend.controller.dto.content;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.Map;

public record CodeQuizSolutionRequest(@NotNull @Size(min = 1) Map<Integer, String> solutionsByIndex) {
}
