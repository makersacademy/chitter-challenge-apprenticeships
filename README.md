# Chitter Challenge

Makers Academy challenge to build a small Twitter clone that allows users to post messages to a public stream.

The web app was written in Ruby using a TDD approach. Tests were written with Rspec and Capybara. It uses the Sinatra framework and a Postgresql database. I used Bootstrap to give the app some basic styling.

<img width="1430" alt="Screenshot 2022-02-13 at 16 37 05" src="https://user-images.githubusercontent.com/60813754/153766396-d9c0e0cc-d32b-460d-86a7-394270333ab3.png">

## Implementation

I have covered the first four user stories:
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
And coverage:

```
COVERAGE:  95.59% -- 65/68 lines in 4 files

+----------+------------------------+-------+--------+---------+
| coverage | file                   | lines | missed | missing |
+----------+------------------------+-------+--------+---------+
|  90.48%  | lib/chitter_manager.rb | 21    | 2      | 17, 30  |
|  92.31%  | app.rb                 | 13    | 1      | 7       |
+----------+------------------------+-------+--------+---------+
2 file(s) with 100% coverage not shown
```
## Feature still to implement

I did not fully finish the challenge in the time given so I have improvements and enhancements I would like to make:
- [ ] User story 5 - to be able to filter posts
- [ ] Build a registration and authentication system
- [ ] Implement a feature to delete posts
- [ ] Work more on the styling of the page
- [ ] Deploy the app with Heroku

## To set up the database

* Connect to `psql`
* Create the database using the `psql` command `CREATE DATABASE chitter`;
* Connect to the database using the `psql` command `\c chitter;`
* Run the query we have saved in the file `01_create_chitter_table.sql`

## Test database connection instructions

* Connect to `psql`
* Create the database using the `psql` command `CREATE DATABASE chitter_test`;
* Connect to the database using the `psql` command `\c chitter_test;`
* Run the query we have saved in the file `01_create_chitter_table.sql`

## To Run

* `git clone https://github.com/benfielding74/chitter-challenge-apprenticeships.git`
* `bundle install`
* `ruby app.rb`
* `visit "https://localhost:4567"`
