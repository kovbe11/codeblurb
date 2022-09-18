package hu.codeblurb.backend.security.service.dto;

import lombok.Builder;

import java.time.Instant;

@Builder
public record TokenIssuedMessage(int customerId, String accessTokenJti, String refreshTokenJti,
                                 Instant accessTokenExpirationDate, Instant refreshTokenExpirationDate) {
}
