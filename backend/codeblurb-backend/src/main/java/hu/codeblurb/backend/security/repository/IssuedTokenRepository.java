package hu.codeblurb.backend.security.repository;

import hu.codeblurb.backend.security.domain.IssuedToken;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.repository.CrudRepository;

import java.time.Instant;
import java.util.Optional;
import java.util.Set;

public interface IssuedTokenRepository extends CrudRepository<IssuedToken, String> {

    Optional<IssuedToken> findByAccessTokenJti(String accessJti);

    Set<IssuedToken> findByCustomerId(int id);

    @Modifying
    void deleteByExpirationDateBefore(Instant instant);
}
