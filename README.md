# Chitter
## Setup

1. Clone repo
2. Run `bundle install`
3. Create two databases, `chitter` and `chitter_test`
4. Run the command in `db/migrations/01_create_chitter_table.sql` to create the required relations
     - **Note**: this command has been altered from the starter project, in order to include the date of each peep
5. Run `rackup -p 4567` and access the Chitter app at `http://localhost:4567/`

## About

This is a simple message board app where a user is able to post and view 'peeps'. The app also includes functionality to filter the peeps by a keyword or a search string.