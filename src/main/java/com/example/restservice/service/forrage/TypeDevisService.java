package com.example.restservice.service.forrage;

import com.example.restservice.entity.forrage.TypeDevis;
import com.example.restservice.repository.forrage.TypeDevisRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TypeDevisService {

    @Autowired
    private TypeDevisRepository repository;

    public List<TypeDevis> getAllTypeDevis() {
        return repository.findAll();
    }
}