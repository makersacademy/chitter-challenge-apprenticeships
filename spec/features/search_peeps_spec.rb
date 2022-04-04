feature "filter peeps" do
    scenario "A user can search peeps by keywords" do
        connection = PG.connect(dbname: 'chitter_test')

        # Add the test data
        connection.exec("INSERT INTO peeps (message, author_id) VALUES ('Hello world!', 3);")
        connection.exec("INSERT INTO peeps (message, author_id) VALUES('Hi Chitter! This is my first peep!', 2);")
        connection.exec("INSERT INTO peeps (message, author_id) VALUES('This is a peep!', 2);")

        visit('/chitter')
        fill_in('filter', with: 'peep')
        click_button('Filter')

        expect(page).not_to have_content("Hello world!")
        expect(page).to have_content("Hi Chitter! This is my first peep!")
        expect(page).to have_content("This is a peep!")
    end
end