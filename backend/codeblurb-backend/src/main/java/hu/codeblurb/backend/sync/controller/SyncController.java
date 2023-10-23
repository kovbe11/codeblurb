package hu.codeblurb.backend.sync.controller;

import hu.codeblurb.backend.sync.service.SyncService;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@AllArgsConstructor
public class SyncController {
    private final SyncService syncService;

    @GetMapping("/sync")
    public void sync() {
        syncService.sync();
    }
}
