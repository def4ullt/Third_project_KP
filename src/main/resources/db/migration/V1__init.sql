create table subjects(
    subject_id  serial  primary key,
    name    varchar(25),
    hours   int
);

create table teachers(
    teacher_id  serial primary key,
    last_name   varchar(20),
    first_name  varchar(20),
    second_name varchar(20),
    academic_degree varchar(35),
    position    varchar(20),
    experience  int
);

create table workloads(
    teacher_id int,
    subject_id int,
    group_id varchar(10),
    year   int,
    lecture_hours   int,
    practical_hours int,
    primary key (teacher_id, subject_id, group_id, year),
    foreign key (teacher_id) references teachers(teacher_id),
    foreign key (subject_id) references subjects(subject_id)
);