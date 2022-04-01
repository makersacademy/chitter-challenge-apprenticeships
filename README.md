## How to install Chitter

- Clone this repo into a local repository

## Set up

To setup the database:

- Connect to psql
- Create the database using the psql command `CREATE DATABASE chitter;`
- Connect to the database using the psql command `\c chitter`;
- Run the query we have saved in the file db/migrations/01_create_chitter_table.sql
- Populate your table with a row by running `INSERT INTO peeps (message) values ('This is a peep!');`

To check you have everything set up ok, please take a look at the peeps table inside the chitter database. You should see one row in there.

To setup the test database:

- Connect to psql
- Create the database using the psql
  command `CREATE DATABASE chitter_test;`;
- Connect to the database using the psql command `\c chitter_test`
- Run the query we have saved in the file db/migrations/01_create_chitter_table.sql

- `bundle install'

## Run Chitter

- 'ruby app.rb'
- Go to http://localhost:4567/ in your web browser
- To stop viewing Chitter, press CTRL+C twice in the Terminal.
