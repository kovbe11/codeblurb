package hu.codeblurb.backend.exception;

import org.springframework.http.HttpStatus;

public class InconsistentDatabaseException extends CodeBlurbException {
    public InconsistentDatabaseException(String message) {
        super(message, HttpStatus.INTERNAL_SERVER_ERROR);
    }
}
