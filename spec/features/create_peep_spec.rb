
# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

feature 'create a new peeps' do
  scenario 'a user can post a peep to chitter' do
    visit('/peeps/new')
    fill_in('message', with: 'this is my first peep!')
    click_button('Post')

    expect(page).to have_content 'this is my first peep!'
  end

end
