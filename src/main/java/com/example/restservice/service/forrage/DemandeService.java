package com.example.restservice.service.forrage;

import com.example.restservice.entity.forrage.Demande;
import com.example.restservice.entity.forrage.Status;
import com.example.restservice.entity.forrage.DemandeStatus;
import com.example.restservice.repository.forrage.DemandeRepository;
import com.example.restservice.repository.forrage.StatusRepository;
import com.example.restservice.repository.forrage.DemandeStatusRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DemandeService {

    @Autowired
    private DemandeRepository demandeRepository;

    @Autowired
    private DemandeStatusRepository demandeStatusRepository;

    @Autowired
    private StatusRepository statusRepository;

    public List<Demande> getAllDemandes() {
        return demandeRepository.findAll();
    }

    public Demande getDemandeById(Integer id) {
        return demandeRepository.findById(id).orElse(null);
    }

    public void saveDemande(Demande demande) {

        Demande nouvelleDemande = demandeRepository.save(demande);

        Status statusCree = statusRepository.findById(1).orElse(null);

        DemandeStatus ds = new DemandeStatus();
        ds.setDemande(nouvelleDemande);
        ds.setStatus(statusCree);
        ds.setDate(new java.sql.Timestamp(System.currentTimeMillis()));

        demandeStatusRepository.save(ds);
    }

    public void deleteDemande(Integer id) {
        demandeRepository.deleteById(id);
    }
}