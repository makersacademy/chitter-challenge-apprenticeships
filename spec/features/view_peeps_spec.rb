feature 'Viewing peeps' do
    scenario 'A user can see all messages in browser ' do
      visit('/all-messages')
  
      expect(page).to have_content "peep1"
      expect(page).to have_content "peep2 "
      expect(page).to have_content "peep3"
    end
  end 