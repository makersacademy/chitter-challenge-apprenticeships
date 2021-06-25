# Chitter

## Motivation
This is the fourth individual challenge set by Makers Bootcamp for the module of Databases. I worked on this task on my own using resources from the course, the Ruby, Capybara, Sinatra, PostgreSQL and Rspec documentation and my own notes.

## The Task
This web application is a  small Twitter clone that will allow the users to post messages to a public stream. I fulfiled the following user stories:

As a Maker
So that I can see what people are doing
I want to see all the messages (peeps)
in a browser

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

## Approach to solving the challenge
I solved this challenge using TDD, as well as the BDD cycle as guidance. Before setting up the database and test database, I read the user stories and realised that a datestamp will be required for all messages (peeps). I therefore updated the SQL query in the db directory to also create a column for a timestamp. This column is auto-filled when a new entry is added to the database.

## Technology used
• Ruby •Capybara •Sinatra •Rspec •PostgreSQL

## How to use
1. git clone this repo
2. cd chitter-challenge-apprenticeships
3. bundle install
4. Connect to psql
5. Create the database using the psql command CREATE DATABASE chitter;
6. Connect to the database using the pqsl command \c chitter;
7. Run the query we have saved in the file 01_create_chitter_table.sql

## Progress
• I implemented all user stories.
• The tests passed.
• Test coverage of 99%.

## Limitations
• The user can only see messages and dates they were posted, but not who posted them. An extended version of this application could allow users to register, log in and have their details saved in a DB table.