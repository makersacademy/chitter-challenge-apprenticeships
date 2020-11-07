-- Create a new users table in both the chitter database and the chitter_test database
CREATE TABLE users(id SERIAL PRIMARY KEY, email VARCHAR(60), password VARCHAR(140));
