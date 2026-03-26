package com.example.restservice.controller;

import com.example.restservice.entity.Candidat;
import com.example.restservice.service.CandidatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ModelAttribute;

import java.util.List;

@Controller
public class CandidatController {

    @Autowired
    private CandidatService candidatService;

    @GetMapping("/candidats")
    public String listeCandidats(Model model) {

        List<Candidat> liste = candidatService.getAllCandidats();

        model.addAttribute("candidats", liste);

        return "candidats";
    }

    @GetMapping("/candidat/edit/{id}")
    public String editCandidat(@PathVariable("id") Integer id, Model model){

        Candidat candidat = candidatService.getCandidatById(id);

        model.addAttribute("candidat", candidat);

        return "editCandidat";
    }

    @PostMapping("/candidat/update")
    public String updateCandidat(@ModelAttribute Candidat candidat){

        candidatService.saveCandidat(candidat);
     
        return "redirect:/candidats";
    }

    @GetMapping("/candidat/delete/{id}")
    public String deleteCandidat(@PathVariable("id") Integer id){

        candidatService.deleteCandidat(id);

        return "redirect:/candidats";
    }

    @GetMapping("/candidat/add")
    public String showAddForm(Model model){

        model.addAttribute("candidat", new Candidat());

        return "addCandidat";
    }

    @PostMapping("/candidat/save")
    public String saveCandidat(@ModelAttribute Candidat candidat){

        candidatService.saveCandidat(candidat);

        return "redirect:/candidats";
    }
}