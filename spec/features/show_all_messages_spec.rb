feature 'Messages' do
  scenario 'show all messages' do
    connection = PG.connect(dbname: 'chitter_test')
    
    connection.exec("INSERT INTO peeps (message) VALUES ('Today''s first peep');")
    connection.exec("INSERT INTO peeps (message) VALUES ('Today''s second peep');")
    connection.exec("INSERT INTO peeps (message) VALUES ('Today''s third peep');")

    visit '/messages'
    expect(page).to have_content "Today's first peep"
    expect(page).to have_content "Today's second peep"
    expect(page).to have_content "Today's third peep"
  end
end