package org.sta6.dev.third_project_kp.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.sta6.dev.third_project_kp.Repository.SubjectRepository;

@Controller
public class SubjectViewController {

    private final SubjectRepository subjectRepository;

    @Autowired
    public SubjectViewController(SubjectRepository subjectRepository) {
        this.subjectRepository = subjectRepository;
    }

    @GetMapping("/subject")
    public String showSubjects(Authentication authentication, Model model) {
        if (authentication != null && authentication.isAuthenticated()) {
            model.addAttribute("username", authentication.getName());
            boolean isAdmin = authentication.getAuthorities().stream()
                    .anyMatch(auth -> auth.getAuthority().equals("ROLE_ADMIN"));
            model.addAttribute("isAdmin", isAdmin);
        } else {
            model.addAttribute("username", null);
            model.addAttribute("isAdmin", false);
        }
        model.addAttribute("subjects", subjectRepository.findAll());
        return "subject";
    }
}
