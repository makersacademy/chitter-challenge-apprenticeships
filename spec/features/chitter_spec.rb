require 'pg'

feature 'View all peeps' do
  context 'Database is prepopulated' do
    scenario 'User is displayed a peep' do
      DatabaseConnection.query("INSERT INTO peeps(message) VALUES('This is a peep');")
      
      visit('/')
      expect(page).to have_content 'This is a peep'
    end

    scenario 'User is displayed peeps in chronological order' do
      DatabaseConnection.query("INSERT INTO peeps(message, date) VALUES('This is an old peep', '2021-09-10');")
      DatabaseConnection.query("INSERT INTO peeps(message, date) VALUES('This is a newer peep', '2021-10-10');")

      visit('/')
      expect(page).to have_content "This is a newer peep\n10/10/21\nThis is an old peep\n10/09/21"
    end
  end
end

feature 'Create new peep' do
  scenario 'User is able to create a new peep' do
    visit('/')
    fill_in 'message', with: 'This is a fun new peep!'
    click_button 'Post'

    expect(page).to have_content('This is a fun new peep!')
  end

  scenario 'User cannot create a blank peep' do
    visit('/')
    click_button 'Post'

    expect(page).to have_content('You must enter a message!')
  end
end
