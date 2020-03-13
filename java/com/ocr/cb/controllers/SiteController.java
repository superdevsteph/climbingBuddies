package com.ocr.cb.controllers;

import com.ocr.cb.entities.Site;
import com.ocr.cb.entities.User;
import com.ocr.cb.services.MessageSourceService;
import com.ocr.cb.services.SiteService;
import com.ocr.cb.services.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.LocaleResolver;

import javax.servlet.http.HttpServletRequest;
import java.security.Principal;
import java.util.List;

@Controller
@RequestMapping("/site")
public class SiteController {

    @Autowired
    SiteService siteService;

    @Autowired
    UserService userService;

    @Autowired
    MessageSourceService messageSourceService;

    @Autowired
    LocaleResolver localeResolver;

    @RequestMapping(value = "/details", method = RequestMethod.GET)
    public String details(@RequestParam(required = true) Integer id, ModelMap modelMap) {
        Site site = siteService.findByIdFetchSecteursFetchVoiesFetchLongueurs(id);
        if (site != null) {
            modelMap.addAttribute("site", site);
        }
        return "sitedetails";
    }

    @RequestMapping(value = "/change", method = RequestMethod.GET)
    public String seeAttributes(@RequestParam("id") Integer id,
                                ModelMap modelMap,
                                Principal principal) {
        boolean isAssoLevel = userService.isAtLeastAssociationLevel(principal);
        modelMap.addAttribute("isassolevel", isAssoLevel);
        Site site = siteService.findById(id);
        modelMap.addAttribute("site", site);
        if (site.getTag()) {
            modelMap.addAttribute("siteofficialistaged", true);
        }
        return "sitechange";
    }

    @RequestMapping(value = "/change", method = RequestMethod.POST)
    public String changeAttributes(@RequestParam(value = "id") Integer id,
                                   @RequestParam(value = "lieu") String lieu,
                                   @RequestParam(value = "nom") String nom,
                                   @RequestParam(value = "siteofficial", required = false) String siteOfficialTag,
                                   HttpServletRequest request,
                                   ModelMap modelMap,
                                   Principal principal
    ) {
        User user = userService.getUserFromPrincipalAndDB(principal);
        boolean isOK = siteService.updateSite(id, lieu, nom, siteOfficialTag, user);
        if (isOK) {
            String redirectUrl = "/site/details?id=" + id;
            return "redirect:" + redirectUrl;
        } else {
            boolean isAssoLevel = userService.isAtLeastAssociationLevel(principal);
            modelMap.addAttribute("isassolevel", isAssoLevel);
            modelMap.addAttribute("error", messageSourceService.getMessage("error.typing", localeResolver.resolveLocale(request)));
            if (siteOfficialTag != null) {
                modelMap.addAttribute("siteofficialistaged", true);
            }
            return "sitechange";
        }
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String add(ModelMap modelMap, Principal principal) {
        boolean isAssoLevel = userService.isAtLeastAssociationLevel(principal);
        modelMap.addAttribute("isassolevel", isAssoLevel);
        return "addnewsite";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String addNew(@RequestParam(value = "lieu") String lieu,
                         @RequestParam(value = "nom") String nom,
                         @RequestParam(value = "siteofficial", required = false) String siteOfficialTag,
                         HttpServletRequest request,
                         ModelMap modelMap,
                         Principal principal) {
        User user = userService.getUserFromPrincipalAndDB(principal);
        Site site = siteService.add(lieu, nom, siteOfficialTag, user);
        if (site != null) {
            String redirectUrl = "/site/details?id=" + site.getId();
            return "redirect:" + redirectUrl;
        } else {
            boolean isAssoLevel = userService.isAtLeastAssociationLevel(principal);
            modelMap.addAttribute("isassolevel", isAssoLevel);
            modelMap.addAttribute("error", messageSourceService.getMessage("error.create.site", localeResolver.resolveLocale(request)));
            return "addnewsite";
        }
    }


    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public String addNew(@RequestParam(value = "id") Integer id,
                         ModelMap modelMap,
                         Principal principal) {
        boolean isAssoLevel = userService.isAtLeastAssociationLevel(principal);
        siteService.deleteById(id, isAssoLevel);
        List<Site> sites = siteService.findAll();
        modelMap.addAttribute("sitessommaire", sites);
        return "searchhome";
    }
}
