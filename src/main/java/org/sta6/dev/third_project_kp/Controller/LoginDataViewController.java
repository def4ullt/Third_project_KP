package org.sta6.dev.third_project_kp.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.sta6.dev.third_project_kp.Repository.loginDataRepository;

@Controller
public class LoginDataViewController {

    private final loginDataRepository loginDataRepository;

    @Autowired
    public LoginDataViewController(loginDataRepository loginDataRepository) {
        this.loginDataRepository = loginDataRepository;
    }

    @GetMapping("/adminPanel")
    public String showLoginData(Model model) {
        model.addAttribute("loginData", loginDataRepository.findAll());
        model.addAttribute("editingUser", null);
        return "admin";
    }
}