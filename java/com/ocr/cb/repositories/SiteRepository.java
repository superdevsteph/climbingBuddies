package com.ocr.cb.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.ocr.cb.entities.Site;

import java.util.List;
import java.util.Optional;

@Repository
public interface SiteRepository extends JpaRepository<Site, Integer> {

    @Query("SELECT s FROM Site s LEFT JOIN FETCH s.secteurs WHERE s.id = :id")
    Optional<Site> findByIdFetchSecteurs(@Param("id") Integer id);

    @Query("SELECT distinct s FROM Site s LEFT JOIN FETCH s.secteurs WHERE s.secteurs.size = :count")
    List<Site> findByIdFetchSecteursCountSecteur(@Param("count") Integer count);

    @Query("SELECT s FROM Site s WHERE s.lieu like CONCAT(:lieu,'%')")
    List<Site> findStartWithLieu(@Param("lieu") String lieu);

}
