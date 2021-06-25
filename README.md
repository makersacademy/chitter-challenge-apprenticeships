## Chitter Challenge ###

This project is a database backed Sinatra web application that acts as a message board where users can add posts (called peeps), and edit, comment on or delete these posts. Users can also filter the peeps by a keyword and view their search results. It satisfies the user stories mentioned below:

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

#### Getting Started ####

Fork and then clone this repo using:
```
git clone [path-to-your-repo]
```

Setup the database by:

* Connecting to psql using `psql postgres`
* Create the database using the psql command `CREATE DATABASE chitter;`
* Connect to the database using the psql command `\c chitter;`
* Run the queries saved in the folder `/db/migrations` in the order they appear in the folder to setup the database tables
* Populate your table with a row by running `INSERT INTO peeps (message) values ('This is a peep!');`

If everything is setup corrently, you should see one row in the peeps table of the chitter database.  

To setup the test database:
* Connect to psql using `psql postgres`
* Create the database using the psql command `CREATE DATABASE chitter_test;`;
* Connect to the database using the psql command `\c chitter_test`
* Run the queries saved in the folder `/db/migrations` in the order they appear in the folder to setup the database tables, ensuring to replace any references to the `chitter` database with `chitter_test`

Install the necessary dependencies using:
```
bundle
```

#### Usage ####

To start running the program, run:
`rackup`

Then navigate to the following address in your browser:
```
localhost:9292
```

#### Running Tests ####

To run the tests:
```
rspec
```

#### Features I would like to add ####

I would really like to add a user sign in feature so that users can see who has made each post and so users can comment on any post but can only delete and edit posts that were made from their own account. I didn't do this due to time constraints but it's definitely something I'd like to try out in the future!

#### Things to note: ####

At the moment, entering any apostophes into the forms on the web page causes an error. This is something I plan on fixing but again just ran out of time.

There are a few rubocop offences that I didn't fix. I am open to suggestions on whether I should change the lines it is saying are too long or whether this would affect the readability of the code too much.
