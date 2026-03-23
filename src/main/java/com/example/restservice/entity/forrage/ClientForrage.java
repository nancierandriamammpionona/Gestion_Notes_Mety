package com.example.restservice.entity.forrage;

import jakarta.persistence.*;

@Entity
@Table(name = "client")
public class ClientForrage {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_client") 
    private Integer id;

    private String nom;
    private String contact;

    public ClientForrage() {}

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }
}