package hu.codeblurb.backend.security.exception;

import hu.codeblurb.backend.exception.CodeBlurbException;
import org.springframework.http.HttpStatus;

public class UsernameAlreadyExists extends CodeBlurbException {
    public UsernameAlreadyExists(String username) {
        super("A user with name: " + username + " already exists", HttpStatus.FORBIDDEN);
    }
}
