package com.pyramidev.crm.dto;

import com.fasterxml.jackson.annotation.JsonAlias;
import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import java.time.Instant;

public class InteractionDto {
    private Long id;
    
    @NotNull(message = "L'ID du prospect est obligatoire")
    private Long prospect; // Maps to Django API field "prospect"
    
    @NotNull(message = "La date est obligatoire")
    private Instant date;
    
    @NotBlank(message = "Le type d'échange est obligatoire")
    private String type;
    
    @NotBlank(message = "Les notes sont obligatoires")
    private String notes;
    
    @JsonProperty("contact_id")
    @JsonAlias({"contact_id", "contactId"})
    private Long contactId;

    @JsonProperty("contact_name")
    @JsonAlias({"contact_name", "contactName"})
    private String contactName;
    
    @JsonProperty("created_at")
    @JsonAlias({"created_at", "createdAt"})
    private Instant createdAt;

    public InteractionDto() {}

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public Long getProspect() { return prospect; }
    public void setProspect(Long prospect) { this.prospect = prospect; }

    public Long getContactId() { return contactId; }
    public void setContactId(Long contactId) { this.contactId = contactId; }

    public String getContactName() { return contactName; }
    public void setContactName(String contactName) { this.contactName = contactName; }

    public Instant getDate() { return date; }
    public void setDate(Instant date) { this.date = date; }

    public String getType() { return type; }
    public void setType(String type) { this.type = type; }

    public String getNotes() { return notes; }
    public void setNotes(String notes) { this.notes = notes; }

    public Instant getCreatedAt() { return createdAt; }
    public void setCreatedAt(Instant createdAt) { this.createdAt = createdAt; }
}
