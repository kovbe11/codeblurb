package hu.codeblurb.backend.security.service;

import hu.codeblurb.backend.security.domain.LoggedOutToken;
import hu.codeblurb.backend.security.repository.LoggedOutTokenRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.concurrent.ConcurrentMap;
import java.util.function.Function;
import java.util.stream.Collectors;

@Service
@AllArgsConstructor
public class DeniedTokenCacheRestoreService {

    private final LoggedOutTokenRepository loggedOutTokenRepository;

    public ConcurrentMap<String, LoggedOutToken> restoreCache() {
        return loggedOutTokenRepository.findAll().stream().collect(Collectors.toConcurrentMap(LoggedOutToken::getJti, Function.identity()));
    }
}
