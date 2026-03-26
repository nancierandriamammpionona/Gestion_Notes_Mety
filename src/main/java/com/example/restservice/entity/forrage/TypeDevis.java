package com.example.restservice.entity.forrage;

import jakarta.persistence.*;

@Entity
@Table(name = "type_devis")
public class TypeDevis {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_type_devis")
    private Integer id;

    private String libelle;

    public TypeDevis() {}

    public Integer getId() { return id; }
    public void setId(Integer id) { this.id = id; }

    public String getLibelle() { return libelle; }
    public void setLibelle(String libelle) { this.libelle = libelle; }
}