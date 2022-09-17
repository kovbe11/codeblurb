package hu.codeblurb.backend.security.service.dto;

import lombok.Builder;

import java.time.Instant;

@Builder
public record AuthUserDetails(String customerId, String username, String jti, Instant expiration) {
}
