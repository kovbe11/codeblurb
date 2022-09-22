package hu.codeblurb.backend.security;

import hu.codeblurb.backend.domain.Customer;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

import java.time.Instant;
import java.util.Date;
import java.util.UUID;

import static hu.codeblurb.backend.security.service.TokenService.ACCESS_TOKEN_SUBJECT;
import static hu.codeblurb.backend.security.service.TokenService.CUSTOMER_ID_CLAIM;
import static hu.codeblurb.backend.security.service.TokenService.REFRESH_TOKEN_SUBJECT;
import static hu.codeblurb.backend.security.service.TokenService.TOKEN_ISSUER;


public class JwtTestUtil {

    public static final String SECRET = "CodeBlurbSecretKey1234";


    public Token createAccessTokenFor(Customer customer) {
        return createTokenFor(customer, ACCESS_TOKEN_SUBJECT);
    }

    public Token createRefreshTokenFor(Customer customer) {
        return createTokenFor(customer, REFRESH_TOKEN_SUBJECT);
    }

    private Token createTokenFor(Customer customer, String subject) {
        final var jti = UUID.randomUUID().toString();
        final var expiration = Date.from(Instant.now().plusSeconds(1000));
        final var jwt = Jwts.builder()
                .setId(jti)
                .setSubject(subject)
                .setAudience(customer.getUsername())
                .setIssuer(TOKEN_ISSUER)
                .claim(CUSTOMER_ID_CLAIM, customer.getId())
                .setExpiration(expiration)
                .signWith(SignatureAlgorithm.HS512, SECRET)
                .compact();
        return new Token(jti, jwt);
    }

    record Token(String jti, String jwt) {
    }
}
