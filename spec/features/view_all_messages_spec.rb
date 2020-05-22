require 'pg'

feature 'Viewing all messages' do
  scenario 'seeing all the peeps' do
    connection = PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO peeps (message) VALUES('Hey, how are you?');")
    connection.exec("INSERT INTO peeps (message) VALUES('Chitter is pretty cool!');")
    connection.exec("INSERT INTO peeps (message) VALUES('I am really enjoying Makers!');")

    visit('/all_messages')

    expect(page).to have_content("Hey, how are you?")
    expect(page).to have_content("Chitter is pretty cool!")
    expect(page).to have_content("I am really enjoying Makers!")
  end
end
