package com.example.restservice.repository.forrage;

import com.example.restservice.entity.forrage.Devis;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DevisRepository extends JpaRepository<Devis, Integer> {}