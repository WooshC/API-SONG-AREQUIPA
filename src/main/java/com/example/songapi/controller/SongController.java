package com.example.songapi.controller;

import com.example.songapi.model.Song;
import com.example.songapi.service.SongService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/songs")
public class SongController {
    private final SongService service;

    public SongController(SongService service) {
        this.service = service;
    }

    @GetMapping
    public List<Song> getAll() { return service.findAll(); }

    @GetMapping("/{id}")
    public ResponseEntity<Song> getById(@PathVariable Integer id) {
        return service.findById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @PostMapping
    public Song create(@RequestBody Song song) { return service.save(song); }

    @PutMapping("/{id}")
    public ResponseEntity<Song> update(@PathVariable Integer id, @RequestBody Song song) {
        return service.findById(id)
                .map(existing -> {
                    existing.setName(song.getName());
                    existing.setPath(song.getPath());
                    existing.setPlays(song.getPlays());
                    return ResponseEntity.ok(service.save(existing));
                })
                .orElse(ResponseEntity.notFound().build());
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> delete(@PathVariable Integer id) {
        if (service.findById(id).isPresent()) {
            service.deleteById(id);
            return ResponseEntity.noContent().build();
        }
        return ResponseEntity.notFound().build();
    }
} 