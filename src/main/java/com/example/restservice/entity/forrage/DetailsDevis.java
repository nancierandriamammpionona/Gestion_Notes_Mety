package com.example.restservice.entity.forrage;

import jakarta.persistence.*;
import java.math.BigDecimal;

@Entity
@Table(name = "details_devis")
public class DetailsDevis {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_details")
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "id_devis")
    private Devis devis;

    private String libelle;

    @Column(name = "prix_unitaire")
    private BigDecimal prixUnitaire;

    private Integer quantite;

    private BigDecimal montant;

    public DetailsDevis() {}

    public Integer getId() { return id; }
    public void setId(Integer id) { this.id = id; }

    public Devis getDevis() { return devis; }
    public void setDevis(Devis devis) { this.devis = devis; }

    public String getLibelle() { return libelle; }
    public void setLibelle(String libelle) { this.libelle = libelle; }

    public BigDecimal getPrixUnitaire() { return prixUnitaire; }
    public void setPrixUnitaire(BigDecimal prixUnitaire) { this.prixUnitaire = prixUnitaire; }

    public Integer getQuantite() { return quantite; }
    public void setQuantite(Integer quantite) { this.quantite = quantite; }

    public BigDecimal getMontant() { return montant; }
    public void setMontant(BigDecimal montant) { this.montant = montant; }
}