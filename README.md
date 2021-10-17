## Chitter Challenge

```
      _          _          _          _          _
    >(')____,  >(')____,  >(')____,  >(')____,  >(') ___,
      (` =~~/    (` =~~/    (` =~~/    (` =~~/    (` =~~/
~^~^`---'~^~^~^`---'~^~^~^`---'~^~^~^`---'~^~^~^`---'~^~^~
```

## Introduction

This program is a webapp that uses the Sinatra framework to create a Twitter clone. The primary programming language is Ruby, however HTML has been used to render the text on a browser and styling has been applied using Bootstrap and CSS. Tests have been written using RSpec, with feature tests written using Capybara. 

This webapp satisfies the following user stories:

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

## Setup

After forking and cloning this repo, you will need to run gem install bundler. After installation use the bundle command.

```bash
gem install bundler
```

```bash
bundle
```

To setup the database:

* Connect to psql and create the database with the psql command `CREATE DATABASE chitter;`
* Connect to the database using the psql command `\c chitter`;
* Run the query saved in the file 01_create_chitter_table.sql to create a `peeps` table;
* Populate the table with a couple of rows by running the query saved in the file 02_seed_table.sql.


To setup the test database:

* Connect to psql and create the database with the psql command `CREATE DATABASE chitter_test;`;
* Connect to the database using the psql command `\c chitter_test`;
* Run the query saved in the file 01_create_chitter_table.sql to create a `peeps` table;
* Populate the table with a couple of rows by running the query saved in the file 02_seed_table.sql.

![Chitter Homepage](./lib/public/images/ChitterHomepage.png?raw=true "Homepage")

