require 'pg'
require 'database_connection'

feature 'Index page' do
    scenario 'it has an index page title' do
        visit '/'
        expect(page).to have_content 'Chitter'
    end

    scenario 'it shows peeps' do
		DatabaseConnection.query("INSERT INTO peeps (message) values ('This is a peep!');")
        DatabaseConnection.query("INSERT INTO peeps (message) values ('Peep peep');")
        visit '/'
        expect(page).to have_content 'This is a peep!'
        expect(page).to have_content 'Peep peep'
    end
end