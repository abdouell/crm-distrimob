package com.pyramidev.crm.controllers;

import com.pyramidev.crm.dto.InteractionDto;
import com.pyramidev.crm.models.Contact;
import com.pyramidev.crm.models.Interaction;
import com.pyramidev.crm.models.Prospect;
import com.pyramidev.crm.repositories.ContactRepository;
import com.pyramidev.crm.repositories.InteractionRepository;
import com.pyramidev.crm.repositories.ProspectRepository;
import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.time.Instant;
import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/interactions")
public class InteractionController {

    private final InteractionRepository interactionRepository;
    private final ProspectRepository prospectRepository;
    private final ContactRepository contactRepository;

    public InteractionController(InteractionRepository interactionRepository, ProspectRepository prospectRepository, ContactRepository contactRepository) {
        this.interactionRepository = interactionRepository;
        this.prospectRepository = prospectRepository;
        this.contactRepository = contactRepository;
    }

    @GetMapping
    public ResponseEntity<List<InteractionDto>> getInteractions(@RequestParam(name = "prospect", required = false) Long prospectId) {
        List<Interaction> interactions;
        if (prospectId != null) {
            interactions = interactionRepository.findByProspectIdOrderByDateDesc(prospectId);
        } else {
            interactions = interactionRepository.findAll();
        }

        List<InteractionDto> dtos = interactions.stream()
                .map(this::convertToDto)
                .collect(Collectors.toList());
        return ResponseEntity.ok(dtos);
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> getInteractionById(@PathVariable Long id) {
        return interactionRepository.findById(id)
                .map(i -> ResponseEntity.ok(convertToDto(i)))
                .orElse(ResponseEntity.notFound().build());
    }

    @PostMapping
    @Transactional
    public ResponseEntity<?> createInteraction(@Valid @RequestBody InteractionDto dto) {
        Prospect prospect = prospectRepository.findById(dto.getProspect())
                .orElseThrow(() -> new IllegalArgumentException("Prospect non trouvé avec l'id : " + dto.getProspect()));

        Interaction interaction = new Interaction();
        interaction.setProspect(prospect);
        interaction.setDate(dto.getDate());
        interaction.setType(dto.getType());
        interaction.setNotes(dto.getNotes());
        
        if (dto.getContactId() != null) {
            Contact contact = contactRepository.findById(dto.getContactId())
                    .orElseThrow(() -> new IllegalArgumentException("Contact non trouvé avec l'id : " + dto.getContactId()));
            interaction.setContact(contact);
        }

        Interaction saved = interactionRepository.save(interaction);
        
        // Recalculate last_interaction_at
        updateProspectLastInteraction(prospect.getId());

        return ResponseEntity.status(HttpStatus.CREATED).body(convertToDto(saved));
    }

    @PutMapping("/{id}")
    @Transactional
    public ResponseEntity<?> updateInteraction(@PathVariable Long id, @Valid @RequestBody InteractionDto dto) {
        return interactionRepository.findById(id)
                .map(interaction -> {
                    interaction.setDate(dto.getDate());
                    interaction.setType(dto.getType());
                    interaction.setNotes(dto.getNotes());
                    
                    if (dto.getContactId() != null) {
                        Contact contact = contactRepository.findById(dto.getContactId())
                                .orElseThrow(() -> new IllegalArgumentException("Contact non trouvé avec l'id : " + dto.getContactId()));
                        interaction.setContact(contact);
                    } else {
                        interaction.setContact(null);
                    }

                    Interaction saved = interactionRepository.save(interaction);
                    
                    // Recalculate last_interaction_at for the associated prospect
                    updateProspectLastInteraction(interaction.getProspect().getId());

                    return ResponseEntity.ok(convertToDto(saved));
                })
                .orElse(ResponseEntity.notFound().build());
    }

    @DeleteMapping("/{id}")
    @Transactional
    public ResponseEntity<?> deleteInteraction(@PathVariable Long id) {
        return interactionRepository.findById(id)
                .map(interaction -> {
                    Long prospectId = interaction.getProspect().getId();
                    interactionRepository.delete(interaction);
                    
                    // Recalculate last_interaction_at
                    updateProspectLastInteraction(prospectId);
                    
                    return ResponseEntity.noContent().build();
                })
                .orElse(ResponseEntity.notFound().build());
    }

    private void updateProspectLastInteraction(Long prospectId) {
        Prospect prospect = prospectRepository.findById(prospectId)
                .orElseThrow(() -> new IllegalArgumentException("Prospect non trouvé avec l'id : " + prospectId));
        
        Instant maxDate = interactionRepository.findMaxDateByProspectId(prospectId).orElse(null);
        prospect.setLastInteractionAt(maxDate);
        prospectRepository.save(prospect);
    }

    private InteractionDto convertToDto(Interaction i) {
        InteractionDto dto = new InteractionDto();
        dto.setId(i.getId());
        dto.setProspect(i.getProspect().getId());
        dto.setDate(i.getDate());
        dto.setType(i.getType());
        dto.setNotes(i.getNotes());
        dto.setCreatedAt(i.getCreatedAt());
        if (i.getContact() != null) {
            dto.setContactId(i.getContact().getId());
            dto.setContactName(i.getContact().getFirstName() + " " + i.getContact().getLastName());
        }
        return dto;
    }
}
