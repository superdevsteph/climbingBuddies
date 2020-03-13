package com.ocr.cb.controllers;

import com.ocr.cb.entities.Site;
import com.ocr.cb.services.MessageSourceService;
import com.ocr.cb.services.SearchService;
import com.ocr.cb.services.SiteService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.LocaleResolver;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/search")
public class SearchController {

    @Autowired
    SearchService searchService;

    @Autowired
    SiteService siteService;

    @Autowired
    MessageSourceService messageSourceService;

    @Autowired
    LocaleResolver localeResolver;

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String searchHomePage(ModelMap modelMap) {
        List<Site> sites = siteService.findAll();
        modelMap.addAttribute("sitessommaire", sites);
        return "searchhome";
    }

    @RequestMapping(value = "", method = RequestMethod.POST)
    public String search(@RequestParam(required = false) String lieu,
                         @RequestParam(required = false) String nombredesecteurs,
                         @RequestParam(required = false) String cotation,
                         ModelMap modelMap,
                         HttpServletRequest request) {
        List<Site> sites = searchService.search(lieu, nombredesecteurs, cotation);
        modelMap.addAttribute("sites", sites);
        if (sites.size() == 0)
            modelMap.addAttribute("rechercheinfructueuse", messageSourceService.getMessage("recherche.infructueuse", localeResolver.resolveLocale(request)));
        return "searchhome";
    }

    @RequestMapping(value = "site", method = RequestMethod.GET)
    public String site(@RequestParam Integer id, ModelMap modelMap) {
        Site site = siteService.findByIdFetchSecteursFetchVoiesFetchLongueurs(id);
        modelMap.addAttribute("site", site);
        return "searchsites";
    }
}
