# Chitter Challenge

Makers Academy challenge to build a small Twitter clone that allows users to post messages to a public stream.

The web app was written in Ruby using a TDD approach. Tests were written with Rspec and Capybara. It uses the Sinatra framework and a Postgresql database.

## To set up the database

* Connect to `psql`
* Create the database using the `psql` command `CREATE DATABASE chitter`;
* Connect to the database using the `psql` command `\c chitter;`
* Run the query we have saved in the file `01_create_chitter_table.sql`

## Test database connection instructions

* Connect to `psql`
* Create the database using the `psql` command `CREATE DATABASE chitter_test`;
* Connect to the database using the `psql` command `\c chitter_test;`
* Run the query we have saved in the file `01_create_chitter_table.sql`

## To Run

* `git clone https://github.com/benfielding74/chitter-challenge-apprenticeships.git`
* `bundle install`
* `ruby app.rb`
* `visit "https://localhost:4567"`
