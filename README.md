## Personal Entry

# Work process
To start this challenge I have first produced a CRC (Class Responsibility Collaborators) and a DB (Database) diagram. See links for this.

The diagrams produced helped greatly with understanding how the application would communicate and interact. This saved a lot of confusion in the long run. I started working towards the user stories by writting the spec files and following the TDD process. I made sure to follow this process making small implementations as I go and choosing ideal points to refactor (making sure not to attempt this to early or to late). 

I feel that most of my refactors had been timed correctly which alleviated most of the possible confusion. However when attempting to seperate the concerns of the database from message_handle it was clear that it was long overdue as this became a big mess very quickly.  

Overall I feel that my working process was efficient, and that it has come a long way in the space of a week. If I was to carry this task out again I would focus on seperating the concerns through doubling in my spec files but I simply ran out of time.

# Links 
* CRC & DB diagram: https://wireframe.cc/SpI7VA


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
