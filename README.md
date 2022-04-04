## CHITTER CHALLENGE

We are going to write a small Twitter clone that will allow the users to post messages to a public stream.

## SETTING UP THE DATABASE

1. Connect to `psql` (you may need to install postgresql first by running `brew install postgres`)
2. Create the database using the psql command `CREATE DATABASE chitter`
3. Connect to the database using the pqsl command `\c chitter`
4. Run the query we have saved in the file **01_create_chitter_table.sql**
5. Run the query we have saved in the file **02_create_author_table.sql**
6. Run the query we have saved in the file **03_add_timestamp_to_peeps.sql**
7. Populate your table by running the queries saved in the file **04_insert_data_to_peeps.sql** and **05_insert_data_to_author.sql**

To check you have everything set up ok, please take a look at the peeps table and the author inside the chitter database.

## SETTING UP THE TEST DATABASE

1. Connect to `psql`
2. Create the database using the psql command `CREATE DATABASE chitter_test`
3. Connect to the database using the pqsl command `\c chitter_test`
4. Run the query we have saved in the file **01_create_chitter_table.sql**
5. Run the query we have saved in the file **02_create_author_table.sql**
6. Run the query we have saved in the file **03_add_timestamp_to_peeps.sql**

## START THE APP

- Run `bundle install` to add predefined package dependencies
- Run `rackup` and run the app on localhost 9292

## USER STORIES

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
