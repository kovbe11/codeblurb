package hu.codeblurb.backend.security.controller.dto;

import lombok.Builder;

@Builder
public record RegisterRequest(String username, String password) {
}
