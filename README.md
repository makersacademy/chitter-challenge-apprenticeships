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

### FEATURE 1: view ALL the peeps (DONE)
> As a Maker  
> So that I can _see_ what people are doing  
> I want to _see_ all the **messages** (**peeps**) in a browser  
  
- user visits `/` and expects to see all peeps
    - `LoaderWriter` talks to database and gets all peeps via `fetch`
    - peeps rendered on page
- They see all the peeps

### FEATURE 2: post a peep (DONE)
> As a Maker  
> So that I can let people know what I am doing  
> I want to _post_ a **message** (**peep**) to chitter  

- user visits `'/'` and expects to see all peeps AND a form to enter message and button to post
- user enters message and presses 'post'
    - form parameters sent via post request to `/newpeep` route
        - `LoaderStorer` 'creates' a record in the database with certain data
    - page redirected back to `'/'`
        - `LoaderWriter` talks to database and gets all peeps via `fetch`
    - peeps rendered on page
- user sees peeps

### FEATURE 3: peeps have a date (DONE)
> As a Maker  
> So that I can _see_ when people are doing things  
> I want to _see_ the **date** the **message** was posted  
> (Hint the database table will need to change to store the date too)  

### FEATURE 4: peeps organized in rev. chronological order (DONE)
> As a Maker  
> So that I can easily _see_ the latest peeps  
> I want to _see_ a **list** of peeps in reverse chronological order  

### FEATURE 5: filter tweets by keywords (TO DO)
> As a Maker  
> So that I can _find_ relevant peeps  
> I want to _filter_ on a specific **keyword**  

## Objects, Messages and States

|        Object &                     Responsibility         |      Message(s)      |             State(s)              |
| :--------------------------------------------------------: | :------------------: | :-------------------------------: |
|         [Peep] Raw object containing a single peep         |   `create`/`post`    | user, content, timestamp, keyword |
| [DatabaseConnection]  Writes Peeps to database on creation |       `write`        |                                   |
|      + Loads Peeps from database on visiting homepage      | `load_all`, `filter` |                                   |

#### Not yet in use
|        Object &                     Responsibility         |       Message(s)       | State(s) |
| :--------------------------------------------------------: | :--------------------: | :------: |
| [PeepContainer] Holds Peeps for display on browser session |       `display`        |   list   |
|           [PeepRenderer] Renders Peeps into HTML           | `new` (used by loader) |          |  
  
## Features to expand upon & bugs/errors to fix
### Bugs/ errors
- [ ] Order peeps by date rather than database id.
  - A peep can be entered via the database and the date can be any value but still appear above a posted tweet with a more recent date  
- [ ] Keywords list/ 'cloud' does not remove any punctuation
  - User may want to separate keywords by comma etc.  
  
### Features
- [ ] **Filter by keyword**
- [ ] 'Like button'
- [ ] Make it look more appealing! The style is atrocious right now.
- [ ] Logo
- [ ] User authentication
  -  Database of users (database relationships?)
- [ ] Navbar
- [ ] Images embedded in peeps
