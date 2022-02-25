feature 'Create a new peep' do
  scenario 'User visits page and fills form' do

    visit('/peeps')
    click_button "New Peep"
    fill_in "message", with: "This is a new peep"
    click_button "Post!"

    expect(page).to have_content("This is a new peep")
    
  end
end