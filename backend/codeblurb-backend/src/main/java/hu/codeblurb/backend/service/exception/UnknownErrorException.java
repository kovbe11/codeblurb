package hu.codeblurb.backend.service.exception;

import hu.codeblurb.backend.exception.CodeBlurbException;
import org.springframework.http.HttpStatus;

public class UnknownErrorException extends CodeBlurbException {
    public UnknownErrorException() {
        super("Unknown error", HttpStatus.INTERNAL_SERVER_ERROR);
    }
}
