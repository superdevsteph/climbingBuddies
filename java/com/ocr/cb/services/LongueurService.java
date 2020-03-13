package com.ocr.cb.services;

import com.ocr.cb.entities.Longueur;
import com.ocr.cb.entities.Voie;
import com.ocr.cb.repositories.LongueurRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LongueurService {

    @Autowired
    LongueurRepository longueurRepository;

    @Autowired
    VoieService voieService;


    List<Longueur> findStartWithCotation(String cotation) {
        return longueurRepository.findStartWithCotation(cotation);
    }

    public Longueur findById(Integer id) {
        return longueurRepository.findById(id).orElse(null);
    }

    public void deleteById(Integer id) {
        longueurRepository.deleteById(id);
    }

    public boolean updateLongueur(Integer id, String cotation) {
        Longueur longueur = findById(id);
        if (longueur != null && cotation != null && cotation.length() > 0 && cotation.length() <= 3) {
            longueur.setCotation(cotation);
            longueurRepository.save(longueur);
            return true;
        }
        return false;
    }

    public boolean add(String cotation, Integer voieId) {
        Voie voie = voieService.findById(voieId);
        Longueur longueur = new Longueur();
        if (cotation != null && cotation.length() > 0 && cotation.length() <= 3 && voie != null) {
            longueur.setCotation(cotation);
            longueur.setVoie(voie);
            longueurRepository.save(longueur);
            return true;
        }
        return false;
    }
}
