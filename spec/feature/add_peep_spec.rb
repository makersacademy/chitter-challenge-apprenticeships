require './lib/chitter_model'

feature 'add a peep' do
  scenario 'A user can add a peep' do
    visit '/add-peeps'
    fill_in 'message', with: "This is a peep!"
    click_button 'Submit'

    visit '/view-peeps'

    expect(page).to have_content("This is a peep!")
  end
end
