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
            expect(page).to have_content Time.now.strftime("On %d-%m-%Y at %H:%M")
        end
    end

    feature "view my own peeps" do
        scenario "user can view their own peeps in their browser" do
            Peep.post(message: "Cannot believe it is snowing in April", author_id: 1)
            Peep.post(message: "Happy Friday everyone!", author_id: 1)
            Peep.post(message: "Looking forward to the weekend!", author_id: 1)
            
            visit('/chitter')
            click_button('My Peeps')

            expect(page).to have_content("Cannot believe it is snowing in April")
            expect(page).to have_content("Looking forward to the weekend!")
            expect(page).to have_content Time.now.strftime("On %d-%m-%Y at %H:%M")
        end
    end
end