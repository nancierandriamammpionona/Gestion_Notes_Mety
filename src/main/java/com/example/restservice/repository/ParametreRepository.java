package com.example.restservice.repository;

import com.example.restservice.entity.Parametre;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ParametreRepository extends JpaRepository<Parametre, Integer> {
    List<Parametre> findByIdMatiere(int idMatiere);
}