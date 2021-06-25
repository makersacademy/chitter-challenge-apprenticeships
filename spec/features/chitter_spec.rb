# As a Maker
# So that I can see what people are doing
# I want to see all the messages (peeps)
# in a browser

feature 'a user can see all the peeps in a browser' do
  scenario 'when navigating to /peeps' do
    add_rows_to_test_database
    visit '/peeps'
    expect(page).to have_content 'All Peeps Ever Created'
    expect(page).to have_content 'This is a peep!'
    expect(page).to have_content 'This is another peep!'
  end
end

# As a Maker
# So that I can let people know what I am doing  
# I want to post a message (peep) to chitter

feature 'a user can post a peep to chitter' do
  scenario 'from the main page' do
    visit '/'
    expect(page).to have_content 'Welcome to Peeps Land!'
    fill_in :message, with: "Another peep bites the dust!"
    click_button 'Add Peep'
    expect(page).to have_content 'Another peep bites the dust!'
  end
end