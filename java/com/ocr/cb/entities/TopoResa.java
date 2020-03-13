package com.ocr.cb.entities;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "topo_resa")
public class TopoResa {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User user;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "topo_id")
    private Topo topo;

    @Column(name = "dt_creation")
    private LocalDateTime dtCreation;

    @Column(name = "accept_resa")
    private Boolean acceptResa;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Topo getTopo() {
        return topo;
    }

    public void setTopo(Topo topo) {
        this.topo = topo;
    }

    public LocalDateTime getDtCreation() {
        return dtCreation;
    }

    public void setDtCreation(LocalDateTime dtCreation) {
        this.dtCreation = dtCreation;
    }

    public Boolean getAcceptResa() {
        return acceptResa;
    }

    public void setAcceptResa(Boolean acceptResa) {
        this.acceptResa = acceptResa;
    }
}
