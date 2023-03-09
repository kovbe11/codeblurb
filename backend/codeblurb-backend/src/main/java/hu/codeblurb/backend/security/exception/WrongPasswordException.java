package hu.codeblurb.backend.security.exception;

public class WrongPasswordException extends CodeBlurbSecurityException {
    public WrongPasswordException() {
        super("Wrong password!");
    }
}
