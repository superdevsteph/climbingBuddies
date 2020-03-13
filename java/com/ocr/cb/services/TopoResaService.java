package com.ocr.cb.services;

import com.ocr.cb.beans.TopoInfo;
import com.ocr.cb.entities.Topo;
import com.ocr.cb.entities.TopoResa;
import com.ocr.cb.entities.User;
import com.ocr.cb.repositories.TopoResaRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Service
public class TopoResaService {

    @Autowired
    TopoResaRepository topoResaRepository;

    @Autowired
    UserService userService;

    @Autowired
    TopoService topoService;

    public TopoResa findByIdFetchUserFetchTopo(Integer id) {
        return topoResaRepository.findByIdFetchUserFetchTopo(id).orElse(null);
    }

    public List<TopoResa> findAllByTopoIdFetchUser(Integer topoId) {
        return topoResaRepository.findAllByTopoIdFetchUser(topoId);
    }

    public TopoResa findByUserIdByTopoId(Integer userId, Integer topoId) {
        return topoResaRepository.findByUserIdByTopoId(userId, topoId).orElse(null);
    }

    @Transactional
    public boolean addResa(Integer topoId, User user) {
        if (topoId == null || user == null) return false;
        TopoResa topoResa = new TopoResa();
        topoResa.setDtCreation(LocalDateTime.now());
        topoResa.setUser(user);
        topoResa.setTopo(topoService.findById(topoId));
        topoResa.setAcceptResa(false);
        topoResaRepository.save(topoResa);
        return true;
    }

    @Transactional
    public boolean setUpResa(Integer topoResaId, String acceptResa) {
        TopoResa topoResa = topoResaRepository.findById(topoResaId).orElse(null);
        if (topoResa == null) return false;
        Topo topo = topoService.findById(topoResa.getTopo().getId());
        if (topo == null) return false;
        if ("on".equals(acceptResa)) {
            if (!topoResa.getAcceptResa()) {
                topoResa.setAcceptResa(true);
                topo.setDispoResa(false);
            }
        } else {
            topoResa.setAcceptResa(false);
        }
        topoService.save(topo);
        topoResaRepository.save(topoResa);
        return true;
    }

    public List<TopoResa> getForUserFetchTopoFetchUserTopo(User user) {
        if (user == null) return new ArrayList<TopoResa>();
        return topoResaRepository.findAllByUserIdFetchTopoFecthUserTopo(user.getId());
    }

    @Transactional
    public boolean delete(Integer topoResaId, User user) {
        TopoResa topoResa = topoResaRepository.findById(topoResaId).orElse(null);
        if (topoResa == null || user == null || user.getId() != topoResa.getUser().getId()) return false;
        topoResaRepository.deleteById(topoResa.getId());
        return true;
    }

    @Transactional
    public void delete(Integer topoResaId) {
        topoResaRepository.deleteById(topoResaId);
    }

    public List<TopoResa> getAllByTopoId(Integer topoId) {
        return topoResaRepository.findAllByTopoId(topoId);
    }
}
