package com.ocr.cb.controllers;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.security.Principal;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.LocaleResolver;

import com.ocr.cb.beans.TopoInfo;
import com.ocr.cb.entities.Topo;
import com.ocr.cb.entities.TopoResa;
import com.ocr.cb.entities.User;
import com.ocr.cb.services.MessageSourceService;
import com.ocr.cb.services.TopoInfoService;
import com.ocr.cb.services.TopoResaService;
import com.ocr.cb.services.TopoService;
import com.ocr.cb.services.UserService;

@Controller
@RequestMapping("/personnalspace")
public class PersonnalSpaceController {
	
    @Autowired
    UserService userService;


    @Autowired
    TopoService topoService;

    @Autowired
    TopoInfoService topoInfoService;

    @Autowired
    TopoResaService topoResaService;

    @Autowired
    MessageSourceService messageSourceService;

    @Autowired
    LocaleResolver localeResolver;

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String home(Principal principal,
                       ModelMap modelMap) {
        User user = userService.getUserFromPrincipalAndDB(principal);
        modelMap.addAttribute("user", user);
        List<TopoInfo> topoInfos = topoInfoService.findAllByUserId(user);
        modelMap.addAttribute("topoinfos", topoInfos);
        return "personnalspacehome";
    }

    @RequestMapping(value = "/topo/add", method = RequestMethod.GET)
    public String addNewTopo(Principal principal,
                             ModelMap modelMap) {
        User user = userService.getUserFromPrincipalAndDB(principal);
        modelMap.addAttribute("userid", user.getId());
        return "addtopo";
    }

    @RequestMapping(value = "/topo/add", method = RequestMethod.POST)
    public String addTopo(@ModelAttribute("topo") Topo topo,
    					  @RequestParam("lieu") String lieu,
                          @RequestParam("description") String description,
                          @RequestParam(value = "picture", required = false) String picture,
                          @RequestParam(value = "file", required = false) MultipartFile file,
                          @RequestParam(value = "topopret", required = false) String topoPret,
                          Principal principal,
                          ModelMap modelMap,
                          HttpServletRequest request) {
        User user = userService.getUserFromPrincipalAndDB(principal);
        String nameImage = uploadFile(file);
        
        if (nameImage != null) {
            topo.setPicture(nameImage);
        }
         boolean isOK = topoService.add(user, lieu,  description, nameImage, topoPret);
        if (isOK) {
            String url = "/personnalspace";
            return "redirect:" + url;
        } else {
            modelMap.addAttribute("error", messageSourceService.getMessage("error", localeResolver.resolveLocale(request)));
            return "addtopo";
        }
    }
    @RequestMapping(value = "/topo/change", method = RequestMethod.POST)
    public String changeTopo(@ModelAttribute("topo") Topo topo,
    						@RequestParam("topoid") Integer topoId,
    						@RequestParam(value = "file", required = false) MultipartFile file,
    						@RequestParam(value = "picture", required = false) String picture,
    						@RequestParam("lieu") String lieu,
                            @RequestParam("description") String description,
                            @RequestParam(value = "topopret", required = false) String topoPret,
                             Principal principal,
                             ModelMap modelMap,
                             HttpServletRequest request) {
        User user = userService.getUserFromPrincipalAndDB(principal);
        String nameImage = uploadFile(file);
        
        if (nameImage != null) {
            topo.setPicture(nameImage);
        }
        boolean isOK = topoService.updateTopo(topoId, nameImage, lieu, description, topoPret, user);
        if (isOK) {
            String url = "/personnalspace";
            return "redirect:" + url;
        } else {
            modelMap.addAttribute("error", messageSourceService.getMessage("error", localeResolver.resolveLocale(request)));
            topo = topoService.getTopo(topoId, user);
            modelMap.addAttribute("topo", topo);
            return "changetopo";
        }
    }
    public String uploadFile(MultipartFile file) {
        if (!file.isEmpty()) {
            try {
            	byte[] bytes = file.getBytes();
                // Creating the directory to store file
            	String rootPath = File.separator +"Users"+ File.separator +"stephaniemehraik"+ File.separator +"Documents"+ File.separator +"workspace-sts-3.9.10.RELEASE"+ File.separator +"climbingBuddies"+ File.separator +"src"+ File.separator +"main"+File.separator +"webapp"+ File.separator +"img";
                File dir = new File(rootPath + File.separator + "topo");
                if (!dir.exists())
                    dir.mkdirs();
                
                // Create the file on server
                String nameImage = String.valueOf(new Date().getTime()) + ".jpg";             
                File serverFile = new File(dir.getAbsolutePath()
                        + File.separator + nameImage);
                System.out.println(serverFile.toString());
                          
                BufferedOutputStream stream = new BufferedOutputStream(
                        new FileOutputStream(serverFile));
                stream.write(bytes);
                stream.close();
                
                return nameImage;
            } catch (Exception e) {
 
            }
        } else {
 
        }
        return null;
    }
    

    
    
