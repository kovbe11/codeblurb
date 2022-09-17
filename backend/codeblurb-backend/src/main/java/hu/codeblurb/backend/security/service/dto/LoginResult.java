package hu.codeblurb.backend.security.service.dto;

import lombok.Builder;

@Builder
public record LoginResult(String accessToken, String refreshToken) {
}
