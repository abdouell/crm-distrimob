package com.pyramidev.crm.dto;

import com.fasterxml.jackson.annotation.JsonAlias;
import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

public class ContactDto {
    private Long id;
    
    @NotNull(message = "L'ID du prospect est obligatoire")
    private Long prospect; // Maps to Django API field "prospect"
    
    @NotBlank(message = "Le prénom est obligatoire")
    @JsonProperty("first_name")
    @JsonAlias({"first_name", "firstName"})
    private String firstName;
    
    @NotBlank(message = "Le nom est obligatoire")
    @JsonProperty("last_name")
    @JsonAlias({"last_name", "lastName"})
    private String lastName;
    
    @NotBlank(message = "La fonction est obligatoire")
    @JsonProperty("job_title")
    @JsonAlias({"job_title", "jobTitle"})
    private String jobTitle;
    
    @NotBlank(message = "L'adresse email est obligatoire")
    @Email(message = "Format d'email invalide")
    private String email;
    
    @NotBlank(message = "Le numéro de téléphone est obligatoire")
    private String phone;
    
    @JsonProperty("linkedin_url")
    @JsonAlias({"linkedin_url", "linkedinUrl"})
    private String linkedinUrl;
    
    private String notes;

    public ContactDto() {}

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public Long getProspect() { return prospect; }
    public void setProspect(Long prospect) { this.prospect = prospect; }

    public String getFirstName() { return firstName; }
    public void setFirstName(String firstName) { this.firstName = firstName; }

    public String getLastName() { return lastName; }
    public void setLastName(String lastName) { this.lastName = lastName; }

    public String getJobTitle() { return jobTitle; }
    public void setJobTitle(String jobTitle) { this.jobTitle = jobTitle; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public String getLinkedinUrl() { return linkedinUrl; }
    public void setLinkedinUrl(String linkedinUrl) { this.linkedinUrl = linkedinUrl; }

    public String getNotes() { return notes; }
    public void setNotes(String notes) { this.notes = notes; }
}
