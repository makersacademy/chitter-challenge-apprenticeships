require 'pg'

#failing test - not connecting successfully with test database

feature 'view all messages' do
  scenario 'when visiting browser' do 
      
   connection = PG.connect(dbname: 'chitter_test')

    # Add test data
    connection.exec("INSERT INTO peeps_test VALUES(1, 'Hey, I am working on a test database');")
    connection.exec("INSERT INTO peeps_test VALUES(2, 'This is database week!');")
    connection.exec("INSERT INTO peeps_test VALUES(3, 'I love MVC Frameworks');")
      
    visit('/messages')

    expect(page).to have_content "Hey, I am working on a test database"
    expect(page).to have_content "This is database week!"
    expect(page).to have_content "I love MVC Frameworks"
  end 
end 