require 'pg'

feature 'view all the messages' do
  scenario 'user visits view messages page' do
    connection = PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO peeps VALUES(1, 'This is a peep!');")
    connection.exec("INSERT INTO peeps VALUES(2, 'and another peep');")

    visit('/view_messages')
    
    expect(page).to have_content "This is a peep!"
    expect(page).to have_content "and another peep"
  end
end
