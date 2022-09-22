package hu.codeblurb.backend.security.exception;

import hu.codeblurb.backend.exception.CodeBlurbException;

public class InconsistentDatabaseException extends CodeBlurbException {
    public InconsistentDatabaseException(String message) {
        super(message);
    }
}
