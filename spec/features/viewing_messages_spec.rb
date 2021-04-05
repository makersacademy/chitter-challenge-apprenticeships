#As a Maker
#So that I can see what people are doing
#I want to see all the messages (peeps)
#in a browser

feature 'Viewing Messages' do
  scenario 'Users can view messages' do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps (message) values ('This is a peep!');")
    
    visit ('/peeps')
    expect(page).to have_content "This is a peep!"
  end
end