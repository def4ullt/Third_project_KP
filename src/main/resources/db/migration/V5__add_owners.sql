DO $$
    BEGIN
        -- workloads.owner
        IF NOT EXISTS (
            SELECT 1 FROM information_schema.columns
            WHERE table_name = 'workloads' AND column_name = 'owner'
        ) THEN
            ALTER TABLE workloads ADD COLUMN owner BIGINT;
        END IF;

        -- Додаємо зовнішній ключ, якщо його ще немає
        IF NOT EXISTS (
            SELECT 1 FROM information_schema.table_constraints
            WHERE constraint_name = 'fk_workloads_owner'
        ) THEN
            ALTER TABLE workloads
                ADD CONSTRAINT fk_workloads_owner
                    FOREIGN KEY (owner) REFERENCES logindata(id) ON DELETE SET NULL;
        END IF;

        -- teachers.owner
        IF NOT EXISTS (
            SELECT 1 FROM information_schema.columns
            WHERE table_name = 'teachers' AND column_name = 'owner'
        ) THEN
            ALTER TABLE teachers ADD COLUMN owner BIGINT;
        END IF;

        IF NOT EXISTS (
            SELECT 1 FROM information_schema.table_constraints
            WHERE constraint_name = 'fk_teachers_owner'
        ) THEN
            ALTER TABLE teachers
                ADD CONSTRAINT fk_teachers_owner
                    FOREIGN KEY (owner) REFERENCES logindata(id) ON DELETE SET NULL;
        END IF;

        -- subjects.owner
        IF NOT EXISTS (
            SELECT 1 FROM information_schema.columns
            WHERE table_name = 'subjects' AND column_name = 'owner'
        ) THEN
            ALTER TABLE subjects ADD COLUMN owner BIGINT;
        END IF;

        IF NOT EXISTS (
            SELECT 1 FROM information_schema.table_constraints
            WHERE constraint_name = 'fk_subjects_owner'
        ) THEN
            ALTER TABLE subjects
                ADD CONSTRAINT fk_subjects_owner
                    FOREIGN KEY (owner) REFERENCES logindata(id) ON DELETE SET NULL;
        END IF;
    END $$;
