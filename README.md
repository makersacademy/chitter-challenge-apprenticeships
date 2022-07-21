## Chitter Challenge

* Challenge time: until the end of the day
* Feel free to use google, your notes, books etc but please work on your own
* Please raise a pull request when you start this challenge, and keep pushing updates as and when you make commits throughout the day
* There is _no expectation_ to finish all or any of the user stories, please use this time to reflect on where you feel you are with the skill and what may support your learning.
* If you get blocked, please reflect on what blocked you and any strategies you adopted that helped you make progress.

We are going to write a small Twitter clone that will allow the users to post messages to a public stream.

## Set up

To setup the database:

* Connect to psql
* Create the database using the psql command `CREATE DATABASE chitter;`
* Connect to the database using the psql command `\c chitter`;
* Run the query we have saved in the file 01_create_chitter_table.sql
* Populate your table with a row by running `INSERT INTO peeps (message) values ('This is a peep!');`
* Create the user table using the query saved in 02_create_user_table.sql

To check you have everything set up ok, please take a look at the peeps table inside the chitter database. You should see one row in there.  

To setup the test database:
* Connect to psql
* Create the database using the psql
command `CREATE DATABASE chitter_test;`;
* Connect to the database using the psql command `\c chitter_test`
* Run the query we have saved in the file 01_create_chitter_table.sql
* Populate your table with a row by running `INSERT INTO peeps (message) values ('This is a peep!');`
* Create the user table using the query saved in 02_create_user_table.sql

* `bundle install`
* `rspec`

## Run

run use ruby app.rb

rackup is not working - currently unsure why

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


# FIRST USER STORY

```
As a Maker
So that I can see what people are doing
I want to see all the messages (peeps)
in a browser
```

class Message
  def initialize # name is a string
    @messages = []
  end

  def add(message)
    # adds the message to @messages
  end

  def self.all
    # Returns @messages
  end
end

# TESTS

# 1
RSpec.describe Message do
  context "so that I can see what people are doing" do
    it "#all displays all messages do
      message1 = Message.new
      message2 = Message.new
      message1.add("First message")
      message2.add("Second message")
      expect(Message.all).to eq ["First message", "Second message"]
    end
  end
end

# 2 -> feature test

feature 'messages' do
  scenario 'to have a messages on it' do
    visit '/messages'
    expect(page).to have_content "First message", "Second message"
  end
end
