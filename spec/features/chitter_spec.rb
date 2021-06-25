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