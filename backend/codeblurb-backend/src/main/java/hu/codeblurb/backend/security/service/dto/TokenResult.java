package hu.codeblurb.backend.security.service.dto;

import lombok.Builder;

@Builder
public record TokenResult(String accessToken, String refreshToken) {
}
