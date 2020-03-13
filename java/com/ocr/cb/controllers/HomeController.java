package com.ocr.cb.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.LocaleResolver;

import com.ocr.cb.services.MessageSourceService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Locale;

@Controller
@RequestMapping("/")
public class HomeController {

    @Autowired
    MessageSourceService messageSourceService;

    @Autowired
    LocaleResolver localeResolver;

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String index(ModelMap modelMap,
                        HttpServletRequest request) {
        modelMap.addAttribute("message", messageSourceService.getMessage("welcome", localeResolver.resolveLocale(request)));
        return "home";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login() {
        return "login";
    }

    @RequestMapping(value = "appExceptionHandler")
    public String appExceptionHandler(HttpServletRequest request, ModelMap modelMap) {
        Integer statusCode = (Integer) request.getAttribute("javax.servlet.error.status_code");
        modelMap.addAttribute("message", String.format(messageSourceService.getMessage("error.page", localeResolver.resolveLocale(request)), statusCode));
        return "home";
    }

    @RequestMapping(value = "/language", method = RequestMethod.GET)
    public ResponseEntity<String> setLanguage(HttpServletRequest request,
                                              HttpServletResponse response,
                                              @RequestParam(value = "lang", required = false) String lang,
                                              ModelMap modelMap) {
        if ("fr".equals(lang)) {
            localeResolver.setLocale(request, response, Locale.FRENCH);
        } else {
            localeResolver.setLocale(request, response, Locale.ENGLISH);
        }
        return new ResponseEntity<String>(HttpStatus.OK);
    }
}
