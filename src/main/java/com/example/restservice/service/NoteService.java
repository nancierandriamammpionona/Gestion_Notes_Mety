package com.example.restservice.service;

import com.example.restservice.entity.Note;
import com.example.restservice.entity.Parametre;
import com.example.restservice.repository.NoteRepository;
import com.example.restservice.repository.ParametreRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.List;

@Service
public class NoteService {

    @Autowired
    private NoteRepository noteRepository;

    @Autowired
    private ParametreRepository parametreRepository;

    public Double calculNoteFinale(int idCandidat, int idMatiere) {

        // 1️⃣ récupérer les notes
        List<Note> notesEntity = noteRepository.findByIdCandidatAndIdMatiere(idCandidat, idMatiere);

        if (notesEntity.isEmpty()) {
            return 0.0;
        }

        List<Double> notes = notesEntity.stream()
                .map(n -> n.getNote().doubleValue())
                .toList();

        // 2️⃣ calcul somme des différences
        double sommeDifferences = 0;
        for (int i = 0; i < notes.size(); i++) {
            for (int j = i + 1; j < notes.size(); j++) {
                sommeDifferences += Math.abs(notes.get(i) - notes.get(j));
            }
        }

        // 3️⃣ récupérer les paramètres
        List<Parametre> params = parametreRepository.findByIdMatiere(idMatiere);
        if (params.isEmpty()) {
            throw new RuntimeException("Paramètre non défini pour la matière id=" + idMatiere);
        }

        Double noteFinale = null;

        // 4️⃣ tester chaque paramètre
        for (Parametre param : params) {

            boolean condition = switch (param.getOperateur().getSymbole()) {
                case ">" -> sommeDifferences > param.getDiff();
                case "<" -> sommeDifferences < param.getDiff();
                case ">=" -> sommeDifferences >= param.getDiff();
                case "<=" -> sommeDifferences <= param.getDiff();
                default -> throw new RuntimeException("Opérateur inconnu : " + param.getOperateur().getSymbole());
            };

            if (condition) {
                noteFinale = switch (param.getResolution().getNom().toLowerCase()) {
                    case "plus petit", "petit" -> notes.stream().min(Double::compare).orElse(0.0);
                    case "plus grand", "grand" -> notes.stream().max(Double::compare).orElse(0.0);
                    case "moyenne" -> notes.stream().mapToDouble(Double::doubleValue).average().orElse(0.0);
                    default -> throw new RuntimeException("Résolution inconnue : " + param.getResolution().getNom());
                };
                break; // ⚡ dès qu’un paramètre correspond, on sort
            }
        }

        // 5️⃣ si aucun paramètre ne correspond → moyenne
        if (noteFinale == null) {
            noteFinale = notes.stream().mapToDouble(Double::doubleValue).average().orElse(0.0);
        }

        // 6️⃣ arrondi à 2 décimales
        BigDecimal bd = new BigDecimal(noteFinale);
        bd = bd.setScale(2, RoundingMode.HALF_UP);
        return bd.doubleValue();
    }
}