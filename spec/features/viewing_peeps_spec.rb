feature 'Viewing peeps' do
  scenario 'A user can see the peeps' do
    connection = PG.connect(dbname: 'chitter_test')
      
    connection.exec("INSERT INTO peeps (message) VALUES ('This is a peep!');")
    connection.exec("INSERT INTO peeps (message) VALUES('This is another peep!');")

    visit('/messages')
    
    expect(page).to have_content "This is a peep!"
    expect(page).to have_content "This is another peep!"
  end
end