package org.sta6.dev.third_project_kp.Controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

    @GetMapping("/")
    public String showMain(Authentication authentication, Model model) {
            if (authentication != null && authentication.isAuthenticated()) {
                model.addAttribute("username", authentication.getName());
                boolean isAdmin = authentication.getAuthorities().stream()
                        .anyMatch(auth -> auth.getAuthority().equals("ROLE_ADMIN"));
                model.addAttribute("isAdmin", isAdmin);
            } else {
                model.addAttribute("username", null);
                model.addAttribute("isAdmin", false);
            }
            return "main";
        }
    @GetMapping("/login")
    public String showLogin(Model model) {
        return "login";
    }

    @GetMapping("/register")
    public String showRegister(Model model) {
        return "register";
    }
}
