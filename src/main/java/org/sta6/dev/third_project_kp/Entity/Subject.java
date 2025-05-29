package org.sta6.dev.third_project_kp.Entity;

import jakarta.persistence.*;

@Entity
@Table(name = "subjects")
public class Subject {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long subject_id;

    private String name;
    private int hours;

    public Long getSubject_id() {
        return subject_id;
    }

    public void setSubject_id(Long id) {
        this.subject_id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getHours() {
        return hours;
    }

    public void setHours(int hours) {
        this.hours = hours;
    }
}
