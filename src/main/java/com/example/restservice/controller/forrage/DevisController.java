package com.example.restservice.controller.forrage;

import com.example.restservice.entity.forrage.Devis;
import com.example.restservice.entity.forrage.Demande;
import com.example.restservice.entity.forrage.TypeDevis;
import com.example.restservice.service.forrage.DevisService;
import com.example.restservice.service.forrage.DemandeService;
import com.example.restservice.service.forrage.TypeDevisService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.sql.Date;
import java.util.List;

@Controller
public class DevisController {

    @Autowired
    private DevisService devisService;

    @Autowired
    private DemandeService demandeService;

    @Autowired
    private TypeDevisService typeDevisService;

    @GetMapping("/devis/add")
    public String showAddDevisForm(Model model) {
        List<Demande> demandes = demandeService.getAllDemandes();
        List<TypeDevis> types = typeDevisService.getAllTypeDevis();

        Devis devis = new Devis();
        devis.setDate(Date.valueOf(LocalDate.now())); 

        model.addAttribute("demandes", demandes);
        model.addAttribute("types", types);
        model.addAttribute("devis", devis);

        return "addDevis";
    }

    @PostMapping("/devis/save")
    public String saveDevis(@ModelAttribute Devis devis) {
        if (devis.getDate() == null) {
            devis.setDate(Date.valueOf(LocalDate.now()));
        }

        devisService.saveDevis(devis);
        return "redirect:/devis/list";
    }

    @GetMapping("/devis/list")
    public String listDevis(Model model) {
        model.addAttribute("devisList", devisService.getAllDevis());
        return "listDevis";
    }
}