--OG version: CREATE TABLE peeps(id SERIAL PRIMARY KEY, message VARCHAR(60));
CREATE TABLE peeps(id SERIAL PRIMARY KEY, message VARCHAR(60), post_date DATE NOT NULL default CURRENT_DATE);
INSERT INTO peeps (message) values ('This is a peep!');