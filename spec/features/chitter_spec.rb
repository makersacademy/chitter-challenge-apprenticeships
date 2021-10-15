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

feature 'Filtering on a specific keyword' do
  scenario 'User is shown peeps containing a specific keyword' do
    DatabaseConnection.query("INSERT INTO peeps(message) VALUES('This is a tweet');")
    DatabaseConnection.query("INSERT INTO peeps(message) VALUES('This is an older peep');")
    DatabaseConnection.query("INSERT INTO peeps(message) VALUES('This is a newer peep');")
    
    visit('/')
    click_button 'Search'

    fill_in 'query', with: 'peep'
    click_button 'Search'

    expect(page).to have_content 'This is a newer peep'
    expect(page).to have_content 'This is an older peep'
  end

  scenario "user is told that there are no peeps if search doesn't return anything" do
    visit('/')
    click_button 'Search'

    fill_in 'query', with: 'peep'
    click_button 'Search'

    expect(page).to have_content "No results found for 'peep'"
  end

  scenario 'most recent peeps are returned first' do
    DatabaseConnection.query("INSERT INTO peeps(message, date) VALUES('This is a tweet', '2021-10-15');")
    DatabaseConnection.query("INSERT INTO peeps(message, date) VALUES('This is an older peep', '2021-10-15');")
    DatabaseConnection.query("INSERT INTO peeps(message, date) VALUES('This is a newer peep', '2021-10-15');")

    visit('/')
    click_button 'Search'

    fill_in 'query', with: 'peep'
    click_button 'Search'

    expect(page).to have_content("This is a newer peep\n15/10/21\nThis is an older peep\n15/10/21")
  end

  scenario 'user is able to go back to the homepage' do
    visit('/search')
    click_button('Go back')

    expect(page).to have_current_path('/')
  end
end

feature 'heading is clickable' do
  scenario 'user clicks the heading and is returned home' do
    visit('/search')
    find('h1', text: 'Chitter').click_link
    expect(page).to have_current_path('/')
  end
end
