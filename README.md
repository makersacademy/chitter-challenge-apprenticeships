# Chitter Challenge

Completed all user stories within the time limit (admittedly I lack the HTML and CSS knowledge to make it look pretty).
I then went on to challenge myself by writing additional user stories for more functionality, including user logins.
See icons below to see my progress. I've noted the point at which I hit the 'time limit' for the one-day challenge.


=> I've tried to link the tables with a foreign key on user_id, but this is
  through experimentation and I'm not sure if I've used or done it correctly.
  Things seem to be working though. Next idea would be to implement user profiles for
  all users, and add hyperlinks to usernames in the peeps. Finally then allow for deletion
  of one's own peeps when logged in.

![Screenshot](Screenshot2.png)

## Set up

- Clone this repo
- `bundle install`

- Set up the public and test databases, two tables each, peeps and users:

* Connect to psql
* Create the database using the psql command `CREATE DATABASE chitter;`
* Connect to the database using the psql command `\c chitter`;
* Run the queries saved in the file full_database_creation.sql, either sequentially or all at once if possible
* If not done so already with the above sql, manually populate your table with a row
  by running `INSERT INTO peeps (message, date, username, date_time, user_id) values ('This is a peep!', '01/01/2021 at 11:11', 'test_user', '06/25/2021 at 11:30:18:958:958560000', 1);`

To check you have everything set up ok, please take a look at the peeps table inside the chitter database. You should see one row in there.  

To setup the test database:
* Connect to psql
* Create the database using the psql
command `CREATE DATABASE chitter_test;`;
* Connect to the database using the psql command `\c chitter_test`
* Run the queries saved in the file full_database_creation.sql, either sequentially or all at once if possible
* If not done so already with the above sql, manually populate your table with a row
  by running `INSERT INTO users (username, password) VALUES (1, 'test_user', '$2a$12$5Q7bC9eq57VH./eHlj.aze7qN.GljTw9RhKGQWDml9WkRm08uo37a');`


## Running the App

- Run the app with `ruby app.rb` on the CLI

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
So that I can have personalisation
I would like to be able to register an account with Chitter
```
:white_check_mark:
--This is as far as I got during daytime hours Friday, committing just before
our cohort retro. Anything beyond here was done in evening and weekend time.--


```
As a logged-in Maker
So that I can be sure someone else does not access my account
I'd like to be able to log out
```
:white_check_mark:


```
As a logged-in Maker
So that I can protect my data
I'd like my password to be encrypted
```
:white_check_mark:


```
As a Maker
So that I can access my registered account
I would like to be able to log in
```
:white_check_mark:


```
As a logged-in Maker
So that I do not need to re-enter my information
I'd like the name field to pre-populate with my username
```
:white_check_mark:


```
As a logged-in Maker
So that I have visibility over what I say online
I would like to be able to see all my peeps on my profile
```
:white_check_mark:

```
As a Maker
So that I can keep up with my favourite people
I would like to be able to see all a users peeps on their profile page
```


```
As a logged-in Maker
So that I can manage my digital footprint
I'd like to be able to delete my peeps
```





### Analysis

Methods:
- peep.all :white_check_mark:
- peep.add :white_check_mark:
- peep.reverse :white_check_mark:
- peep.filter :white_check_mark:
- peep.delete ? (user validation)

- user.add :white_check_mark:
- user.authenticate :white_check_mark:
- user.update ?
- user.find :white_check_mark:


Attributes:
- peep.message :white_check_mark:
- peep.date :white_check_mark:
- peep.tags x (not needed)
- peep.username (display name) :white_check_mark:  
- peep.username (v2) ? (dynamic/database username) :white_check_mark:

- user.username :white_check_mark:
- user.id :white_check_mark:


Views:
- index (peeps) :white_check_mark:
- new_peep :white_check_mark:
- search_results (may not need, if filter directly on /peeps?) :white_check_mark:
- new_user :white_check_mark:
- user_peeps :white_check_mark:

Model:
- peep.rb :white_check_mark:
- database_connection.rb :white_check_mark:

Controller:
- GET / (redirect /peeps) :white_check_mark:
- GET /peeps  :peeps :white_check_mark:
- GET /peeps/new  :new_peep :white_check_mark:
- POST /peeps/add (redirect /peeps) :white_check_mark:
- POST /peeps/search (redirect /peeps) :white_check_mark:
- GET /peeps/:user  :user_peeps  ? :white_check_mark:

- GET /users/new :new_user :white_check_mark:
- POST /users/add (redirect /peeps) :white_check_mark:

# Original Instructions:

* Challenge time: until the end of the day
* Feel free to use google, your notes, books etc but please work on your own
* Please raise a pull request when you start this challenge, and keep pushing updates as and when you make commits throughout the day
* There is _no expectation_ to finish all or any of the user stories, please use this time to reflect on where you feel you are with the skill and what may support your learning.
* If you get blocked, please reflect on what blocked you and any strategies you adopted that helped you make progress.

We are going to write a small Twitter clone that will allow the users to post messages to a public stream.
