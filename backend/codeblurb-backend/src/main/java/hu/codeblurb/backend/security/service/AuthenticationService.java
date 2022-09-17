package hu.codeblurb.backend.security.service;

import hu.codeblurb.backend.domain.Customer;
import hu.codeblurb.backend.repository.CustomerRepository;
import hu.codeblurb.backend.security.exception.CustomerNotFoundException;
import hu.codeblurb.backend.security.exception.WrongPasswordException;
import hu.codeblurb.backend.security.service.dto.LoginResult;
import hu.codeblurb.backend.security.service.dto.RefreshTokenResult;
import lombok.AllArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class AuthenticationService {

    private final TokenService tokenService;
    private final PasswordEncoder passwordEncoder;
    private final CustomerRepository customerRepository;

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

    private Customer findCustomerOrThrow(String username) {
        return customerRepository.findByUsername(username)
                .orElseThrow(() -> new CustomerNotFoundException("No customer registered with username: " + username));
    }

    public void register(String username, String password) {
        final var customer = Customer.builder()
                .username(username)
                .password(passwordEncoder.encode(password))
                .build();
        customerRepository.save(customer);
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
}
