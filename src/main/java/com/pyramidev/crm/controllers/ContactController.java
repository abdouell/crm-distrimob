package com.pyramidev.crm.controllers;

import com.pyramidev.crm.dto.ContactDto;
import com.pyramidev.crm.models.Contact;
import com.pyramidev.crm.models.Prospect;
import com.pyramidev.crm.repositories.ContactRepository;
import com.pyramidev.crm.repositories.ProspectRepository;
import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/contacts")
public class ContactController {

    private final ContactRepository contactRepository;
    private final ProspectRepository prospectRepository;

    public ContactController(ContactRepository contactRepository, ProspectRepository prospectRepository) {
        this.contactRepository = contactRepository;
        this.prospectRepository = prospectRepository;
    }

    @GetMapping
    public ResponseEntity<List<ContactDto>> getContacts(@RequestParam(name = "prospect", required = false) Long prospectId) {
        List<Contact> contacts;
        if (prospectId != null) {
            contacts = contactRepository.findByProspectId(prospectId);
        } else {
            contacts = contactRepository.findAll();
        }
        
        List<ContactDto> dtos = contacts.stream()
                .map(this::convertToDto)
                .collect(Collectors.toList());
        return ResponseEntity.ok(dtos);
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> getContactById(@PathVariable Long id) {
        return contactRepository.findById(id)
                .map(c -> ResponseEntity.ok(convertToDto(c)))
                .orElse(ResponseEntity.notFound().build());
    }

    @PostMapping
    public ResponseEntity<?> createContact(@Valid @RequestBody ContactDto dto) {
        Prospect prospect = prospectRepository.findById(dto.getProspect())
                .orElseThrow(() -> new IllegalArgumentException("Prospect non trouvé avec l'id : " + dto.getProspect()));

        Contact contact = new Contact();
        contact.setProspect(prospect);
        contact.setFirstName(dto.getFirstName());
        contact.setLastName(dto.getLastName());
        contact.setJobTitle(dto.getJobTitle());
        contact.setEmail(dto.getEmail());
        contact.setPhone(dto.getPhone());
        contact.setLinkedinUrl(dto.getLinkedinUrl());
        contact.setNotes(dto.getNotes());

        Contact saved = contactRepository.save(contact);
        return ResponseEntity.status(HttpStatus.CREATED).body(convertToDto(saved));
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> updateContact(@PathVariable Long id, @Valid @RequestBody ContactDto dto) {
        return contactRepository.findById(id)
                .map(contact -> {
                    contact.setFirstName(dto.getFirstName());
                    contact.setLastName(dto.getLastName());
                    contact.setJobTitle(dto.getJobTitle());
                    contact.setEmail(dto.getEmail());
                    contact.setPhone(dto.getPhone());
                    contact.setLinkedinUrl(dto.getLinkedinUrl());
                    contact.setNotes(dto.getNotes());

                    Contact saved = contactRepository.save(contact);
                    return ResponseEntity.ok(convertToDto(saved));
                })
                .orElse(ResponseEntity.notFound().build());
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteContact(@PathVariable Long id) {
        return contactRepository.findById(id)
                .map(c -> {
                    contactRepository.delete(c);
                    return ResponseEntity.noContent().build();
                })
                .orElse(ResponseEntity.notFound().build());
    }

    private ContactDto convertToDto(Contact c) {
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
}
