INSERT INTO subjects (name, hours) VALUES
    ('Математика', 120),
    ('Фізика', 90),
    ('Хімія', 80),
    ('Інформатика', 100)
ON CONFLICT DO NOTHING;

INSERT INTO teachers (last_name, first_name, second_name, academic_degree, position, experience) VALUES
    ('Іваненко', 'Олег', 'Петрович', 'кандидат фізико-математичних наук', 'доцент', 15),
    ('Петренко', 'Світлана', 'Іванівна', 'доктор технічних наук', 'професор', 25),
    ('Коваленко', 'Андрій', 'Сергійович', 'магістр педагогіки', 'викладач', 5)
ON CONFLICT DO NOTHING;


INSERT INTO workloads (teacher_id, subject_id, group_id, year, lecture_hours, practical_hours) VALUES
    (1, 1, 'КН-31', 2024, 30, 90),
    (2, 2, 'КН-32', 2024, 40, 50),
    (3, 4, 'КН-31', 2024, 20, 80),
    (1, 3, 'КН-33', 2024, 35, 45)
ON CONFLICT DO NOTHING;
