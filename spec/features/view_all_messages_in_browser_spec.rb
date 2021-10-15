# User Story 1
# As a Maker
# So that I can see what people are doing
# I want to see all the messages (peeps)
# in a browser

require 'pg'

feature 'View all messages in browser' do
  scenario 'Browser shows all messages posted' do
    connection = PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO peeps (message) VALUES('Message 1');")
    connection.exec("INSERT INTO peeps (message) VALUES('Message 2');")
    connection.exec("INSERT INTO peeps (message) VALUES('Message 3');")
    connection.exec("INSERT INTO peeps (message) VALUES('Message 4');")
    connection.exec("INSERT INTO peeps (message) VALUES('Message 5');")
    
    visit('/messages')

    expect(page).to have_content "Message 1"
    expect(page).to have_content "Message 2"
    expect(page).to have_content "Message 3"
    expect(page).to have_content "Message 4"
    expect(page).to have_content "Message 5"
  end
end



