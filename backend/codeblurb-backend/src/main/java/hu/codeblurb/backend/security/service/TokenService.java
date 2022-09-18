package hu.codeblurb.backend.security.service;

import hu.codeblurb.backend.domain.Customer;
import hu.codeblurb.backend.security.exception.InvalidTokenException;
import hu.codeblurb.backend.security.service.dto.TokenIssuedMessage;
import hu.codeblurb.backend.security.service.dto.TokenResult;
import hu.codeblurb.backend.security.service.dto.ValidateRefreshTokenResult;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.JwtException;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import lombok.AllArgsConstructor;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.UUID;

@Service
@AllArgsConstructor
public class TokenService {

    public static final String TOKEN_PREFIX = "Bearer ";

    public static final String TOKEN_ISSUER = "codeblurb";
    public static final String CUSTOMER_ID_CLAIM = "customerId";
    public static final String ACCESS_TOKEN_SUBJECT = "accesstoken";
    private static final String REFRESH_TOKEN_SUBJECT = "refreshtoken";

    private final SecretService secretService;
    private final DenyTokenService denyTokenService;
    private final IssuedTokenService issuedTokenService;

    private static TokenIssuedMessage createTokenIssuedMessage(Customer customer, Token accessToken, Token refreshToken) {
        return TokenIssuedMessage.builder()
                .accessTokenJti(accessToken.jti())
                .accessTokenExpirationDate(accessToken.expirationDate().toInstant())
                .refreshTokenJti(refreshToken.jti())
                .refreshTokenExpirationDate(refreshToken.expirationDate().toInstant())
                .customerId(customer.getId())
                .build();
    }

    public TokenResult generateTokens(Customer customer) {
        final var accessToken = generateAccessToken(customer);
        final var refreshToken = generateRefreshToken(customer);

        issuedTokenService.tokenIssued(createTokenIssuedMessage(customer, accessToken, refreshToken));

        return TokenResult.builder()
                .accessToken(accessToken.jwt())
                .refreshToken(refreshToken.jwt())
                .build();
    }

    private Token generateAccessToken(Customer customer) {
        return generateToken(customer, ACCESS_TOKEN_SUBJECT, 2000000000);
    }

    private Token generateRefreshToken(Customer customer) {
        return generateToken(customer, REFRESH_TOKEN_SUBJECT, 2000000000);
    }

    private String randomJti() {
        return UUID.randomUUID().toString();
    }

    private Date getExpiration(int ttl) {
        return new Date(System.currentTimeMillis() + ttl);
    }

    //TODO: ttl
    private Token generateToken(Customer customer, String subject, int ttl) {
        final var jti = randomJti();
        final var expiration = getExpiration(ttl);
        final var jwt = Jwts.builder()
                .setId(jti)
                .setSubject(subject)
                .setAudience(customer.getUsername())
                .setIssuer(TOKEN_ISSUER)
                .claim(CUSTOMER_ID_CLAIM, customer.getId())
                .setExpiration(expiration)
                .signWith(SignatureAlgorithm.HS512, secretService.getSecret())
                .compact();
        return new Token(jti, expiration, jwt);
    }

    private Claims validateToken(String subject, String refreshToken) {
        try {
            return Jwts.parser()
                    .requireIssuer(TOKEN_ISSUER)
                    .requireSubject(subject)
                    .setSigningKey(secretService.getSecret())
                    .parseClaimsJws(refreshToken)
                    .getBody();
        } catch (JwtException | IllegalArgumentException e) {
            throw new InvalidTokenException();
        }
    }

    public ValidateRefreshTokenResult validateRefreshToken(String refreshToken) {
        if (denyTokenService.isDenied(refreshToken)) {
            throw new BadCredentialsException(""); //TODO
        }
        final var claims = validateToken(REFRESH_TOKEN_SUBJECT, refreshToken);
        return new ValidateRefreshTokenResult(claims.getAudience());
    }

    private record Token(String jti, Date expirationDate, String jwt) {
    }
}
