require 'chitter'
require './app.rb'
require 'pg'

feature 'creating a chit' do
  scenario 'viewing a chit you created' do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps (message) VALUES('CHITT')")
    visit('/chitter')
    expect(page).to have_content "CHITT"
  end
end

feature 'Time stamps' do
  scenario 'When you view chits you can see time stamps' do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps (message) VALUES('CHITT')")
    visit('/chitter')
    expect(page).to have_content "posted at"
  end
end
