package org.sta6.dev.third_project_kp.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.sta6.dev.third_project_kp.Entity.logindata;
import org.sta6.dev.third_project_kp.Repository.loginDataRepository;

import java.util.List;

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

    // Додавання або оновлення користувача
    @PostMapping("/save")
    public String saveUser(@ModelAttribute logindata user) {
        logindata existing = loginDataRepository.findById(user.getId()).orElseThrow();
        existing.setUsername(user.getUsername());
        existing.setRole(user.getRole());

        if (user.getPassword() != null && !user.getPassword().isEmpty()) {
            existing.setPassword(passwordEncoder.encode(user.getPassword()));
        }

        loginDataRepository.save(existing);

        return "redirect:/user";
    }

    // Видалення
    @DeleteMapping("/{id}")
    public void deleteById(@PathVariable Long id) {
        loginDataRepository.deleteById(id);
    }
}
