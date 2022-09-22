package hu.codeblurb.backend.security.controller.dto;

import lombok.Builder;

@Builder
public record LoginResponse(String accessToken, String refreshToken) {
}
