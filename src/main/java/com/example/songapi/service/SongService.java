package com.example.songapi.service;

import com.example.songapi.model.Song;
import com.example.songapi.repository.SongRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class SongService {
    private final SongRepository repository;

    public SongService(SongRepository repository) {
        this.repository = repository;
    }

    public List<Song> findAll() { return repository.findAll(); }
    public Optional<Song> findById(Integer id) { return repository.findById(id); }
    public Song save(Song song) { return repository.save(song); }
    public void deleteById(Integer id) { repository.deleteById(id); }
} 