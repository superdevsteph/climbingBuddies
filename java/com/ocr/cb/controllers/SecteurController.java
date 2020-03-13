package com.ocr.cb.controllers;

import com.ocr.cb.entities.Secteur;
import com.ocr.cb.services.MessageSourceService;
import com.ocr.cb.services.SecteurService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.LocaleResolver;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/secteur")
public class SecteurController {

    @Autowired
    SecteurService secteurService;

    @Autowired
    MessageSourceService messageSourceService;

    @Autowired
    LocaleResolver localeResolver;

    @RequestMapping(value = "/change", method = RequestMethod.GET)
    public String seeAttributes(@RequestParam("id") Integer id,
                                @RequestParam("siteid") Integer siteId,
                                ModelMap modelMap) {
        Secteur secteur = secteurService.findById(id);
        modelMap.addAttribute("secteur", secteur);
        modelMap.addAttribute("siteid", siteId);
        return "secteurchange";
    }

    @RequestMapping(value = "/change", method = RequestMethod.POST)
    public String changeAttributes(@RequestParam(value = "id") Integer id,
                                   @RequestParam(value = "siteid") Integer siteId,
                                   @RequestParam(value = "nom") String nom,
                                   ModelMap modelMap,
                                   HttpServletRequest request) {
        boolean isOK = secteurService.updateSecteur(id, nom);
        if (isOK) {
            String redirectUrl = "/site/details?id=" + siteId;
            return "redirect:" + redirectUrl;
        } else {
            modelMap.addAttribute("error", messageSourceService.getMessage("error.typing", localeResolver.resolveLocale(request)));
            modelMap.addAttribute("secteur", secteurService.findById(id));
            modelMap.addAttribute("siteid", siteId);
            return "secteurchange";
        }
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String addNew(@RequestParam(value = "id") Integer siteId, ModelMap modelMap) {
        modelMap.addAttribute("siteid", siteId);
        return "addnewsecteur";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String add(@RequestParam(value = "siteid") Integer siteId,
                      @RequestParam(value = "nom") String nom,
                      ModelMap modelMap,
                      HttpServletRequest request) {
        boolean isOK = secteurService.add(nom, siteId);
        if (isOK) {
            String redirectUrl = "/site/details?id=" + siteId;
            return "redirect:" + redirectUrl;
        } else {
            modelMap.addAttribute("error", messageSourceService.getMessage("error.secteur.typing", localeResolver.resolveLocale(request)));
            modelMap.addAttribute("siteid", siteId);
            return "addnewsecteur";
        }
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public String delete(@RequestParam(value = "id") Integer id,
                         @RequestParam(value = "siteid") Integer siteId,
                         ModelMap modelMap) {
        secteurService.deleteById(id);
        String redirectUrl = "/site/details?id=" + siteId;
        return "redirect:" + redirectUrl;
    }
}
