package hu.codeblurb.backend.controller;

import hu.codeblurb.backend.controller.dto.ErrorResponse;
import hu.codeblurb.backend.exception.CodeBlurbException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.context.request.WebRequest;

@ControllerAdvice
@Slf4j
public class CodeBlurbControllerAdvice {

    @ExceptionHandler(CodeBlurbException.class)
    public ResponseEntity<ErrorResponse> handleException(CodeBlurbException ex, WebRequest request) {
        return ResponseEntity.status(ex.getStatus()).body(new ErrorResponse(ex.getMessage()));
    }

    @ExceptionHandler(Exception.class)
    public ResponseEntity<ErrorResponse> handleException(Exception ex, WebRequest request) {
        log.error("Unknown error occurred for request: {}", request);
        log.error(ex.getMessage(), ex);
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(new ErrorResponse("Unknown error"));
    }

}
