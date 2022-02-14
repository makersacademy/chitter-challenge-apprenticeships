# Chitter Challenge - Twitter clone

## Setup

### PostgreSQL

to setup the programme, you will need to install PostgresQL.

after cloning the directory and setting ruby version specified in Gemile ( present 3.0.2 )

you will need to create **2** databases in PostgreSQL

**chitter** and **chitter_test**

within each of these databases you must create the table, 'peeps'

to do this run the following command in psql, within each database ( you will also find this at db/migrations/01_create_chitter_table.sql )

```SQL
CREATE TABLE peeps(id SERIAL PRIMARY KEY, message VARCHAR(160), created_date timestamp default CURRENT_TIMESTAMP);
```

### Ruby

Navigate to the directory

run 'bundle'

run 'rspec'

if successful, passing tests should show.

## Diagrams

The diagrams folder contains UML diagrams of the classes, and the er - simplisitic for this project

The processes via MVC - again, relatively simple - some inaccuracies due to changes made during development, but they should remain comprehensible

## Lib

The lib contains 2 classes

Each uses self methods - they are 'singletons', only existing to "pipe" data through themselves

### DatabaseConnection

DatabaseConnection has 2 methods

#### DatabaseConnection.setup(dbname)

takes a single argument, dbname as a parameter.

Provided a database within PostgreSQL shares that name, it will variable that stores that connection, on the DatabaseConnection object.

#### DatabaseConnection.query(sql, params)

takes two arguments - the first is a string containing an executable SQL command.

the second argument is an array, containg a number of parameters, which will be interpolated into the SQL command string. This should provide security against basic SQL injection attacks.

### Message

Message has 4 methods, and 3 getters

#### getters / attr_readers

provides access to id(int), message(string), date(string) on the object

***
# unfinished
***

#### Message.all

takes no arguments

returns all messages from Postgres in order

#### Message.latest

**accessible at '/by_latest' url**

takes no arguments

returns all messages from the newest to oldest

#### Message.create(message)

takes a single string as a message

inserts the message into DatabaseConnection.query

#### Message.search(keyword)

takes a single keyword to search against all messages in the peeps table. returns all messages of the search-term, case insensitive

runs the sql query search with the parameter

## Views

### index.erb

displays all in messages in the peeps tables 

has a search input

### peep.erb

allows the user to post a message

