package hu.codeblurb.backend.service;

import com.spotify.docker.client.*;
import com.spotify.docker.client.exceptions.DockerException;
import com.spotify.docker.client.messages.*;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.TimeUnit;

@Service
@AllArgsConstructor
public class DockerService {

    private final DockerClient dockerClient;

    public String createImage(File dockerFile, String imageName) throws DockerException, InterruptedException, IOException {
        Path dockerFilePath = Paths.get(dockerFile.getAbsolutePath());
        return dockerClient.build(dockerFilePath.getParent(), imageName);
    }

    public String runContainer(String imageName) throws DockerException, InterruptedException {
        final ContainerConfig containerConfig = ContainerConfig.builder()
                .image(imageName)
                .build();

        final ContainerCreation containerCreation = dockerClient.createContainer(containerConfig);
        final String containerId = containerCreation.id();

        dockerClient.startContainer(containerId);

        CompletableFuture<Long> exitFuture = CompletableFuture.supplyAsync(() -> {
            try {
                dockerClient.waitContainer(containerId);
                return dockerClient.inspectContainer(containerId).state().exitCode();
            } catch (Exception e) {
                throw new RuntimeException("Failed to get container exit code", e);
            }
        });

        try {
            exitFuture.get(5, TimeUnit.SECONDS);
        } catch (Exception e) {
            exitFuture.cancel(true);
            throw new RuntimeException("Container did not finish within the specified timeout", e);
        }

        return containerId;
    }

    public String getOutputFromContainer(String containerId) throws DockerException, InterruptedException {
        final LogStream logStream = dockerClient.logs(containerId, DockerClient.LogsParam.stdout(), DockerClient.LogsParam.stderr());
        return logStream.readFully();
    }

    public void deleteImage(String imageName) throws DockerException, InterruptedException {
        dockerClient.removeImage(imageName, true, false);
    }

    public void deleteContainer(String containerId) throws DockerException, InterruptedException {
        dockerClient.removeContainer(containerId);
    }
}
