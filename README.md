## Chitter Challenge



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
I want to /see all/ the /messages/ (peeps)
in a browser
```
:white_check_mark:


```
As a Maker
So that I can let people know what I am doing  
I want to /post/ a /message/ (peep) to chitter
```
:white_check_mark:


```
As a Maker
So that I can see when people are doing things
I want to /see/ the /date/ the /message/ was posted
```
(Hint the database table will need to change to store the date too)

:white_check_mark:


```
As a Maker
So that I can easily see the latest peeps
I want to /see/ a /list of peeps/ in /reverse chronological order/
```
:white_check_mark:


```
As a Maker
So that I can find relevant peeps
I want to /filter/ on a specific /keyword/
```
:white_check_mark:

And just for fun, since I'm no front-end designer and would
rather spend time building functionality over style,
let's try some user stories of my own:

```
As a Maker
So that I don't have to keep re-entering my name
I would like to be able to log-in to Chitter
```
:construction:

```
As a logged-in Maker
So that I can manage my digital footprint
I'd like to be able to delete my peeps
```

```
As a logged-in Maker
So that I can protect my data
I'd like my password to be encrypted
```

### Analysis

Methods:
- peep.all :white_check_mark:
- peep.add :white_check_mark:
- peep.reverse :white_check_mark:
- peep.filter :white_check_mark:
- peep.delete ? (user validation)

Attributes:
- peep.message :white_check_mark:
- peep.date :white_check_mark:
- peep.tags x (not needed)
- peep.username (display name) :white_check_mark:  
- peep.username (v2) ? (dynamic/database username) :construction:

- user.username


Views:
- index (peeps) :white_check_mark:
- new_peep :white_check_mark:
- search_results (may not need, if filter directly on /peeps?) :white_check_mark:
- new_user :construction:
- user_peeps ?

Model:
- peep.rb :white_check_mark:
- database_connection.rb :white_check_mark:

Controller:
- GET / (redirect /peeps) :white_check_mark:
- GET /peeps  :peeps :white_check_mark:
- GET /peeps/new  :new_peep :white_check_mark:
- POST /peeps/add (redirect /peeps) :white_check_mark:
- POST /peeps/search (redirect /peeps) :white_check_mark:
- GET /peeps/:user  :user_peeps  ?

- GET /users/new :new_user :construction:
- POST /users/add (redirect /peeps)

# Original Instructions:

* Challenge time: until the end of the day
* Feel free to use google, your notes, books etc but please work on your own
* Please raise a pull request when you start this challenge, and keep pushing updates as and when you make commits throughout the day
* There is _no expectation_ to finish all or any of the user stories, please use this time to reflect on where you feel you are with the skill and what may support your learning.
* If you get blocked, please reflect on what blocked you and any strategies you adopted that helped you make progress.

We are going to write a small Twitter clone that will allow the users to post messages to a public stream.
