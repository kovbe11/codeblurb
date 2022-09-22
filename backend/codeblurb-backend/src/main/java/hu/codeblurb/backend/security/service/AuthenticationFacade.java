package hu.codeblurb.backend.security.service;

import hu.codeblurb.backend.security.service.dto.AuthUserDetails;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

import java.util.Optional;

@Component
public class AuthenticationFacade {
    public Optional<AuthUserDetails> getCurrentUserFromContext() {
        return Optional.ofNullable(SecurityContextHolder.getContext().getAuthentication())
                .filter(it -> it instanceof UsernamePasswordAuthenticationToken)
                .map(it -> (AuthUserDetails) it.getPrincipal());
    }

    public Optional<Integer> getCurrentCustomerId() {
        return getCurrentUserFromContext()
                .map(AuthUserDetails::customerId);
    }
}
