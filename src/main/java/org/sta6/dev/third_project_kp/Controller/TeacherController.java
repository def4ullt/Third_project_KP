package org.sta6.dev.third_project_kp.Controller;


import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;
import org.sta6.dev.third_project_kp.Entity.Teacher;
import org.sta6.dev.third_project_kp.Entity.logindata;
import org.sta6.dev.third_project_kp.Repository.TeacherRepository;
import org.sta6.dev.third_project_kp.Repository.loginDataRepository;

import java.util.Optional;

@RestController
@RequestMapping("/teacher")
public class TeacherController {

    private final TeacherRepository teacherRepository;

    private final loginDataRepository loginDataRepository;

    public TeacherController(TeacherRepository teacherRepository, loginDataRepository loginDataRepository) {
        this.teacherRepository = teacherRepository;
        this.loginDataRepository = loginDataRepository;
    }

    @PostMapping
    public Teacher addTeacher(Authentication authentication, @RequestBody Teacher teacher) {
        String currentUsername = authentication.getName(); // Отримуємо ім'я користувача

        // Шукаємо LoginData по username
        Optional<logindata> owner = loginDataRepository.findByUsername(currentUsername);
        teacher.setOwner(owner.orElse(null)); // Встановлюємо об'єкт власника

        return teacherRepository.save(teacher);
    }


    @PutMapping("/{id}")
    public Teacher update(@PathVariable Long id, @RequestBody Teacher updatedTeacher) {
        return teacherRepository.findById(id)
                .map(subject -> {
                    subject.setLast_Name(updatedTeacher.getLast_Name());
                    subject.setFirst_Name(updatedTeacher.getFirst_Name());
                    subject.setSecond_name(updatedTeacher.getSecond_name());
                    subject.setAcademic_degree(updatedTeacher.getAcademic_degree());
                    subject.setPosition(updatedTeacher.getPosition());
                    subject.setExperience(updatedTeacher.getExperience());
                    return teacherRepository.save(subject);
                })
                .orElseGet(() -> {
                    updatedTeacher.setTeacher_Id(id);
                    return teacherRepository.save(updatedTeacher);
                });
    }

    @DeleteMapping("/{id}")
    public void deleteById(@PathVariable Long id ) {
        teacherRepository.deleteById(id);
    }
}
