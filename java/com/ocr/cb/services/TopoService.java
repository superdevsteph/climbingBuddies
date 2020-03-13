package com.ocr.cb.services;

import com.ocr.cb.entities.Topo;
import com.ocr.cb.entities.TopoResa;
import com.ocr.cb.entities.User;
import com.ocr.cb.repositories.TopoRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Service
public class TopoService {

    @Autowired
    TopoRepository topoRepository;

    @Autowired
    UserService userService;

    @Autowired
    TopoResaService topoResaService;

    public Topo findByIdFetchUser(Integer id) {
        return topoRepository.findByIdFetchUser(id).orElse(null);
    }

    /**
     * Find all topo witch the user is the owner
     *
     * @param userId the user id for whom looking for the topo list
     * @return the topo list of this user
     */
    public List<Topo> findAllByUserId(Integer userId) {
        return topoRepository.findAllByUserId(userId);
    }

    public List<Topo> findAllDispoWithoutUserIdWithoutResa(Integer userId) {
        List<Topo> topos = topoRepository.findAllDispoWithoutUserId(userId);
        List<Topo> topoList = new ArrayList<>();
        topos.forEach(t -> {
            TopoResa topoResa = topoResaService.findByUserIdByTopoId(userId, t.getId());
            if (topoResa == null) {
                // this topo is not already selected
                topoList.add(t);
            }
        });
        return topoList;
    }

    public Topo findById(Integer topoId) {
        return topoRepository.findById(topoId).orElse(null);
    }

    @Transactional
    public boolean add(User user, String lieu, String description, String picture, String topoPret) {
        if (user == null || lieu == null || description == null) return false;
        if (lieu.length() == 0 || lieu.length() > 100 || description.length() == 0 || description.length() > 65535)
            return false;
        Topo topo = new Topo();
        topo.setDescription(description);
        topo.setPicture(picture);
        topo.setUser(user);
        topo.setLieu(lieu);
        topo.setDispoResa(false);
        topo.setDtParution(LocalDateTime.now());
        if ("yes".equals(topoPret)) 
        	topo.setDispoResa(true);
        else 
        	topo.setDispoResa(false);
        topoRepository.save(topo);
        return true;
    }

    @Transactional
    public void save(Topo topo) {
        topoRepository.save(topo);
    }

    /**
     * get the topo if the user is the owner
     *
     * @param topoId the id of topo
     * @param user   the owner
     * @return a topo of the user, otherwise null
     */
    public Topo getTopo(Integer topoId, User user) {
        if (topoId == null || user == null) return null;
        Topo topo = topoRepository.findById(topoId).orElse(null);
        if (topo == null || user.getId() != topo.getUser().getId()) return null;
        return topo;
    }

    @Transactional
    public boolean updateTopo(Integer topoId, String picture, String lieu, String description, String topoPret, User user) {
        if (topoId == null || lieu == null || description == null || user == null) return false;
        Topo topo = topoRepository.findById(topoId).orElse(null);
        if (topo == null || user.getId() != topo.getUser().getId()) return false;
        topo.setPicture(picture);
        topo.setLieu(lieu);
        topo.setDescription(description);
        if ("yes".equals(topoPret)) topo.setDispoResa(true);
        else topo.setDispoResa(false);
        topoRepository.save(topo);
        return true;
    }

    /**
     * delete topo with all resa from it
     *
     * @param topoId the id of the topo
     * @param user   the user who is the owner of the topo
     * @return true if all is ok otherwise false
     */
    @Transactional
    public boolean deleteTopo(Integer topoId, User user) {
        if (topoId == null || user == null) return false;
        Topo topo = topoRepository.findById(topoId).orElse(null);
        if (topo == null || user.getId() != topo.getUser().getId()) return false;
        List<TopoResa> topoResas = topoResaService.getAllByTopoId(topo.getId());
        topoResas.forEach(tr -> topoResaService.delete(tr.getId()));
        topoRepository.deleteById(topoId);
        return true;
    }

	  @Transactional
    public boolean updateTopo2(Integer topoId, String lieu, String description, String topoPret, User user) {
        if (topoId == null || lieu == null || description == null || user == null) return false;
        Topo topo = topoRepository.findById(topoId).orElse(null);
        if (topo == null || user.getId() != topo.getUser().getId()) return false;
        topo.setLieu(lieu);
        topo.setDescription(description);
        if ("yes".equals(topoPret)) topo.setDispoResa(true);
        else topo.setDispoResa(false);
        topoRepository.save(topo);
        return true;
    }
}
