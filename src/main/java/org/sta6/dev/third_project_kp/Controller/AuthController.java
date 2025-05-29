package org.sta6.dev.third_project_kp.Controller;

import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.sta6.dev.dto.RegisterRequest;
import org.sta6.dev.third_project_kp.Entity.logindata;
import org.sta6.dev.third_project_kp.Repository.loginDataRepository;


@RestController
@RequestMapping("/api")
public class AuthController {

    private final loginDataRepository loginDataRepository;
    private final PasswordEncoder passwordEncoder;

    @Autowired
    public AuthController(loginDataRepository loginDataRepository, PasswordEncoder passwordEncoder) {
        this.loginDataRepository = loginDataRepository;
        this.passwordEncoder = passwordEncoder;
    }

    @PostMapping("/register")
    public ResponseEntity<?> register(@RequestBody @Valid RegisterRequest registerRequest) {
        // Перевірка наявності користувача
        if (loginDataRepository.existsByUsername(registerRequest.getUsername())) {
            return ResponseEntity.badRequest().body("Користувач з таким логіном вже існує");
        }

        // Валідація пароля
        if (registerRequest.getPassword() == null || registerRequest.getPassword().trim().isEmpty()) {
            return ResponseEntity.badRequest().body("Пароль не може бути порожнім");
        }

        // Створення нового користувача
        logindata loginData = new logindata();
        loginData.setUsername(registerRequest.getUsername());
        loginData.setPassword(passwordEncoder.encode(registerRequest.getPassword()));
        loginData.setRole("ROLE_USER");

        loginDataRepository.save(loginData);

        return ResponseEntity.ok("Користувача успішно зареєстровано");
    }
}