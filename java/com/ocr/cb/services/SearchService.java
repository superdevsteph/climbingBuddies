package com.ocr.cb.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ocr.cb.entities.Longueur;
import com.ocr.cb.entities.Secteur;
import com.ocr.cb.entities.Site;
import com.ocr.cb.entities.Voie;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.concurrent.atomic.AtomicBoolean;

@Service
public class SearchService {

    @Autowired
    LongueurService longueurService;

    @Autowired
    VoieService voieService;

    @Autowired
    SecteurService secteurService;

    @Autowired
    SiteService siteService;

    public List<Site> search(String lieu, String nombredesecteurs, String cotation) {
        List<Site> sites = new ArrayList<>();
        if (cotation != null && cotation.length() > 0) {
            List<Longueur> longueurs = longueurService.findStartWithCotation(cotation);
            longueurs.forEach(longueur -> {
                Site site = findSiteForLongueur(longueur);
                if (site != null && !sites.contains(site)) {
                    sites.add(site);
                } else if (site != null && sites.contains(site)) {
                    addNewComponentInSite(sites, site);
                }
            });
        }
        if (nombredesecteurs != null && nombredesecteurs.length() > 0 && nombredesecteurs.matches("\\d+")) {
            List<Site> ls = siteService.findByIdFetchSecteursCountSecteur(Integer.parseInt(nombredesecteurs));
            ls.forEach(site -> addNewComponentInSite(sites, siteService.findByIdFetchSecteursFetchVoiesFetchLongueurs(site.getId())));
        }
        if (lieu != null && lieu.length() > 0) {
            List<Site> ls = siteService.findStartWithLieu(lieu);
            ls.forEach(site -> addNewComponentInSite(sites, siteService.findByIdFetchSecteursFetchVoiesFetchLongueurs(site.getId())));
        }
        return sites;
    }

    /**
     * Met à jour le site dans la liste des site
     *
     * @param sites la liste des sites existant
     * @param site  le nouveau site à mettre à jour
     */
    private void addNewComponentInSite(List<Site> sites, Site site) {
        AtomicBoolean siteAdded = new AtomicBoolean(false);
        sites.forEach(site1 -> {
            if (site.equals(site1)) {
                siteAdded.set(true);
                site.getSecteurs().forEach(newSecteur -> {
                    AtomicBoolean secteurAdded = new AtomicBoolean(false);
                    site1.getSecteurs().forEach(secteurList -> {
                        if (newSecteur.equals(secteurList)) {
                            secteurAdded.set(true);


                            AtomicBoolean voieAdded = new AtomicBoolean(false);
                            newSecteur.getVoies().forEach(newVoie -> {
                                secteurList.getVoies().forEach(voieList -> {
                                    if (newVoie.equals(voieList)) {
                                        voieAdded.set(true);


                                        AtomicBoolean longueurAdded = new AtomicBoolean(false);
                                        newVoie.getLongueurs().forEach(newLongeur -> {
                                            voieList.getLongueurs().forEach(longueurList -> {
                                                if (newLongeur.equals(longueurList)) {
                                                    longueurAdded.set(true);
                                                }
                                            });
                                            if (!longueurAdded.get()) {
                                                voieList.setLongueurs(getNewListLongueurs(voieList.getLongueurs(), newLongeur));
                                            }

                                        });

                                    }
                                });
                                if (!voieAdded.get()) {
                                    secteurList.setVoies(getNewListVoies(secteurList.getVoies(), newVoie));
                                }
                            });
                        }
                    });
                    if (!secteurAdded.get()) {
                        site1.setSecteurs(getNewListSecteurs(site1.getSecteurs(), newSecteur));
                    }
                });

            }
        });
        if (!siteAdded.get()) {
            sites.add(site);
        }
    }

    private List<Longueur> getNewListLongueurs(List<Longueur> longueurs, Longueur newLongeur) {
        List<Longueur> list = new ArrayList<>();
        if (longueurs != null) longueurs.forEach(longueur -> list.add(longueur));
        list.add(newLongeur);
        return list;
    }

    private List<Voie> getNewListVoies(List<Voie> voies, Voie newVoie) {
        List<Voie> list = new ArrayList<>();
        if (voies != null) voies.forEach(voie -> list.add(voie));
        list.add(newVoie);
        return list;
    }

    private List<Secteur> getNewListSecteurs(List<Secteur> secteurs, Secteur newSecteur) {
        List<Secteur> list = new ArrayList<>();
        if (secteurs != null) secteurs.forEach(secteur -> list.add(secteur));
        list.add(newSecteur);
        return list;
    }

    private Site findSiteForLongueur(Longueur longueur) {
        Voie voie = voieService.findById(longueur.getVoie().getId());
        if (voie != null) {
            Secteur secteur = secteurService.findById(voie.getSecteur().getId());
            if (secteur != null) {
                Site site = siteService.findById(secteur.getSite().getId());
                if (site != null) {
                    site.setSecteurs(Arrays.asList(secteur));
                    secteur.setVoies(Arrays.asList(voie));
                    voie.setLongueurs(Arrays.asList(longueur));
                    return site;
                }
            }
        }
        return null;
    }
}
