
# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

feature 'create a new peeps' do
  scenario 'a user can post a peep to chitter' do
    visit('/peeps/new')
    fill_in('message', with: 'this is my first peep!')
    click_button('Post')

    expect(page).to have_content('this is my first peep!')
  end

# So that I can see when people are doing things
# I want to see the date the message was posted

  scenario 'the date is posted with a peep' do
    visit('/peeps/new')
    fill_in('message', with: 'this is my first peep!')
    click_button('Post')

    expect(page).to have_content('2021-05-21')
  end

end
