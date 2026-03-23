package com.example.restservice.repository.forrage;

import com.example.restservice.entity.forrage.ClientForrage;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

public interface ClientForrageRepository extends JpaRepository<ClientForrage, Integer> {
}