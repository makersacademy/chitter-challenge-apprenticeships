## Chitter challenge

# Issues

* Users are able to enter blank peeps, would be nice to implement a guard condition to prevent this
* Users currently post anonymously, it would be cool to have a table of users with log ins that was able to link to the peeps table, so it would be possible to search by peep keywords and usernames
* The page has zero styling - I would like to try using bootstrap or similar frameworks to liven it up
* My tests could be expanded to make completely sure of the functions, they are quite light and not particularly DRY

# Successes

(Trying to be a bit more positive about my work!)

* I like the way the app uses only two pages and updates these as it is used, I feel like I have gotten a good grip on using Sinatra
* I've tried used a private method to dry out my peeps class (although it doesn't seem to work as expected)
* I've met the requirements all of the user stories

Overall there is a lot of room for improvement - maybe another class could handle the private method?

ORIGINAL README BELOW

============

## Chitter Challenge

* Challenge time: until the end of the day
* Feel free to use google, your notes, books etc but please work on your own
* Please raise a pull request when you start this challenge, and keep pushing updates as and when you make commits throughout the day
* There is _no expectation_ to finish all or any of the user stories, please use this time to reflect on where you feel you are with the skill and what may support your learning.
* If you get blocked, please reflect on what blocked you and any strategies you adopted that helped you make progress.

We are going to write a small Twitter clone that will allow the users to post messages to a public stream.

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

You should see 1 passing test.

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
