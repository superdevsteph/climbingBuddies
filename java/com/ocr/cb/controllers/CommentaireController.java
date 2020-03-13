package com.ocr.cb.controllers;

import com.ocr.cb.entities.Commentaire;
import com.ocr.cb.entities.User;
import com.ocr.cb.services.CommentaireService;
import com.ocr.cb.services.MessageSourceService;
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
@RequestMapping("/comment")
public class CommentaireController {

    @Autowired
    private CommentaireService commentaireService;

    @Autowired
    private UserService userService;

    @Autowired
    private MessageSourceService messageSourceService;

    @Autowired
    LocaleResolver localeResolver;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String list(@RequestParam("id") Integer siteId, ModelMap modelMap, Principal principal) {
        
    	List<Commentaire> commentaires = commentaireService.findAllBySiteIdFetchUser(siteId);
        modelMap.addAttribute("commentaires", commentaires);
        boolean isAssoLevel = userService.isAtLeastAssociationLevel(principal);
        modelMap.addAttribute("isassolevel", isAssoLevel);
        modelMap.addAttribute("siteid", siteId);
        
        return "commentlist";
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String addNew(@RequestParam("siteid") Integer siteId, ModelMap modelMap) {
       
    	modelMap.addAttribute("siteid", siteId);
        
    	return "commentnew";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String add(@RequestParam("siteid") Integer siteId,
                      @RequestParam("commentnew") String comment,
                      ModelMap modelMap,
                      Principal principal) {
        User user = userService.getUserFromPrincipalAndDB(principal);
        boolean isOK = commentaireService.addNew(comment, siteId, user);
        if (isOK) {
            String url = "/comment/list?id=" + siteId;
            return "redirect:" + url;
        } else {
            modelMap.addAttribute("siteid", siteId);
            return "commentnew";
        }
    }

    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String delete(@RequestParam("id") Integer commentId,
                         @RequestParam("siteid") Integer siteId,
                         Principal principal) {
        commentaireService.delete(commentId);
        String url = "/comment/list?id=" + siteId;
        return "redirect:" + url;
    }

    @RequestMapping(value = "/change", method = RequestMethod.GET)
    public String change(@RequestParam("id") Integer commentId,
                         @RequestParam("siteid") Integer siteId,
                         Principal principal,
                         ModelMap modelMap) {
        boolean isAtLeastAssoLevel = userService.isAtLeastAssociationLevel(principal);
        if (isAtLeastAssoLevel) {
            Commentaire comment = commentaireService.findByIdFetchSiteFetchUser(commentId);
            modelMap.addAttribute("comment", comment);
            return "commentchange";
        } else {
            String url = "/comment/list?id=" + siteId;
            return "redirect:" + url;
        }
    }

    @RequestMapping(value = "/change", method = RequestMethod.POST)
    public String changeComment(@RequestParam("siteid") Integer siteId,
                                @RequestParam("commentid") Integer commentId,
                                @RequestParam("commentchange") String comment,
                                ModelMap modelMap,
                                Principal principal,
                                HttpServletRequest request) {
        User user = userService.getUserFromPrincipalAndDB(principal);
        boolean isOK = commentaireService.change(comment, commentId, user);
        if (isOK) {
            String url = "/comment/list?id=" + siteId;
            return "redirect:" + url;
        } else {
            modelMap.addAttribute("error", messageSourceService.getMessage("error", localeResolver.resolveLocale(request)));
            return "commentchange";
        }
    }
}
