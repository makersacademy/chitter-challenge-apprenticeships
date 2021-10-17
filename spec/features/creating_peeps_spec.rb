feature 'Adding a new peep' do
    scenario 'A user can add a peep to peeps' do
      visit('/peeps/new')
      fill_in('message', with: 'Example peep')
      click_button('Submit')
  
      expect(page).to have_content 'Example peep'
    end
  end