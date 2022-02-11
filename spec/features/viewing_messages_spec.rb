require 'pg'

feature "viewing messages" do
  scenario "user can view all messages on the message board page" do
    connection = PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO peeps VALUES(1, 'Test Message 1', 'Bob');")
    connection.exec("INSERT INTO peeps VALUES(2, 'Test Message 2', 'Ron');")
    
    visit ('/messageboard')

    expect(page).to have_content "Bob - Test Message 1"
    expect(page).to have_content "Ron - Test Message 2"
  end
end
