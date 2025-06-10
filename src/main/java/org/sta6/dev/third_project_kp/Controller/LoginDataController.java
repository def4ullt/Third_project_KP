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

    // Відображення таблиці користувачів
    @GetMapping
    public String getAllUsers(Model model) {
        List<logindata> users = (List<logindata>) loginDataRepository.findAll();
        model.addAttribute("loginData", users);
        model.addAttribute("newUser", new logindata()); // Для форми додавання
        return "adminPanel";
    }

    // Додавання користувача
    @PostMapping("/add")
    public String addUser(@ModelAttribute("newUser") logindata user) {
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        loginDataRepository.save(user);
        return "redirect:/adminPanel";
    }

    // Відображення форми редагування
    @GetMapping("/edit/{id}")
    public String editUserForm(@PathVariable Long id, Model model) {
        logindata user = loginDataRepository.findById(id).orElseThrow();
        model.addAttribute("user", user);
        return "user_edit";
    }

    // Оновлення користувача
    @PostMapping("/update")
    public String updateUser(@ModelAttribute logindata updatedUser) {
        logindata existingUser = loginDataRepository.findById(updatedUser.getId()).orElseThrow();

        existingUser.setUsername(updatedUser.getUsername());
        existingUser.setRole(updatedUser.getRole());

        if (updatedUser.getPassword() != null && !updatedUser.getPassword().isEmpty()) {
            existingUser.setPassword(passwordEncoder.encode(updatedUser.getPassword()));
        }

        loginDataRepository.save(existingUser);
        return "redirect:/adminPanel";
    }


    @DeleteMapping("/{id}")
    public void deleteById(@PathVariable Long id ) {
        loginDataRepository.deleteById(id);
    }
}
