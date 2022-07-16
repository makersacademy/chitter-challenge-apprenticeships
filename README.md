## Chitter Challenge

- Challenge time: until the end of the day
- Feel free to use google, your notes, books etc but please work on your own
- Please raise a pull request when you start this challenge, and keep pushing updates as and when you make commits throughout the day
- There is _no expectation_ to finish all or any of the user stories, please use this time to reflect on where you feel you are with the skill and what may support your learning.
- If you get blocked, please reflect on what blocked you and any strategies you adopted that helped you make progress.

We are going to write a small Twitter clone that will allow the users to post messages to a public stream.

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

You should see 1 passing test.

## User stories

```
As a Maker
So that I can see what people are doing
I want to see all the messages (peeps)
in a browser


| Component  | Responsibility                              | Refactor                          |
| ---------- | ------------------------------------------- | --------------------------------- |
| Model      | Encapsulate logic with relevant data        | Encapsulate peep data in a class  |
| View       | Display the result to a user                | Show the peep data in a list      |
| Controller | Get data from the model and put in the view | Render peep data into to the view |
```

```
As a Maker
So that I can let people know what I am doing
I want to post a message (peep) to chitter

- Adding a new message - /peeps/new
- Typing a message into a form on that page
- Submitting that form
- Seeing the message just submitted

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

# Hannah's Chitter Challenge

Brief description of what the project is

## Getting started

`git clone path-to-your-repo`

- list gems in the Gemfile:
  source 'https://rubygems.org'

ruby '3.0.2'

gem 'pg'
gem 'sinatra'

group :test do
gem 'capybara'
gem 'rspec'
gem 'simplecov', require: false
gem 'simplecov-console', require: false
end

group :development, :test do
gem 'rubocop', '1.20'
end

- bundle install
- rspec --init
- setup basic Sinatra app in app.rb (Root directory)

# in app.rb

require 'sinatra/base'
require 'sinatra/reloader'

class Chitter < Sinatra::Base
configure :development do
register Sinatra::Reloader
end

get '/' do
'Hello World'
end

run! if app_file == $0
end

- configure 'rackup' command to run the app in app.rb via config.ru file

# in config.ru

require_relative "./app"

run Chitter

## Usage

- ruby app.rb => Navigate to `http://localhost:4567/`

## Running tests

- rspec
