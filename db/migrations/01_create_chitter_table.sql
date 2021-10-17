-- Create database called "chitter" PLACE IN README
-- Create table
CREATE TABLE peeps(id SERIAL PRIMARY KEY, username VARCHAR(60), message VARCHAR(60), post_date TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP);

SET timezone = 'GMT';

-- Seed table
INSERT INTO peeps (username, message) VALUES ('JoeBlogz', 'Hello world!');
INSERT INTO peeps (username, message) VALUES ('JaneBlogz', '@JoeBlogz is my partner');
