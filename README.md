# Chitter Challenge

## Task

You are going to write a small Twitter clone that will allow the users to post messages to a public stream.

## Set up instructions

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

## Project Planning

1. Read all user stories
2. Identify objects(classes) and methods
3. Write down unit tests that fail
4. Write methods to satisfy the requirements of the unit tests above, until they all pass
5. Review code before submissions to ensure:

- Is this code presentable? Am I proud to show it off to others?
- Have I cleaned up things like whitespace, commented-out code, debugger statements from my code?
- Does the indentation look right?
- Have I conformed my code to styleguide rules?
- Is it clear to someone unfamiliar with my codebase what's going on?

6. Raise a pull request and commit updates

## Project Features

- [x] the user can see all the messages in a browser
- [x] the user can post a message to chitter
- [x] the user can see the date of a message posted
- [x] the user can see a list of messages in reverse chronological order
- [ ] the user can filter by keywords


## Demo

https://user-images.githubusercontent.com/78110998/137589235-55b31f72-0d7b-4c31-8220-637e99202277.mov

## MVC Modelling

![Server - MVC Model](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/3289ba85-ac74-433d-9635-bb89ab2ee551/Screenshot_2021-10-15_at_14.46.04.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20211015%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211015T134710Z&X-Amz-Expires=86400&X-Amz-Signature=2d44882fbc36891918fcef5903373d564b667f31bacddeb9081b5e06a69728d6&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22Screenshot%25202021-10-15%2520at%252014.46.04.png%22)

