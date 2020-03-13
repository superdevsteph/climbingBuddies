package com.ocr.cb.services;

import com.ocr.cb.entities.Secteur;
import com.ocr.cb.entities.Site;
import com.ocr.cb.entities.Voie;
import com.ocr.cb.repositories.SecteurRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
public class SecteurService {

    @Autowired
    SecteurRepository secteurRepository;

    @Autowired
    SiteService siteService;

    @Autowired
    VoieService voieService;

    public Secteur findByIdFetchVoies(Integer id) {
        return secteurRepository.findByIdFetchVoies(id).orElse(null);
    }

    @Transactional
    public void save(Secteur secteur) {
        secteurRepository.save(secteur);
    }

    public Secteur findByIdFetchVoiesFetchLongueurs(Integer id) {
        Secteur secteur = findByIdFetchVoies(id);
        if (secteur == null) {
            return secteur;
        }
        List<Voie> voies = new ArrayList<>();
        secteur.getVoies().forEach(v -> {
            Voie voie = voieService.findByIdFetchLongueur(v.getId());
            if (voie != null) {
                voies.add(voie);
            }
        });
        secteur.setVoies(voies);
        return secteur;
    }

    public Secteur findById(Integer id) {
        return secteurRepository.findById(id).orElse(null);
    }

    @Transactional
    public boolean updateSecteur(Integer id, String nom) {
        Secteur secteur = findById(id);
        if (nom != null && nom.length() > 0 && nom.length() <= 100) {
            secteur.setNom(nom);
            save(secteur);
            return true;
        }
        return false;
    }

    @Transactional
    public boolean add(String nom, Integer siteId) {
        Secteur secteur = new Secteur();
        Site site = siteService.findById(siteId);
        if (site != null && nom != null && nom.length() > 0 && nom.length() <= 100) {
            secteur.setNom(nom);
            secteur.setSite(site);
            secteurRepository.save(secteur);
            return true;
        }
        return false;
    }

    @Transactional
    public void deleteById(Integer id) {
        secteurRepository.deleteById(id);
    }
}
