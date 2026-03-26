package com.example.restservice.repository.forrage;

import com.example.restservice.entity.forrage.DetailsDevis;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DetailsDevisRepository extends JpaRepository<DetailsDevis, Integer> {}