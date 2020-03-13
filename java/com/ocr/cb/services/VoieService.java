package com.ocr.cb.services;

import com.ocr.cb.entities.Secteur;
import com.ocr.cb.entities.Voie;
import com.ocr.cb.repositories.VoieRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class VoieService {

    @Autowired
    VoieRepository voieRepository;

    @Autowired
    SecteurService secteurService;

    public Voie findByIdFetchLongueur(Integer id) {
        return voieRepository.findByIdFetchLongueur(id).orElse(null);
    }

    public Voie findById(Integer id) {
        return voieRepository.findById(id).orElse(null);
    }

    public void deleteById(Integer id) {
        voieRepository.deleteById(id);
    }

    @Transactional
    public boolean updateVoie(Integer id, String nom) {
        Voie voie = findById(id);
        if (nom != null && nom.length() > 0 && nom.length() <= 100) {
            voie.setNom(nom);
            voieRepository.save(voie);
            return true;
        }
        return false;
    }

    @Transactional
    public boolean add(String nom, Integer secteurId) {
        Secteur secteur = secteurService.findById(secteurId);
        if (secteur != null && nom != null && nom.length() > 0 && nom.length() <= 100) {
            Voie voie = new Voie();
            voie.setNom(nom);
            voie.setSecteur(secteur);
            voieRepository.save(voie);
            return true;
        }
        return false;
    }
}
