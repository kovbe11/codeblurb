package hu.codeblurb.backend.service.exception;

import hu.codeblurb.backend.exception.CodeBlurbException;
import org.springframework.http.HttpStatus;

public class EntityNotFoundException extends CodeBlurbException {
    public EntityNotFoundException(Class<?> clazz, Integer id) {
        super(clazz.getName() + " with id " + id + " was not found!", HttpStatus.INTERNAL_SERVER_ERROR);
    }
}
