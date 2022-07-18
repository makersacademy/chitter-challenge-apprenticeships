require 'pg'
require './lib/chitter'

feature 'Viewing peeps' do
  scenario 'A user can see peeps' do
    # connection = PG.connect(dbname: 'chitter_test')

    # # Add the test data
    # connection.exec("INSERT INTO peeps VALUES(1, 'Peep one');")
    # connection.exec("INSERT INTO peeps VALUES(2, 'Peep two');")
    # connection.exec("INSERT INTO peeps VALUES(3, 'Peep three');")

    # Bookmark.create(website: "http://www.makersacademy.com")
    # Bookmark.create(website: "http://www.destroyallsoftware.com")
    # Bookmark.create(website: "http://www.google.com")
    
    Peep.create(peep: 'Peep one')
    Peep.create(peep: 'Peep two')
    Peep.create(peep: 'Peep three')
    visit('/peeps')

    expect(page).to have_content "Peep one"
    expect(page).to have_content "Peep two"
    expect(page).to have_content "Peep three"
  end
end
