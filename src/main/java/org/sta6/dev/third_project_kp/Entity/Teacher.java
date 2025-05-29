package org.sta6.dev.third_project_kp.Entity;

import jakarta.persistence.*;

@Entity
public class Teacher {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)

    private Long teacher_Id;

    private String last_Name;
    private String first_Name;
    private String second_name;
    private String academic_degree;
    private String position;
    private int experience;

    public Long getTeacher_Id() {
        return teacher_Id;
    }

    public String getLast_Name() {
        return last_Name;
    }

    public String getFirst_Name() {
        return first_Name;
    }

    public String getSecond_name() {
        return second_name;
    }

    public String getAcademic_degree() {
        return academic_degree;
    }

    public String getPosition() {
        return position;
    }

    public int getExperience() {
        return experience;
    }


    public void setTeacher_Id(Long teacherId) {
        this.teacher_Id = teacherId;
    }

    public void setLast_Name(String lastName) {
        this.last_Name = lastName;
    }

    public void setFirst_Name(String firstName) {
        this.first_Name = firstName;
    }

    public void setSecond_name(String second_name) {
        this.second_name = second_name;
    }

    public void setAcademic_degree(String qualification) {
        this.academic_degree = qualification;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public void setExperience(int experience) {
        this.experience = experience;
    }
}
