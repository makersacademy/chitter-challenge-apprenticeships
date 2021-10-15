feature 'Viewing peeps' do
    scenario 'A user can see all peeps in a browser' do
      visit('/chitter')
  
      expect(page).to have_content "This is a peep"
    end
  end