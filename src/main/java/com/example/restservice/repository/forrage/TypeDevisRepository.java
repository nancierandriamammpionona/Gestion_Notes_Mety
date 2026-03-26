package com.example.restservice.repository.forrage;

import com.example.restservice.entity.forrage.TypeDevis;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TypeDevisRepository extends JpaRepository<TypeDevis, Integer> {}