package com.pyramidev.crm.repositories;

import com.pyramidev.crm.models.Prospect;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface ProspectRepository extends JpaRepository<Prospect, Long>, JpaSpecificationExecutor<Prospect> {

    @Query("SELECT p FROM Prospect p " +
           "LEFT JOIN FETCH p.owner " +
           "WHERE (cast(:search as string) IS NULL OR LOWER(p.name) LIKE LOWER(CONCAT('%', cast(:search as string), '%'))) " +
           "AND (cast(:status as string) IS NULL OR p.status = cast(:status as string)) " +
           "AND (cast(:sector as string) IS NULL OR p.activitySector = cast(:sector as string)) " +
           "ORDER BY p.createdAt DESC")
    List<Prospect> findAllFilteredOrderByCreatedAtDesc(
            @Param("search") String search, 
            @Param("status") String status, 
            @Param("sector") String sector);

    @Query("SELECT p FROM Prospect p " +
           "LEFT JOIN FETCH p.owner " +
           "WHERE (cast(:search as string) IS NULL OR LOWER(p.name) LIKE LOWER(CONCAT('%', cast(:search as string), '%'))) " +
           "AND (cast(:status as string) IS NULL OR p.status = cast(:status as string)) " +
           "AND (cast(:sector as string) IS NULL OR p.activitySector = cast(:sector as string)) " +
           "ORDER BY p.createdAt ASC")
    List<Prospect> findAllFilteredOrderByCreatedAtAsc(
            @Param("search") String search, 
            @Param("status") String status, 
            @Param("sector") String sector);

    @Query("SELECT p FROM Prospect p " +
           "LEFT JOIN FETCH p.owner " +
           "WHERE (cast(:search as string) IS NULL OR LOWER(p.name) LIKE LOWER(CONCAT('%', cast(:search as string), '%'))) " +
           "AND (cast(:status as string) IS NULL OR p.status = cast(:status as string)) " +
           "AND (cast(:sector as string) IS NULL OR p.activitySector = cast(:sector as string)) " +
           "ORDER BY p.lastInteractionAt ASC NULLS FIRST")
    List<Prospect> findAllFilteredOrderByLastInteractionAtAscNullsFirst(
            @Param("search") String search, 
            @Param("status") String status, 
            @Param("sector") String sector);

    @Query("SELECT p FROM Prospect p " +
           "LEFT JOIN FETCH p.owner " +
           "WHERE (cast(:search as string) IS NULL OR LOWER(p.name) LIKE LOWER(CONCAT('%', cast(:search as string), '%'))) " +
           "AND (cast(:status as string) IS NULL OR p.status = cast(:status as string)) " +
           "AND (cast(:sector as string) IS NULL OR p.activitySector = cast(:sector as string)) " +
           "ORDER BY p.lastInteractionAt DESC NULLS LAST")
    List<Prospect> findAllFilteredOrderByLastInteractionAtDescNullsLast(
            @Param("search") String search, 
            @Param("status") String status, 
            @Param("sector") String sector);
}
