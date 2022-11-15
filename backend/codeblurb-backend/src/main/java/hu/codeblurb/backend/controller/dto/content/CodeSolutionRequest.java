package hu.codeblurb.backend.controller.dto.content;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

public record CodeSolutionRequest(@NotNull @Size(max = 32768) String code) {
    //additional data later, like count of ctrl v used :D
}
