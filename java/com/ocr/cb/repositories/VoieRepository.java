package com.ocr.cb.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.ocr.cb.entities.Voie;

import java.util.Optional;

@Repository
public interface VoieRepository extends JpaRepository<Voie, Integer> {

    @Query("SELECT v FROM Voie v LEFT JOIN FETCH v.longueurs where v.id = :id")
    Optional<Voie> findByIdFetchLongueur(@Param("id") Integer id);
}
