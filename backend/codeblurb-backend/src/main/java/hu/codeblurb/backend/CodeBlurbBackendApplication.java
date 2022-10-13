package hu.codeblurb.backend;

import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@Slf4j
public class CodeBlurbBackendApplication {

    public static void main(String[] args) {
        SpringApplication.run(CodeBlurbBackendApplication.class, args);
    }

}
