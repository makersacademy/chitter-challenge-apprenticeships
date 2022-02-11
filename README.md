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

<img width="1440" alt="Screenshot 2022-02-11 at 16 55 37" src="https://user-images.githubusercontent.com/84017149/153634387-7962e95e-02e4-42ae-9a66-6759e3954788.png">


View all posts in '/messages'

<img width="1440" alt="Screenshot 2022-02-11 at 16 56 31" src="https://user-images.githubusercontent.com/84017149/153634555-ae77424c-438e-4824-940d-0fd360f8c7e3.png">

Filter messages using the submission form on the left of '/messages'

<img width="1440" alt="Screenshot 2022-02-11 at 16 58 07" src="https://user-images.githubusercontent.com/84017149/153634837-8f73b858-2714-4f7b-85c7-c374e5bbfcd3.png">

