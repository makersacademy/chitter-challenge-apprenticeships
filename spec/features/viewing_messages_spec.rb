feature 'Viewing messages: ' do
  scenario 'A user can see messages' do
    connection = PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO peeps VALUES(1, 'Hi Michelle! How are you?');")
    connection.exec("INSERT INTO peeps VALUES(2, 'What time is the theatre show?');")

    visit('/messages')
    expect(page).to have_content "Hi Michelle! How are you?"
    expect(page).to have_content "What time is the theatre show?"
  end
end
