package hu.codeblurb.backend.security.service;

import hu.codeblurb.backend.security.exception.ExpiredAccessTokenException;
import hu.codeblurb.backend.security.service.dto.AuthUserDetails;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.JwtException;
import io.jsonwebtoken.Jwts;
import lombok.AllArgsConstructor;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.List;
import java.util.Optional;

import static hu.codeblurb.backend.security.service.TokenService.ACCESS_TOKEN_SUBJECT;
import static hu.codeblurb.backend.security.service.TokenService.TOKEN_ISSUER;
import static hu.codeblurb.backend.security.service.TokenService.TOKEN_PREFIX;

@Service
@AllArgsConstructor
public class JwtTokenAuthenticationService {

    private final SecretService secretService;
    private final DenyTokenService denyTokenService;

    public UsernamePasswordAuthenticationToken getAuthenticationFromToken(String token) {
        if (!StringUtils.hasText(token)) {
            return null;
        }

        final var claims = validateTokenAndParseClaims(token)
                .filter(it -> denyTokenService.isNotDenied(it.getId()))
                .orElseThrow(() -> new BadCredentialsException("")); //TODO

        final var customerId = Integer.parseInt(claims.get(TokenService.CUSTOMER_ID_CLAIM).toString());

        final var userDetails = AuthUserDetails.builder()
                .customerId(customerId)
                .username(claims.getAudience())
                .jti(claims.getId())
                .expiration(claims.getExpiration().toInstant())
                .build();

        return new UsernamePasswordAuthenticationToken(userDetails, null, List.of());
    }

    private Optional<Claims> validateTokenAndParseClaims(String token) {
        token = token.replace(TOKEN_PREFIX, "");
        try {
            return Optional.of(Jwts.parser()
                    .requireIssuer(TOKEN_ISSUER)
                    .requireSubject(ACCESS_TOKEN_SUBJECT)
                    .setSigningKey(secretService.getSecret())
                    .parseClaimsJws(token).getBody());
        } catch (ExpiredJwtException e) {
            throw new ExpiredAccessTokenException();
        } catch (JwtException | IllegalArgumentException ignored) {
        }

        return Optional.empty();
    }

}
