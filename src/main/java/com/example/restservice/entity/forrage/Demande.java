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

    @ManyToOne
    @JoinColumn(name = "id_client") 
    private ClientForrage client;

    @Column(name = "lieu")
    private String lieu;

    @Column(name = "district")
    private String district;

    public Demande() {}

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
}