CREATE TABLE peeps(id SERIAL PRIMARY KEY, message VARCHAR(60));
ALTER TABLE peeps ADD COLUMN date timestamp with time zone;
