CREATE TABLE peeps(id SERIAL PRIMARY KEY, message VARCHAR(60));

-- Add timestamp

ALTER TABLE peeps ADD COLUMN created_at TIMESTAMP;
ALTER TABLE peeps ALTER COLUMN created_at SET DEFAULT now();