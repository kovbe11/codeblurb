package hu.codeblurb.backend.exception;

import lombok.Getter;
import org.springframework.http.HttpStatus;

@Getter
public abstract class CodeBlurbException extends RuntimeException {

    private final HttpStatus status;

    public CodeBlurbException(String message, HttpStatus status) {
        super(message);
        this.status = status;
    }

}
