# Chitter

Chitter is a databased backed web application that allows a user to view and post messages (peeps).

## Getting started

```
git clone https://github.com/olliefreeman94/chitter-challenge-apprenticeships.git
```

To setup the database:

* Connect to psql
* Create the database using the psql command `CREATE DATABASE chitter;`
* Connect to the database using the psql command `\c chitter`
* Run the query saved in 01_create_chitter_table.sql
* Run the query saved in 02_add_date_to_peeps.sql

To setup the test database:
* Connect to psql
* Create the database using the psql command `CREATE DATABASE chitter_test;`
* Connect to the database using the psql command `\c chitter_test`
* Run the query saved in 01_create_chitter_table.sql
* Run the query saved in 02_add_date_to_peeps.sql

```
bundle install
```

## Usage

```
rackup
```

Navigate to `http://localhost:9292/`

## Running tests

```
rspec
```
