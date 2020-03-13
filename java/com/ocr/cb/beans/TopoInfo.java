package com.ocr.cb.beans;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import com.ocr.cb.entities.TopoResa;

public class TopoInfo {

    private Integer id;
    private String lieu;
    private String description;
    private String picture;
   

	private Boolean dispoResa;
    private LocalDateTime dtParution;
    private List<TopoResa> topoResas;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getLieu() {
        return lieu;
    }

    public void setLieu(String lieu) {
        this.lieu = lieu;
    }

    public String getDescription() {
        return description;
    }
    public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}
	
    public void setDescription(String description) {
        this.description = description;
    }

    public Boolean getDispoResa() {
        return dispoResa;
    }

    public void setDispoResa(Boolean dispoResa) {
        this.dispoResa = dispoResa;
    }

    public LocalDateTime getDtParution() {
        return dtParution;
    }

    public void setDtParution(LocalDateTime dtParution) {
        this.dtParution = dtParution;
    }

    public String getDtParutionFormated() {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        return dtParution.format(formatter);
    }

    public List<TopoResa> getTopoResas() {
        return topoResas;
    }

    public void setTopoResas(List<TopoResa> topoResas) {
        this.topoResas = topoResas;
    }
}
