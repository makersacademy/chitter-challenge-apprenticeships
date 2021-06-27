## Chitter Challenge

Built a small Twitter clone that will allow the users to post messages.

- Sinatra
- PostgreSQL
- RSpec (unit testing)
- Capybara (feature testing)
- TablePlus (Database GUI)

### Screenshots

<img src = "/screenshots/chitter.png" width = "70%">
<img src = "/screenshots/keyword-matches.png" width = "70%">
<img src = "/screenshots/no-matches.png" width = "70%">

### MVC sequence diagram & User stories

[Planning & diagramming](/docs/planning.md)

## How to

### Set up the project

Clone this repository and install all the dependencies by running:

```
bundle install
```

To set up the databases, connect to psql:

```
psql
```

Create the `chitter` and `chitter_test` databases:

```
CREATE DATABASE chitter;
CREATE DATABASE chitter_test;
```

Connect to each database:
```
\c chitter;
\c chitter_test;
```
To create the tables, run the SQL queries in the `db/migrations` folder in the given order.

Populate your table with a row by running 
```
INSERT INTO peeps (message, create_time) VALUES ('hello, how are you?', '2021-06-26 12:00:01+01');
```

### Run the Chitter app

- run ``` ruby app.rb ```
- Visit http://localhost:4567/