    @RequestMapping(value = "/topo/change", method = RequestMethod.GET)
    public String viewTopo(@RequestParam("topoid") Integer topoId,
                           Principal principal,
                           ModelMap modelMap) {
        User user = userService.getUserFromPrincipalAndDB(principal);
        Topo topo = topoService.getTopo(topoId, user);
        modelMap.addAttribute("topo", topo);
        return "changetopo";
    }

    

    @RequestMapping(value = "/topo/delete", method = RequestMethod.POST)
    public String delteTopo(@RequestParam("topoid") Integer topoId,
                            Principal principal,
                            ModelMap modelMap,
                            HttpServletRequest request) {
        User user = userService.getUserFromPrincipalAndDB(principal);
        boolean isOK = topoService.deleteTopo(topoId, user);
        if (isOK) {
            String url = "/personnalspace";
            return "redirect:" + url;
        } else {
            modelMap.addAttribute("error", messageSourceService.getMessage("error", localeResolver.resolveLocale(request)));
            Topo topo = topoService.getTopo(topoId, user);
            modelMap.addAttribute("topo", topo);
            return "changetopo";
        }
    }

    @RequestMapping(value = "/topo/list", method = RequestMethod.GET)
    public String listTopo(Principal principal,
                           ModelMap modelMap) {
        User user = userService.getUserFromPrincipalAndDB(principal);
        List<Topo> topos = topoService.findAllDispoWithoutUserIdWithoutResa(user.getId());
        modelMap.addAttribute("topos", topos);
        return "listtopodispo";
    }

    @RequestMapping(value = "/topo/resa", method = RequestMethod.POST)
    public String toporesa(@RequestParam("topoid") Integer topoId, Principal principal, ModelMap modelMap, HttpServletRequest request) {
        User user = userService.getUserFromPrincipalAndDB(principal);
        boolean isOK = topoResaService.addResa(topoId, user);
        if (isOK) {
            String url = "/personnalspace";
            return "redirect:" + url;
        } else {
            modelMap.addAttribute("error", messageSourceService.getMessage("error", localeResolver.resolveLocale(request)));
            return "listtopodispo";
        }
    }

    @RequestMapping(value = "/toporesa/selected", method = RequestMethod.GET)
    public String topoResaInfo(@RequestParam("toporesaid") Integer topoResaId,
                               ModelMap modelMap,
                               HttpServletRequest request) {
        TopoResa topoResa = topoResaService.findByIdFetchUserFetchTopo(topoResaId);
        if (topoResa == null) {
            modelMap.addAttribute("error", messageSourceService.getMessage("error", localeResolver.resolveLocale(request)));
        }
        modelMap.addAttribute("toporesa", topoResa);
        return "toporesa";
    }

    @RequestMapping(value = "/toporesa/selected", method = RequestMethod.POST)
    public String topoResaSelected(@RequestParam("toporesaid") Integer topoResaId,
                                   @RequestParam(value = "acceptresa", required = false) String acceptResa,
                                   ModelMap modelMap,
                                   HttpServletRequest request) {
        boolean isOK = topoResaService.setUpResa(topoResaId, acceptResa);
        if (isOK) {
            String url = "/personnalspace";
            return "redirect:" + url;
        } else {
            TopoResa topoResa = topoResaService.findByIdFetchUserFetchTopo(topoResaId);
            modelMap.addAttribute("toporesa", topoResa);
            modelMap.addAttribute("error", messageSourceService.getMessage("error", localeResolver.resolveLocale(request)));
            return "toporesa";
        }
    }

    @RequestMapping(value = "/topo/myresas", method = RequestMethod.GET)
    public String myResa(Principal principal,
                         ModelMap modelMap) {
        User user = userService.getUserFromPrincipalAndDB(principal);
        List<TopoResa> topoResas = topoResaService.getForUserFetchTopoFetchUserTopo(user);
        modelMap.addAttribute("toporesas", topoResas);
        return "myresalist";
    }

    @RequestMapping(value = "/toporesa/delete", method = RequestMethod.POST)
    public String deleteResa(@RequestParam("toporesaid") Integer topoResaId,
                             Principal principal,
                             ModelMap modelMap,
                             HttpServletRequest request) {
        User user = userService.getUserFromPrincipalAndDB(principal);
        boolean isOK = topoResaService.delete(topoResaId, user);
        List<TopoResa> topoResas = topoResaService.getForUserFetchTopoFetchUserTopo(user);
        modelMap.addAttribute("toporesas", topoResas);
        if (isOK) {
            return "myresalist";
        } else {
            modelMap.addAttribute("error", messageSourceService.getMessage("error", localeResolver.resolveLocale(request)));
            return "myresalist";
        }
    }
    
    
    


}
