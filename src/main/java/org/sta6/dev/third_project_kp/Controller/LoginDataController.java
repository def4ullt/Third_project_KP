package org.sta6.dev.third_project_kp.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.sta6.dev.third_project_kp.Entity.logindata;
import org.sta6.dev.third_project_kp.Repository.loginDataRepository;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/user")
public class LoginDataController {

    @Autowired
    private loginDataRepository loginDataRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    // Відображення всіх користувачів
    @GetMapping
    public String getAllUsers(Model model) {
        List<logindata> users = (List<logindata>) loginDataRepository.findAll();
        model.addAttribute("loginData", users);
        return "adminPanel";
    }

    @PostMapping("/save")
    public String saveUser(@ModelAttribute logindata user) {

        if (user.getId() != null) {
            // Оновлення існуючого
            logindata existing = loginDataRepository.findById(user.getId())
                    .orElseThrow(() -> new IllegalArgumentException("Користувача не знайдено: " + user.getId()));

            existing.setUsername(user.getUsername());
            existing.setRole(user.getRole());

            if (user.getPassword() != null && !user.getPassword().isEmpty()) {
                existing.setPassword(passwordEncoder.encode(user.getPassword()));
            }

            loginDataRepository.save(existing);
        } else {
            // Створення нового
            if (user.getPassword() == null || user.getPassword().isEmpty()) {
                throw new IllegalArgumentException("Пароль обов'язковий для нового користувача");
            }
            user.setPassword(passwordEncoder.encode(user.getPassword()));
            loginDataRepository.save(user);
        }

        return "redirect:/user";
    }


    @GetMapping("/edit/{id}")
    public String editUser(@PathVariable Long id, Model model) {
        logindata user = loginDataRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Користувача не знайдено: " + id));
        List<logindata> users = (List<logindata>) loginDataRepository.findAll();
        model.addAttribute("editingUser", user);
        model.addAttribute("loginData", users);
        return "admin";
    }

    // Видалення
    @DeleteMapping("/{id}")
    public void deleteById(@PathVariable Long id) {
        loginDataRepository.deleteById(id);
    }
}
