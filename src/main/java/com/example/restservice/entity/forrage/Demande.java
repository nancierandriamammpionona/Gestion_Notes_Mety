package com.example.restservice.entity.forrage;

import jakarta.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name = "demande")
public class Demande {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_demande")
    private Integer id;

    @Column(name = "date")
    private LocalDate date;

    // Relation ManyToOne vers ClientForrage
    @ManyToOne(fetch = FetchType.EAGER) // charger le client avec la demande
    @JoinColumn(name = "id_client", nullable = false)
    private ClientForrage client;

    @Column(name = "lieu", nullable = false)
    private String lieu;

    @Column(name = "district", nullable = false)
    private String district;

    // Constructeur vide obligatoire pour JPA
    public Demande() {}

    // --- Getters et Setters ---
    public Integer getId() { return id; }
    public void setId(Integer id) { this.id = id; }

    public LocalDate getDate() { return date; }
    public void setDate(LocalDate date) { this.date = date; }

    public ClientForrage getClient() { return client; }
    public void setClient(ClientForrage client) { this.client = client; }

    public String getLieu() { return lieu; }
    public void setLieu(String lieu) { this.lieu = lieu; }

    public String getDistrict() { return district; }
    public void setDistrict(String district) { this.district = district; }

    // Optionnel : méthode utilitaire pour afficher la demande complète
    @Transient
    public String getDescription() {
        if (client != null) {
            return String.format("%s - %s (%s) | Client: %s - %s",
                    lieu, district, date, client.getNom(), client.getContact());
        } else {
            return String.format("%s - %s (%s)", lieu, district, date);
        }
    }
}