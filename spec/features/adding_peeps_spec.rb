require 'pg'

feature 'Creating a new peep' do
  scenario 'A user can create a new peep' do
    visit('/')
    fill_in('message', with: 'here is a new peep')
    click_button('submit')
    #visit('')
    expect(page).to have_content "This is a peep!"
    expect(page).to have_content'here is a new peep'
  end
end
