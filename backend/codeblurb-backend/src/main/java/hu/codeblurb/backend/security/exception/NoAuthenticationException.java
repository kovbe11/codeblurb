package hu.codeblurb.backend.security.exception;

public class NoAuthenticationException extends CodeBlurbSecurityException {
    public NoAuthenticationException() {
        super("No authentication was found!");
    }
}
