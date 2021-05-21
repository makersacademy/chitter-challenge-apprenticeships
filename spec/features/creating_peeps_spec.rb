# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter
feature 'Creating a peep' do
  scenario 'a user can post a peep' do
    visit('/new')
    fill_in('message', with: 'My first peep!')
    click_button('Send')

    expect(page).to have_content 'My first peep!'
  end
end
