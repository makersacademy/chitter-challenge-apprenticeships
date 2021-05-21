feature 'Viewing chitters' do
  scenario 'A user can see the messages' do
    connection = PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO peeps (message) VALUES ('Hi there Paul hows the family?');")
    connection.exec("INSERT INTO peeps (message) VALUES ('Hey Ryan yeah the family are doing well thanks');")
    visit('/messages')
    expect(page).to have_content "Hi there Paul hows the family?"  
    expect(page).to have_content "Hey Ryan yeah the family are doing well thanks"
  end
end