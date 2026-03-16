package com.example.restservice.repository;

import com.example.restservice.entity.Note;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface NoteRepository extends JpaRepository<Note, Integer> {
    List<Note> findByIdCandidatAndIdMatiere(int idCandidat, int idMatiere);
}