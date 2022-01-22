# As a Maker
# So that I can let people know what I am doing  
# I want to post a message (peep) to chitter

feature 'Adding a new peep' do
  scenario 'A user can add a message to chitter' do
    visit('/new_peep')
    fill_in('message', with: 'This is my Third peep')
    click_button('Submit')

    expect(page).to have_content 'This is my Third peep'
  end
end 