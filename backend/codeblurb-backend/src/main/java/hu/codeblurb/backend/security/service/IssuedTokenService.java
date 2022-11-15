package hu.codeblurb.backend.security.service;

import hu.codeblurb.backend.exception.InconsistentDatabaseException;
import hu.codeblurb.backend.security.domain.IssuedToken;
import hu.codeblurb.backend.security.repository.IssuedTokenRepository;
import hu.codeblurb.backend.security.service.dto.TokenIssuedMessage;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.Instant;
import java.util.Set;

@Service
@AllArgsConstructor
public class IssuedTokenService {

    private final IssuedTokenRepository issuedTokenRepository;

    public Set<IssuedToken> getIssuedTokensForCustomer(int customerId) {
        return issuedTokenRepository.findByCustomerId(customerId);
    }

    public IssuedToken findTokenById(String jti) {
        return issuedTokenRepository.findById(jti)
                .orElseThrow(() -> new InconsistentDatabaseException("There is no token with jti: " + jti));
    }

    public IssuedToken findRefreshTokenForAccessToken(String accessTokenJti) {
        return issuedTokenRepository.findByAccessTokenJti(accessTokenJti)
                .orElseThrow(() -> new InconsistentDatabaseException("There is no refresh token for issued accessToken with jti: " + accessTokenJti));
    }

    //TODO
    // @Scheduled(cron = "0 0/${codeblurb.issued-tokens.cleanup-frequency-in-minutes} * * * *")
    public void removeExpiredTokens() {
        issuedTokenRepository.deleteByExpirationDateBefore(Instant.now());
    }

    public void tokenIssued(TokenIssuedMessage tokenIssuedMessage) {
        final var accessToken = IssuedToken.builder()
                .jti(tokenIssuedMessage.accessTokenJti())
                .expirationDate(tokenIssuedMessage.accessTokenExpirationDate())
                .customerId(tokenIssuedMessage.customerId())
                .build();
        issuedTokenRepository.save(accessToken);
        final var refreshToken = IssuedToken.builder()
                .jti(tokenIssuedMessage.refreshTokenJti())
                .expirationDate(tokenIssuedMessage.refreshTokenExpirationDate())
                .customerId(tokenIssuedMessage.customerId())
                .accessTokenJti(tokenIssuedMessage.accessTokenJti())
                .build();
        issuedTokenRepository.save(refreshToken);
    }

}
