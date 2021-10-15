feature 'Adding a new peep' do
    scenario 'A user can add a peep to Chitter' do
      visit('/peeps/new')
      fill_in('message', with: 'This is an example peep message')
      click_button('Submit')
  
      expect(page).to have_content 'This is an example peep message'
    end
end