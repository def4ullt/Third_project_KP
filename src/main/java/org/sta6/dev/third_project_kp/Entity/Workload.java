package org.sta6.dev.third_project_kp.Entity;

import jakarta.persistence.*;

@Entity
@Table(name = "workloads")
@IdClass(WorkloadId.class)
public class Workload {

    @Id
    @Column(name = "teacher_id")
    private Long teacher_Id;

    @Id
    @Column(name = "subject_id")
    private Long subject_Id;

    @Id
    @Column(name = "group_id")
    private String group_Id;

    @Id
    @Column(name = "year")
    private Integer year;

    @Column(name = "owner")
    private Integer owner;

    @Column(name = "lecture_hours")
    private Integer lecture_Hours;

    @Column(name = "practical_hours")
    private Integer practical_Hours;

    @ManyToOne
    @JoinColumn(name = "teacher_id", insertable = false, updatable = false)
    private Teacher teacher;

    @ManyToOne
    @JoinColumn(name = "subject_id", insertable = false, updatable = false)
    private Subject subject;

    @ManyToOne
    @JoinColumn(name = "owner", insertable = false, updatable = false)
    private logindata owner_info;

    // Гетери й сетери...

    public Long getTeacher_Id() {
        return teacher_Id;
    }

    public void setTeacher_Id(Long teacherId) {
        this.teacher_Id = teacherId;
    }

    public Long getSubject_Id() {
        return subject_Id;
    }

    public void setSubject_Id(Long subjectId) {
        this.subject_Id = subjectId;
    }

    public String getGroup_Id() {
        return group_Id;
    }

    public void setGroup_Id(String groupId) {
        this.group_Id = groupId;
    }

    public Integer getYear() {
        return year;
    }

    public void setYear(Integer year) {
        this.year = year;
    }

    public Integer getLecture_Hours() {
        return lecture_Hours;
    }

    public void setLecture_Hours(Integer lectureHours) {
        this.lecture_Hours = lectureHours;
    }

    public Integer getPractical_Hours() {
        return practical_Hours;
    }

    public void setPractical_Hours(Integer practicalHours) {
        this.practical_Hours = practicalHours;
    }

    public Teacher getTeacher() {
        return teacher;
    }

    public Subject getSubject() {
        return subject;
    }

    public Integer getOwner() {
        return owner;
    }

    public void setOwner(Integer owner) {
        this.owner = owner;
    }

    public void setTeacher(Teacher teacher) {
        this.teacher = teacher;
    }

    public void setSubject(Subject subject) {
        this.subject = subject;
    }

    public logindata getOwner_info() {
        return owner_info;
    }

    public void setOwner_info(logindata owner_info) {
        this.owner_info = owner_info;
    }
}
