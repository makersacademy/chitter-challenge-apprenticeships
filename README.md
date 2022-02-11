# Set up

## To setup the database:

Connect to psql

Create the database using the psql command CREATE DATABASE messages_app;

Connect to the database using the psql command \c messages_app;

Create a table using the line saved in 01_create_messages_table.sql



## To setup the test database:

Connect to psql

Create the database using the psql command CREATE DATABASE messages_app_test;;

Connect to the database using the psql command \c messages_app_test

Create a table using the line saved in 01_create_messages_table.sql

bundle install

rspec



# How to use

Create a post by writing your name and message in the root '/' directory.

View all posts in '/messages'

Don't SQL inject pls! It is very easy im sure.



