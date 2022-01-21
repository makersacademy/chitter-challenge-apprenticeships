# Chitter Challenge

Chitter is a web application adoption of Twitter. Here some key features.

  * You will be shown the all posts in reverse chronological order
  * You can add new posts to let the world know what you're currently doing
  * You can filter by keyword hitting the 'Apply' button
  * To reset the filter, just hit 'Apply' again, without entering any text first

## Set up

To setup the production database:

* Connect to psql
* Create the database using the psql command `CREATE DATABASE chitter;`
* Connect to the database using the psql command `\c chitter`
* Run the query we have saved in the file 01_create_chitter_table.sql in folder ./db/migrations
* Populate your table with a row by running `INSERT INTO peeps (message) values ('This is a peep!');`
* Run the query we have saved in the file 02_add_date_to_table.sql in folder ./db/migrations

To setup the test database:

* Connect to psql
* Create the database using the psql command `CREATE DATABASE chitter_test;`
* Connect to the database using the psql command `\c chitter_test`
* Run the query we have saved in the file 01_create_chitter_table.sql in folder ./db/migrations
* Run the query we have saved in the file 02_add_date_to_table.sql in folder ./db/migrations

Install required GEMs

* `bundle install`

Run tests

* `rspec`

Run application

* `rackup`

## User stories

```
As a Maker
So that I can see what people are doing
I want to see all the messages (peeps)
in a browser
```

```
As a Maker
So that I can easily see the latest peeps
I want to see a list of peeps in reverse chronological order
```

```
As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter
```

```
As a Maker
So that I can see when people are doing things
I want to see the date the message was posted
```

```
As a Maker
So that I can find relevant peeps
I want to filter on a specific keyword
```
