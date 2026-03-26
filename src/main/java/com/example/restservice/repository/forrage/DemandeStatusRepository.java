package com.example.restservice.repository.forrage;

import com.example.restservice.entity.forrage.DemandeStatus;
import org.springframework.data.jpa.repository.JpaRepository;

public interface DemandeStatusRepository extends JpaRepository<DemandeStatus, Integer> {
}