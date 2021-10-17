CREATE TABLE peeps(id SERIAL PRIMARY KEY, message VARCHAR(60));

/* add a date column*/
ALTER TABLE peeps
ADD COLUMN posted_at TIMESTAMP;

ALTER TABLE peeps
ALTER COLUMN date_posted SET DEFAULT now();

/* Order peeps by descending order */
SELECT * FROM peeps ORDER BY date_posted DESC;