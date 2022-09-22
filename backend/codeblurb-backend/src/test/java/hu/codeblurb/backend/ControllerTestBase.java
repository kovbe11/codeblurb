package hu.codeblurb.backend;


import hu.codeblurb.backend.security.service.SecretService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.boot.test.web.client.TestRestTemplate;

import javax.annotation.PostConstruct;

import static hu.codeblurb.backend.security.JwtTestUtil.SECRET;
import static org.mockito.Mockito.when;

@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
public class ControllerTestBase {

    @Autowired
    protected TestRestTemplate testRestTemplate;

    @MockBean
    private SecretService secretService;

    @PostConstruct
    public void init() {
        when(secretService.getSecret()).thenReturn(SECRET);
    }

}
