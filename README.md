## Chitter Challenge

Today I have writen a small Twitter clone that will allow the users to post messages to a public stream. To install the app follow the setup instructions below and run it by entering the command 'rackup' in your terminal at the app root. 

## Site usage

For those of you who cant be bothered with all the faff and just want to have a quick glimpse I have included 3 screenshots which show the homepage displaying the list of peeps(You'll have to trust their reverse ordered), the filter peeps by keyword screen before execution, and the filter by peeps screen after execution.

To use the site visit 'http://localhost:9292/newsfeed'.
From that page you will see all peeps posted, displayed in reverse chronological order. You will also see a text box and submit button which can be used to submit your own peeps. If you wish to search through posted peeps for a specific keyword, visit 'http://localhost:9292/newsfeed/filter' and enter your keyword in the box and click submit.

## Set up

To setup the database:

* Connect to psql
* Create the database using the psql command `CREATE DATABASE chitter;`
* Connect to the database using the psql command `\c chitter`;
* Run the query I have saved in the file 01_create_chitter_table.sql
* Run the query I have saved in the file 02_alter_chitter_table.sql
* Populate your table with a row by running `INSERT INTO peeps (message, date) VALUES ('This is a peep!', '2022-02-10');`

To check you have everything set up ok, please take a look at the peeps table inside the chitter database. You should see one row in there.  

To setup the test database:
* Connect to psql
* Create the database using the psql
command `CREATE DATABASE chitter_test;`;
* Connect to the database using the psql command `\c chitter_test`
* Run the query we have saved in the file 01_create_chitter_table.sql
* Run the query I have saved in the file 02_alter_chitter_table.sql

* `bundle install`
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
So that I can let people know what I am doing  
I want to post a message (peep) to chitter
```

```
As a Maker
So that I can see when people are doing things
I want to see the date the message was posted
```
(Hint the database table will need to change to store the date too)

```
As a Maker
So that I can easily see the latest peeps
I want to see a list of peeps in reverse chronological order
```
```
As a Maker
So that I can find relevant peeps
I want to filter on a specific keyword
```
