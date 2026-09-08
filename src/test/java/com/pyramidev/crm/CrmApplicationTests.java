package com.pyramidev.crm;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.pyramidev.crm.dto.LoginRequest;
import com.pyramidev.crm.models.Contact;
import com.pyramidev.crm.models.Interaction;
import com.pyramidev.crm.models.Prospect;
import com.pyramidev.crm.models.User;
import com.pyramidev.crm.repositories.ContactRepository;
import com.pyramidev.crm.repositories.InteractionRepository;
import com.pyramidev.crm.repositories.ProspectRepository;
import com.pyramidev.crm.repositories.UserRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.transaction.annotation.Transactional;

import java.time.Instant;
import java.time.temporal.ChronoUnit;
import java.util.List;

import static org.hamcrest.Matchers.*;
import static org.junit.jupiter.api.Assertions.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@SpringBootTest
@AutoConfigureMockMvc
@Transactional
public class CrmApplicationTests {

    @Autowired
    private MockMvc mockMvc;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ProspectRepository prospectRepository;

    @Autowired
    private InteractionRepository interactionRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private ObjectMapper objectMapper;

    private User testUser;

    @BeforeEach
    public void setUp() {
        interactionRepository.deleteAll();
        prospectRepository.deleteAll();
        userRepository.deleteAll();

        // Create a test user
        testUser = new User();
        testUser.setEmail("test@pyramidev.com");
        testUser.setFullName("User Test");
        testUser.setPasswordHash(passwordEncoder.encode("Password123!"));
        testUser = userRepository.save(testUser);
    }

    @Test
    public void testUserAuthenticationFlow() throws Exception {
        LoginRequest request = new LoginRequest();
        request.setEmail("test@pyramidev.com");
        request.setPassword("Password123!");

        // Valid Login
        mockMvc.perform(post("/api/auth/login")
                .contentType(MediaType.APPLICATION_JSON)
                .content(objectMapper.writeValueAsString(request)))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.token").exists())
                .andExpect(jsonPath("$.user.email").value("test@pyramidev.com"))
                .andExpect(jsonPath("$.user.full_name").value("User Test"));

        // Invalid Login
        request.setPassword("wrongpassword");
        mockMvc.perform(post("/api/auth/login")
                .contentType(MediaType.APPLICATION_JSON)
                .content(objectMapper.writeValueAsString(request)))
                .andExpect(status().isUnauthorized());
    }

    @Test
    public void testUnauthenticatedApiProtection() throws Exception {
        mockMvc.perform(get("/api/prospects"))
                .andExpect(status().isForbidden()); // Security config rejects with 403 Forbidden without JWT
    }

    @Test
    public void testLastInteractionAtCalculationAndSortingNullsFirst() throws Exception {
        // 1. Create a prospect
        Prospect prospect1 = new Prospect();
        prospect1.setName("Acme Local");
        prospect1.setActivitySector("pharma");
        prospect1.setCity("Paris");
        prospect1.setPhone("0102030405");
        prospect1.setSource("salon");
        prospect1.setOwner(testUser);
        prospect1 = prospectRepository.save(prospect1);

        assertNull(prospect1.getLastInteractionAt());

        // 2. Create another prospect
        Prospect prospect2 = new Prospect();
        prospect2.setName("Beta Corp");
        prospect2.setActivitySector("grossiste");
        prospect2.setCity("Lyon");
        prospect2.setPhone("0202020202");
        prospect2.setSource("LinkedIn");
        prospect2.setOwner(testUser);
        prospect2 = prospectRepository.save(prospect2);

        // 3. Add first interaction to prospect 1 (D1)
        Instant d1 = Instant.now().minus(10, ChronoUnit.DAYS);
        Interaction i1 = new Interaction();
        i1.setProspect(prospect1);
        i1.setDate(d1);
        i1.setType("appel");
        i1.setNotes("First call");
        interactionRepository.save(i1);

        // Update last interaction date (controller logic does it inside transaction, we simulate it here)
        prospect1.setLastInteractionAt(interactionRepository.findMaxDateByProspectId(prospect1.getId()).orElse(null));
        prospect1 = prospectRepository.save(prospect1);
        assertEquals(d1.truncatedTo(ChronoUnit.MILLIS), prospect1.getLastInteractionAt().truncatedTo(ChronoUnit.MILLIS));

        // 4. Add second newer interaction to prospect 1 (D2 > D1)
        Instant d2 = Instant.now().minus(2, ChronoUnit.DAYS);
        Interaction i2 = new Interaction();
        i2.setProspect(prospect1);
        i2.setDate(d2);
        i2.setType("RDV");
        i2.setNotes("Meeting");
        interactionRepository.save(i2);

        prospect1.setLastInteractionAt(interactionRepository.findMaxDateByProspectId(prospect1.getId()).orElse(null));
        prospect1 = prospectRepository.save(prospect1);
        assertEquals(d2.truncatedTo(ChronoUnit.MILLIS), prospect1.getLastInteractionAt().truncatedTo(ChronoUnit.MILLIS));

        // 5. Add older interaction to prospect 1 (D3 < D2)
        Instant d3 = Instant.now().minus(5, ChronoUnit.DAYS);
        Interaction i3 = new Interaction();
        i3.setProspect(prospect1);
        i3.setDate(d3);
        i3.setType("email");
        i3.setNotes("Email mid");
        interactionRepository.save(i3);

        prospect1.setLastInteractionAt(interactionRepository.findMaxDateByProspectId(prospect1.getId()).orElse(null));
        prospect1 = prospectRepository.save(prospect1);
        assertEquals(d2.truncatedTo(ChronoUnit.MILLIS), prospect1.getLastInteractionAt().truncatedTo(ChronoUnit.MILLIS)); // Should remain D2 (max)

        // 6. Delete newer interaction i2
        interactionRepository.delete(i2);
        prospect1.setLastInteractionAt(interactionRepository.findMaxDateByProspectId(prospect1.getId()).orElse(null));
        prospect1 = prospectRepository.save(prospect1);
        assertEquals(d3.truncatedTo(ChronoUnit.MILLIS), prospect1.getLastInteractionAt().truncatedTo(ChronoUnit.MILLIS)); // New max should be D3

        // 7. Verify Sorting ordering=last_interaction_at_asc (prospect2 has null, prospect1 has d3, so prospect2 first)
        List<Prospect> sortedAsc = prospectRepository.findAllFilteredOrderByLastInteractionAtAscNullsFirst(null, null, null);
        assertEquals(2, sortedAsc.size());
        assertEquals(prospect2.getId(), sortedAsc.get(0).getId()); // Nulls first
        assertEquals(prospect1.getId(), sortedAsc.get(1).getId());
    }
}
