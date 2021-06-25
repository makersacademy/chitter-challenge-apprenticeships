## Chitter Challenge

Built a small Twitter clone that will allow the users to post messages.

- Sinatra
- PostgreSQL
- RSpec (unit testing)
- Capybara (feature testing)
- TablePlus (Database GUI)

### Screenshots

<img src = "/screenshots/peeps.png" width = "70%">

### User stories & MVC sequence diagram

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

Populate your table with a row by running `INSERT INTO peeps (message) values ('This is a peep!');`

### Run the Chitter app

- run ``` ruby app.rb ```
- Visit http://localhost:4567/
