# Chitter Challenge

Week 6 individual project from the Makers Academy Bootcamp.
This project is written is Ruby & HTML, using the knowledge learnt from the following topics:

- Test Driven Development (TDD): RSpec
- Object Oriented Design (OOD)
- Web Applications: Capybara, Sinatra
- Databases: PostgreSQL

## Project Task

Write a small Twitter clone that will allow the users to post messages to a public stream.

## Set up

To setup the database:

- Connect to psql
- Create the database using the psql command `CREATE DATABASE chitter;`
- Connect to the database using the psql command `\c chitter`;
- Run the query we have saved in the file 01_create_chitter_table.sql
- Populate your table with a row by running `INSERT INTO peeps (message) values ('This is a peep!');`

To check you have everything set up ok, please take a look at the peeps table inside the chitter database. You should see one row in there.

To setup the test database:

- Connect to psql
- Create the database using the psql
  command `CREATE DATABASE chitter_test;`;
- Connect to the database using the psql command `\c chitter_test`
- Run the query we have saved in the file 01_create_chitter_table.sql

- `bundle install`
- `rspec`

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

## Domain Model

Here are my domain models for the user stories:

![Domain model diagrams](https://github.com/feedXia/chitter-challenge-apprenticeships/blob/82768646647ac76aae49da9e5bfbad2dca658de8/images/Chitter%20Domain%20Model.drawio.png)

## Project To Do's

### Features

- [x] Can view all messages (peeps) in a browser (.view)
- [x] Can post a message (peep) to Chitter (.post)
- [x] Can see the date messages (peeps) were posted (.date)
- [ ] Can see list of peeps in reverse chronological order (.sort_by_date)
- [ ] Can filter peeps by specific keyword to find relevant peeps (.filter)

### Style

- [ ] All test passing
- [ ] Test coverage > 95%
- [ ] The code is elegant: every class has a clear responsibility, methods are short etc.
- [ ] Commit messages are short & scoped, e.g.

```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```
