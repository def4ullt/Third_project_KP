package org.sta6.dev.third_project_kp.Controller;


import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;
import org.sta6.dev.third_project_kp.Entity.Subject;
import org.sta6.dev.third_project_kp.Entity.Teacher;
import org.sta6.dev.third_project_kp.Entity.logindata;
import org.sta6.dev.third_project_kp.Repository.SubjectRepository;
import org.sta6.dev.third_project_kp.Repository.TeacherRepository;
import org.sta6.dev.third_project_kp.Repository.WorkloadRepository;
import org.sta6.dev.third_project_kp.Repository.loginDataRepository;

import java.util.Optional;

@RestController
@RequestMapping("/subject")
public class SubjectController {

    private final SubjectRepository subjectRepository;

    private final loginDataRepository loginDataRepository;

    public SubjectController(SubjectRepository subjectRepository, loginDataRepository loginDataRepository) {
        this.subjectRepository = subjectRepository;
        this.loginDataRepository = loginDataRepository;
    }

    @PostMapping
    public Subject addSubject(Authentication authentication, @RequestBody Subject subject) {
        String currentUsername = authentication.getName(); // Отримуємо ім'я користувача

        // Шукаємо LoginData по username
        Optional<logindata> owner = loginDataRepository.findByUsername(currentUsername);
        subject.setOwner(owner.orElse(null)); // Встановлюємо об'єкт власника

        return subjectRepository.save(subject);
    }


    @PutMapping("/{id}")
    public Subject update(Authentication authentication, @PathVariable Long id, @RequestBody Subject updatedSubject) {
        String currentUsername = authentication.getName();
        Optional<logindata> owner = loginDataRepository.findByUsername(currentUsername);
        return subjectRepository.findById(id)
                .map(subject -> {
                    subject.setName(updatedSubject.getName());
                    subject.setHours(updatedSubject.getHours());
                    subject.setOwner(owner.orElse(null));
                    return subjectRepository.save(subject);
                })
                .orElseGet(() -> {
                    updatedSubject.setSubject_id(id);
                    return subjectRepository.save(updatedSubject);
                });
    }

    @DeleteMapping("/{id}")
    public void deleteById(@PathVariable Long id ) {
        subjectRepository.deleteById(id);
    }
}
