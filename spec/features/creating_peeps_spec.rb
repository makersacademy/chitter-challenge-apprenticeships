feature 'Adding a new peep' do
    scenario 'A user can add a peep to peeps' do
      visit('/peeps/new')
      fill_in('message', with: 'Example peep')
      fill_in('date', with: "Test date")
      click_button('Submit')
  
      expect(page).to have_content('Test date') 
      expect(page).to have_content('Example peep')
    end
  end