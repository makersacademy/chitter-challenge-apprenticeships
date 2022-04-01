require 'pg'
require 'peep'

feature 'viewing peeps' do
    scenario 'user wants to view peeps in browser' do
        connection= PG.connect(dbname: 'chitter_test')

        connection.exec("INSERT INTO peeps (message) VALUES('This is a peep!');")
        connection.exec("INSERT INTO peeps (message) VALUES('peep 2');")
        
        visit('/peeps')
       
        expect(page).to have_content 'This is a peep!'
        expect(page).to have_content 'peep 2'
    end
end