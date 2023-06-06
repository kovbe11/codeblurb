package hu.codeblurb.backend;

import com.spotify.docker.client.DefaultDockerClient;
import com.spotify.docker.client.DockerClient;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

import java.io.File;
import java.io.InputStream;
import java.net.URI;
import java.nio.file.Path;

@SpringBootApplication
@Slf4j
public class CodeBlurbBackendApplication {

    @Bean
    @SneakyThrows
    public DockerClient dockerClient() {
        return DefaultDockerClient.fromEnv().build();
    }

    @Bean
    public Path templatePath(){
        return Path.of("/java-docker-template.dockerfile");
    }

    public static void main(String[] args) {
        SpringApplication.run(CodeBlurbBackendApplication.class, args);
    }

}
