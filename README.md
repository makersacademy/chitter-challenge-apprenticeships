## Chitter Challenge

This program simulates Twitter, with a list of 'peeps' viewable by the user, and the ability to 
post new peeps to the forum

The views for this project are written in HAML

![Homepage Image for Chitter](https://drive.google.com/uc?export=view&id=1cACmERMEiCh_tGGSFFF8MzDnIAccmd_S)

```
bundle
rackup
```
To set up the database:
```
psql
=> CREATE DATABASE chitter;
=> \c chitter
```
Run the SQL scripts in `db/migrations` in order

You will also need to create a test database for running tests
```
=> CREATE DATABASE chitter_test;
=> \c chitter_test
```
And run the SQL scripts in `db/migrations` in order

## Personal Critique

I didn't know how to spec/mock for time, but the peeps return the time

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

```
As a Maker
So that I can easily see the latest peeps
I want to see a list of peeps in reverse chronological order
```
This user story was not yet built
```
As a Maker
So that I can find relevant peeps
I want to filter on a specific keyword
```
