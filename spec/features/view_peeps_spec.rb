feature 'Viewing peeps' do
    scenario 'A user can see all messages in browser ' do
      visit('/all-messages')
  
      expect(page).to have_content "peep 1"
      expect(page).to have_content "peep 2"
      expect(page).to have_content "peep 3"
    end
  end 