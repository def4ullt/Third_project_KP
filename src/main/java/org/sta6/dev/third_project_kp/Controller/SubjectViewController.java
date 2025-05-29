package org.sta6.dev.third_project_kp.Controller;

import org.springframework.beans.factory.annotation.Autowired;
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
    public String showSubjects(Model model) {
        model.addAttribute("subjects", subjectRepository.findAll());
        return "subject";
    }
}
