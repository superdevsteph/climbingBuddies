package com.ocr.cb.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.ocr.cb.entities.Commentaire;

import java.util.List;
import java.util.Optional;

@Repository
public interface CommentaireRepository extends JpaRepository<Commentaire, Integer> {

    @Query("SELECT c from Commentaire c LEFT JOIN  FETCH c.site LEFT JOIN FETCH c.user where c.id = :id")
    Optional<Commentaire> findByIdFetchSiteFetchUser(@Param("id") Integer id);

    @Query("SELECT c FROM Commentaire c LEFT JOIN FETCH c.user where c.site.id = :siteId")
    List<Commentaire> findAllBySiteIdFetchUser(@Param("siteId") Integer siteId);

}
