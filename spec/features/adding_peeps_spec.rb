feature 'Adding a peep' do
    scenario 'A user can add a new peep (message) to Chitter database' do
      visit('/peeps/new')
      fill_in('peep', with: 'This is my message I would like to post')
      fill_in('username', with: 'jenny123')
      click_button('Submit')
  
      expect(page).to have_content('This is my message I would like to post', 'jenny123')
    end
  end