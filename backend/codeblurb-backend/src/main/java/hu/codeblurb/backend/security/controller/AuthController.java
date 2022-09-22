package hu.codeblurb.backend.security.controller;

import hu.codeblurb.backend.security.controller.dto.LoginRequest;
import hu.codeblurb.backend.security.controller.dto.LoginResponse;
import hu.codeblurb.backend.security.controller.dto.RefreshTokenRequest;
import hu.codeblurb.backend.security.controller.dto.RefreshTokenResponse;
import hu.codeblurb.backend.security.controller.dto.RegisterRequest;
import hu.codeblurb.backend.security.service.AuthenticationService;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/auth")
@AllArgsConstructor
public class AuthController {

    private final AuthenticationService authenticationService;

    @PostMapping("/login")
    public LoginResponse login(@RequestBody LoginRequest loginRequest) {
        final var tokens = authenticationService.login(loginRequest.username(), loginRequest.password());
        return LoginResponse.builder()
                .accessToken(tokens.accessToken())
                .refreshToken(tokens.refreshToken())
                .build();
    }

    @PostMapping("/register")
    public void register(@RequestBody RegisterRequest registerRequest) {
        authenticationService.register(registerRequest.username(), registerRequest.password());
    }

    @PostMapping("/refresh")
    public RefreshTokenResponse refresh(@RequestBody RefreshTokenRequest refreshTokenRequest) {
        final var tokens = authenticationService.refresh(refreshTokenRequest.refreshToken());
        return RefreshTokenResponse.builder()
                .accessToken(tokens.accessToken())
                .refreshToken(tokens.refreshToken())
                .build();
    }

    @PostMapping("/logout")
    public void logout() {
        authenticationService.logout();
    }

    @PostMapping("/force-logout")
    public void forceLogout() {
        authenticationService.forceLogout();
    }

}
