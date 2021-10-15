feature 'Adding a new bookmark' do
    scenario 'A user can add a bookmark to Bookmark Manager' do
      visit('/peeps/new')
      fill_in('peep', with: 'This is an example peep message')
      click_button('Submit')
  
      expect(page).to have_content 'This is an example peep message'
    end
  end