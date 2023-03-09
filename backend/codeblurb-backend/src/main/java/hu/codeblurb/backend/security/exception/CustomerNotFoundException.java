package hu.codeblurb.backend.security.exception;

public class CustomerNotFoundException extends CodeBlurbSecurityException {
    public CustomerNotFoundException(String message) {
        super(message);
    }
}
