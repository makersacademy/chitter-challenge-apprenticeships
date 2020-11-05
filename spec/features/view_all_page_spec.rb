feature 'Viewing test page' do
  scenario 'visiting the test page' do
    connection = PG.connect(dbname: 'chitter_test')

        # Add the test data
        connection.exec("INSERT INTO peeps (message, date) VALUES ('This is message 1', 'nil');")
        connection.exec("INSERT INTO peeps (message, date) VALUES ('This is message 2', 'nil');")
        connection.exec("INSERT INTO peeps (message, date) VALUES ('This is message 3', 'nil');")

        visit('/chitter')

        expect(page).to have_content('This is message 1')
        expect(page).to have_content('This is message 2')
        expect(page).to have_content('This is message 3')
  end
end
