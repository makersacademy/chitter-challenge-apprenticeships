CREATE TABLE peeps(id SERIAL PRIMARY KEY, username VARCHAR(60), message VARCHAR(60), post_date TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP);

SET timezone = 'GMT';