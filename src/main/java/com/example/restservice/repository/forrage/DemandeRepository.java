package com.example.restservice.repository.forrage;

import com.example.restservice.entity.forrage.Demande;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DemandeRepository extends JpaRepository<Demande, Integer> {
}