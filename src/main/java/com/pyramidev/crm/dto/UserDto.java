package com.pyramidev.crm.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import java.time.Instant;

public class UserDto {
    private Long id;
    private String email;
    
    @JsonProperty("full_name")
    private String fullName;
    
    @JsonProperty("created_at")
    private Instant createdAt;

    public UserDto() {}

    public UserDto(Long id, String email, String fullName, Instant createdAt) {
        this.id = id;
        this.email = email;
        this.fullName = fullName;
        this.createdAt = createdAt;
    }

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getFullName() { return fullName; }
    public void setFullName(String fullName) { this.fullName = fullName; }

    public Instant getCreatedAt() { return createdAt; }
    public void setCreatedAt(Instant createdAt) { this.createdAt = createdAt; }
}
