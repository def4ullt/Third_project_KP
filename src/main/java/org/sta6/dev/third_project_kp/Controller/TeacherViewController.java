package org.sta6.dev.third_project_kp.Controller;

import org.springframework.beans.factory.annotation.Autowired;
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

    @GetMapping("/")
    public String showTeachers(Model model) {
        model.addAttribute("teachers", teacherRepository.findAll());
        return "teacher";
    }
}
