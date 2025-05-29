package org.sta6.dev.third_project_kp.Entity;

import java.io.Serializable;
import java.util.Objects;

public class WorkloadId implements Serializable {

    private Long teacher_Id;
    private Long subject_Id;
    private String group_Id;
    private Integer year;

    public WorkloadId() {}

    public WorkloadId(Long teacher_Id, Long subject_Id, String group_Id, Integer year) {
        this.teacher_Id = teacher_Id;
        this.subject_Id = subject_Id;
        this.group_Id = group_Id;
        this.year = year;
    }

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

    // hashCode і equals (важливо!!!)
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof WorkloadId)) return false;
        WorkloadId that = (WorkloadId) o;
        return Objects.equals(teacher_Id, that.teacher_Id) &&
                Objects.equals(subject_Id, that.subject_Id) &&
                Objects.equals(group_Id, that.group_Id) &&
                Objects.equals(year, that.year);
    }

    @Override
    public int hashCode() {
        return Objects.hash(teacher_Id, subject_Id, group_Id, year);
    }
}

