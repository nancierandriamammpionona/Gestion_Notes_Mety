package com.example.restservice.service.forrage;

import com.example.restservice.entity.forrage.Devis;
import com.example.restservice.entity.forrage.DetailsDevis;
import com.example.restservice.repository.forrage.DevisRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class DevisService {

    @Autowired
    private DevisRepository devisRepository;

    @Transactional
    public Devis saveDevis(Devis devis) {
        if (devis.getDetails() != null) {
            for (DetailsDevis d : devis.getDetails()) {
                d.setDevis(devis);
                d.setMontant(d.getPrixUnitaire().multiply(new java.math.BigDecimal(d.getQuantite())));
            }
        }
        return devisRepository.save(devis);
    }

    public List<Devis> getAllDevis() {
        return devisRepository.findAll();
    }
}