package com.example.restservice.entity.forrage;

import jakarta.persistence.*;
import java.sql.Date;
import java.util.List;

@Entity
@Table(name = "devis")
public class Devis {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_devis")
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "id_demande")
    private Demande demande;

    @ManyToOne
    @JoinColumn(name = "id_type_devis")
    private TypeDevis typeDevis;

    @Column(name = "date")
    private Date date;

    @OneToMany(mappedBy = "devis", cascade = CascadeType.ALL)
    private List<DetailsDevis> details;

    public Devis() {}

    public Integer getId() { return id; }
    public void setId(Integer id) { this.id = id; }

    public Demande getDemande() { return demande; }
    public void setDemande(Demande demande) { this.demande = demande; }

    public TypeDevis getTypeDevis() { return typeDevis; }
    public void setTypeDevis(TypeDevis typeDevis) { this.typeDevis = typeDevis; }

    public Date getDate() { return date; }
    public void setDate(Date date) { this.date = date; }

    public List<DetailsDevis> getDetails() { return details; }
    public void setDetails(List<DetailsDevis> details) { this.details = details; }
}