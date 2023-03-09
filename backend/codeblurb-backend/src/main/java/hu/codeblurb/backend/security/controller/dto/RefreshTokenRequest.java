package hu.codeblurb.backend.security.controller.dto;

import lombok.Builder;

import javax.validation.constraints.NotNull;

@Builder
public record RefreshTokenRequest(@NotNull String refreshToken) {
}
