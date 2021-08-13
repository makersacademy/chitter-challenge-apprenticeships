
Project Title - Chitter (details at end of readme file)

Requested outputs
Sketch of each page of app that user sees (see Overview file folder)
List of requests / responses involved (see Overview file in root folder)

Motivation
End of week 6 test to allow calibration of current learning status and allow setting of goals in future weeks.

Build status
Awaiting rubocopping and refactor. Base Model built, with additional formatting to be applied at a later version for the screens.

Notes:

Code style
Ruby, RSpec, rubocop, Sinatra, Capybara, SimpleCov.


Installation
lib folder - messages.rb
view folder - Screen[1-3].erb
spec folder/features for feature tests

Provide step by step series of examples and explanations about how to get a development env running. 
e.g.
Download of files from git hub.
Use Rackup to run webserver.
Access server via the provided host (xxxx) on your terminal screen e.g. localhost:xxxx/

Database:
In PSQL: run the following:
    CREATE DATABASE chitter;
    run contents of 01_create_chitter_table.sql 
    ALTER TABLE peeps
	ADD whenposted TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP;
    INSERT INTO peeps (message) values ('This is a peep!');
    repeat for testing database: (replace chitter for chitter_test). No need to do the INSERT.

API Reference
n/a

How to use?
can be operated via rackup and the local host website address using / for the home page to navigate through the screens.

Contribute
Was really useful to have built the MessageBoard app ahead of this.

Credits

Thanks to my peer group team for their support (Danyaal, Annesa, Jessica)

License

no known license requirements.

Thoughts on the project:
I really enjoyed the challenge, i would loved to have applied the styling to my web pages, but time at 4pm on Friday was not allowing for this. Rubocop was not working with the yml file and this is an outstanding task to tidy up the code and refactor it. There is a base model, and the reformatting should go around the time format. It was a plus that i used the databases own time function which includes time and date and was easily formattable via SQL. I did not choose to add a name as it was not explicitly asked for in the user stories, but is an easy addition.

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
