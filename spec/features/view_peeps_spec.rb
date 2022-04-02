require './app'
require 'pg'

RSpec.describe "Peeps" do
    feature "view peeps" do
        scenario "user can view all peeps in their browser" do
            connection = PG.connect(dbname: 'chitter_test')

             # Add the test data
            connection.exec("INSERT INTO peeps (message, author_id) VALUES ('Hello world!', 3);")
            connection.exec("INSERT INTO peeps (message, author_id) VALUES('Hi Chitter! This is my first peep!', 2);")
            connection.exec("INSERT INTO peeps (message, author_id) VALUES('This is a peep!', 2);")

            visit('/chitter')

            expect(page).to have_content("Hello world!")
            expect(page).to have_content("Hi Chitter! This is my first peep!")
            expect(page).to have_content("This is a peep!")
        end
    end

    feature "view my own peeps" do
        scenario "user can view their own peeps in their browser" do
            connection = PG.connect(dbname: 'chitter_test')

             # Add the test data
            connection.exec("INSERT INTO peeps (message, author_id) VALUES ('Cannot believe it is snowing in April', 1);")
            connection.exec("INSERT INTO peeps (message, author_id) VALUES ('Happy Friday everyone!', 1);")
            connection.exec("INSERT INTO peeps (message, author_id) VALUES ('Looking forward to the weekend!', 1);")

            visit('/chitter')
            click_button('My Peeps')

            expect(page).to have_content("Cannot believe it is snowing in April")
            expect(page).to have_content("Looking forward to the weekend!")
        end
    end
end