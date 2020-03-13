package com.ocr.cb.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.ocr.cb.entities.Longueur;

import java.util.List;

@Repository
public interface LongueurRepository extends JpaRepository<Longueur, Integer> {

    @Query("SELECT l FROM Longueur l WHERE l.cotation like CONCAT(:cot,'%')")
    List<Longueur> findStartWithCotation(@Param("cot") String cotation);
}
