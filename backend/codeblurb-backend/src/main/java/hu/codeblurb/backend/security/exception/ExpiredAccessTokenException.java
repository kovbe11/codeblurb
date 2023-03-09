package hu.codeblurb.backend.security.exception;

public class ExpiredAccessTokenException extends CodeBlurbSecurityException {
    public ExpiredAccessTokenException() {
        super("Token is expired!");
    }
}
