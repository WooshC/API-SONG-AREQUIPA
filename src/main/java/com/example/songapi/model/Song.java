package com.example.songapi.model;

import jakarta.persistence.*;

@Entity
@Table(name = "TBL_SONG")
public class Song {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID_SONG")
    private Integer id;

    @Column(name = "SONG_NAME", nullable = false)
    private String name;

    @Column(name = "SONG_PATH", nullable = false)
    private String path;

    @Column(name = "PLAYS")
    private Integer plays;

    public Integer getId() { return id; }
    public void setId(Integer id) { this.id = id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getPath() { return path; }
    public void setPath(String path) { this.path = path; }
    public Integer getPlays() { return plays; }
    public void setPlays(Integer plays) { this.plays = plays; }
} 