package hu.codeblurb.backend.security.exception;

public class WrongPasswordException extends RuntimeException {
    public WrongPasswordException() {
        super("Wrong password!");
    }
}
