package com.ocr.cb.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.ocr.cb.entities.Topo;

import java.util.List;
import java.util.Optional;

@Repository
public interface TopoRepository extends JpaRepository<Topo, Integer> {

    @Query("SELECT t FROM Topo t LEFT JOIN FETCH t.user where t.id = :id")
    Optional<Topo> findByIdFetchUser(@Param("id") Integer id);

    @Query("SELECT t FROM Topo t LEFT JOIN FETCH t.user where t.user.id = :userId")
    List<Topo> findAllByUserId(@Param("userId") Integer userId);

    @Query("SELECT t FROM Topo t LEFT JOIN FETCH t.user where t.dispoResa = true and t.user.id <> :userId")
    List<Topo> findAllDispoWithoutUserId(@Param("userId") Integer userId);
}
