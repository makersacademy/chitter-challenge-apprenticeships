require 'pg'

feature 'View all peeps' do
  scenario 'Database is prepopulated, user is displayed peeps' do
    DatabaseConnection.query("INSERT INTO peeps(message) VALUES('This is a peep');")
    
    visit('/')
    expect(page).to have_content 'This is a peep'
  end
end
