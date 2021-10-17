## Chitter Challenge
This week's challenge was to creat a small Twitter clone that will allow the users to post messages to a public stream.

## Set up

To setup the database:

* Connect to psql
* Create the database using the psql command `CREATE DATABASE chitter;`
* Connect to the database using the psql command `\c chitter`;
* Run the query we have saved in the file 01_create_chitter_table.sql
* Populate your table with a row by running `INSERT INTO peeps (message) values ('This is a peep!');`

To check you have everything set up ok, please take a look at the peeps table inside the chitter database. You should see one row in there.  

To setup the test database:
* Connect to psql
* Create the database using the psql
command `CREATE DATABASE chitter_test;`;
* Connect to the database using the psql command `\c chitter_test`
* Run the query we have saved in the file 01_create_chitter_table.sql

* `bundle install`
* `rspec`

To View Chitter Page:
* run rackup 
* navigate to http://localhost:9292/chitter 

## User stories

1- ``
As a Maker
So that I can see what people are doing
I want to see all the messages (peeps)
in a browser
```

2-``
As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter
```

3-``
As a Maker
So that I can see when people are doing things
I want to see the date the message was posted
```
(Hint the database table will need to change to store the date too)

4-``
As a Maker
So that I can easily see the latest peeps
I want to see a list of peeps in reverse chronological order
```

5-``
As a Maker
So that I can find relevant peeps
I want to filter on a specific keyword
```
User story 5 has not been completed yet so users are unable to filter.


