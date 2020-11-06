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
|Domain Model|Message (to)                                                     |
|:----------:|:---------------------------------------------------------------:|
|User        |view peeps(Controller)                                           |
|Controller  |get peeps(Model) --> send received peeps(View) ; show peeps(User)|
|Model Layer |read peeps(Database) --> give peeps(Controller)                  |
|View        |peeps display(Controller)                                        |

```
As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter
```
|Domain Model|Message (to)                                                     |
|:----------:|:---------------------------------------------------------------:|
|User        |send peep(Controller)                                            |
|Controller  |add peep(Model) --> send confirmation(View) ; show confirmation(User)|
|Model Layer |create peep(Database) --> confirm add(Controller)                |
|View        |confirmation display(Controller)                                 |

```
As a Maker
So that I can see when people are doing things
I want to see the date the message was posted
```
- add date to database columns and set as time of created peep
- display date in peep view (add date to SELECT query)

```
As a Maker
So that I can easily see the latest peeps
I want to see a list of peeps in reverse chronological order
```
- display peeps in order of date/time posted descending
- ORDER BY date DESC

```
As a Maker
So that I can find relevant peeps
I want to filter on a specific keyword
```
- add keyword search which uses message LIKE '%keyword%' query to find relevant peeps
