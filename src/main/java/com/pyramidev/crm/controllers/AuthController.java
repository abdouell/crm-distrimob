package com.pyramidev.crm.controllers;

import com.pyramidev.crm.config.JwtService;
import com.pyramidev.crm.dto.LoginRequest;
import com.pyramidev.crm.dto.LoginResponse;
import com.pyramidev.crm.dto.UserDto;
import com.pyramidev.crm.models.User;
import com.pyramidev.crm.repositories.UserRepository;
import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/api/auth")
public class AuthController {

    private final AuthenticationManager authenticationManager;
    private final UserRepository userRepository;
    private final JwtService jwtService;

    public AuthController(AuthenticationManager authenticationManager, UserRepository userRepository, JwtService jwtService) {
        this.authenticationManager = authenticationManager;
        this.userRepository = userRepository;
        this.jwtService = jwtService;
    }

    @PostMapping("/login")
    public ResponseEntity<?> login(@Valid @RequestBody LoginRequest request) {
        try {
            Authentication authentication = authenticationManager.authenticate(
                    new UsernamePasswordAuthenticationToken(request.getEmail(), request.getPassword())
            );
            User user = (User) authentication.getPrincipal();
            String jwtToken = jwtService.generateToken(user);
            
            UserDto userDto = new UserDto(user.getId(), user.getEmail(), user.getFullName(), user.getCreatedAt());
            return ResponseEntity.ok(new LoginResponse(jwtToken, userDto));
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
                    .body(Map.of("error", "Identifiants invalides."));
        }
    }
}
