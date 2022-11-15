package hu.codeblurb.backend.security.exception;

public class TokenDeniedException extends CodeBlurbSecurityException {
    public TokenDeniedException(String jti) {
        super("Token denied, jti: " + jti);
    }

    public TokenDeniedException(){
        super("Token denied");
    }
}
