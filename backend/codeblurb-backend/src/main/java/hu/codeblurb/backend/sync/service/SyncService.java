package hu.codeblurb.backend.sync.service;

import hu.codeblurb.backend.repository.ContentBundleRepository;
import hu.codeblurb.backend.sync.domain.SyncData;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

@Service
@Slf4j
public class SyncService {

    private final ContentBundleRepository contentBundleRepository;
    private final RestTemplate restTemplate;
    private final String apiUrl;

    public SyncService(ContentBundleRepository contentBundleRepository, RestTemplate restTemplate,
                       @Value("${codeblurb.sync-url}") String apiUrl) {
        this.contentBundleRepository = contentBundleRepository;
        this.restTemplate = restTemplate;
        this.apiUrl = apiUrl;
    }

    public void sync() {
        SyncData syncData = restTemplate.getForObject(apiUrl, SyncData.class);
        if (syncData != null) {
            final var bundles = syncData.getBundles();
            contentBundleRepository.saveAll(bundles);
        } else {
            log.error("Syncing returned as null");
        }
    }

}
