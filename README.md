## Chitter Challenge

* Challenge time: until the end of the day
* Feel free to use google, your notes, books etc but please work on your own
* Please raise a pull request when you start this challenge, and keep pushing updates as and when you make commits throughout the day
* There is _no expectation_ to finish all or any of the user stories, please use this time to reflect on where you feel you are with the skill and what may support your learning.
* If you get blocked, please reflect on what blocked you and any strategies you adopted that helped you make progress.

We are going to write a small Twitter clone that will allow the users to post messages to a public stream.

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
