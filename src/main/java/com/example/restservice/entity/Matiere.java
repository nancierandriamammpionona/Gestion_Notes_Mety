package com.example.restservice.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "matiere")
public class Matiere {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String matiere;
    public Matiere() {}

    public Integer getId() { 
        return id; 
    }

    public String getMatiere() { 
        return matiere;
    }

    public void setMatiere(String matiere) { 
        this.matiere = matiere; 
    }
}