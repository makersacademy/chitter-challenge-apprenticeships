-- Create a new comments table in both the chitter database and the chitter_test database
CREATE TABLE comments(id SERIAL PRIMARY KEY, text VARCHAR(240), peep_id INTEGER REFERENCES peeps (id));
