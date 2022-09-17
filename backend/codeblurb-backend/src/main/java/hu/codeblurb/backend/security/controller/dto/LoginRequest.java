package hu.codeblurb.backend.security.controller.dto;

import lombok.Builder;

@Builder
public record LoginRequest(String username, String password) {
}
