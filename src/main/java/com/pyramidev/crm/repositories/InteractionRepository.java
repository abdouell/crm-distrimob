package com.pyramidev.crm.repositories;

import com.pyramidev.crm.models.Interaction;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.time.Instant;
import java.util.List;
import java.util.Optional;

public interface InteractionRepository extends JpaRepository<Interaction, Long> {
    List<Interaction> findByProspectIdOrderByDateDesc(Long prospectId);
    
    @Query("SELECT MAX(i.date) FROM Interaction i WHERE i.prospect.id = :prospectId")
    Optional<Instant> findMaxDateByProspectId(@Param("prospectId") Long prospectId);
}
