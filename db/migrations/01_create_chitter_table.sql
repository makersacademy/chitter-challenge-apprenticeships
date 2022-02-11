CREATE TABLE peeps(id SERIAL PRIMARY KEY, message VARCHAR(160), created_date timestamp default CURRENT_TIMESTAMP);
