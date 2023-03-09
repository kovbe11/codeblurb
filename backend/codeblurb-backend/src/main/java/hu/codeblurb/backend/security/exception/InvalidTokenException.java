package hu.codeblurb.backend.security.exception;

public class InvalidTokenException extends CodeBlurbSecurityException {
    public InvalidTokenException() {
        super("Token is invalid!");
    }
}
