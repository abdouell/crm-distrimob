package com.pyramidev.crm.dto;

import com.fasterxml.jackson.annotation.JsonAlias;
import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.validation.constraints.NotBlank;
import java.time.Instant;
import java.util.List;

public class ProspectDto {
    private Long id;

    @NotBlank(message = "Le nom de l'entreprise est obligatoire")
    private String name;

    @NotBlank(message = "Le secteur d'activité est obligatoire")
    @JsonProperty("activity_sector")
    @JsonAlias({"activity_sector", "activitySector"})
    private String activitySector;

    @NotBlank(message = "La ville est obligatoire")
    private String city;

    @NotBlank(message = "Le numéro de téléphone est obligatoire")
    private String phone;

    private String website;

    @NotBlank(message = "La provenance/source est obligatoire")
    private String source;

    private String status;

    private String notes;

    @JsonProperty("created_at")
    @JsonAlias({"created_at", "createdAt"})
    private Instant createdAt;

    @JsonProperty("last_interaction_at")
    @JsonAlias({"last_interaction_at", "lastInteractionAt"})
    private Instant lastInteractionAt;

    private Long owner;

    @JsonProperty("owner_name")
    @JsonAlias({"owner_name", "ownerName"})
    private String ownerName;

    private List<ContactDto> contacts;
    private List<InteractionDto> interactions;

    public ProspectDto() {}

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getActivitySector() { return activitySector; }
    public void setActivitySector(String activitySector) { this.activitySector = activitySector; }

    public String getCity() { return city; }
    public void setCity(String city) { this.city = city; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public String getWebsite() { return website; }
    public void setWebsite(String website) { this.website = website; }

    public String getSource() { return source; }
    public void setSource(String source) { this.source = source; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public String getNotes() { return notes; }
    public void setNotes(String notes) { this.notes = notes; }

    public Instant getCreatedAt() { return createdAt; }
    public void setCreatedAt(Instant createdAt) { this.createdAt = createdAt; }

    public Instant getLastInteractionAt() { return lastInteractionAt; }
    public void setLastInteractionAt(Instant lastInteractionAt) { this.lastInteractionAt = lastInteractionAt; }

    public Long getOwner() { return owner; }
    public void setOwner(Long owner) { this.owner = owner; }

    public String getOwnerName() { return ownerName; }
    public void setOwnerName(String ownerName) { this.ownerName = ownerName; }

    public List<ContactDto> getContacts() { return contacts; }
    public void setContacts(List<ContactDto> contacts) { this.contacts = contacts; }

    public List<InteractionDto> getInteractions() { return interactions; }
    public void setInteractions(List<InteractionDto> interactions) { this.interactions = interactions; }
}
