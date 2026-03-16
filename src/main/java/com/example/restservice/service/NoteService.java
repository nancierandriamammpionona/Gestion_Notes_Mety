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

        //  recuperer les notes
        List<Note> notesEntity = noteRepository.findByIdCandidatAndIdMatiere(idCandidat, idMatiere);
        if (notesEntity.isEmpty()) return 0.0;

        List<Double> notes = notesEntity.stream()
                .map(n -> n.getNote().doubleValue())
                .toList();

        //  calcul somme des differences
        double sommeDifferences = 0;
        for (int i = 0; i < notes.size(); i++) {
            for (int j = i + 1; j < notes.size(); j++) {
                sommeDifferences += Math.abs(notes.get(i) - notes.get(j));
            }
        }

        //  recuperer les parametres
        List<Parametre> params = parametreRepository.findByIdMatiere(idMatiere);
        if (params.isEmpty())
            throw new RuntimeException("Parametre non defini pour la matiere id=" + idMatiere);

        Parametre paramChoisi = null;

        //  Condition 1 : correspondance exacte avec operateur
        for (Parametre p : params) {
            boolean condition = switch (p.getOperateur().getSymbole()) {
                case ">" -> sommeDifferences > p.getDiff();
                case ">=" -> sommeDifferences >= p.getDiff();
                case "<" -> sommeDifferences < p.getDiff();
                case "<=" -> sommeDifferences <= p.getDiff();
                default -> false;
            };
            if (condition) {
                paramChoisi = p;
                break;
            }
        }

        // si la 1er condition est fausse on continue 
        if (paramChoisi == null) {
            if (sommeDifferences % 1 == 0) {
                // Condition 2 : somme diff : prendre diff le plus proche
                double minDistance = Double.MAX_VALUE;
                for (Parametre p : params) {
                    double distance = Math.abs(sommeDifferences - p.getDiff());
                    if (distance < minDistance) {
                        minDistance = distance;
                        paramChoisi = p;
                    }
                }
            } else {
                // Condition 3 : somme diff : prendre diff inferieur 
                double diffMax = -1;
                for (Parametre p : params) {
                    if (p.getDiff() <= sommeDifferences && p.getDiff() > diffMax) {
                        diffMax = p.getDiff();
                        paramChoisi = p;
                    }
                }
                // rehefa tsisy izy de tode ze min no raisina
                if (paramChoisi == null) {
                    paramChoisi = params.stream()
                            .min((a, b) -> Double.compare(a.getDiff(), b.getDiff()))
                            .orElse(null);
                }
            }
        }

        Double noteFinale;
        switch (paramChoisi.getResolution().getNom().toLowerCase()) {
            case "plus petit":
            case "petit":
                noteFinale = notes.stream().min(Double::compare).orElse(0.0);
                break;
            case "plus grand":
            case "grand":
                noteFinale = notes.stream().max(Double::compare).orElse(0.0);
                break;
            case "moyenne":
                noteFinale = notes.stream().mapToDouble(Double::doubleValue).average().orElse(0.0);
                break;
            default:
                throw new RuntimeException("Resolution inconnue : " + paramChoisi.getResolution().getNom());
        }

        BigDecimal bd = new BigDecimal(noteFinale);
        bd = bd.setScale(2, RoundingMode.HALF_UP);
        return bd.doubleValue();
    }
}