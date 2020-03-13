package com.ocr.cb.services;

import com.ocr.cb.entities.Commentaire;
import com.ocr.cb.entities.Site;
import com.ocr.cb.entities.User;
import com.ocr.cb.repositories.CommentaireRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.security.Principal;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Service
public class CommentaireService {

    @Autowired
    private CommentaireRepository commentaireRepository;

    @Autowired
    private UserService userService;

    @Autowired
    private SiteService siteService;


    public Commentaire findByIdFetchSiteFetchUser(Integer id) {
        return commentaireRepository.findByIdFetchSiteFetchUser(id).orElse(null);
    }

    public List<Commentaire> findAllBySiteIdFetchUser(Integer siteId) {
        return commentaireRepository.findAllBySiteIdFetchUser(siteId);
    }

    @Transactional
    public boolean addNew(String comment, Integer siteId, User user) {
        if (comment == null || comment.length() == 0 || comment.length() > 65535 || siteId == null || user == null)
            return false;
        Site site = siteService.findById(siteId);
        if (site == null) return false;
        Commentaire commentaire = new Commentaire();
        commentaire.setCommentaire(comment);
        commentaire.setSite(site);
        commentaire.setUser(user);
        commentaire.setDtCreation(LocalDateTime.now());
        commentaireRepository.save(commentaire);
        return true;
    }

    @Transactional
    public void delete(Integer commentId) {
        commentaireRepository.deleteById(commentId);
    }

    @Transactional
    public boolean change(String comment, Integer commentId, User user) {
        if (comment == null || commentId == null || user == null) return false;
        if (!userService.isAtLeastAssociationLevelFromUser(user)) return false;
        Commentaire commentaire = commentaireRepository.findById(commentId).orElse(null);
        if (commentaire == null) return false;
        commentaire.setUser(user);
        commentaire.setCommentaire(comment);
        commentaireRepository.save(commentaire);
        return true;
    }
}
