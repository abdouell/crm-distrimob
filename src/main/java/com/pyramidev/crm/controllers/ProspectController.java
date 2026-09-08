package com.pyramidev.crm.controllers;

import com.pyramidev.crm.dto.ContactDto;
import com.pyramidev.crm.dto.InteractionDto;
import com.pyramidev.crm.dto.ProspectDto;
import com.pyramidev.crm.models.Contact;
import com.pyramidev.crm.models.Interaction;
import com.pyramidev.crm.models.Prospect;
import com.pyramidev.crm.models.User;
import com.pyramidev.crm.repositories.ProspectRepository;
import com.pyramidev.crm.repositories.UserRepository;
import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/prospects")
public class ProspectController {

    private final ProspectRepository prospectRepository;
    private final UserRepository userRepository;

    public ProspectController(ProspectRepository prospectRepository, UserRepository userRepository) {
        this.prospectRepository = prospectRepository;
        this.userRepository = userRepository;
    }

    private User getCurrentUser() {
        return (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    }

    @GetMapping
    public ResponseEntity<List<ProspectDto>> getAllProspects(
            @RequestParam(required = false) String search,
            @RequestParam(required = false) String status,
            @RequestParam(name = "activity_sector", required = false) String activitySector,
            @RequestParam(required = false, defaultValue = "-created_at") String ordering) {
        
        // Clean empty parameters
        String searchParam = (search == null || search.trim().isEmpty()) ? null : search;
        String statusParam = (status == null || status.trim().isEmpty()) ? null : status;
        String sectorParam = (activitySector == null || activitySector.trim().isEmpty()) ? null : activitySector;
        
        List<Prospect> prospects;
        
        switch (ordering) {
            case "created_at":
                prospects = prospectRepository.findAllFilteredOrderByCreatedAtAsc(searchParam, statusParam, sectorParam);
                break;
            case "last_interaction_at_asc":
                prospects = prospectRepository.findAllFilteredOrderByLastInteractionAtAscNullsFirst(searchParam, statusParam, sectorParam);
                break;
            case "last_interaction_at_desc":
                prospects = prospectRepository.findAllFilteredOrderByLastInteractionAtDescNullsLast(searchParam, statusParam, sectorParam);
                break;
            case "-created_at":
            default:
                prospects = prospectRepository.findAllFilteredOrderByCreatedAtDesc(searchParam, statusParam, sectorParam);
                break;
        }

        List<ProspectDto> dtos = prospects.stream()
                .map(this::convertToDto)
                .collect(Collectors.toList());
        
        return ResponseEntity.ok(dtos);
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> getProspectById(@PathVariable Long id) {
        return prospectRepository.findById(id)
                .map(p -> ResponseEntity.ok(convertToDto(p)))
                .orElse(ResponseEntity.notFound().build());
    }

    @PostMapping
    public ResponseEntity<?> createProspect(@Valid @RequestBody ProspectDto dto) {
        User currentUser = getCurrentUser();
        
        Prospect prospect = new Prospect();
        prospect.setName(dto.getName());
        prospect.setActivitySector(dto.getActivitySector());
        prospect.setCity(dto.getCity());
        prospect.setPhone(dto.getPhone());
        prospect.setWebsite(dto.getWebsite());
        prospect.setSource(dto.getSource());
        prospect.setStatus(dto.getStatus() != null ? dto.getStatus() : "nouveau");
        prospect.setNotes(dto.getNotes());
        prospect.setOwner(currentUser);

        Prospect saved = prospectRepository.save(prospect);
        return ResponseEntity.status(HttpStatus.CREATED).body(convertToDto(saved));
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> updateProspect(@PathVariable Long id, @Valid @RequestBody ProspectDto dto) {
        return prospectRepository.findById(id)
                .map(prospect -> {
                    prospect.setName(dto.getName());
                    prospect.setActivitySector(dto.getActivitySector());
                    prospect.setCity(dto.getCity());
                    prospect.setPhone(dto.getPhone());
                    prospect.setWebsite(dto.getWebsite());
                    prospect.setSource(dto.getSource());
                    prospect.setStatus(dto.getStatus());
                    prospect.setNotes(dto.getNotes());
                    
                    Prospect saved = prospectRepository.save(prospect);
                    return ResponseEntity.ok(convertToDto(saved));
                })
                .orElse(ResponseEntity.notFound().build());
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteProspect(@PathVariable Long id) {
        return prospectRepository.findById(id)
                .map(p -> {
                    prospectRepository.delete(p);
                    return ResponseEntity.noContent().build();
                })
                .orElse(ResponseEntity.notFound().build());
    }

    // Helper conversion methods
    private ProspectDto convertToDto(Prospect p) {
        ProspectDto dto = new ProspectDto();
        dto.setId(p.getId());
        dto.setName(p.getName());
        dto.setActivitySector(p.getActivitySector());
        dto.setCity(p.getCity());
        dto.setPhone(p.getPhone());
        dto.setWebsite(p.getWebsite());
        dto.setSource(p.getSource());
        dto.setStatus(p.getStatus());
        dto.setNotes(p.getNotes());
        dto.setCreatedAt(p.getCreatedAt());
        dto.setLastInteractionAt(p.getLastInteractionAt());
        dto.setOwner(p.getOwner().getId());
        dto.setOwnerName(p.getOwner().getFullName());

        if (p.getContacts() != null) {
            dto.setContacts(p.getContacts().stream().map(this::convertContactToDto).collect(Collectors.toList()));
        }
        if (p.getInteractions() != null) {
            dto.setInteractions(p.getInteractions().stream().map(this::convertInteractionToDto).collect(Collectors.toList()));
        }
        return dto;
    }

    private ContactDto convertContactToDto(Contact c) {
        ContactDto dto = new ContactDto();
        dto.setId(c.getId());
        dto.setProspect(c.getProspect().getId());
        dto.setFirstName(c.getFirstName());
        dto.setLastName(c.getLastName());
        dto.setJobTitle(c.getJobTitle());
        dto.setEmail(c.getEmail());
        dto.setPhone(c.getPhone());
        dto.setLinkedinUrl(c.getLinkedinUrl());
        dto.setNotes(c.getNotes());
        return dto;
    }

    private InteractionDto convertInteractionToDto(Interaction i) {
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
