package hu.codeblurb.backend.security.service;

import hu.codeblurb.backend.domain.Customer;
import hu.codeblurb.backend.security.exception.CustomerNotFoundException;
import hu.codeblurb.backend.security.exception.UsernameAlreadyExists;
import hu.codeblurb.backend.security.exception.WrongPasswordException;
import hu.codeblurb.backend.security.service.dto.LoginResult;
import hu.codeblurb.backend.security.service.dto.RefreshTokenResult;
import hu.codeblurb.backend.service.CustomerService;
import lombok.AllArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Set;

@Service
@AllArgsConstructor
public class AuthenticationService {

    private final TokenService tokenService;
    private final PasswordEncoder passwordEncoder;
    private final AuthenticationFacade authenticationFacade;
    private final IssuedTokenService issuedTokenService;
    private final DenyTokenService denyTokenService;
    private final CustomerService customerService;


    public LoginResult login(String username, String password) {
        final var customer = findCustomerOrThrow(username);

        if (passwordEncoder.matches(password, customer.getPassword())) {
            final var tokens = tokenService.generateTokens(customer);
            return LoginResult.builder()
                    .accessToken(tokens.accessToken())
                    .refreshToken(tokens.refreshToken())
                    .build();
        } else {
            throw new WrongPasswordException();
        }
    }

    public void register(String username, String password) {
        if (customerService.findCustomerByUsername(username).isPresent()) {
            throw new UsernameAlreadyExists(username);
        }
        customerService.createCustomer(username, passwordEncoder.encode(password));
    }

    public RefreshTokenResult refresh(String refreshToken) {
        final var validateRefreshTokenResult = tokenService.validateRefreshToken(refreshToken);
        final var customer = findCustomerOrThrow(validateRefreshTokenResult.username());
        final var tokens = tokenService.generateTokens(customer);
        return RefreshTokenResult.builder()
                .accessToken(tokens.accessToken())
                .refreshToken(tokens.refreshToken())
                .build();
    }

    public void forceLogout() {
        authenticationFacade.getCurrentCustomerId()
                .map(issuedTokenService::getIssuedTokensForCustomer)
                .stream()
                .flatMap(Set::stream)
                .forEach(denyTokenService::denyToken);
    }

    public void logout() {
        authenticationFacade.getCurrentUserFromContext()
                .map(it -> issuedTokenService.findTokenById(it.jti()))
                .ifPresent(token -> {
                    denyTokenService.denyToken(token);
                    denyTokenService.denyToken(issuedTokenService.findRefreshTokenForAccessToken(token.getJti()));
                });
    }

    private Customer findCustomerOrThrow(String username) {
        return customerService.findCustomerByUsername(username)
                .orElseThrow(() -> new CustomerNotFoundException("No customer registered with username: " + username));
    }
}
