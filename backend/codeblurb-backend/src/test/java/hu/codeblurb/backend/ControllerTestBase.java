package hu.codeblurb.backend;


import hu.codeblurb.backend.security.service.SecretService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.boot.test.web.client.TestRestTemplate;
import org.springframework.http.HttpStatus;
import org.springframework.http.client.ClientHttpResponse;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.web.client.DefaultResponseErrorHandler;

import javax.annotation.PostConstruct;

import java.io.IOException;

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
