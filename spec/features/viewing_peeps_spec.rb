feature 'See all messages in a browser' do
  scenario 'To see what people are doing, I want to see all the messages' do
    connection = PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO peeps (message) VALUES('message 1');")
    connection.exec("INSERT INTO peeps (message) VALUES('message 2');")
    connection.exec("INSERT INTO peeps (message) VALUES('message 3');")

    visit('/peeps')
    expect(page).to have_content 'message 1'
    expect(page).to have_content 'message 2'
    expect(page).to have_content 'message 3'
  end
end