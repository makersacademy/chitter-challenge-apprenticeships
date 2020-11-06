require_relative 'web_helpers'

feature 'post a peep' do
  scenario 'a user can post a peep' do
    sign_in
    click_button 'Make New Peep'
    expect(page).to have_content("New peep:")
  end
  scenario 'once a user has signed in they can post a peep' do
    sign_in
    add_peep
    expect(page).to have_content("This is a test peep")
  end
  click_button 'Make New Peep'
end
