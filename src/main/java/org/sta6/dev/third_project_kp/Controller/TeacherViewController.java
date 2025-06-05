package org.sta6.dev.third_project_kp.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.sta6.dev.third_project_kp.Repository.TeacherRepository;

@Controller
public class TeacherViewController {

    private final TeacherRepository teacherRepository;

    @Autowired
    public TeacherViewController(TeacherRepository teacherRepository) {
        this.teacherRepository = teacherRepository;
    }

    @GetMapping("/teacher")
    public String showTeachers(Authentication authentication, Model model) {
        if (authentication != null && authentication.isAuthenticated()) {
            model.addAttribute("username", authentication.getName());
            boolean isAdmin = authentication.getAuthorities().stream()
                    .anyMatch(auth -> auth.getAuthority().equals("ROLE_ADMIN"));
            model.addAttribute("isAdmin", isAdmin);
        } else {
            model.addAttribute("username", null);
            model.addAttribute("isAdmin", false);
        }
        model.addAttribute("teachers", teacherRepository.findAll());
        return "teacher";
    }
}
