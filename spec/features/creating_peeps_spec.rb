feature 'Adding a new message' do
    scenario 'A user can add a peep to Chitter' do
      visit('/chitter-feed/new-peep')
      fill_in('message', with:'Friday Feels!')
      click_button('Submit')
  
      expect(page).to have_content('Friday Feels!')
    end
end
