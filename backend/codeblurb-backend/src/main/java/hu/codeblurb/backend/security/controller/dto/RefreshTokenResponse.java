package hu.codeblurb.backend.security.controller.dto;

import lombok.Builder;

@Builder
public record RefreshTokenResponse(String accessToken, String refreshToken) {
}
