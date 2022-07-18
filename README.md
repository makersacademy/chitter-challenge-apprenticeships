
## Set up

In order to test this app you'll need a test/prod database setup locally on your machine. To setup both databases:

* Connect to psql
* Create the database using the psql command `CREATE DATABASE chitter;` & `CREATE DATABASE chitter;`
* Connect to the each database using the psql command `\c chitter`;
* Run the query we have saved in the file 01_create_chitter_table.sql & 02_add_time_to_peeps_table.sql
* Populate the chitter table with a row by running `INSERT INTO peeps (message) values ('This is a peep!');`


* `bundle install`
* `rspec`

You should see 8 passing tests.

## Accessing the web UI

`rackup`

Visit `localhost:9292\posts` in your web browser (your port number may be different, check the rackup output in terminal)