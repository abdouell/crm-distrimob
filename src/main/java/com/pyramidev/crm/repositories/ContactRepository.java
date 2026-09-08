package com.pyramidev.crm.repositories;

import com.pyramidev.crm.models.Contact;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface ContactRepository extends JpaRepository<Contact, Long> {
    List<Contact> findByProspectId(Long prospectId);
}
