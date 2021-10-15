# Chitter 
## User stories
```
As a Maker
So that I can see what people are doing
I want to see all the messages (peeps)in a browser

As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a Maker
So that I can see when people are doing things
I want to see the date the message was posted

As a Maker
So that I can easily see the latest peeps
I want to see a list of peeps in reverse chronological order

As a Maker
So that I can find relevant peeps
I want to filter on a specific keyword

```

# Setting up the project
1. git fork
2. Make new directory in your projects folder
3. Pull all the information from the fork 
4. Run bundle
5. Do rackup in the terminal to start the server

## Setting up the database
1. in terminal do psql
2. write CREATE DATABASE chitter;
3. write \c chitter to connect to the database
4. follow the intructions from db/migrations to create the peeps table (copy the sql code into psql)

## Setting up the test database
1. in terminal do psql
2. write CREATE DATABASE chitter_test;
3. write \c chitter_test to connect to the database
4. follow the intructions from db/migrations to create the peeps table (copy the sql code into psql)

# User stories plan
## User story 1 - completed
## User story 2 - completed
## User story 3 
1. I would look into using the timecop gem in the tests - https://andycroll.com/ruby/replace-timecop-with-rails-time-helpers-in-rspec/ 
2. First, we would write a feature test that would check that our /messages also contains a date for the shown messages   
3. We pass the test by adding ruby code in our erb file
4. We need to update our table to contain a date column - ALTER TABLE peeps ADD COLUMN date timestamp;
  - I would research on how to automate the time when a new message is added to the table:
      - https://www.sqlshack.com/sql-server-alter-table-add-column-overview/
      - https://www.postgresqltutorial.com/postgresql-date/ 
      - https://www.postgresql.org/docs/9.1/datatype-datetime.html 
      - https://www.postgresqltutorial.com/postgresql-add-column/
      - https://www.postgresqltutorial.com/postgresql-insert/
5. We need to change the code in our ChitterMessage class to include the presence of time as well
6. Our erb code and app.rb should also be changed to reflect the presence of the date column
## User story 4 
1. We write a feature test that would check for the presence of a button that organises the messages in reverse chronological order
2. We create the button in an erb file 
2. We also need to write a unit test for a new method in the ChitterMessage class that returns messages in reverse chronological order
3. We write the code to pass the test
4. We check in the browser to see if our application is indeed working like we want it to 
5. Additional unit tests may be necessary to ensure we are testing all areas of our code

## User story 5
1. We need to add a tag column to our table
2. We write a feature test for a form that accepts a tag and returns a page that has the messages containing said tag
3. We need to refactor our ChitterMessage to include a tag when creating a new message
4. We check in the browser to see if our application is working accordingly
5. Additional unit tests may be necessary to ensure we are testing all areas of our code

# Diagram




# Further steps
- [ ] Need to implement ORM 
- [ ] Code needs refactoring
- [ ] Need to design the webpage, implement bootstrap
- [ ] Get the coverage to 100%
* Need to figure a way to somehow test the else statements from the class methods ( the ones that direct to the actual database that the user interacts with) in order to get full coverage of the code
