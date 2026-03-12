package com.example.restservice.controller;

import com.example.restservice.entity.Candidat;
import com.example.restservice.entity.Matiere;
import com.example.restservice.repository.CandidatRepository;
import com.example.restservice.repository.MatiereRepository;
import com.example.restservice.service.NoteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class NoteController {

    @Autowired
    private NoteService noteService;

    @Autowired
    private MatiereRepository matiereRepository;

    @Autowired
    private CandidatRepository candidatRepository;

    @GetMapping("/resultats")
    public String afficherResultats(Model model) {

        List<Candidat> candidats = candidatRepository.findAll();
        List<Matiere> matieres = matiereRepository.findAll();

        List<Map<String, Object>> resultats = new ArrayList<>();

        for (Candidat c : candidats) {
            for (Matiere m : matieres) {
                Double noteFinale = noteService.calculNoteFinale(c.getId(), m.getId());

                Map<String, Object> r = new HashMap<>();
                r.put("nomCandidat", c.getNom() );
                r.put("nomMatiere", m.getMatiere()); // <-- ici, on utilise getMatiere()
                r.put("noteFinale", noteFinale);

                resultats.add(r);
            }
        }

        model.addAttribute("resultats", resultats);

        return "resultats"; // JSP
    }

    @GetMapping("/calculNoteFinale")
    public String afficherFormulaire(Model model) {
        model.addAttribute("matieres", matiereRepository.findAll());
        model.addAttribute("candidats", candidatRepository.findAll());
        return "noteFinaleParMatiere"; // JSP
    }

    @PostMapping("/calculNoteFinale")
    public String calculNoteFinale(@RequestParam int idCandidat,
                                   @RequestParam int idMatiere,
                                   Model model) {
        Double noteFinale = noteService.calculNoteFinale(idCandidat, idMatiere);
        model.addAttribute("noteFinale", noteFinale);

        model.addAttribute("matieres", matiereRepository.findAll());
        model.addAttribute("candidats", candidatRepository.findAll());

        return "noteFinaleParMatiere";
    }
}