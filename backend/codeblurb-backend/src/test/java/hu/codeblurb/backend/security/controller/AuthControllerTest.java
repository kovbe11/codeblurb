package hu.codeblurb.backend.security.controller;

import hu.codeblurb.backend.ControllerTestBase;
import hu.codeblurb.backend.security.controller.dto.LoginRequest;
import hu.codeblurb.backend.security.controller.dto.LoginResponse;
import hu.codeblurb.backend.security.controller.dto.RefreshTokenRequest;
import hu.codeblurb.backend.security.controller.dto.RefreshTokenResponse;
import hu.codeblurb.backend.security.controller.dto.RegisterRequest;
import org.junit.jupiter.api.Test;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.test.context.jdbc.Sql;
import org.springframework.test.web.reactive.server.WebTestClient;

import java.time.Duration;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.springframework.http.MediaType.APPLICATION_JSON;

class AuthControllerTest extends ControllerTestBase {

    public static final String TEST_PASSWORD = "testPassword";
    public static final String TEST_USER = "testUser";
    private static final String baseUrl = "/auth";

    @Test
    @Sql({"/scripts/cleanDb.sql", "/scripts/addCustomer.sql"})
    void login() {
        assertDoesNotAuthenticate();

        final var loginResult = getLoginResponse();
        assertAuthenticatesProperly(loginResult.accessToken());
    }

    @Test
    @Sql({"/scripts/cleanDb.sql"})
    void register() {
        final var registerResult = testRestTemplate.postForEntity(baseUrl + "/register",
                RegisterRequest.builder().username(TEST_USER).password(TEST_PASSWORD).build(),
                Void.class);

        assertEquals(HttpStatus.OK, registerResult.getStatusCode());
        final var loginResult = getLoginResponse();
        assertAuthenticatesProperly(loginResult.accessToken());
    }

    @Test
    @Sql({"/scripts/cleanDb.sql", "/scripts/addCustomer.sql"})
    void refresh() {
        final var loginResult = getLoginResponse();
        assertAuthenticatesProperly(loginResult.accessToken());

        final var refreshResult = getRefreshTokenResponse(loginResult.refreshToken());
        assertEquals(HttpStatus.OK, refreshResult.getStatusCode());
        assertNotNull(refreshResult.getBody());
        assertAuthenticatesProperly(refreshResult.getBody().accessToken());
    }

    @Test
    @Sql({"/scripts/cleanDb.sql", "/scripts/addCustomer.sql"})
    void logout() {
        final var loginResult = getLoginResponse();
        assertAuthenticatesProperly(loginResult.accessToken());

        final var logoutResult = testRestTemplate.exchange(baseUrl + "/logout", HttpMethod.POST,
                new HttpEntity<>(createAuthHeader(loginResult.accessToken())), Void.class);
        assertEquals(HttpStatus.OK, logoutResult.getStatusCode());

        assertAuthenticates(HttpStatus.UNAUTHORIZED, loginResult.accessToken());
        assertRefreshTokenIsDenied(loginResult.refreshToken());
    }


    @Test
    @Sql({"/scripts/cleanDb.sql", "/scripts/addCustomer.sql"})
    void forceLogout() {
        final var loginResult = getLoginResponse();
        final var refreshResult = getRefreshTokenResponse(loginResult.refreshToken());
        assertNotNull(refreshResult.getBody());
        assertAuthenticatesProperly(loginResult.accessToken());
        assertAuthenticatesProperly(refreshResult.getBody().accessToken());

        final var forceLogoutResult = testRestTemplate.exchange(baseUrl + "/force-logout", HttpMethod.POST,
                new HttpEntity<>(createAuthHeader(loginResult.accessToken())), Void.class);
        assertEquals(HttpStatus.OK, forceLogoutResult.getStatusCode());

        assertAuthenticates(HttpStatus.UNAUTHORIZED, loginResult.accessToken());
        assertAuthenticates(HttpStatus.UNAUTHORIZED, refreshResult.getBody().accessToken());
        assertRefreshTokenIsDenied(loginResult.refreshToken());
        assertRefreshTokenIsDenied(refreshResult.getBody().refreshToken());
    }

    private void assertAuthenticatesProperly(String token) {
        assertAuthenticates(HttpStatus.OK, token);
    }

    private void assertDoesNotAuthenticate() {
        assertAuthenticates(HttpStatus.UNAUTHORIZED, null);
    }

    private void assertAuthenticates(HttpStatus httpStatus, String token) {
        final var headers = new HttpHeaders();
        if (token != null) {
            headers.add(HttpHeaders.AUTHORIZATION, "Bearer " + token);
        }
        final var helloResult = testRestTemplate.exchange("/hello", HttpMethod.GET, new HttpEntity<>(headers), String.class);
        assertEquals(httpStatus, helloResult.getStatusCode());
    }

    private LoginResponse getLoginResponse() {
        final var loginResult = testRestTemplate.postForEntity(baseUrl + "/login",
                LoginRequest.builder().username(TEST_USER).password(TEST_PASSWORD).build(), LoginResponse.class);
        assertEquals(HttpStatus.OK, loginResult.getStatusCode());
        assertNotNull(loginResult.getBody());
        return loginResult.getBody();
    }

    private ResponseEntity<RefreshTokenResponse> getRefreshTokenResponse(String refreshToken) {
        return testRestTemplate.postForEntity(baseUrl + "/refresh",
                RefreshTokenRequest.builder().refreshToken(refreshToken).build(),
                RefreshTokenResponse.class);
    }

    private void assertRefreshTokenIsDenied(String refreshToken) {
        //TODO: migrate to WebTestClient, so testresttemplate is not an issue anymore..
        final var webtestclient = WebTestClient
                .bindToServer()
                .baseUrl(testRestTemplate.getRootUri())
                .responseTimeout(Duration.ofMinutes(2))
                .codecs(configurer -> configurer
                        .defaultCodecs()
                        .maxInMemorySize(16 * 1024 * 1024)
                )
                .build();
        final var refreshTokenRequest = RefreshTokenRequest.builder().refreshToken(refreshToken).build();
        webtestclient.post()
                .uri(baseUrl + "/refresh")
                .contentType(APPLICATION_JSON)
                .bodyValue(refreshTokenRequest)
                .exchange()
                .expectStatus().isUnauthorized();
    }

    private HttpHeaders createAuthHeader(String token) {
        final var headers = new HttpHeaders();
        headers.add(HttpHeaders.AUTHORIZATION, "Bearer " + token);
        return headers;
    }
}