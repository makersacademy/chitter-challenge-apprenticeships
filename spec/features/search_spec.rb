require_relative 'web_helpers'

feature 'User can search for a peep' do
  scenario 'enter search criteria and search' do
    sign_in
    add_peep
    search
    expect(page).to have_content 'This is a test peep'
  end

  scenario 'enter search criteria and search and go back to the homepage' do
    sign_in
    add_peep
    search
    click_button 'Back'
    expect(page).to have_content 'This is a test peep'
  end
end
