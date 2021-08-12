require './spec/setup_test_database'

feature 'Viewing messages' do 
  scenario 'A user can view messages' do
    setup_test_database

    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps (message) VALUES ('This is a peep!');")
    connection.exec("INSERT INTO peeps (message) VALUES ('Hello');")
    connection.exec("INSERT INTO peeps (message) VALUES ('World');")

    visit ('/messages')
     

    expect(page).to have_content('This is a peep!')
    expect(page).to have_content('Hello')
    expect(page).to have_content('World')
  end
  
end
