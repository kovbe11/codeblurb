package hu.codeblurb.backend.security.service;

import hu.codeblurb.backend.domain.Customer;
import hu.codeblurb.backend.security.exception.InvalidTokenException;
import hu.codeblurb.backend.security.service.dto.TokenResult;
import hu.codeblurb.backend.security.service.dto.ValidateRefreshTokenResult;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.JwtException;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import lombok.AllArgsConstructor;
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


    public TokenResult generateTokens(Customer customer) {
        return TokenResult.builder()
                .accessToken(generateAccessToken(customer))
                .refreshToken(generateRefreshToken(customer))
                .build();
    }

    private String generateAccessToken(Customer customer) {
        return generateToken(customer, ACCESS_TOKEN_SUBJECT, 2000000000);
    }

    private String generateRefreshToken(Customer customer) {
        return generateToken(customer, REFRESH_TOKEN_SUBJECT, 2000000000);
    }

    //TODO: ttl
    private String generateToken(Customer customer, String subject, int ttl) {
        return Jwts.builder()
                .setId(randomJti())
                .setSubject(subject)
                .setAudience(customer.getUsername())
                .setIssuer(TOKEN_ISSUER)
                .claim(CUSTOMER_ID_CLAIM, customer.getId())
                .setExpiration(getExpiration(ttl))
                .signWith(SignatureAlgorithm.HS512, secretService.getSecret())
                .compact();
    }

    private String randomJti() {
        return UUID.randomUUID().toString();
    }

    private Date getExpiration(int ttl) {
        return new Date(System.currentTimeMillis() + ttl);
    }

    public ValidateRefreshTokenResult validateRefreshToken(String refreshToken) {
        final var claims = validateToken(REFRESH_TOKEN_SUBJECT, refreshToken);
        return new ValidateRefreshTokenResult(claims.getAudience());
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
}
