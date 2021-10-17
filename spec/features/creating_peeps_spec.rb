feature 'Adding a new peep' do
    scenario 'A user can add a peep to peeps' do
      visit('/peeps/new')
      fill_in('message', with: 'Example peep')
      fill_in('date', with: "Test date")
      click_button('Submit')
  
      expect(page).to have_link('Test date', href: 'Example peep')
    end
  end