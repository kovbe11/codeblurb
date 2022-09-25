package hu.codeblurb.backend.security.exception;

import hu.codeblurb.backend.exception.CodeBlurbException;
import org.springframework.http.HttpStatus;

public class CodeBlurbSecurityException extends CodeBlurbException {

    public CodeBlurbSecurityException(String message) {
        super(message, HttpStatus.UNAUTHORIZED);
    }

}
