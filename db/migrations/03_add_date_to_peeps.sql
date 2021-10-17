ALTER TABLE peeps ADD COLUMN date DATE NOT NULL;

-- Below allows Postgres to auto-generate a date but I don't know how to retrieve data
-- ALTER TABLE peeps ADD COLUMN date DATE NOT NULL DEFAULT CURRENT_DATE;
-- https://www.postgresqltutorial.com/postgresql-date/