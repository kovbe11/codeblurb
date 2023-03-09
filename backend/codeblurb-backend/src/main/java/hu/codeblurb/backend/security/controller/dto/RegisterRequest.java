package hu.codeblurb.backend.security.controller.dto;

import lombok.Builder;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Builder
public record RegisterRequest(@NotNull @Size(min = 4, max = 30) String username,
                              @NotNull @Size(min = 8, max = 60) String password) {
}
