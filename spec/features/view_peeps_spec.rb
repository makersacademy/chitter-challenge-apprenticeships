require './app'
require 'pg'

RSpec.describe "Peeps" do
    feature "view peeps" do
        scenario "user can view all peeps in their browser" do
            connection = PG.connect(dbname: 'chitter_test')

             # Add the test data
            connection.exec("INSERT INTO peeps (message) VALUES ('Hello world!');")
            connection.exec("INSERT INTO peeps (message) VALUES('Hi Chitter! This is my first peep!');")
            connection.exec("INSERT INTO peeps (message) VALUES('This is a peep!');")

            visit('/chitter')

            expect(page).to have_content("Hello world!")
            expect(page).to have_content("Hi Chitter! This is my first peep!")
        end
    end
end