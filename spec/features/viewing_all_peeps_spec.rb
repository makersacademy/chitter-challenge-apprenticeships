feature 'Visiting the index page' do
  scenario 'User visits the index page' do
    visit('/')
    expect(page).to have_content "Welcome to Chitter!"
  end
end

feature 'Viewing all peeps' do
  scenario 'User can view all the peeps (messages)' do
    connection = PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO peeps (message) VALUES ('This is my first peep!');")
    connection.exec("INSERT INTO peeps (message) VALUES ('This is my second peep!');")
    connection.exec("INSERT INTO peeps (message) VALUES ('This is my third peep!');")
    
    visit ('/peeps')

    expect(page).to have_content "This is my first peep!"
    expect(page).to have_content "This is my second peep!"
    expect(page).to have_content "This is my third peep!"
    
  end
end