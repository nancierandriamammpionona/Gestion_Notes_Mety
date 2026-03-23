package com.example.restservice.service.forrage;

import com.example.restservice.entity.forrage.Demande;
import com.example.restservice.repository.forrage.DemandeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DemandeService {

    @Autowired
    private DemandeRepository demandeRepository;

    public List<Demande> getAllDemandes() {
        return demandeRepository.findAll();
    }

    public Demande getDemandeById(Integer id) {
        return demandeRepository.findById(id).orElse(null);
    }

    public void saveDemande(Demande demande) {
        demandeRepository.save(demande);
    }

    public void deleteDemande(Integer id) {
        demandeRepository.deleteById(id);
    }
}