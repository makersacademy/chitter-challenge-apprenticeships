require 'pg'
require 'peep'

feature 'Viewing Peeps' do
  scenario 'A user can see Peeps' do
    connection = PG.connect(dbname: 'chitter_test')

    # Add the test data
    Peep.create('New Peep 1!')
    Peep.create('Yoyoyo!')
    Peep.create('http://www.google.com')

    visit('/')

    expect(page).to have_content "New Peep 1!"
    expect(page).to have_content "Yoyoyo!"
    expect(page).to have_content "http://www.google.com"
  end
end