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

To check you have everything set up ok, please take a look at the peeps table inside the chitter database. You should see one row in there.  

To setup the test database:
* Connect to psql
* Create the database using the psql
command `CREATE DATABASE chitter_test;`;
* Connect to the database using the psql command `\c chitter_test`
* Run the query we have saved in the file 01_create_chitter_table.sql

* `bundle install`
* `rspec`

You should see 1 passing test.

## User stories

## FEATURE: view ALL the peeps  
> As a Maker  
> So that I can _see_ what people are doing  
> I want to _see_ all the **messages** (**peeps**) in a browser  
  
- user visits `/chitter` and expects to see all peeps
    - `Loader` talks to database and gets all peeps and sends to container
    - `Container` sends all peeps to `Renderer`
    - `Renderer` outputs peeps to the homepage
- They see all the peeps

> As a Maker  
> So that I can let people know what I am doing  
> I want to _post_ a **message** (**peep**) to chitter  
 
> As a Maker  
> So that I can _see_ when people are doing things  
> I want to _see_ the **date** the **message** was posted  
  
(Hint the database table will need to change to store the date too)  
  
> As a Maker  
> So that I can easily _see_ the latest peeps  
> I want to _see_ a **list** of peeps in reverse chronological order  
 
> As a Maker  
> So that I can _find_ relevant peeps  
> I want to _filter_ on a specific **keyword**  

## Objects, Messages and States

|     Object      |                 Responsibility                 |       Message(s)       |           State(s)           |
| :-------------: | :--------------------------------------------: | :--------------------: | :--------------------------: |
|     [Peep]      |      Raw object containing a single peep       |    `create`/`post`     | user, content, date, keyword |
|  [PeepWriter +  |      Writes Peeps to database on creation      |        `write`         |                              |
|   PeepLoader]   | Loads Peeps from database on visiting homepage |  `load_all`, `filter`  |                              |
| [PeepContainer] |   Holds Peeps for display on browser session   |       `display`        |             list             |
| [PeepRenderer]  |            Renders Peeps into HTML             | `new` (used by loader) |                              |