# Chitter Challenge

For week 6 on the web we have been given the task of writing a small Twitter clone that allows users to post messages to a public stream. The user stories can be seen below.

## Approach

This task started relatively easily and similar to the bookmarks pairing challenge we have been working on. After setting up the development and test database and installing the required gems I started with a feature test aimed at the first user story of seeing all messages. From here it developed to unit testing the Peep object that could retreive all peeps from the database and then creating an erb file to display them. It was a similar case for the second user story which led me to do more unit testing on the Peeps class so it could create a new peep.

The user story to see the date made things a bit more complicated but as before I started with the feature test which led to me updating the database. I initially added a date column with the timestamp data type so it would automatically input the date when a new record was created. However I struggled to think of a way to test that accurately and so I decided to change the datatype to a bigint and save the time as "number of seconds since the unix epoch." I felt that gave me more flexibility when it came to formatting the date, and meant I could test it using rspecs `expect ` call.

For the fourth user story of displaying the peeps in reverse chronological order: I found myself in a position where I didn't write a test first. It just meant changing the SQL query to the database to `ORDER BY date DESC` with nothing else needed changing. I ran out of time before figuring out how to write a test to see if the peeps were actually appearing in descending order but the current tests pass with 97.22% coverage. And the only reason they aren't 100% is due to the `if` statements that choose which database to use.

## Screenshots

![All Peeps](https://github.com/alicegray33/bookmarks/blob/main/docs/allpeeps.png?raw=true)
![New Peep](https://github.com/alicegray33/bookmarks/blob/main/docs/newpeep.png?raw=true)

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
