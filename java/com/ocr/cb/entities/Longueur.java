package com.ocr.cb.entities;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "longueur")
public class Longueur {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(length = 3)
    private String cotation;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "voie_id")
    private Voie voie;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCotation() {
        return cotation;
    }

    public void setCotation(String cotation) {
        this.cotation = cotation;
    }

    public Voie getVoie() {
        return voie;
    }

    public void setVoie(Voie voie) {
        this.voie = voie;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Longueur longueur = (Longueur) o;
        return Objects.equals(id, longueur.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, cotation, voie);
    }
}
