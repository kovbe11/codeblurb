package hu.codeblurb.backend;

import hu.codeblurb.backend.security.service.SecretService;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;

import javax.annotation.PostConstruct;

import static hu.codeblurb.backend.security.JwtTestUtil.SECRET;
import static org.mockito.Mockito.when;

@SpringBootTest
class CodeBlurbBackendApplicationTests {

    @MockBean
    private SecretService secretService;

    @PostConstruct
    public void init() {
        when(secretService.getSecret()).thenReturn(SECRET);
    }

    @Test
    void contextLoads() {
    }

}
