package hu.codeblurb.backend.service;

import com.spotify.docker.client.exceptions.DockerException;
import hu.codeblurb.backend.domain.content.CodingContent;
import hu.codeblurb.backend.service.exception.UnknownErrorException;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;

@Service
@AllArgsConstructor
@Slf4j
public class CodeRunnerService {

    private final DockerService dockerService;

    private final Path template;

    private final RandomNameGenerator randomNameGenerator;

    private static final String folderPrefix = "/coderuns/";
    private static final String javaFileName = "Coderunner.java";

    public void runAndCheckOutputFor(CodingContent content, String code) {
        final var runId = randomNameGenerator.generateCodeRunId();
        String imageId;
        String output;
        try {
            final var created = Files.createDirectory(Path.of(folderPrefix, runId));
            final var dockerFile = Files.copy(template, created, StandardCopyOption.REPLACE_EXISTING);
            final var javaFile = Files.createFile(created.resolve(javaFileName));
            Files.writeString(javaFile, code);
            imageId = dockerService.createImage(dockerFile.toFile(), runId);
        } catch (Exception e) {
            // log
            throw new UnknownErrorException();
        }
        if(imageId == null) throw new UnknownErrorException();

        try {
            final var containerId = dockerService.runContainer(imageId);
            output = dockerService.getOutputFromContainer(containerId);
        } catch (DockerException | InterruptedException e){
            throw new UnknownErrorException();
        }

        if (output == null) throw new UnknownErrorException();

        log.info(output);
    }
}
