package com.example.restservice.controller.forrage;

import com.example.restservice.entity.forrage.Demande;
import com.example.restservice.entity.forrage.ClientForrage;
import com.example.restservice.service.forrage.DemandeService;
import com.example.restservice.service.forrage.ClientForrageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class DemandeController {

    @Autowired
    private DemandeService demandeService;

    @Autowired
    private ClientForrageService clientService;

    @GetMapping("/demande")
    public String listeDemande(Model model) {
        List<Demande> liste = demandeService.getAllDemandes();
        model.addAttribute("demandes", liste);
        return "demande";
    }

    @GetMapping("/demande/add")
    public String showAddForm(Model model) {
        model.addAttribute("demande", new Demande());
        model.addAttribute("clients", clientService.getAllClient());
        return "addDemande";
    }

    @PostMapping("/demande/save")
    public String saveDemande(@ModelAttribute Demande demande) {
        demandeService.saveDemande(demande);
        return "redirect:/demande";
    }

    @GetMapping("/demande/edit/{id}")
    public String editDemande(@PathVariable Integer id, Model model) {
        Demande demande = demandeService.getDemandeById(id);
        model.addAttribute("demande", demande);
        model.addAttribute("clients", clientService.getAllClient());
        return "editDemande";
    }

    @PostMapping("/demande/update")
    public String updateDemande(@ModelAttribute Demande demande) {
        demandeService.saveDemande(demande);
        return "redirect:/demande";
    }

    @GetMapping("/demande/delete/{id}")
    public String deleteDemande(@PathVariable Integer id) {
        demandeService.deleteDemande(id);
        return "redirect:/demande";
    }
}